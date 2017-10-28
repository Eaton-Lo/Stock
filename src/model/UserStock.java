package model;

import java.util.List;

public class UserStock extends BaseModel<UserStock> {
	public static final UserStock dao = new UserStock();
    
	public List<UserStock> findAll(){
    	return UserStock.dao.find("select * from user_stocks");
	}
//	public StockTransaction getByActionId(Object action_id) {
//    	return StockTransaction.dao.findFirst("select * from action_settings where action_id = ?", action_id);
//    }
//    
//	public List<StockTransaction> getAllActionSettingByServiceId(String serviceId){
//    	return StockTransaction.dao.find("select * from action_settings where service_id = ?", serviceId);
//	}
//	
//	public StockTransaction getAction(int service_id,int action_id) {
//		 return StockTransaction.dao.findFirst("select * from action_settings where service_id = ? and action_id = ?", service_id, action_id);
//	 }
}