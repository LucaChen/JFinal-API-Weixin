
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<% String path = request.getContextPath();
   String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!doctype html>
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
  <script language="javascript" type="text/javascript">
    $(document).ready(function(){
      $('#myselect').change(function(){
        var checkValue=$("#myselect").val();
        alert(checkValue);
        window.location.href="/equipment/"+checkValue;//页面跳转并传参
      });
      $('#seacher').click(function(){
        var checkValue=$("input[name='equipmentname']").val();
        alert(checkValue);
        window.location.href="/equipment/"+checkValue;
      });
      $('.am-tt-t').click(function () {
        $('#from1').submit();
        $('.am-modal').css("opacity","0");
        $('.am-modal').css("display","none");
      });
      $('#add').click(function () {
        $('.am-modal').css("opacity","1");
        $('.am-modal').css("display","block");
        $('.am-modal').css("top","25%");
        $('#my-prompt1').modal({
          relatedTarget: this,
          onConfirm: function(e) {
            alert("hello");
            $('#from1').submit();
            $('.am-modal').css("opacity","0");
            $('.am-modal').css("display","none");
          },
          onCancel: function(e) {
            $('.am-modal').css("opacity","0");
            $('.am-modal').css("display","none");
          }
        });
      })
    })
  </script>
</head>
<body>
<header class="am-topbar admin-header">
  <div class="am-topbar-brand">
    <strong>机器人与智慧工厂实验室</strong> <small>后台管理</small>
  </div>

  <button class="am-topbar-btn am-topbar-toggle am-btn am-btn-sm am-btn-success am-show-sm-only" data-am-collapse="{target: '#topbar-collapse'}"><span class="am-sr-only">导航切换</span> <span class="am-icon-bars"></span></button>

  <div class="am-collapse am-topbar-collapse" id="topbar-collapse">

    <ul class="am-nav am-nav-pills am-topbar-nav am-topbar-right admin-header-list">
      <li><a href="javascript:;"><span class="am-icon-envelope-o"></span> 收件箱 <span class="am-badge am-badge-warning">5</span></a></li>
      <li class="am-dropdown" data-am-dropdown>
        <a class="am-dropdown-toggle" data-am-dropdown-toggle href="javascript:;">
          <span class="am-icon-users"></span> 管理员 <span class="am-icon-caret-down"></span>
        </a>
        <ul class="am-dropdown-content">
          <li><a href="#"><span class="am-icon-user"></span> 资料</a></li>
          <li><a href="#"><span class="am-icon-cog"></span> 设置</a></li>
          <li><a href="#"><span class="am-icon-power-off"></span> 退出</a></li>
        </ul>
      </li>
      <li class="am-hide-sm-only"><a href="javascript:;" id="admin-fullscreen"><span class="am-icon-arrows-alt"></span> <span class="admin-fullText">开启全屏</span></a></li>
    </ul>
  </div>
</header>

