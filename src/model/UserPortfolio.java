package model;

import java.util.List;

public class UserPortfolio extends BaseModel<UserPortfolio> {
	public static final UserPortfolio dao = new UserPortfolio();

	public List<UserPortfolio> findUserPortfolio(String userId){
    	return UserPortfolio.dao.find("select * from user_portfolios where user_id =?",userId);
	}
	
	public List<UserPortfolio> findAll(){
    	return UserPortfolio.dao.find("select * from user_portfolios");
	}
	
	//建立db資料關聯性
	@Override
	protected void initAssociationMap() {
		// TODO Auto-generated method stub
		super.initAssociationMap();
		map.put("user_stocks", UserStock.class);
	}
	//建立db資料關聯key
	@Override
	public String getLinkName() {
		// TODO Auto-generated method stub
		return "portfolio_id";
	}
}