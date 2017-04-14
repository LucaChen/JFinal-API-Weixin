package com.demo.bean;

import java.util.List;

import com.jfinal.plugin.activerecord.Record;

import java.util.ArrayList;


public class QueryResponse extends BaseResponse {
	private List<Record> result=new ArrayList<Record>();


	public List<Record> getResult() {
		return result;
	}

	public void setResult(List<Record> result) {
		this.result = result;
	}
	 public QueryResponse() {
	        super();
	    }

	    public QueryResponse(Integer code) {
	        super(code);
	    }

	    public QueryResponse(Integer code, String message) {
	        super(code,message);
	    }


}
