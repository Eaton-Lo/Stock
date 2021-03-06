package controller.v1;

import java.util.List;

import org.json.JSONException;
import org.json.JSONObject;

import com.jfinal.kit.StrKit;
import com.jfinal.plugin.activerecord.Page;
import controller.ApiController;
import exception.ErrorCodedException;
import model.User;
import common.ReturnCode;
import render.JsonRender;
import rest.API;
import view.UsersJsonSerializer;

@API("/users")
public class UsersController extends ApiController {

	//getBody、getPara、render 是jfinal的方法
	public void get() throws Exception {
		String userId = getPara();
		if (StrKit.isBlank(userId)) {
			//dao下可以寫要查詢的sql 如果是多筆 會是用下面這個方法return 資料給前端
			List<User> userList = User.dao.findAll();
			Page<User> usersPage = new Page<>(userList, 0, userList.size(), 1, userList.size());
			render(new JsonRender(new UsersJsonSerializer(usersPage).getJson()));
		} else {
			//單筆
			User user = User.dao.findById(userId);
			if (userId == null) {
				renderApiResult(ReturnCode.DATA_NOT_FOUND, "user not found");
				return;
			}
			//UsersJsonSerializer 這會是前端對應查詢回去的key val
			render(new JsonRender(new UsersJsonSerializer(user).getJson()));
		}
	}

	public void post() {
		//這裡會依照前端來的request 轉乘 jsonObj新增db
		JSONObject body = getBody();
		User user = getModel(User.class);

		try {
			if (user.create(body)) {
				renderApiResult(ReturnCode.SUCCESS, 200);
			} else {
				renderApiResult(ReturnCode.DATA_CREATE_FAILED, 422);
			}
		} catch (Exception e) {
			renderApiResult(ReturnCode.DATA_CREATE_FAILED, 422);
			e.printStackTrace();
		}
	}

	public void patch() throws Exception {
		update();
	}

	public void put() throws Exception {
		update();
	}

	public void update() {
		JSONObject body = getBody();
		String userId = getPara();
		User user = User.dao.findById(userId);
		if (user == null) {
			renderApiResult(ReturnCode.DATA_NOT_FOUND);
			return;
		}
		try {
			if (user.update(body)) {
				render(new JsonRender(new UsersJsonSerializer(user).getJson()));
			} else {
				renderApiResult(ReturnCode.DATA_UPDATE_FAILED, 422);
			}
		} catch (Exception e) {
			renderApiResult(ReturnCode.DATA_UPDATE_FAILED, 422);
			e.printStackTrace();
		}
	}

	public void delete() {
		String userId = getPara();
		User user = User.dao.findById(userId);
		if (user == null) {
			renderApiResult(ReturnCode.DATA_NOT_FOUND);
		} else {
			try {
				if (user.deleteWithAssociation()) {
					renderApiSuccess();
				} else {
					renderApiResult(ReturnCode.SYSTEM_ERROR);
				}
			} catch (Exception e) {
				renderApiResult(ReturnCode.DATA_DELETE_FAILED, 422);
				e.printStackTrace();
			}
		}
	}
}
