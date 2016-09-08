package com.demo.api;
import java.util.ArrayList;
import java.util.List;

import org.omg.CORBA.PUBLIC_MEMBER;
import java.sql.Connection;
import java.sql.SQLException;

import com.demo.bean.*;
import com.demo.common.Require;
import com.demo.model.*;
import com.demo.router.*;
import com.demo.util.*;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Record;
public class EquipmentAPIController extends BaseAPIController {
	/**
	 * 根据器材名查询器材信息
	 */
	public void queryName()throws BaseException{
		String equipmentname =getPara("equipmentname");
		String sql = "SELECT * FROM equipment WHERE equipmentname like"+"'"+equipmentname+"%'";
		System.out.println(sql);
		List<Record> equipments = Db.find(sql) ;
		QueryResponse response = new QueryResponse();
		if(!equipments.isEmpty()){
			response.setResult(equipments);
			response.setCode(Code.SUCCESS);
			response.setMessage("successful");
			renderJson(response);
		}else {
			renderJson(new BaseResponse().setCode(Code.FAIL).setMessage("can't found this equipment"));
		}
	}
	/**
	 * 根据器材id查询器材信息
	 */
	public void queryId(){
		int equipmentid = getParaToInt("equipmentid");
		 if (!notNull(Require.me()
	                .put(equipmentid, "equipmentid can not be null")
	        )) {
	            return;
	     }
		String sql = "SELECT * FROM equipment WHERE equipmentid = ?";
		List<Record> equipments =Db.find(sql,equipmentid);
		QueryResponse response = new QueryResponse();
		if(!equipments.isEmpty()){
			response.setResult(equipments);
			response.setCode(Code.SUCCESS);
			response.setMessage("successful");
			renderJson(response);
		}else {
			renderJson(new BaseResponse().setCode(Code.FAIL).setMessage("can't found this equipment"));
		}
	}
	
	
}
