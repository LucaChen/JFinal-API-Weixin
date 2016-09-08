package com.demo.model;
import com.jfinal.plugin.activerecord.Model;

import java.util.Map;


public class User extends Model<User> {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	public static String USER_ID = "UserID";
	public static String PASSWORD = "UserPassword";
	public static String USER_NAME = "UserName";
	public static String USER_PHONE = "UserPhone";
	public static String USER_EMAIL = "UserEmail";
	public static String USER_POWER = "UserPower";
	public static String USER_TYPE = "UserType";
	public static String CREAT_ID = "CreatID";
	public static String CREAT_TIME = "CreateTime";
	public static String UPDATE_ID = "UpdateID";
	public static String UPDATE_TIME = "UpdateTime";
	public static String REMOVE_ID = "RemoveID";
	public static String REMOVE_TIME = "RemoveTime";

	public static final User user = new User();


    public User getme(String id){
        return User.user.findById(id);
    }

    public static final boolean checkSex(int sex) {
        
        return sex == 1 || sex == 0;
    }
    
	@Override
	public Map<String, Object> getAttrs() {
		return super.getAttrs();
	}
}
