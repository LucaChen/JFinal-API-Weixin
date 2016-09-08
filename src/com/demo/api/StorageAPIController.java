package com.demo.api;

import java.awt.image.DataBufferDouble;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.BlockingDeque;

import com.demo.bean.*;
import com.demo.common.Require;
import com.demo.model.*;
import com.demo.util.StringUtils;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.IAtom;
import com.jfinal.plugin.activerecord.Record;

public class StorageAPIController extends BaseAPIController {
	/**
	 * 根据器材id查询器材仓储情况
	 */
	public void getProfile(){
		List<Record> s;
		QueryResponse response = new QueryResponse();
		String equipmentid = getPara("equipmentid");
		String shelvesid=getPara("shelvesid");
		if(StringUtils.isNotEmpty(equipmentid)){
		    s=Db.find("SELECT * FROM storage WHERE equipmentid=?", equipmentid);
	        if(s!=null){
	    	    response.setResult(s);
	    	    response.setCode(Code.SUCCESS).setMessage("successful");
	    	    renderJson(response);
	    	    return;
	       }
	        else {
				renderJson(new BaseResponse().setCode(Code.NOT_FOUND).setMessage("can't found equipmentid"));
				return;
			}
		}
		else if(StringUtils.isNotEmpty(shelvesid)){
			String sql="SELECT * FROM storage WHERE ShelvesID like '"+shelvesid+"'";
			s=Db.find(sql);
			if(s!=null){
				response.setResult(s);
				response.setCode(Code.SUCCESS).setMessage("successful");
			    renderJson(response);
			    return;
			}else{
				renderJson(new BaseResponse().setCode(Code.NOT_FOUND).setMessage("can't found shelvesid"));
				return;
			}
		}
		else {
			renderArgumentError("must set profile");
		}	   
	}
	public void getProfileById() {
		int storagetid =getParaToInt("storagetid");
		QueryResponse response = new QueryResponse();
		 if (!notNull(Require.me()
	                .put(storagetid, "storageid can not be null")
	        )) {
	            return;
	     }
		 String sql = "SELECT * FROM storaget WHERE storagetid = ?";
			List<Record> equipments =Db.find(sql,storagetid);
			
			if(!equipments.isEmpty()){
				response.setResult(equipments);
				response.setCode(Code.SUCCESS);
				response.setMessage("successful");
				renderJson(response);
			}else {
				renderJson(new BaseResponse().setCode(Code.FAIL).setMessage("can't found this storageid"));
			}
	}
	public void update(){
	    String updateid =getPara("updateid");
		String barcode =getPara("barcode");
		String state = getPara("state");
		int storaget =getParaToInt("storaget");
		QueryResponse response = new QueryResponse();
		 if (!notNull(Require.me()
	                .put(storaget, "storageid can not be null")
	                .put(barcode, "barcode can not be null")
	                .put(state, "state can not be null")
	                .put(updateid,"updateid can not be null")
	        )) {
	            return;
	     }
		 boolean update = Db.tx(new IAtom() {
			
			@Override
			public boolean run() throws SQLException {
				// TODO Auto-generated method stub
				int count1 = Db.update("UPDATE equips SET updateid=?,storagetid =? WHERE barcode=?",updateid,storaget,barcode);
		        int count2 = Db.update("UPDATE storaget SET updateid=?,BarCode=? WHERE StoragetID=?",updateid,barcode,storaget);
				return count1==1&&count2==1;
			}
		});
			
		 if(update){
			response.setCode(Code.SUCCESS);
			response.setMessage("successful");
			renderJson(response);
		 }else {
			 renderJson(new BaseResponse().setCode(Code.FAIL).setMessage("fail"));
		 }
	}
}
	
