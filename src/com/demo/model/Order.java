package com.demo.model;

import com.jfinal.plugin.activerecord.Model;
import org.apache.poi.hssf.record.formula.functions.Or;

/**
 * Created by root on 17-4-14.
 */
public class Order extends Model<Order> {
    private static  final long serialVersionUID = 1L;
    public static String ORDERNUMBER = "ordernumber";
    public static String ORDERNAME = "ordername";
    public static String PROPERTY = "property";
    public static String PURCHASENAME = "purchasename";
    public static String CREATTIME = "creattime";
    public static String PHONENUMBR = "phonenumber";
    public static final Order order = new Order();
}
