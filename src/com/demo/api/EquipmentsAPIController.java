package com.demo.api;
import java.sql.SQLException;
import java.util.List;

import com.demo.bean.BaseResponse;
import com.demo.bean.Code;
import com.demo.bean.DatumResponse;
import com.demo.bean.QueryResponse;
import com.demo.common.Require;
import com.demo.model.Storage;
import com.demo.util.*;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.IAtom;
import com.jfinal.plugin.activerecord.Record;

public class EquipmentsAPIController extends BaseAPIController {
	/**
	 *  查询器材的状态
	 */

	public void getBarCode(){
		String barcode =getPara("barcode");
		QueryResponse response = new QueryResponse();
		 if (!notNull(Require.me()
	                .put(barcode, "storageid can not be null")
	        )) {
	            return;
	     }
		 String sql = "SELECT * FROM equips WHERE barcode = ?";
			List<Record> equipments =Db.find(sql,barcode);
			
			if(!equipments.isEmpty()){
				response.setResult(equipments);
				response.setCode(Code.SUCCESS);
				response.setMessage("successful");
				renderJson(response);
			}else {
				renderJson(new BaseResponse().setCode(Code.FAIL).setMessage("can't found this equips"));
			}
	}

	public void updateProfile(){
		int updateid= getParaToInt("updateid");
	//	String state = getPara("state");
	//	int storageid = getParaToInt("storageid");
     	String barcode = getPara("barcode");
		QueryResponse response = new QueryResponse();
		if(notNull(Require.me()
				.put(updateid, "updateid can not be null")
	//			.put(state, "states can not be null")
	//			.put(storageid, "storageid can not be null")
				.put(barcode, "barcode can not be null")
				)){
			return;
		}
		Record equips = Db.findById("equips", barcode);
		equips.set("updateid", updateid);
		boolean update=Db.update("equisps",equips);
	//	int update= Db.update("UPDATE equips SET updateid=? WHERE barcode=?",updateid,barcode);
		System.out.println(update);
		/*String sql2 = "UPDATE storaget SET updateid=?,updatetime=?,equipmentid=?,BarCode=? WHERE StoragetID=?";
		int update2 = Db.update(sql2,updateid,new java.sql.Timestamp(System.currentTimeMillis()),barcode,storageid,Db.findById("equips", barcode).getInt("equipmentid"),storageid);*/
		if(update){
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
	public void lendEquips(){
		String barcode = getPara("barcode");
		String userid = getPara("userid");
		String updateid = getPara("updateid");
		String states = getPara("states");
		BaseResponse response = new BaseResponse();
		if(notNull(Require.me()
				.put(updateid, "updateid can not be null")
				.put(states, "states can not be null")
				.put(userid, "userid can not be null")
				.put(barcode, "barcode can not be null")
				)){
			return;
		}
		String sql = "insert into lendquips (Barcode,UserID,LendTime,UpdateID,UpdateTime,States) values(?,?,?,?,?,?)";
		int update= Db.update(sql,barcode,userid,new java.sql.Timestamp(System.currentTimeMillis()),updateid,new java.sql.Timestamp(System.currentTimeMillis()),states);
		if(update==1){
			response.setCode(Code.SUCCESS).setMessage("update successful");
		}
		else {
			response.setCode(Code.FAIL).setMessage("update fail");
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
