package controller.v1;

import java.util.List;

import org.json.JSONException;
import org.json.JSONObject;

import com.jfinal.kit.StrKit;
import com.jfinal.plugin.activerecord.Page;
import controller.ApiController;
import exception.ErrorCodedException;
import model.Symbol;
import model.User;
import common.ReturnCode;
import render.JsonRender;
import rest.API;
import view.SymbolsJsonSerializer;
import view.UsersJsonSerializer;

@API("/symbols")
public class SymbolsController extends ApiController {

	public void get() throws Exception {
		String symbolId = getPara();
		if (StrKit.isBlank(symbolId)) {
			List<Symbol> symbolList = Symbol.dao.findAll();
			Page<Symbol> symbolPage = new Page<>(symbolList, 0, symbolList.size(), 1, symbolList.size());
			render(new JsonRender(new SymbolsJsonSerializer(symbolPage).getJson()));
		} else {
			Symbol symbol = Symbol.dao.findById(symbolId);
			if (symbol == null) {
				renderApiResult(ReturnCode.DATA_NOT_FOUND, "symbolId not found");
				return;
			}
			render(new JsonRender(new SymbolsJsonSerializer(symbol).getJson()));
		}
	}

	public void post() {
		JSONObject body = getBody();
		Symbol symbol = getModel(Symbol.class);

		try {
			if (symbol.create(body)) {
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
		String symbolId = getPara();
		Symbol symbol = Symbol.dao.findById(symbolId);
		if (symbol == null) {
			renderApiResult(ReturnCode.DATA_NOT_FOUND);
			return;
		}
		try {
			if (symbol.update(body)) {
				render(new JsonRender(new SymbolsJsonSerializer(symbol).getJson()));
			} else {
				renderApiResult(ReturnCode.DATA_UPDATE_FAILED, 422);
			}
		} catch (Exception e) {
			renderApiResult(ReturnCode.DATA_UPDATE_FAILED, 422);
			e.printStackTrace();
		}
	}

	public void delete() {
		String symbolId = getPara();
		Symbol symbol = Symbol.dao.findById(symbolId);
		if (symbol == null) {
			renderApiResult(ReturnCode.DATA_NOT_FOUND);
		} else {
			try {
				if (symbol.delete()) {
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
