package model;

import java.util.List;


public class User extends BaseModel<User> {
	public static final User dao = new User();
    
//	public StockTransaction getByActionId(Object action_id) {
//    	return StockTransaction.dao.findFirst("select * from action_settings where action_id = ?", action_id);
//    }
	public User findUserByEmailAndPassword(String email,String password){
		return User.dao.findFirst("select * from users where user_email = ? and user_password = ?",email,password);
	}
	public List<User> findAll(){
    	return User.dao.find("select * from users");
	}

	//檢查是否重複
	@Override
	public boolean checkUniqueRelateConflict(boolean isCreate) {
		setUniqueRelate("user_email");
    	return super.checkUniqueRelateConflict(isCreate);
	}	
	//建立db資料關聯性
	@Override
	protected void initAssociationMap() {
		// TODO Auto-generated method stub
		super.initAssociationMap();
		map.put("user_portfolios", UserPortfolio.class);
	}
	//建立db資料關聯key
	@Override
	public String getLinkName() {
		// TODO Auto-generated method stub
		return "user_id";
	}
}