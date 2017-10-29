package entry;


import java.util.List;

import com.jfinal.config.Constants;
import com.jfinal.config.Handlers;
import com.jfinal.config.Interceptors;
import com.jfinal.config.JFinalConfig;
import com.jfinal.config.Plugins;
import com.jfinal.config.Routes;

import com.jfinal.plugin.activerecord.ActiveRecordPlugin;
import com.jfinal.plugin.c3p0.C3p0Plugin;
import com.jfinal.render.IMainRenderFactory;
import com.jfinal.render.JsonRender;
import com.jfinal.render.Render;

import common.ConnectionSetting;
import model.BaseModel;
import rest.ClassScanner;
import rest.RestKit;

public class entry extends JFinalConfig {

	//這可以開啟做排程 新增job
	//ConfigSupport support = new ConfigSupport();

	//這裡設置對應crud request的位置
	//Restful規則
	//前端送的method [base:http://localhost:8080/(warName)/(packageName)/(對應的controller api名稱)/(參數 可能是id或是queryString)]:
	//get 會是查詢 ex.http://localhost:8080/stock/v1/users/1 ->>查user id=1 的人給 沒給參數就是查全部users 
	//put、patch 會是修改
	//delete 會是刪除
	
	@Override
	public void configRoute(Routes me) {
		RestKit.buildRoutes("/v1", me, "controller.v1");
    }

	//建立db 連線
	@Override
	public void configPlugin(Plugins me) {
		//如果需要ssh 遠端連線到db可以先設置這個 tunnelPort 可隨意填 dbUrl 要換
		//ConnectionSetting.sshSetting(entry.SSH_USER,entry.SSH_PASSWOED,entry.EMMA_SSH_IP,22,tunnelPort,"localhost",3306);

		String dbName = "stock";
		String DBUrl = "jdbc:mysql://localhost:3306/"+dbName+"?useUnicode=true&characterEncoding=utf-8&autoReconnect=true";
		String DBUser = "root";
		String DBPassword = "iscreen";
		C3p0Plugin cp = new C3p0Plugin(DBUrl, DBUser, DBPassword);
		me.add(cp);
		
		//這裡會去找對應的db
		ActiveRecordPlugin stock = new ActiveRecordPlugin(dbName,cp);
		me.add(stock);
		
		//這個方法會去對應db table name
		//db 命名習慣會是小寫底線連接 ex. table_xxxs
		//這裡需要在model 新增對應相同名稱但不能有s lib 裡面有做code判斷 
		loadModel(stock);
	}

	//這裡可以做crud 的request是否需要做攔截器
	@Override
	public void configInterceptor(Interceptors me) {
		// TODO Auto-generated method stub
		//me.add(new GlobalTransactionInterceptor("post", "patch", "put", "delete"));

	}

	//configHandler、configConstant 可設置一些參數目前應該用不到
	@Override
	public void configHandler(Handlers me) {
	     RestKit.buildHandler(me);
	}

    @Override
    public void configConstant(Constants me) {
    	me.setDevMode(true);
    	me.setMainRenderFactory(new IMainRenderFactory() {
    		@Override
    		public Render getRender(String view) {
    			return new JsonRender();
    		}
    		
		    @Override
		    public String getViewExtension() {
		        return null;
		    }
    	});
    }
	
	
	protected void loadModel(ActiveRecordPlugin plugin) {
        //掃出model下的所有 class並 map 至Db name
        List<Class<?>> list = ClassScanner.scan("model");
        for (Class<?> clazz : list) {
            @SuppressWarnings("unchecked")
            Class<? extends BaseModel<?>> modelClass = (Class<? extends BaseModel<?>>) clazz;
            try {
				plugin.addMapping(modelClass.newInstance().getTableName(), modelClass);
			} catch (InstantiationException | IllegalAccessException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
        }
	}
}
