package com.stocks.beans;

public class Stock {

	private String name;
	private String symbol;
	private String exchange;
	private String countryOfIssue;
	private float latestPrice;
	private float openPrice;
	private float closePrice;
	private float yearlyHigh;
	private float yearlyLow;
	private float dailyChange;
	private double dailyChangePct;
	
	public Stock (String name, String symbol, String exchange, String country,float latestPrice,
			float openPrice, float closePrice, float yearlyHigh, float yearlyLow, float dailyChange, double dailyChangePct)
	{
		this.name = name;
		this.symbol = symbol;
		this.exchange = exchange;
		this.countryOfIssue = country;
		this.latestPrice = latestPrice;
		this.openPrice = openPrice;
		this.closePrice = closePrice;
		this.yearlyHigh = yearlyHigh;
		this.yearlyLow = yearlyLow;
		this.dailyChange  = dailyChange;
		this.dailyChangePct = dailyChangePct;
	}
	
	public Stock()
	{
		//no-args constructor
	}
	
	public String getName()
	{
		return this.name;
	}
	
	public String getSymbol()
	{
		return this.symbol;
	}
	
	public String getExchange()
	{
		return this.exchange;
	}
	
	public String getCountry()
	{
		return this.countryOfIssue;
	}
	
	public float getLatestPrice()
	{
		return this.latestPrice;
	}
	
	public float getOpenPrice()
	{
		return this.openPrice;
	}
	
	public float getClosePrice()
	{
		return this.closePrice;
	}
	
	public float getYearlyHigh()
	{
		return this.yearlyHigh;
	}
	
	public float getYearlyLow()
	{
		return this.yearlyLow;
	}
	
	public float getChange()
	{
		return this.dailyChange;
	}
	
	public double getChangePct()
	{
		return this.dailyChangePct;
	}
	
	@Override
	public String toString()
	{
		return "Stock details are:/n" + this.name + " " + this.symbol + " " + this.exchange + " " + this.countryOfIssue
				+ " " + this.latestPrice + " " + this.openPrice + " " + this.closePrice + " " + this.yearlyHigh + " "
				+ this.yearlyLow + " daily change" + this.dailyChange + " daily change pct " + this.dailyChangePct;
	}
}






