package com.demo.api;

import com.demo.model.Customer;
import com.demo.model.Order;
import com.demo.util.ExcelKitUtils;
import com.jfinal.core.Controller;
import com.jfinal.kit.PathKit;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.upload.UploadFile;
import com.demo.bean.BaseResponse;
import com.demo.model.Event;
import com.demo.util.FileUtils;

import java.util.List;

/**
 * Created by Lucas on 2017/3/29.
 */
public class FileAPIController extends Controller {
    public void upload(){

        UploadFile uploadFile = getFile();//在磁盘上保存文件
        String customerId = getPara("customerid");
        String orderNumber = getPara("ordernumber");
        String customerName = getPara("customername");
        String uploadPath = uploadFile.getUploadPath();//获取保存文件的文件夹
        String fileName = uploadFile.getFileName();//获取保存文件的文件名
        String filePath = uploadPath+"\\"+fileName;//保存文件的路径
        String resultFileName = FileUtils.instance.changeFileName(filePath,orderNumber);//为了避免相同文件上传冲突，使用工具类重新命名
        if(Db.findFirst("Select * from event where  ordernumber = ?",orderNumber)!=null)
            renderJson(new BaseResponse().setCode(0).setMessage("订单号已存在"));
        else {
            if(Db.findFirst("Select * from customer where customerid = ?",customerId)==null){
                Customer customer = new Customer();
                customer.set("customerid",customerId);
                customer.set("customername",customerName);
                customer.set("eventnumber",1);
                customer.save();
            }
            Event event = new Event();
            event.set("customerid", customerId);
            event.set("ordernumber", orderNumber);
            event.set("eventtype", 1);
            event.set("creattime", new java.sql.Timestamp(System.currentTimeMillis()));
            event.set("filename", resultFileName);
            event.save();
            Customer.getMe(customerId).set("eventnumber",Customer.getMe(customerId).getStr("eventnumber")+1);
            renderJson(new BaseResponse().setCode(1).setMessage("上传成功"));
        }
    }
    public void download(){
        String orderNumber = getPara("ordernumber");
        if(Db.findFirst("Select * from event where  ordernumber = ?",orderNumber)==null)
            renderJson(new BaseResponse().setCode(0).setMessage("订单号有误"));
        else {
            renderFile(Db.findFirst("Select * from event where ordernumber = ?",orderNumber).getStr("filename"));
        }

    }
    public void uploadExcel() {
        UploadFile uploadFile = getFile();//在磁盘上保存文件
        String uploadPath = uploadFile.getUploadPath();//获取保存文件的文件夹
        String fileName = uploadFile.getFileName();//获取保存文件的文件名
        String filePath = uploadPath+"\\"+fileName;//保存文件的路径
        List<String[]> list = ExcelKitUtils.instance.getExcelData(uploadFile.getFile());
        for (String[] strings : list) {
            if (strings[0] != null && !"".equals(strings[0])) {
                Order order = new Order();
                order.set("ordernumber",strings[0]);
                order.set("ordername",strings[1]);
              //  order.set("number",strings[3]);
                order.set("property",strings[5]);
                order.save();
            }
        }
        FileUtils.instance.deleteFile(filePath);
        renderJson(new BaseResponse().setCode(1).setMessage("上传成功"));
    }
}
