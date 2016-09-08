package com.demo.model;

import java.util.Map;

import com.jfinal.plugin.activerecord.Model;
import java.util.Map;

public class Equips extends Model<Equips> {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private static String BarCode = "BarCode";
	private static String EquipmentID ="EquipmentID";
	private static String StorageID = "StorageID";
	private static String CreatID ="CreatID";
	private static String CreatTime ="CreatTime";
	private static String UpdateTime ="UpdateTime";
	private static String UpdateID ="UpdateID";
	private static String RemoveID ="RemoveID";
	private static String RemoveTime ="RemoveTime";
	private static String State="State";
	
	private static final Equips equips = new Equips();
	
	public Equips getequips(String Barcode){
		Equips result;
		result = Equips.equips.findById("Barcode",Barcode);
		return result;
	}
	public Map<String, Object> getAttrs() {
		return super.getAttrs();
	}

}
