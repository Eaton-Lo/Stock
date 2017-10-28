package view;

import com.jfinal.plugin.activerecord.Page;

import model.User;
import model.UserPortfolio;

public class UserPortfoliosJsonSerializer extends JsonSerializer<UserPortfolio> {
	
	public UserPortfoliosJsonSerializer(UserPortfolio record) {
		super(record);
		this.rootName = "user_portfolios";
	}
	
	public UserPortfoliosJsonSerializer(Page<UserPortfolio> records) {
		super(records);
		this.rootName = "user_portfolios";
	}
	
	protected void loadAssociations(UserPortfolio record, Boolean isFirst) {		
		if(isFirst){
			record.readAssociationValue();
		}
	}
}

