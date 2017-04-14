package com.demo.model;

import com.jfinal.plugin.activerecord.Model;

/**
 * Created by Lucas on 2017/3/29.
 */
public class Customer extends Model<Customer> {
    public static String OPENID = "openid";
    public static String NICKNAME = "nickname";
    public static String EVENTNUMBER = "eventnumber";
    public static String IMAGE = "image";
    public static final Customer customer = new Customer();
    public static Customer getMe(String id){
        return Customer.customer.findById(id);
    }
}
