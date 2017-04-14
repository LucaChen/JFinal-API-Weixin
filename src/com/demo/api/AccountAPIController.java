package com.demo.api;

import com.demo.api.BaseAPIController;
/*import com.jfinal.aop.*;
import com.jfinal.plugin.activerecord.Db;*/
import com.demo.bean.*;
/*import com.demo.util.SMSUtils;*/
import com.demo.common.Require;
/*import com.demo.util.DateUtils;
import com.demo.util.RandomUtils;
import com.demo.util.StringUtils;
import com.demo.cofig.*;*/
//import com.mlongbo.jfinal.interceptor.TokenInterceptor;
import com.demo.model.User;
import com.demo.util.*;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Record;

import static com.demo.model.User.*;

import java.awt.List;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

//import org.eclipse.jetty.jndi.java.javaNameParser;

/**
 * 用户账号相关的接口*
 *
 * 检查账号是否被注册: GET /api/account/checkUser
 * 发送注册验证码: POST /api/account/sendCode
 * 注册: POST /api/account/register
 * 登录： POST /api/account/login
 * 查询用户资料: GET /api/account/profile
 * 修改用户资料: PUT /api/account/profile
 * 修改密码: PUT /api/account/password
 * 修改头像: PUT /api/account/avatar
 *
 */
public class AccountAPIController extends BaseAPIController {
    
