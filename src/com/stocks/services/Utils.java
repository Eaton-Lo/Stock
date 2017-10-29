package com.stocks.services;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.io.IOException;
import java.io.Writer;
import java.io.FileWriter;
import javax.swing.JFileChooser;
import java.util.Date;

public class Utils {

	public static void exportPortfolioToCSV(String[] portfolioGrid)
	{
		JFileChooser chooser = new JFileChooser();
		chooser.setCurrentDirectory(new java.io.File("."));
		chooser.setDialogTitle("Select directory to save exported portfolio file");
		chooser.setFileSelectionMode(JFileChooser.DIRECTORIES_ONLY);
		
		if(chooser.showOpenDialog(null) == JFileChooser.APPROVE_OPTION)
		{
			String dirSelected = chooser.getSelectedFile().getAbsolutePath();
			String filePath = dirSelected + "//portfolio" +
					new SimpleDateFormat("yyyy.MM.dd.HH.mm.ss").format(new Date()) + ".csv";
			try
			{
				FileWriter writer = new FileWriter(filePath);
			
				for (int i = 0; i< portfolioGrid.length; i++)
				{
					writeLine(writer, portfolioGrid[i]);
				}
			}
			catch (IOException e)
			{
				
			}
		}
	}
	
	public static void writeLine(FileWriter fw, String line) throws IOException
	{
		StringBuilder sb = new StringBuilder();
		String[] tokens = line.split(",");
		for (String token : tokens)
		{
			if(sb.length() == 0)
			{
				sb.append(token);
				
			}
			else
			{
				sb.append(",");
				sb.append(token);
			}
		}
		sb.append("/n");
		fw.append(sb.toString());
	}
}
