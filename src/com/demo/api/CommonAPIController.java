package com.demo.api;

import com.demo.bean.BaseResponse;
import com.jfinal.plugin.activerecord.Db;

/**
 * Created by root on 17-4-14.
 */
public class CommonAPIController extends BaseAPIController{
    public void getOrderProfile(){
        String ordernumber = getPara("ordernumber");
        if(Db.findFirst("select * from order where ordernumber = ?",ordernumber)!=null){
            renderJson(new BaseResponse().setCode(1).setMessage("订单号存在"));
        }
        else {
            renderJson(new BaseResponse().setCode(0).setMessage("订单号不存在"));
        }
    }
}
