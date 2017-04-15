package com.demo;

import com.jfinal.config.Constants;
import com.jfinal.config.Handlers;
import com.jfinal.config.Interceptors;
import com.jfinal.config.JFinalConfig;
import com.jfinal.config.Plugins;
import com.jfinal.config.Routes;
import com.jfinal.core.JFinal;
import com.jfinal.kit.PathKit;
import com.jfinal.kit.PropKit;
import com.jfinal.plugin.activerecord.ActiveRecordPlugin;
import com.jfinal.plugin.c3p0.C3p0Plugin;
import com.jfinal.render.ViewType;

import java.util.Locale.FilteringMode;

import javax.tools.ForwardingFileObject;

import com.demo.model.*;
import com.demo.model.User;
import com.demo.router.APIRouter;
import com.demo.controller.*;
import org.apache.poi.hssf.record.formula.functions.Or;

public class MainConfig extends JFinalConfig {

	@Override
	public void configConstant(Constants me) {
		me.setDevMode(true);
		me.setEncoding("UTF-8");
		me.setViewType(ViewType.JSP);
		me.setBaseUploadPath(PathKit.getWebRootPath()+"/upload");
		me.setBaseDownloadPath(PathKit.getWebRootPath()+"/upload");
	    PropKit.use("config.properties");
	}

	@Override
	public void configHandler(Handlers me) {
		// TODO Auto-generated method stub
	}

	@Override
	public void configInterceptor(Interceptors arg0) {
		// TODO Auto-generated method stub

	}

	@Override
	public void configPlugin(Plugins me) {
		// TODO Auto-generated method stub
	/*		C3p0Plugin  c3p0Plugin = new C3p0Plugin(PropKit.get("jdbcUrl"),PropKit.get("user"),PropKit.get("password"));
			ActiveRecordPlugin arp = new ActiveRecordPlugin(c3p0Plugin); 
			arp.setShowSql(true);
			arp.addMapping("user","userid", User.class);
			me.add(c3p0Plugin);
			me.add(arp);*/
		C3p0Plugin cp = new C3p0Plugin("jdbc:mysql://localhost/weixin?useOldAliasMetadataBehavior=true&characterEncoding=UTF-8&amp;useUnicode=true", "root", "123456");
		me.add(cp);  
		ActiveRecordPlugin arp = new ActiveRecordPlugin(cp); 
		me.add(arp);  
		arp.addMapping("user","userid" ,User.class);
		arp.addMapping("event","eventid",Event.class);
		arp.addMapping("customer","openid",Customer.class);
		arp.addMapping("order","ordernumber", Order.class);
	}

	@Override
	public void configRoute(Routes me) {
		// TODO Auto-generated method stub
		me.add(new APIRouter());
		me.add("/",IndexController.class);
	}
	public static void main(String[] args) {
		JFinal.start("WebRoot",80,"/",5);
	}

}