	/**
	 * 用户注册
	 */
	public void register(){
		//必填信息
		String userid = getPara("userid");//登录帐号
		String userphone = getPara("userphone");//电话号码
		String useremail = getPara("useremail");//邮箱地址
        String password = getPara("password");//密码
		String username = getPara("username");//姓名
		String creatid =getPara("creatid");
        //校验必填项参数
		if(!notNull(Require.me()
                .put(userid, "loginName can not be null")
                .put(useremail, "email can not be null")//
                .put(password, "password can not be null")
                .put(userphone, "phone can not be null")
                .put(creatid, "creatid can not be null")
                .put(username, "nickName can not be null"))){
			return;
		}

        //检查id是否已被注册
        if (Db.findFirst("SELECT * FROM user WHERE userid=?", userid) != null) {
            renderJson(new BaseResponse(Code.ACCOUNT_EXISTS, "userid already registered"));
            return;
        }
        //检查邮箱地址是否已经被注册
        if (Db.findFirst("SELECT * FROM user WHERE useremail=?", useremail) != null) {
            renderJson(new BaseResponse(Code.EMAIL_EXISTS,"useremail already registered"));
            return;
        }
        if (Db.findFirst("SELECT * FROM user WHERE username=?", username) != null) {
            renderJson(new BaseResponse(Code.NAME_EXISTS,"username already registered"));
            return;
        }
        
		//保存用户数据

		User user = new User();
        user.set(USER_ID, userid);
        user.set(USER_NAME, username);
        user.set(PASSWORD, password);
        user.set(USER_ID, creatid);
        user.set(USER_TYPE, "用户");
    //    user.set(UPDATE_ID,null);
     //   user.set(UPDATE_TIME, null);
    //    user.set(REMOVE_ID,null);
    //    user.set(REMOVE_TIME, null);
        user.save();
        
		//返回数据
		renderJson(new BaseResponse("success"));
	}
	
	
    /**
     * 登录接口
     */
    public void login() {
        String userid = getPara("userid");
        String password = getPara("password");
       //校验 参数不为空
        if (!notNull(Require.me()
                .put(userid, "userid can not be null")
                .put(password, "password can not be null")
        )) {
            return;
        }
        String sql = "SELECT * FROM user WHERE UserID=? AND UserPassword=?";
        User nowUser = User.user.findFirst(sql, userid, password);
        QueryResponse response = new QueryResponse();
        if (nowUser == null) {
            response.setCode(Code.FAIL).setMessage("userid or password is error");
            renderJson(response);
            return;
        }
        java.util.List<Record> result = Db.find("select * from user where UserID = ?",userid);  
        result.remove(PASSWORD);
        response.setResult(result);
        response.setMessage("login success");
        response.setCode(Code.SUCCESS);
        renderJson(response);
    }
    

/**
 * 查询用户资料
 */
    public void getProfile(){
        String userid = getPara("userid");
        String sql = "SELECT * FROM user WHERE UserID=? ";
        User nowUser = User.user.findFirst(sql,userid);
      
        DatumResponse response = new DatumResponse();
        
        if(nowUser== null){
            response.setCode(Code.FAIL).setMessage("user is not found");
        }
        else {
            HashMap<String, Object> map = new HashMap<String,Object>(nowUser.getAttrs());
            map.remove(PASSWORD);
            response.setDatum(map);
        }
        renderJson(response);
    }
    /**
     * 修改用户资料
     */
//     public void updateProfile() {
//         boolean flag = false;
//         BaseResponse response = new BaseResponse();
//         String userid = getPara("userid");
//         User nowUser = getUser(userid);
//         nowUser.set(UPDATE_ID, userid);
//         nowUser.set(UPDATE_TIME, new java.sql.Timestamp(System.currentTimeMillis()));
//         String username = getPara("username");
//         if (StringUtils.isNotEmpty(username)) {
//             nowUser.set(USER_NAME, username);
//             flag = true;
//         }
//
//         String useremail = getPara("useremail");
//         if (StringUtils.isNotEmpty(useremail)&&Db.findFirst("SELECT * FROM user WHERE useremail=?", useremail) != null) {
//             nowUser.set(USER_EMAIL, useremail);
//             flag = true;
//         }
//
//         String userphone = getPara("uerphone");
//         if (StringUtils.isNotEmpty(userphone)) {
//             nowUser.set(USER_PHONE, userphone);
//             flag = true;
//         }
//
//         //修改性别
// /*        Integer sex = getParaToInt("sex", null);
//         if (null != sex) {
//             if (!User.checkSex(sex)) {
//                 renderArgumentError("sex is invalid");
//                 return;
//             }
//             user.set(SEX, sex);
//             flag = true;
//         }*/
//
//         if (flag) {
//             boolean update = user.update();
//             renderJson(response.setCode(update ? Code.SUCCESS : Code.FAIL).setMessage(update ? "update success" : "update failed"));
//         } else {
//             renderArgumentError("must set profile");
//         }
//     }
//
//     /**
//     * 修改密码
//     */
//     public void password(){
//         if (!"put".equalsIgnoreCase(getRequest().getMethod())) {
//             render404();
//             return;
//         }
//         //根据用户id，查出这个用户的密码，再跟传递的旧密码对比，一样就更新，否则提示旧密码错误
//         String oldPwd = getPara("oldPwd");
//         String newPwd = getPara("newPwd");
//         if(!notNull(Require.me()
//                 .put(oldPwd, "old password can not be null")
//                 .put(newPwd, "new password can not be null"))){
//             return;
//         }
//         //用户真实的密码
//         User nowUser = getUser();
//         if(StringUtils.encodePassword(oldPwd, "md5").equalsIgnoreCase(nowUser.getStr(PASSWORD))){
//             boolean flag = nowUser.set(User.PASSWORD, StringUtils.encodePassword(newPwd, "md5")).update();
//             renderJson(new BaseResponse(flag?Code.SUCCESS:Code.FAIL, flag?"success":"failed"));
//         }else{
//             renderJson(new BaseResponse(Code.FAIL, "oldPwd is invalid"));
//         }
//     }
//
//     public void updateAdmin() {
//         boolean flag = false;
//         BaseResponse response = new BaseResponse();
//         String userid = getPara("userid");
//         String updateid =getPara("updateid");
//         String sql = "SELECT * FROM user WHERE UserID=? ";
//         User nowUser = User.user.findFirst(sql,userid);
//         String username = getPara("username");
//         if (StringUtils.isNotEmpty(username)) {
//             nowUser.set(USER_NAME, username);
//             flag = true;
//         }
//
//         String useremail = getPara("useremail");
//         if (StringUtils.isNotEmpty(useremail)&&Db.findFirst("SELECT * FROM user WHERE useremail=?", useremail) == null) {
//             nowUser.set(USER_EMAIL, useremail);
//             flag = true;
//         }
//
//         String userphone = getPara("uerphone");
//         if (StringUtils.isNotEmpty(userphone)) {
//             nowUser.set(USER_PHONE, userphone);
//             flag = true;
//         }
//         String usertype =getPara("usertype");
//         if (StringUtils.isNotEmpty(usertype)) {
//             nowUser.set(USER_TYPE, usertype);
//             flag = true;
//         }
//        String userpower = getPara("userpower");
//        if (StringUtils.isNotEmpty(userpower)) {
//            nowUser.set(USER_TYPE, userpower);
//            flag = true;
//        }
//
//         if (flag) {
//             nowUser.set(UPDATE_ID, updateid);
//             nowUser.set(UPDATE_TIME, DateUtils.getNowTimeStamp());
//             boolean update = user.update();
//             renderJson(response.setCode(update ? Code.SUCCESS : Code.FAIL).setMessage(update ? "update success" : "update failed"));
//         } else {
//             renderArgumentError("must set profile");
//         }
//     }
//
//
}
    
