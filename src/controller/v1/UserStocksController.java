package controller.v1;

import java.util.List;

import org.json.JSONException;
import org.json.JSONObject;

import com.jfinal.kit.StrKit;
import com.jfinal.plugin.activerecord.Page;
import controller.ApiController;
import exception.ErrorCodedException;
import model.User;
import model.UserStock;
import common.ReturnCode;
import render.JsonRender;
import rest.API;
import view.UserStocksJsonSerializer;
import view.UsersJsonSerializer;

@API("/user_stocks")
public class UserStocksController extends ApiController {

	public void get() throws Exception {
		String userStockId = getPara();
		if (StrKit.isBlank(userStockId)) {
			List<UserStock> userStockList = UserStock.dao.findAll();
			Page<UserStock> userStock = new Page<>(userStockList, 0, userStockList.size(), 1, userStockList.size());
			render(new JsonRender(new UserStocksJsonSerializer(userStock).getJson()));
		} else {
			UserStock userStock = UserStock.dao.findById(userStockId);
			if (userStockId == null) {
				renderApiResult(ReturnCode.DATA_NOT_FOUND, "UserStock not found");
				return;
			}
			render(new JsonRender(new UserStocksJsonSerializer(userStock).getJson()));
		}
	}

	public void post() {
		JSONObject body = getBody();
		UserStock userStock = getModel(UserStock.class);

		try {
			if (userStock.create(body)) {
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
		String userStockId = getPara();
		UserStock userStock  = UserStock.dao.findById(userStockId);
		if (userStock == null) {
			renderApiResult(ReturnCode.DATA_NOT_FOUND);
			return;
		}
		try {
			if (userStock.update(body)) {
				render(new JsonRender(new UserStocksJsonSerializer(userStock).getJson()));
			} else {
				renderApiResult(ReturnCode.DATA_UPDATE_FAILED, 422);
			}
		} catch (Exception e) {
			renderApiResult(ReturnCode.DATA_UPDATE_FAILED, 422);
			e.printStackTrace();
		}
	}

	public void delete() {
		String userStockId = getPara();
		UserStock userStock = UserStock.dao.findById(userStockId);
		if (userStock == null) {
			renderApiResult(ReturnCode.DATA_NOT_FOUND);
		} else {
			try {
				if (userStock.delete()) {
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
