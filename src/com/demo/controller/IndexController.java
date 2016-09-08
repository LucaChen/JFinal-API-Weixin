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
		String real_password = user.getStr("userpassword");
		String get_password = user.getme(user.getStr("userid")).getStr("userpassword");
	if(real_password.equals(get_password)){
			 redirect("/equipment");
		}
		else {
			render("login.jsp");
		}
	}
	public void equipment(){
		String seacher= getPara("type");
		int page = getParaToInt("page",1);
		String sql ;
		int num;
		String select="SELECT equipment.equipmentid,equipment.equipmentname,equipment.property,equipment.`describe`,equipment.unit,equipmenttype.equipmenttypename ";
		String from = "FROM equipment,equipmenttype WHERE equipment.equipmenttypeid=equipmenttype.equipmenttypeid";
		if(seacher==null){
			sql="";
		}
		else if(seacher.matches("[1-9]")){
			sql="where equipmenttypeid = "+Integer.valueOf(seacher).intValue();
			String type = Db.findFirst("SELECT * FROM equipmenttype WHERE equipmenttypeid = ?",Integer.valueOf(seacher).intValue()).getStr("equpimenttypename");
			System.out.println(type);
			setAttr("type",type);

		}
		else{
			sql="AND equipmentname like"+"'"+seacher+"%'";
			setAttr("type",seacher);
		}

		Page<Equipment> equipmentPage = Equipment.equimpent.paginate(page, 10, select, from+sql);
		System.out.println(equipmentPage.getList());
		List<Equipment> Pagenumber = Equipment.equimpent.find("select * from equipment "+sql);
		Page<Equipmenttype>  equipmenttypePage = Equipmenttype.equipmenttype.paginate(1, 10, "select *", " from equipmenttype");
		if(Pagenumber.size()%10==0){
			num=Pagenumber.size()/10;
		}
		else{
			num = Pagenumber.size()/10+1;
		}
		setAttr("equipmenttypePage", equipmenttypePage);
		setAttr("number", Pagenumber.size());
		setAttr("equipmentPage",equipmentPage);
		setAttr("num",num);
		renderJsp("admin-equips.jsp");
	}
	public void addequipment(){
			Equipment equipment = getModel(Equipment.class, "equipment");
			equipment.save();
		    redirect("/equipment");
	}
	public void updateequipment(){
		try {
			Equipment equipment = getModel(Equipment.class,"equipment");
			equipment.update();
		}catch (Exception e){
			e.printStackTrace();
		}
		redirect("/equipment");
	}
	public void deleteequipment(){
		Equipment.equimpent.deleteById(getParaToInt(0));
		redirect("/equipment");
	}
	public void getequipment(){
		int id = getParaToInt("id");
		renderJson(Equipment.equimpent.findById(id));
	}
	public void storage(){
		String equipmentname = getPara("type");
		String sql="" ;
		String searcher = "WHERE equipmentname like"+"'"+equipmentname+"%'";
		String select ="SELECT storage.barcode,storage.warehouseid,storage.equipmentid,storage.num,storage.shelvesid,storage.storageid,equipment.equipmentname ,warehouse.warehousename ";
		String from = " FROM warehouse,`storage`  left outer join equipment ON equipment.equipmentid =`storage`.equipmentid WHERE warehouse.warehouseid= `storage`.warehouseid  ";
		int page = getParaToInt("page",1);
		int number;
		int num;
		if(equipmentname!=null){
			sql = "AND equipment.equipmentname LIKE "+"'"+equipmentname+"%'";
			setAttr("type",equipmentname);

		}

		//Page<Record> storagePage = Db.paginate(page,10,select,from+sql);
		Page<Storage> storagePage = Storage.storage.paginate(page,10,select,from+sql);
		System.out.println(storagePage.getList());
		List<Record> storage = Db.find(select+from+sql);
		System.out.println(storage.size());
		if(storage.size()%10==0){
			num=storage.size()/10;
		}
		else {
			num=storage.size()/10+1;
		}
		setAttr("storagePage",storagePage);
		setAttr("number",storage.size());
		setAttr("num",num);
		render("admin-storage.jsp");
	}
	public void deletestorage(){
		Storage.storage.deleteById(getParaToInt(0));
		redirect("/storage");
	}
	public void addstorage(){
		Storage storage = getModel(Storage.class,"storage");
		storage.save();
		redirect("/storage");
	}
	public void updatestorage(){
		Storage storage = getModel(Storage.class,"storage");
		storage.update();
		redirect("/storage");
	}
	public void getstorage(){
		int id = getParaToInt("id");
		renderJson(Storage.storage.findById(id));
	}
	public void stockin(){
		String userid = getPara("type");
		String sql="" ;
		String select ="SELECT * ";
		String from = " FROM stockin";
		int page = getParaToInt("page",1);
		int number;
		int num;
		if(userid!=null){
			sql = "AND createid LIKE "+"'"+userid+"%'";
			setAttr("type",userid);
		}
		//Page<Record> storagePage = Db.paginate(page,10,select,from+sql);
		Page<Stockin> stockinPage = Stockin.getDao().paginate(page,10,"select *","FROM stockin");
		List<Stockin> stockin = Stockin.getDao().find(select+from+sql);
		System.out.println(stockin);
		if(stockin.size()%10==0){
			num=stockin.size()/10;
		}
		else {
			num=stockin.size()/10+1;
		}
		setAttr("stockinPage",stockinPage);
		setAttr("number",stockin.size());
		setAttr("num",num);
		render("admin-stockin.jsp");
	}
	public void deletestockin(){
		Stockin.getDao().deleteById(getParaToInt(0));
		redirect("/stockin");
	}
	public void addstockin(){
		Stockin stockin = getModel(Stockin.class,"stockin");
		stockin.save();
		redirect("/stockin");
	}
	public void updatestockin(){
		Stockin stockin = getModel(Stockin.class,"stockin");
		stockin.update();
		redirect("/stockin");
	}
	public void getstockin(){
		int id = getParaToInt("id");
		renderJson(Stockin.getDao().findById(id));
		System.out.println(Stockin.getDao().findById(id));
	}
	public void getstockindetails(){
		int id = getParaToInt("id");
		String select = "SELECT stockindetail.id,equipment.property,stockindetail.num,equipment.equipmentname,stockindetail.barcode,stockindetail.state,stockindetail.shelvesid FROM stockindetail,equipment ";
		String where ="WHERE equipment.equipmentid=stockindetail.equipmentid And stockinid=?";
		List<Record> stockindetails = Db.find(select+where,id);
		System.out.print(stockindetails.size());
		renderJson(stockindetails);
	}
	public void detelestockindetails(){
		Stockindetail.getDao().deleteById(getParaToInt("id"));
		renderJson("OK");
	}
	public void addstockindetails(){
		int equipmentid = getParaToInt("equipmentid");
		System.out.println(equipmentid);
		int num = getParaToInt("num");
		String shelvesid = getPara("shelvesid");
		String state = getPara("state");
		int stockinid = getParaToInt("stockinid");
		String code = getPara("barcode");
		String barcode = Equipment.equimpent.findById(equipmentid).getStr("itemcode")+code;
		System.out.println(barcode);
		System.out.println(Equipment.equimpent.findById(equipmentid).getStr("itemcode"));
		new Stockindetail().set("equipmentid",equipmentid).set("num",num).set("stockinid",stockinid).set("state",state).set("shelvesid",shelvesid).set("barcode",barcode).save();
		renderJson("OK");
	}
	public void updatestockindetails(){
		int equipmentid = getParaToInt("equipmentid");
		System.out.println(equipmentid);
		int num = getParaToInt("num");
		String shelvesid = getPara("shelvesid");
		String state = getPara("state");
		int id = getParaToInt("id");
		String code = getPara("barcode");
		String barcode = Equipment.equimpent.findById(equipmentid).getStr("itemcode")+code;
		System.out.println(barcode);
		System.out.println(Equipment.equimpent.findById(equipmentid).getStr("itemcode"));
		Stockindetail.getDao().findById(id).set("num",num).set("shelvesid",shelvesid).set("barcode",barcode).set("state",state).set("equipmentid",equipmentid).update();
		renderJson("OK");
	}
	public void findstockindetails(){
		int id = getParaToInt("id");
		renderJson(Stockindetail.getDao().findById(id));
	}
	public void getFindStockinDetails(){
		int id = getParaToInt("id");
		String select = "SELECT stockindetail.equipmentid,stockindetail.id,equipment.property,stockindetail.num,equipment.equipmentname,stockindetail.barcode,stockindetail.state,stockindetail.shelvesid FROM stockindetail,equipment ";
		String where ="WHERE equipment.equipmentid=stockindetail.equipmentid And stockindetail.id=?";
		List<Record> stockindetails = Db.find(select+where,id);
		System.out.print(stockindetails.size());
		renderJson(stockindetails);
	}
	public void getEquipmentType() {
		List<Equipmenttype> equipmenttypeList = Equipmenttype.equipmenttype.find("SELECT equipmenttypename,equipmenttypeid FROM equipmenttype");
		renderJson(equipmenttypeList);
	}
	public void getWareHouse(){
		List<Warehouse> warehouseList = Warehouse.getDao().find("select warehousename,warehouseid from warehouse");
		renderJson(warehouseList);
	}
	public void getEquipmentName(){
		List<Equipment> equipmentList = Equipment.equimpent.find("select DISTINCT equipmentname from equipment");
		renderJson(equipmentList);
	}
	public void getProperty(){
		String name = getPara("name");
		System.out.println(name);
		List<Equipment> equipmentList = Equipment.equimpent.find("select property,equipmentid from equipment where equipmentname = ?",name);
		System.out.print(equipmentList.size());
		renderJson(equipmentList);
	}
	public void getShelvesid(){
		List<Storage> storageList = Storage.storage.find("select shelvesid from storage");
		renderJson(storageList);
	}

}