/*
private void getProfile() {
    String userId = getPara("userId");
    User resultUser = null;
    if (StringUtils.isNotEmpty(userId)) {
        resultUser = User.user.findById(userId);
    } else {
        resultUser = getUser();
    }

    DatumResponse response = new DatumResponse();
    
    if (resultUser == null) {
        response.setCode(Code.FAIL).setMessage("user is not found");
    } else {
        HashMap<String, Object> map = new HashMap<String, Object>(resultUser.getAttrs());
        map.remove(PASSWORD);
        response.setDatum(map);
    }

    renderJson(response);
}

*//**
 * 修改用户资料
 *//*
private void updateProfile() {
    boolean flag = false;
    BaseResponse response = new BaseResponse();
    User user = getUser();
    String nickName = getPara("nickName");
    if (StringUtils.isNotEmpty(nickName)) {
        user.set(NICK_NAME, nickName);
        flag = true;
    }

    String email = getPara("email");
    if (StringUtils.isNotEmpty(email)) {
        user.set(EMAIL, email);
        flag = true;
    }
    
    String avatar = getPara("avatar");
    if (StringUtils.isNotEmpty(avatar)) {
        user.set(AVATAR, avatar);
        flag = true;
    }

    //修改性别
    Integer sex = getParaToInt("sex", null);
    if (null != sex) {
        if (!User.checkSex(sex)) {
            renderArgumentError("sex is invalid");
            return;
        }
        user.set(SEX, sex);
        flag = true;
    }

    if (flag) {
        boolean update = user.update();
        renderJson(response.setCode(update ? Code.SUCCESS : Code.FAIL).setMessage(update ? "update success" : "update failed"));
    } else {
        renderArgumentError("must set profile");
    }
}

*//**
 * 修改密码
 *//*
public void password(){
    if (!"put".equalsIgnoreCase(getRequest().getMethod())) {
        render404();
        return;
    }
	//根据用户id，查出这个用户的密码，再跟传递的旧密码对比，一样就更新，否则提示旧密码错误
	String oldPwd = getPara("oldPwd");
	String newPwd = getPara("newPwd");
	if(!notNull(Require.me()
			.put(oldPwd, "old password can not be null")
			.put(newPwd, "new password can not be null"))){
		return;
	}
	//用户真实的密码
    User nowUser = getUser();
	if(StringUtils.encodePassword(oldPwd, "md5").equalsIgnoreCase(nowUser.getStr(PASSWORD))){
		boolean flag = nowUser.set(User.PASSWORD, StringUtils.encodePassword(newPwd, "md5")).update();
        renderJson(new BaseResponse(flag?Code.SUCCESS:Code.FAIL, flag?"success":"failed"));
	}else{
        renderJson(new BaseResponse(Code.FAIL, "oldPwd is invalid"));
	}
}*/

