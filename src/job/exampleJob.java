package job;

import java.io.IOException;
import java.net.MalformedURLException;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.temporal.ChronoField;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.xml.parsers.ParserConfigurationException;

import org.json.JSONException;
import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.xml.sax.SAXException;

import com.jfinal.plugin.activerecord.Db;

import common.VariableTable;
//import connectorUtil.HttpUtil;
import exception.ErrorCodedException;

public class exampleJob implements Job {
	static boolean isExecuting = false;
	String connectorServiceId = null;

	@Override
	public void execute(JobExecutionContext arg0) throws JobExecutionException {
		// TODO Auto-generated method stub
		if (isExecuting) {	
			System.out.println("thread should dismiss");
			return;
		}
		
		isExecuting = true;
		try {
			//寫執行job邏輯
			
		} catch (Throwable e1) {
			// 所有的錯誤都接，不讓thread隨意斷開
			e1.printStackTrace();
		}
		
		isExecuting = false;
	}
    
}
