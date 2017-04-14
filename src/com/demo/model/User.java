package com.demo.model;

import com.jfinal.plugin.activerecord.Model;

import java.util.Map;

/**
 * Created by Lucas on 2017/3/29.
 */
public class User extends Model<User> {
    private static  final long serialVersionUID = 1L;
    public static String USER_ID = "userid";
    public static String PASSWORD = "password";
    public static String USER_NAME = "username";
    public static String USER_TYPE = "usertype";
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
