package com.stocks.beans;

public class PortfolioStock {
	
	public String symbol;
	public String stockName;
	public int portfolioID;
	public String stockCountry;
	public int stockQuantity;
	public double costBasis;
	
	public PortfolioStock(String symbol, String stockName, int portfolioID, String stockCountry,
			int stockQuantity, double costBasis)
	{
		this.symbol = symbol;
		this.stockName = stockName;
		this.portfolioID = portfolioID;
		this.stockCountry = stockCountry;
		this.stockQuantity = stockQuantity;
		this.costBasis = costBasis;
	}

	public void updateCostBasis(int qtyPurchased, double purchasePrice)
	{
		this.costBasis+=(qtyPurchased * purchasePrice);
	}
}
