package com.demo.api;

import static com.demo.model.User.user;

import java.util.List;

import com.demo.bean.BaseResponse;
import com.demo.bean.Code;
import com.demo.bean.QueryResponse;
import com.demo.common.Require;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Record;
import com.demo.model.*;

public class RequirationAPIController extends BaseAPIController {
	/**
	 * 更改申请单状态
	 */
	public void updateStatus(){
		String requirationid = getPara("requirationid");
		String requirationstatus=getPara("requirationstatus");
		BaseResponse response = new BaseResponse();
		if (!notNull(Require.me()
                .put(requirationid, "requirationid can not be null")             
        )) {
            return;
        }
		 if (Db.findFirst("SELECT * FROM requiration WHERE requirationid=?", requirationid) == null) {
	            renderJson(new BaseResponse(Code.NOT_FOUND,"requirationid is not found"));
	            return;
	        }
	     Record requisition = Db.findById("requirationid", requirationid).set("RequirationStatus", requirationstatus);
	     boolean  update  = Db.update("requisition",requisition);
         renderJson(response.setCode(update ? Code.SUCCESS : Code.FAIL).setMessage(update ? "update success" : "update failed"));
	}
	/**
	 *  查询订单详情
	 */
	public void getDetail(){
		String requirationid = getPara("requirationid");
		
		String sql = "SELECT * FROM requirationdetail WHERE requirationid = ?";
		List<Record> result =Db.find(sql,requirationid);
		QueryResponse response = new QueryResponse();
		if(result!=null){
			response.setResult(result);
			response.setCode(Code.SUCCESS);
			response.setMessage("this is successful");
			renderJson(response);
		}else {
			renderJson(new BaseResponse().setCode(Code.FAIL).setMessage("can't found this requirationid"));
		}
		
	}
	
}
