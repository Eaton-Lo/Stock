package controller.v1;

import java.util.List;

import org.json.JSONException;
import org.json.JSONObject;

import com.jfinal.kit.StrKit;
import com.jfinal.plugin.activerecord.Page;
import controller.ApiController;
import exception.ErrorCodedException;
import model.User;
import model.Transaction;
import common.ReturnCode;
import render.JsonRender;
import rest.API;
import view.TransactionsJsonSerializer;
import view.UsersJsonSerializer;

@API("/transactions")
public class TransactionsController extends ApiController {

	public void get() throws Exception {
		String transactionId = getPara();
		if (StrKit.isBlank(transactionId)) {
			List<Transaction> transactionList = Transaction.dao.findAll();
			Page<Transaction> transactionPage = new Page<>(transactionList, 0, transactionList.size(), 1, transactionList.size());
			render(new JsonRender(new TransactionsJsonSerializer(transactionPage).getJson()));
		} else {
			Transaction transaction = Transaction.dao.findById(transactionId);
			if (transaction == null) {
				renderApiResult(ReturnCode.DATA_NOT_FOUND, "transaction not found");
				return;
			}
			render(new JsonRender(new TransactionsJsonSerializer(transaction).getJson()));
		}
	}

	public void post() {
		JSONObject body = getBody();
		Transaction transaction = getModel(Transaction.class);

		try {
			if (transaction.create(body)) {
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
		String transactionId = getPara();
		Transaction transaction = Transaction.dao.findById(transactionId);
		if (transaction == null) {
			renderApiResult(ReturnCode.DATA_NOT_FOUND);
			return;
		}
		try {
			if (transaction.update(body)) {
				render(new JsonRender(new TransactionsJsonSerializer(transaction).getJson()));
			} else {
				renderApiResult(ReturnCode.DATA_UPDATE_FAILED, 422);
			}
		} catch (Exception e) {
			renderApiResult(ReturnCode.DATA_UPDATE_FAILED, 422);
			e.printStackTrace();
		}
	}

	public void delete() {
		String transactionId = getPara();
		Transaction transaction = Transaction.dao.findById(transactionId);
		if (transaction == null) {
			renderApiResult(ReturnCode.DATA_NOT_FOUND);
		} else {
			try {
				if (transaction.delete()) {
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
