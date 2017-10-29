package com.stocks.services;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;

import com.stocks.beans.*;

import java.util.HashMap;

public class DataManager {
	
	private String connString = "jdbc:oracle:thin:@prophet.njit.edu:1521:course";
	private String db_user = "IL52";
	private String db_password = "foZg1RuA";
	private Connection conn;
	
	public DataManager() throws SQLException
	{
		this.conn = DriverManager.getConnection(connString, db_user, db_password);
	}
	
	public ArrayList<Ticker> getSymbols()
	{
		ArrayList<Ticker> tickers = new ArrayList<Ticker>();
		try
		{
			PreparedStatement ps = conn.prepareStatement("select * from il52.SYMBOL");
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				Ticker ticker = new Ticker(rs.getString("Symbol"), rs.getString("SYMBOL_NAME"), rs.getString("EXCHANGE"),
						rs.getString("IS_FOREIGN") == "Y");
				tickers.add(ticker);
			}
		}
		catch (SQLException e)
		{
			
		}
		return tickers;
	}
	
	public HashMap<Integer, ArrayList<PortfolioStock>> getPortfoliosForUser(int userID)
	{
		HashMap<Integer, ArrayList<PortfolioStock>> userPortfolioMap = new HashMap<Integer, ArrayList<PortfolioStock>>();
		try
		{
			PreparedStatement ps = conn.prepareStatement("select PORTFOLIO_ID from il52.PORTFOLIO WHERE (PMSR_ID= ?) ");
			ps.setInt(1,  userID);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				int pId = rs.getInt("PORTFOLIO_ID");
				ArrayList<PortfolioStock> pStocks = getPortfolioStocks(pId);
				if (pStocks.size()>0)
				{
					userPortfolioMap.put(pId,  pStocks);
				}
			}
		}
		catch (SQLException e)
		{
			
		}
		return userPortfolioMap;
	}
	
	public ArrayList<PortfolioStock> getPortfolioStocks(int portfolioID)
	{
		ArrayList<PortfolioStock> stocks = new ArrayList<PortfolioStock>();
		try
		{
			PreparedStatement ps = conn.prepareStatement("select * from il52.Stock WHERE (PM_PORTFOLIO_ID= ?) ");
			ps.setInt(1,  portfolioID);
			
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				PortfolioStock stock = new PortfolioStock(rs.getString("STOCK_SYMBOL"), rs.getString("STOCK_NAME"),
						rs.getInt("PM_PORTFOLIO_ID"), rs.getString("STOCK_COUNTRY"), rs.getInt("STOCK_QUANTITY"),
						rs.getDouble("COST_BASIS"));
				stocks.add(stock);
			}
		}
		catch (SQLException e)
		{
			
		}
		return stocks;
	}
	
	public double stockPurchase(PortfolioStock stockToBuy, int portfolioID, double priceToBuy, int userID) throws SQLException
	{
		//stock_symbol in varchar2, stock_name in varchar2, stock_country in varchar2, stock_quantity in number, portfolio_id in number,

		//	curr_price in number, user_id in number, stock_id out number, portfolio_val out number
		//BUYSTOCK
		/*
		 * 
		 * stock_symbol in varchar2, stock_name in varchar2, stock_country in varchar2, stock_quantity in number, portfolio_id in number,
			curr_price in number, stock_id out number, portfolio_val out number)
		 */
		double portfolioVal = 0;
		CallableStatement cs = conn.prepareCall("{call BUYSTOCK(?,?,?,?,?,?,?,?,?)}");
		cs.setString(1,  stockToBuy.symbol);
		cs.setString(2,  stockToBuy.stockName);
		cs.setString(3,  stockToBuy.stockCountry);
		cs.setInt(4,  stockToBuy.stockQuantity);
		cs.setInt(5,  stockToBuy.portfolioID);
		cs.setDouble(6,  priceToBuy);
		cs.setInt(7,  userID);
		cs.registerOutParameter(8, Types.INTEGER);
		cs.registerOutParameter(9, Types.DOUBLE);
		int res = cs.executeUpdate();
		if (res >0)
		{
			int stockId = cs.getInt(8);
			portfolioVal = cs.getDouble(9);
			return portfolioVal;
		}
		return portfolioVal;
	}
	
	

}
