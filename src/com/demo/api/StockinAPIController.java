package com.demo.api;

import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Record;
import com.mchange.v2.lang.Coerce;

import java.util.HashMap;
import java.util.List;

import com.demo.bean.*;
import com.demo.common.Require;
import com.demo.model.*;

public class StockinAPIController extends BaseAPIController {
	public void getStockInProfile(){
		String requisitionid = getPara("reqisitionid");
		DataResponse response = new DataResponse();
		if(notNull(Require.me()
				.put(requisitionid, "requisition can not be null")
				)){
			return;
		}
		if(Db.findFirst("select * from requisition where requisitionid = ?",requisitionid)==null){
			response.setCode(Code.NOT_FOUND).setMessage("requisitionid can not be found");
			renderJson(response);
			return;
		}
		Record stockin = Db.findFirst("select * from stockin where requisitionid=?",requisitionid);
		if(stockin==null){
			response.setCode(Code.NOT_FOUND).setMessage("stockin can not be found");
			renderJson(response);
			return;
		}
		List<Record> result = Db.find("select * from stockindetail where stockinid= ?",stockin.getInt("requirationid"));
		response.setData(stockin);
		response.setCode(Code.SUCCESS);
		response.setMessage("successful");
		response.setResult(result);
	}
	public void getEquipmentProfile(){
		String barcode = getPara("barcode");
		DataResponse response = new DataResponse();
		Record equips = Db.findFirst("select * from equips wherr barcode = ?",barcode);
		List<Record> stockindetail = Db.find("select * from stockindetail where barcode = ?",barcode);
		if(equips==null){
			response.setCode(Code.NOT_FOUND).setMessage("equips can not be found");
			renderJson(response);
			return;
		}
		if(stockindetail==null){
			response.setCode(Code.NOT_FOUND).setMessage("stockindetail can not be found");
			renderJson(response);
			return;
		}
		response.setCode(Code.SUCCESS).setMessage("successful");
		response.setData(equips);
		response.setResult(stockindetail);
		renderJson(response);
	    return;		
	}
	public void updateStockinFail(){
		String stockoutid= getPara("stockoutid");
		BaseResponse response = new BaseResponse();
		if(notNull(Require.me().put("stockoutid", "stockoutid can not be null"))){
			return ;
		}
		String sql = "Update stockout set Stockinstate = '缺少物品'  where stockoutid = ?";
		int update = Db.update(sql,stockoutid);
		if(update==1){
			response.setCode(Code.SUCCESS).setMessage("update successful");
		}
		else {
			response.setCode(Code.FAIL).setMessage("update fail");
		}	
	}
	public void updateStockinSuccess(){     
		String stockoutid= getPara("stockoutid");
		BaseResponse response = new BaseResponse();
		if(notNull(Require.me().put("stockoutid", "stockoutid can not be null"))){
			return ;
		}
		
		String sql = "Update stockout set Stockinstate = '完成'  where stockoutid = ?";
		int update = Db.update(sql,stockoutid);
		if(update==1){
			response.setCode(Code.SUCCESS).setMessage("update successful");
		}
		else {
			response.setCode(Code.FAIL).setMessage("update fail");
		}	
	}
}
