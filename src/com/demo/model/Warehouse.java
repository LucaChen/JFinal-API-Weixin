package com.demo.model;

import com.jfinal.plugin.activerecord.Model;

public class Warehouse extends Model<Warehouse> {
	private static String WareHouseID="WareHouseID";
	private static String WareHouseName="WareHouseName";
	private static String CreatID="CreatID";
	private static String CreatTime="CreatID";
	private static String UpdateID="UpdateID";
	private static String UpdateTime="UpdateTime";
	private static String RemoveID="RemoveID";
	private static String RemoveTime="RemoveTime";
	
	private static final Warehouse warehouse = new Warehouse();

	public static Warehouse getDao(){
		return  warehouse;
	}

}
