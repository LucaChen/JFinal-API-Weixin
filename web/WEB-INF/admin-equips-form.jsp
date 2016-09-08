<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<% String path = request.getContextPath();
  String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html class="no-js">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>实验室器材管理系统</title>
  <meta name="description" content="这是一个 table 页面">
  <meta name="keywords" content="table">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="renderer" content="webkit">
  <meta http-equiv="Cache-Control" content="no-siteapp" />
  <link rel="icon" type="image/png" href="assets/i/favicon.png">
  <link rel="apple-touch-icon-precomposed" href="/assets/i/app-icon72x72@2x.png">
  <meta name="apple-mobile-web-app-title" content="实验室器材管理系统" />
  <link rel="stylesheet" href="/assets/css/amazeui.min.css"/>
  <link rel="stylesheet" href="/assets/css/admin.css">
  <script src="//cdn.bootcss.com/jquery/3.1.0/jquery.js"></script>
  <script>
  </script>
</head>
<body>
  <div class="am-modal-dialog">
    <div class="am-modal-hd">添加器材</div>
    <form name="from1" id="from1" action="/addequipment" method="get">
    <div class="am-modal-actions-group">
       器材名称
      <input type="text" class="am-modal-prompt-input" name="equipment.equipmentname" id="equipment.equipmentname">
    </div>
    <div class="am-modal-actions-group">
       器材类别代码
      <input type="text" class="am-modal-prompt-input" name="equipment.equipmenttypeid" >
    </div>
    <div class="am-modal-actions-group">
      器材库存量
      <input type="text" class="am-modal-prompt-input" name="equipment.num" >
    </div>
    <div class="am-modal-actions-group">
      器材描述
      <input type="text" class="am-modal-prompt-input" name="equipment.describe" >
    </div>
    <div class="am-modal-actions-group">
      器材单位
    <input type="text" class="am-modal-prompt-input"  name="equipment.unit" >
    </div>
    <div class="am-modal-actions-group">
      器材条码前缀
    <input type="text" class="am-modal-prompt-input"  name="equipment.flag" >
      </div>
    </form>
    <div class="am-modal-footer">
      <button class="am-modal-btn am-tt-e" >取消</button>
      <button class="am-modal-btn am-tt-t" >提交</button>
    </div>
  </div>


<!--[if lt IE 9]>
<script src="http://libs.baidu.com/jquery/1.11.1/jquery.min.js"></script>
<script src="http://cdn.staticfile.org/modernizr/2.8.3/modernizr.js"></script>
<script src="assets/js/amazeui.ie8polyfill.min.js"></script>
<![endif]-->

<!--[if (gte IE 9)|!(IE)]><!-->
<script src="assets/js/jquery.min.js"></script>
<!--<![endif]-->
<script src="assets/js/amazeui.min.js"></script>
<script src="assets/js/app.js"></script>
</body>
</html>