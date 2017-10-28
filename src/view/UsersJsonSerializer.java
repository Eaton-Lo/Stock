package view;

import com.jfinal.plugin.activerecord.Page;

import model.User;

public class UsersJsonSerializer extends JsonSerializer<User> {
	
	//這是查詢單筆的回傳結果
	public UsersJsonSerializer(User record) {
		super(record);
		//root key
		this.rootName = "users";
	}
	
	//這是查詢多筆的回傳結果
	public UsersJsonSerializer(Page<User> records) {
		super(records);
		this.rootName = "users";
	}
	
	//這是是否要讀取關聯的table資料回傳
	protected void loadAssociations(User record, Boolean isFirst) {		
		if(isFirst){
			record.readAssociationValue();
		}
	}
}

