package controller.v1;

import java.util.List;

import org.json.JSONException;
import org.json.JSONObject;

import com.jfinal.kit.StrKit;
import com.jfinal.plugin.activerecord.Page;
import controller.ApiController;
import exception.ErrorCodedException;
import model.User;
import model.UserPortfolio;
import common.ReturnCode;
import render.JsonRender;
import rest.API;
import view.UserPortfoliosJsonSerializer;
import view.UsersJsonSerializer;

@API("/users/:user_id/user_portfolios")
public class UserPortfoliosController extends ApiController {

	public void get() throws Exception {
		String userId = getAttr("user_id");
		String userPortfolioId = getPara();
		
		if (StrKit.isBlank(userPortfolioId)) {
			List<UserPortfolio> userList = UserPortfolio.dao.findUserPortfolio(userId);
			Page<UserPortfolio> usersPage = new Page<>(userList, 0, userList.size(), 1, userList.size());
			render(new JsonRender(new UserPortfoliosJsonSerializer(usersPage).getJson()));
		} else {
			UserPortfolio userPortfolio = UserPortfolio.dao.findById(userPortfolioId);
			if (userPortfolioId == null) {
				renderApiResult(ReturnCode.DATA_NOT_FOUND, "userPortfolio not found");
				return;
			}
			render(new JsonRender(new UserPortfoliosJsonSerializer(userPortfolio).getJson()));
		}
	}

	public void post() {
		JSONObject body = getBody();
		UserPortfolio userPortfolio = getModel(UserPortfolio.class);

		try {
			if (userPortfolio.create(body)) {
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
		String userPortfolioId = getPara();
		UserPortfolio userPortfolio = UserPortfolio.dao.findById(userPortfolioId);
		if (userPortfolio == null) {
			renderApiResult(ReturnCode.DATA_NOT_FOUND);
			return;
		}
		try {
			if (userPortfolio.update(body)) {
				render(new JsonRender(new UserPortfoliosJsonSerializer(userPortfolio).getJson()));
			} else {
				renderApiResult(ReturnCode.DATA_UPDATE_FAILED, 422);
			}
		} catch (Exception e) {
			renderApiResult(ReturnCode.DATA_UPDATE_FAILED, 422);
			e.printStackTrace();
		}
	}

	public void delete() {
		String userPortfolioId = getPara();
		UserPortfolio userPortfolio = UserPortfolio.dao.findById(userPortfolioId);
		if (userPortfolio == null) {
			renderApiResult(ReturnCode.DATA_NOT_FOUND);
		} else {
			try {
				if (userPortfolio.delete()) {
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
