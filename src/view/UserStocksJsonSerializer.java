package view;

import com.jfinal.plugin.activerecord.Page;

import model.User;
import model.UserStock;

public class UserStocksJsonSerializer extends JsonSerializer<UserStock> {
	
	public UserStocksJsonSerializer(UserStock record) {
		super(record);
		this.rootName = "user_stocks";
	}
	
	public UserStocksJsonSerializer(Page<UserStock> records) {
		super(records);
		this.rootName = "user_stocks";
	}
	
	protected void loadAssociations(UserStock record, Boolean isFirst) {		
		if(isFirst){
			record.readAssociationValue();
		}
	}
}

