<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head lang="en">
  <meta charset="UTF-8">
  <title>Login Page | Robots and Smart factory Labs</title>
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="format-detection" content="telephone=no">
  <meta name="renderer" content="webkit">
  <meta http-equiv="Cache-Control" content="no-siteapp" />
  <link rel="alternate icon" type="image/png" href="assets/i/favicon.png">
  <link rel="stylesheet" href="assets/css/amazeui.min.css"/>
  <style>
    .header {
      text-align: center;
    }
    .header h1 {
      font-size: 200%;
      color: #333;
      margin-top: 30px;
    }
    .header p {
      font-size: 14px;
    }
  </style>
</head>
<body>
<div class="header">
  <div class="am-g">
    <h1>机器人与智慧工厂实验室--实验室器材管理系统</h1>
  </div>
  <hr />
</div>
<div class="am-g">
  <div class="am-u-lg-6 am-u-md-8 am-u-sm-centered">
    <h3>登录</h3>
    <hr>
    <div class="am-btn-group">
      <a href="#" class="am-btn am-btn-secondary am-btn-sm"><i class="am-icon-qq am-icon-sm"></i> QQ</a>
      <a href="#" class="am-btn am-btn-primary am-btn-sm"><i class="am-icon-tencent-weibo am-icon-sm"></i>微博</a>
      <a href="#" class="am-btn am-btn-primary am-btn-sm"><i class="am-icon-weixin am-icon-sm"></i>微信</a>
    </div>
    <br>
    <br>

    <form method="post" class="am-form" action="/login">
      <div class="am-input-group">
      <br>
      <span class="am-input-group-label"><i class="am-icon-user"></i></span>
      <input type="text" class="am-form-field" name="user.userid" placeholder="Username" id="userid">
      </div>
      <br>
      <div class="am-input-group">
      <br>
      <span class="am-input-group-label"><i class="am-icon-lock"></i></span>
      <input type="password" class="am-form-field" placeholder="Password" name="user.userpassword" id="password" >
      <br>
      </div>
      <label for="remember-me">
      <input id="remember-me" type="checkbox">
        记住密码
      </label>
      <br />
      <div class="am-cf">
        <input type="submit" name="" value="登 录" class="am-btn am-btn-primary am-btn-sm am-fl">
      </div>
    </form>
    <hr>
    <p>© 2016 Robots and Smart Factory Labs.</p>
  </div>
</div>
</body>
</html>