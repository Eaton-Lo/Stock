package com.stocks.services;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.stream.Collectors;

import org.jsoup.*;
import org.jsoup.nodes.Document;
import org.jsoup.select.*;
import org.jsoup.nodes.*;

import com.stocks.beans.*;
import com.fasterxml.jackson.core.*;
import com.fasterxml.jackson.databind.ObjectMapper;

public class YahooScraper {

	public ArrayList<Stock> stockList;
	public static String yahooBaseURL = "https://finance.yahoo.com/quote/";
	public static String symbolLookupURL = "https://www.fool.com/investing/general/2015/05/18/the-30-dow-jones-stocks.aspx";
	public YahooScraper() 
	{
		this.stockList = new ArrayList<Stock>();
	}
	
	public static float getHistoricPrice(String symbol)
	{
		//gets sept 1 price for first time stock buys
		String lookupURL = yahooBaseURL + symbol + "/history?p=" + symbol;
		float historicPrice = 0;
		try
		{
			Document doc = Jsoup.connect(lookupURL).get();
			Elements spanElems = doc.select("table[data-test='historical-prices'] span");
			for (Element elem : spanElems)
			{
				if (elem.text().indexOf("Sep 01") > -1)
				{
					String val = elem.parent().siblingElements().eq(4).first().children().first().text();
					historicPrice = Float.parseFloat(val);
				}
			}
			
		}
		catch (IOException e)
		{	
			historicPrice = -1; //flag for error
		}
		return historicPrice;
	//	 https://finance.yahoo.com/quote/AAPL/history?p=AAPL
	}
	
	public static String stockListToJson()
	{
		ArrayList<Stock> stockList = Scrape();
		ObjectMapper mapper = new ObjectMapper();
		String jsonList = "";
		try
		{
		jsonList = mapper.writeValueAsString(stockList);
		}
		catch (JsonProcessingException e)
		{
			
		}
		return jsonList;
	}
	
	public static String stockToJson(String symbol, String stockName, boolean isFirst)
	{
		Stock stock = YahooScraper.getStockData(symbol, stockName, isFirst);
		String stockJson = "";
		ObjectMapper mapper = new ObjectMapper();
		try
		{
			stockJson = mapper.writeValueAsString(stock);
		}
		catch (JsonProcessingException e)
		{
			
		}
		return stockJson;
	}
	
	public static ArrayList<String> scrapeSymbols()
	{
		ArrayList<String> symbolList = new ArrayList<String>(); //key = symbol, value = stock name
		try 
		{
			Document symbolDoc = Jsoup.connect(symbolLookupURL).get();
			Elements tickerElemList = 
					symbolDoc.getElementsByClass("table-responsive").first().getElementsByClass("ticker");
			for (Element elem : tickerElemList)
			{
				String symbol = elem.children().first().text().split(":")[1];
				String stockName = elem.parent().siblingElements().first().children().first().text();
				symbolList.add(symbol);
			}
		}
		catch (IOException e)
		{
			
		}
		return symbolList;
	}
	
	public static Stock getStockData(String symbol, String stockName, boolean isFirst)
	{
		Stock stock = new Stock();
		try
		{
			float currPrice = 0;
			Document yahooDoc = Jsoup.connect(yahooBaseURL + symbol + "?p=" + symbol).get();
			if (!isFirst)
			{
				try
				{
					currPrice =  Float.parseFloat(yahooDoc.select("span[data-reactid='35']").text());
				}
				catch (NumberFormatException e)
				{
					currPrice = -1;
				}
			}
			else
			{
				currPrice = getHistoricPrice(symbol);
			}
			float openPrice = Float.parseFloat(yahooDoc.select("td[data-test='OPEN-value'] span").text());
			float closePrice = Float.parseFloat(yahooDoc.select("td[data-test='PREV_CLOSE-value'] span").text());
			float yearlyHigh = Float.parseFloat(yahooDoc.select("td[data-test='FIFTY_TWO_WK_RANGE-value']").text().split("-")[1].trim());
			float yearlyLow = Float.parseFloat(yahooDoc.select("td[data-test='FIFTY_TWO_WK_RANGE-value']").text().split("-")[0].trim());
			String changeString = yahooDoc.getElementById("quote-market-notice").previousElementSibling().text();
			float changeVal = 0;
			double changePctVal = 0.0;
			if (changeString.substring(0,1).equals("+"))
			{
				changeVal = Float.parseFloat(changeString.split(" ")[0].substring(1));
				changePctVal = Double.parseDouble(changeString.split("\\(")[1].substring(1,  changeString.split("\\(")[1].length() - 2));
				
			}
			else
			{
				changeVal = Float.parseFloat(changeString.split(" ")[0].substring(1)) * -1;
				changePctVal = Double.parseDouble(changeString.split("\\(")[1].substring(1,  changeString.split("\\(")[1].length() - 2)) * -1;
			}
			String exchange = yahooDoc.select("span[data-reactid='9']").text().split(" - ")[0];
			String country = "USA";
			stock = new Stock(stockName, symbol, exchange, country, currPrice, openPrice, closePrice,
					yearlyHigh, yearlyLow, changeVal, changePctVal);
		}
		catch (IOException e)
		{
			
		}
		return stock;
	}
		
