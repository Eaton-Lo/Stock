package com.stocks.beans;

public class Ticker {
	
	public String symbol;
	public String stockName;
	public String exchange;
	public boolean isForeign;
	
	
	public Ticker(String symbol, String stockName, String exchange, boolean isForeign)
	{
		this.symbol = symbol;
		this.stockName = stockName;
		this.exchange = exchange;
		this.isForeign = isForeign;
	}

}
