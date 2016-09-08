package com.demo.bean;

import java.util.ArrayList;
import java.util.List;

import com.jfinal.plugin.activerecord.Record;

/**
 * @author malongbo
 * @date 2015/1/17
 * @package com.pet.project.bean
 */
public class DataResponse extends BaseResponse {
	private List<Record> result=new ArrayList<Record>();
	Object data;

    public DataResponse() {
        super();
    }

    public DataResponse(String message) {
        super(message);
    }

    public DataResponse (Object data) {
        this.data = data;
    }

    public DataResponse(Integer code) {
        super(code);
    }

    public DataResponse(Integer code, String message) {
        super(code, message);
    }


	public Object getData() {
		return data;
	}

	public void setData(Object data) {
		this.data = data;
	}

	public List<Record> getResult() {
		return result;
	}

	public void setResult(List<Record> result) {
		this.result = result;
	}
}