	public static ArrayList<Stock> Scrape()
	{
		//get all stock symbols
		String stockListJson = "";
		ArrayList<Stock> stockList = new ArrayList<Stock>();
		HashMap<String, String> symbolStockMap = new HashMap<String, String>(); //key = symbol, value = stock name
		try 
		{
			Document symbolDoc = Jsoup.connect(symbolLookupURL).get();
			Elements tickerElemList = 
					symbolDoc.getElementsByClass("table-responsive").first().getElementsByClass("ticker");
			for (Element elem : tickerElemList)
			{
				String symbol = elem.children().first().text().split(":")[1];
				String stockName = elem.parent().siblingElements().first().children().first().text();
				symbolStockMap.put(symbol, stockName);
				//stockSymbols.add(elem.children().first().text().split(":")[1]);
			}
			
			for (String symbol : symbolStockMap.keySet())
			{
				Document yahooDoc = Jsoup.connect(yahooBaseURL + symbol + "?p=" + symbol).get();
				float currPrice = 0;
				try
				{
					currPrice =  Float.parseFloat(yahooDoc.select("span[data-reactid='35']").text());
				}
				catch (NumberFormatException e)
				{
					currPrice = -1;
				}
				//float currPrice =  Float.parseFloat(yahooDoc.select("span[data-reactid='35']").text());
				float openPrice = Float.parseFloat(yahooDoc.select("td[data-test='OPEN-value'] span").text());
				float closePrice = Float.parseFloat(yahooDoc.select("td[data-test='PREV_CLOSE-value'] span").text());
				float yearlyHigh = Float.parseFloat(yahooDoc.select("td[data-test='FIFTY_TWO_WK_RANGE-value']").text().split("-")[1].trim());
				float yearlyLow = Float.parseFloat(yahooDoc.select("td[data-test='FIFTY_TWO_WK_RANGE-value']").text().split("-")[0].trim());
				String changeString = yahooDoc.getElementById("quote-market-notice").previousElementSibling().text();
				float changeVal = 0;
				double changePctVal = 0.0;
				try
				{
					if (changeString.substring(0,1).equals("+"))
					{
						changeVal = Float.parseFloat(changeString.split(" ")[0].substring(1));
						changePctVal = Double.parseDouble(changeString.split("\\(")[1].substring(1,  changeString.split("\\(")[1].length() - 2));
						
					}
					else
					{
						changeVal = Float.parseFloat(changeString.split(" ")[0].substring(1)) * -1;
						changePctVal = Double.parseDouble(changeString.split("\\(")[1].substring(1,  changeString.split("\\(")[1].length() - 2)) * -1;
					}
				}
				catch (NumberFormatException e)
				{
					 
				}
				String exchange = yahooDoc.select("span[data-reactid='9']").text().split(" - ")[0];
				String country = "USA";
				Stock stock = new Stock(symbolStockMap.get(symbol), symbol, exchange, country, currPrice, openPrice, closePrice,
						yearlyHigh, yearlyLow, changeVal, changePctVal);
				stockList.add(stock);
			}
			//ObjectMapper mapper = new ObjectMapper();
			//String stockListJson = mapper.writeValueAsString(stockList);
			//return stockListJson;
		}
		
		catch (IOException e)
		{
			System.out.println(e.getMessage());
		}
		return stockList;
		/*try
		{
		ObjectMapper mapper = new ObjectMapper();
		stockListJson = mapper.writeValueAsString(stockList);
		return stockListJson;
		}
		catch (JsonProcessingException f)
		{
			System.out.println(f.getMessage());
		}
		return stockListJson;
		*/
	}
}








