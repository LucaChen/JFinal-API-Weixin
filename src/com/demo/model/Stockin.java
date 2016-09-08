package com.demo.model;

import com.jfinal.plugin.activerecord.Model;

public class Stockin extends Model<Stockin> {

	private static final long serialVersionUID = 1L;
	
	private static final Stockin stockin = new Stockin();

	public static Stockin getDao() {
		return stockin;
	}
	

}
