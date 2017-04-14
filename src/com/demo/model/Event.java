package com.demo.model;

import com.jfinal.plugin.activerecord.Model;

/**
 * Created by Lucas on 2017/3/29.
 */
public class Event extends Model<Event> {
    private static  final long serialVersionUID = 1L;
    public static String ORDERNUMBER = "ordernumber";
    public static String CUSTOMERID = "customerid";
    public static String FILENAME = "filename";
    public static String CREATTIME = "creattime";
    public static String EVENTTYPE = "eventtype";
    public static String EVENT_ID ="eventid";
    public static final Event event = new Event();
}
