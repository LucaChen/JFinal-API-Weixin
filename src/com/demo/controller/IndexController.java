package com.demo.controller;

import java.util.List;

import com.demo.bean.Code;
import com.demo.bean.QueryResponse;
import com.demo.common.Require;
import com.demo.model.*;
import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;



public class IndexController extends Controller {
	
	
	public void  index() {
		render("login.jsp");
	}

	public void login(){
		User user = getModel(User.class,"user");
		String real_password = user.getStr("password");
		String get_password = User.user.findById(user.getStr("userid")).getStr("password");
	if(real_password.equals(get_password)){
			 redirect("/event");
		}
		else {
			render("login.jsp");
		}
	}
	public void test(){
		render("index.jsp");
	}
	public void event(){
		String seacher = getPara("type");
		int page = getParaToInt("page",1);
		String sql;
		int num;
		String select="SELECT event.ordernumber,event.creattime,event.state,event.customerid,event.eventid,customer.customername ";
		String from = "FROM event,customer WHERE customer.openid=event.customerid";
		if(seacher==null){
			sql="";
		}
		else if(seacher.matches("[1-9]")){
			sql="And state = "+seacher;
		//	String type = Db.findFirst("SELECT * FROM  WHERE equipmenttypeid = ?",Integer.valueOf(seacher).intValue()).getStr("equpimenttypename");
		//	System.out.println(type);
			setAttr("type",seacher);

		}
		else{
			sql="AND ordernumber = "+seacher;
			setAttr("type",seacher);
		}

		//Page<Event> equipmentPage = Event.event.paginate(page, 10, select, from);
		//System.out.println(equipmentPage.getList());
		List<Event> eventsList = Event.event.find(select+from);
		if(eventsList.size()%10==0){
			num=eventsList.size()/10;
		}
		else{
			num = eventsList.size()/10+1;
		}
		setAttr("number", eventsList.size());
		setAttr("eventPage",eventsList);
		setAttr("num",num);
		renderJsp("admin-event.jsp");
	}

}
