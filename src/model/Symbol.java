package model;

import java.util.List;

public class Symbol extends BaseModel<Symbol> {
	public static final Symbol dao = new Symbol();
    
	public List<Symbol> findAll(){
    	return Symbol.dao.find("select * from symbols");
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