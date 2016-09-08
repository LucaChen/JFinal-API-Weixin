package com.demo.model;

import com.jfinal.plugin.activerecord.Model;

public class Requisition extends Model<Requisition> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private static String RequirationID="RequirationID";
	private static String RequirationStatus="RequirationStatus";
	private static String CreatID="CreatID";
	private static String CreatTime="CreatTime";
	private static String UpdateID="UpdateID";
	private static String UpdateTime="UpdateTime";
	private static String RemoveID="RemoveID";
	private static String RemoveTime="RemoveTime";
	private static String UserID="UserID";
	
	private static final Requisition requisition = new Requisition();

}