<div class="am-cf admin-main">
  <!-- sidebar start -->
  <div class="admin-sidebar am-offcanvas" id="admin-offcanvas">
    <div class="am-offcanvas-bar admin-offcanvas-bar">
      <ul class="am-list admin-sidebar-list">
        <li><a href="admin-index.html"><span class="am-icon-home"></span> 首页</a></li>
        <li class="admin-parent">
          <a class="am-cf" data-am-collapse="{target: '#collapse-nav'}"><span class="am-icon-file"></span> 器材管理模块 <span class="am-icon-angle-right am-fr am-margin-right"></span></a>
          <ul class="am-list am-collapse admin-sidebar-sub am-in" id="collapse-nav">
            <li><a href="admin-user.html" class="am-cf"><span class="am-icon-check"></span> 用户管理<span class="am-icon-star am-fr am-margin-right admin-icon-yellow"></span></a></li>
            <li><a href="admin-help.html"><span class="am-icon-puzzle-piece"></span> 预约审核</a></li>
            <li><a href="/equipment"><span class="am-icon-th"></span> 器材管理<span class="am-badge am-badge-secondary am-margin-right am-fr">${number }</span></a></li>
            <li><a href="admin-log.html"><span class="am-icon-calendar"></span> 仓储管理</a></li>
            <li><a href="admin-404.html"><span class="am-icon-bug"></span> 操作记录</a></li>
          </ul>
        </li>
        <li><a href="admin-table.html"><span class="am-icon-table"></span> 发布文章</a></li>
        <li><a href="admin-form.html"><span class="am-icon-pencil-square-o"></span> 发布表格</a></li>
        <li><a href="#"><span class="am-icon-sign-out"></span> 注销</a></li>
      </ul>

      <div class="am-panel am-panel-default admin-sidebar-panel">
        <div class="am-panel-bd">
          <p><span class="am-icon-bookmark"></span> 公告</p>
          <p>实验室器材管理系统--Bate</p>
        </div>
      </div>

      <div class="am-panel am-panel-default admin-sidebar-panel">
        <div class="am-panel-bd">
          <p><span class="am-icon-tag"></span> wiki</p>
          <p>Test！</p>
        </div>
      </div>
    </div>
  </div>
  <!-- sidebar end -->

  <!-- content start -->
  <div class="admin-content">

    <div class="am-cf am-padding">
      <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">器材管理</strong> / <small>Table</small></div>
    </div>

    <div class="am-g">
      <div class="am-u-sm-12 am-u-md-6">
        <div class="am-btn-toolbar">
          <div class="am-btn-group am-btn-group-xs">
            <button type="button" class="am-btn am-btn-default" id="add" onclick="add()"><span class="am-icon-plus"></span> 新增</button>
          </div>
        </div>
      </div>
      <div class="am-u-sm-12 am-u-md-3">
        <div class="am-form-group">
          <select data-am-selected id="myselect">
            <option value="0">${type==null?'所有类别':type}</option>
          <c:forEach items="${equipmenttypePage.list }"  var= "equipmenttype">
            <option value="${equipmenttype.equipmenttypeid }">${equipmenttype.equpimenttypename }</option>
          </c:forEach>
          </select>
        </div>
      </div>
      <div class="am-u-sm-12 am-u-md-3">
        <div class="am-input-group am-input-group-sm">
          <input type="text" class="am-form-field" name="equipmentname"  >
          <span class="am-input-group-btn">
            <button class="am-btn am-btn-default" type="button"  id="seacher">搜索</button>
          </span>
        </div>
      </div>
    </div>

    <div class="am-g">
      <div class="am-u-sm-12">
        <form class="am-form">
          <table class="am-table am-table-striped am-table-hover table-main">
            <thead>
              <tr>
               <th class="table-id">ID</th><th class="table-title">器材名称</th><th class="table-type">类别代码</th><th class="table-number am-hide-sm-only">库存量</th><th class="table-describe am-hide-sm-only">器材描述</th><th class="table-date am-hide-sm-only">单位</th><th class="table-set">操作</th>
              </tr>
          </thead>
          <tbody>
          <c:forEach items="${equipmentPage.list }"  var= "equipment"> 
            <tr>
              <td>${equipment.equipmentid }</td>
              <td>${equipment.equipmentname }</td>
              <td>${equipment.equipmenttypeid }</td>
              <td class="am-hide-sm-only">${equipment.num }</td>
              <td class="am-hide-sm-only">${equipment.describe }</td>
              <td class="am-hide-sm-only">${equipment.unit }</td>
              <td>
                <div class="am-btn-toolbar">
                  <div class="am-btn-group am-btn-group-xs">
                    <button type="button" class="am-btn am-btn-default" id="test" value="${equipment.equipmentid }"><span class="am-icon-pencil-square-o" ></span> 编辑</button>
                    <%--<button class="am-btn am-btn-default am-btn-xs am-text-secondary" id="test"><span class="am-icon-pencil-square-o"></span> 编辑</button>--%>
                    <button class="am-btn am-btn-default am-btn-xs am-text-danger am-hide-sm-only" ><span class="am-icon-trash-o"> <a href="/deleteequipment/${equipment.equipmentid }">删除</a></span ></button>
                  </div>
                </div>
              </td>
            </tr>
            </c:forEach>
          </tbody>
        </table>
          <div class="am-cf">
                           共 ${number } 条记录
  <div class="am-fr">
    <ul class="am-pagination">
     <c:if test="${num==1 }">
      <li class="am-active"><a href="#">1</a></li>
     </c:if>
     <c:if test="${num>1 }">
      <li class="am-disabled"><a href="#">«</a></li>
      <li class="am-active"><a href="#">1</a></li>
      <c:forEach var="i" begin="2" end="${num }" varStatus="status">
      <li><a href="/admin/${status.index}">${status.index}</a></li>
      </c:forEach>
      <li><a href="#">»</a></li>
       </c:if> 
    </ul>
  </div>
</div>
          <hr />
          <p>注：.....</p>
        </form>
      </div>

    </div>
  </div>
  <!-- content end -->
</div>

<a href="#" class="am-icon-btn am-icon-th-list am-show-sm-only admin-menu" data-am-offcanvas="{target: '#admin-offcanvas'}"></a>

<footer>
  <hr>
  <p class="am-padding-left">© 2014 AllMobilize, Inc. Licensed under MIT license.</p>
</footer>
<div class="am-modal am-modal-prompt" tabindex="-1" id="my-prompt1">
  <div class="am-modal-dialog">
    <div class="am-modal-hd">添加器材</div>
    <form name="from1" id="from1" action="/addequipment" method="get">
    <div class="am-modal-actions-group">
       器材名称
      <input type="text" class="am-modal-prompt-input" name="equipment.equipmentname" id="equipmentname">
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
      <span class="am-modal-btn" >取消</span>
      <span class="am-modal-btn am-tt-t" >提交</span>
    </div>
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