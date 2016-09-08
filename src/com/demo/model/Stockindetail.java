package com.demo.model;

import com.jfinal.plugin.activerecord.Model;

public class Stockindetail extends Model<Stockindetail> {
	private static final long serialVersionUID = 1L;
	
	private static final Stockindetail stockindetail = new Stockindetail();

	public  static Stockindetail getDao(){
		return stockindetail;
	}
}
