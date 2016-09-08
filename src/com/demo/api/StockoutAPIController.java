package com.demo.api;

import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Record;
import com.mchange.v2.lang.Coerce;

import java.util.HashMap;
import java.util.List;

import com.demo.bean.*;
import com.demo.common.Require;
import com.demo.model.Stockin;
import com.demo.model.Stockout;

public class StockoutAPIController extends BaseAPIController {
	public void getStockoutProfile(){
		String  stockoutid = getPara("stockoutid");
		DataResponse response = new DataResponse();
		if(notNull(Require.me()
				.put(stockoutid, "stockoutid can not be null")
				)){
			return;
		}
		if(Db.findFirst("select * from stockin where stockinid = ?",stockoutid)==null){
			response.setCode(Code.NOT_FOUND).setMessage("stockoutid can not be found");
			renderJson(response);
			return;
		}
		Record stockout = Db.findFirst("select * from stockoutdetail where stockoutid=?",stockoutid);
		if(stockout==null){
			response.setCode(Code.NOT_FOUND).setMessage("stockoutdetail can not be found");
			renderJson(response);
			return;
		}
		List<Record> result = Db.find("select * from stockoutdetail where stockoutid= ?",stockoutid);
		response.setData(stockout);
		response.setCode(Code.SUCCESS);
		response.setMessage("successful");
		response.setResult(result);
	}
	public void updateStates(){
		String acceptid =getPara("acceptid");
		String stockoutid = getPara("stockoutid");
		Record stockout;
		BaseResponse response = new BaseResponse();
		if(notNull(Require.me()
				.put(acceptid, "acceptid can not be null")
				.put(stockoutid, "stockoutid can not be null")
				)){
			return;
		}
		stockout = Db.findById("stockout", stockoutid);
		stockout.set("AcceptID", acceptid);
		stockout.set("AcceptTime", new java.sql.Timestamp(System.currentTimeMillis()));
		boolean update = Db.update("stockout",stockout);
		if(update){
			response.setCode(Code.SUCCESS).setMessage("update successful");
		}
		else {
			response.setCode(Code.FAIL).setMessage("update fail");
		}	
	}
}
