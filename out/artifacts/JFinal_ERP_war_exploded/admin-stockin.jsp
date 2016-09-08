<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-CN">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>实验室器材管理系统</title>

    <!-- Bootstrap Core CSS -->
    <link href="/bower_components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="//cdn.bootcss.com/bootstrap/4.0.0-alpha.2/css/bootstrap.css" rel="stylesheet">
    <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
    <link href="//cdn.bootcss.com/bootstrap/4.0.0-alpha.2/css/bootstrap.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="/bower_components/metisMenu/dist/metisMenu.min.css" rel="stylesheet">

    <!-- DataTables CSS -->

    <!-- DataTables Responsive CSS -->

    <!-- Custom CSS -->
    <link href="/dist/css/sb-admin-2.css" rel="stylesheet">
    <link href="/dist/css/button.css" rel="stylesheet">

    <link href="/dist/css/jquery.searchableSelect.css" rel="stylesheet" >

    <script src="/js/jquery-1.11.1.min.js"></script>
    <script src="/js/jquery.searchableSelect.js"></script>


    <!-- Custom Fonts -->
    <link href="/bower_components/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
<script language="javascript" type="text/javascript">
    $(document).ready(function(){
        $('#seacher').click(function(){
            var checkValue=$("input[name='seachers']").val();
            window.location.href="/stockin?type="+checkValue;
        });
        $.getJSON("/getEquipmentName",function (data) {
            var item;
            $.each(data,function (i,result) {
                item = "<option value='"+result.equipmentname+"'>"+result.equipmentname+"</option>"
                $('#select1').append(item);
            })
        });
        $.getJSON("/getShelvesid",function (data) {
            var item;
            $.each(data,function (i,result) {
                item = "<option value='"+result.shelvesid+"'>"+result.shelvesid+"</option>"
                $('#select3').append(item);
            })
        })
       // $("input[name='seachers']").value=123;
    })

</script>
</head>

<body>

    <div id="wrapper">

        <!-- Navigation -->
        <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" style="font-family: 'Microsoft YaHei';margin-top: 9px" >实验室器材管理系统后台</a>
            </div>
            <!-- /.navbar-header -->

            <!-- /.navbar-top-links -->

            <div class="navbar-default sidebar" role="navigation"style="width:234px">
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu" >
                        <li class="sidebar-search">
                            <div class="input-group custom-search-form" >
                                <input type="text" class="form-control" placeholder="Search...">
                                <span class="input-group-btn">
                                <button class="btn btn-default" type="button">
                                    <i class="fa fa-search"></i>
                                </button>
                            </span>
                            </div>
                            <!-- /input-group -->
                        </li>
                        <li>
                            <a href="index.html"><i class="fa fa-dashboard fa-fw" ></i> 首页</a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-bar-chart-o fa-fw"></i> 用户管理<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="flot.html">信息维护</a>
                                </li>
                                <li>
                                    <a href="morris.html">预约审核</a>
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                        <li>
                            <a href="/equipment"><i class="fa fa-table fa-fw"></i> 器材管理</a>
                        </li>
                        <li>
                            <a href="/storage"><i class="fa fa-edit fa-fw"></i> 仓储管理</a>
                        </li>
                        <li>
                            <a href="/stockout"><i class="fa fa-book fa-fw"></i> 出库管理</a>
                        </li>
                        <li>
                            <a href="/stockin"><i class="fa fa-coffee fa-fw"></i> 入库管理</a>
                        </li>

                    </ul>
                </div>
                <!-- /.sidebar-collapse -->
            </div>
            <!-- /.navbar-static-side -->
        </nav>

        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header" style="font-family: 'Microsoft YaHei'">入库管理</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading"  style="height: 55px">
                            <div  id="1" style="float: left">
                                <a class="	btn btn-danger " data-toggle="modal"
                                        data-target="#myModal">新增</a>
                            </div>
                            <div  id="2"  style="float: right;margin-top: 5px" >
                                    <input type="text" class="input-medium search-query" name="seachers" id="seachers">
                                    <button type="submit" class="btn" id="seacher">Search</button>
                            </div>
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="dataTable_wrapper">
                                <table class="table table-bordered">
                                    <thead>
                                        <tr>
                                            <th>ID</th>
                                            <th>关联订单号</th>
                                            <th>描述</th>
                                            <th>操作人</th>
                                            <th>更新时间</th>
                                            <th>状态</th>
                                            <th>操作</th>
                                        </tr>
                                    </thead>
                                    <c:forEach items="${stockinPage.list }"  var= "stockin">
                                    <tbody>
                                        <tr class="odd gradeX">
                                            <td>${stockin.stockinid }</td>
                                            <td>${stockin.requisitionid }</td>
                                            <td>${stockin.describe }</td>
                                            <td class="center">${stockin.createid }</td>
                                            <td class="center">${stockin.createtime }</td>
                                            <td class="center">${stockin.state }</td>
                                            <td>
                                                <button class=" btn btn-primary" data-toggle="modal" data-target="#myModal"  onclick="getstockin(${stockin.stockinid })"  id="edit">修改</button>
                                                <button class="	btn btn-inverse"><a href="/deletestockin/${stockin.stockinid }">删除</a></button>
                                                <button class="btn btn-info" data-toggle="modal" data-target="#StockinDetails" data-target=".bs-example-modal-lg" onclick="getdetails(${stockin.stockinid })" id="find">查看明细</button>
                                            </td>
                                        </tr>

                                    </tbody>
                                   </c:forEach>
                                </table>
                            </div>
                            <div> 共有 ${number }个数据</div>
                            <div style="float: right;margin-top: -45px ">
                                <ul class="pagination">
                                    <c:if test="${num==1 }">
                                        <li ><a href="/stockin?type=${type}&page=1">1</a></li>
                                    </c:if>
                                    <c:if test="${num>1 }">

                                        <li class="am-active"><a href="/stockin?type=${type}&page=1">1</a></li>
                                        <c:forEach var="i" begin="2" end="${num }" varStatus="status">
                                            <li><a href="/stockin?type=${type}&page=${status.index}">${status.index}</a></li>
                                        </c:forEach>
                                    </c:if>
                                </ul>
                            </div>
                            <!-- /.table-responsive -->
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->

        <!-- /#page-wrapper -->

        </div>
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog"
             aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog" >
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close"
                                data-dismiss="modal" aria-hidden="true">
                        </button>
                        <h4 class="modal-title" id="myModalLabel" style="text-align:center;margin-left:auto; margin-right:auto;">
                            入库管理
                        </h4>
                    </div>
                    <div class="modal-body">
                        <form class="form-horizontal" name="from1" id="from1" action="/addstockin" method="get" >
                            <div class="form-group">
                                <label class="col-sm-2 control-label"  style="margin-left: 19% "for="requisitionid" v>订单号</label>
                                <div class="col-sm-4">
                                    <input class="form-control" name="stockin.requisitionid" id="requisitionid"  style="margin-left: 7%"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="createid" style="margin-left: 19% ">操作人</label>
                                <div class="col-sm-4">
                                    <input class="form-control" name="stockin.createid" id="createid" style="margin-left: 7%"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="state" style="margin-left: 19% ">状态</label>
                                <div class="col-sm-4">
                                    <input class="form-control" name="stockin.state" id="state" style="margin-left: 7%"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="describe" style="margin-left: 19% ">描述</label>
                                <div class="col-sm-4">
                                    <input class="form-control" name="stockin.describe" id="describe" style="margin-left: 7%"/>
                                </div>
                            </div>
                            <input class="form-control" name="stockin.stockinid" id="stockinid"type="hidden"/>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default"
                                data-dismiss="modal">关闭
                        </button>
                        <button type="button" class="btn btn-primary" data-dismiss="modal" aria-hidden="true"  id="sumbit" onclick="sumbit()">
                            提交更改
                        </button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal -->
        </div>
    </div>
    <div class="modal fade" id="StockinDetails" tabindex="-1" role="dialog"
         aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog" style="width:800px;height: 800px">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close"
                            data-dismiss="modal" aria-hidden="true">
                    </button>
                    <h4 class="modal-title" id="StockinDetailsLabel" >

                        <div style="text-align:center;margin-left:auto; margin-right:auto;">
                            入库明细
                        </div>
                    </h4>
                </div>
                <div class="modal-body">
                    <table class="table table-bordered" id = "details">
                        <thead>
                        <tr>
                            <th>序号</th>
                            <th>器材名称</th>
                            <th>器材属性</th>
                            <th>数量</th>
                            <th>货架号</th>
                            <th>条形码</th>
                            <th>状态</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody id ="show">
                        </tbody>
                    </table>
                    <hr>
                    <button class='btn btn-danger' data-toggle='modal' data-target='#adddetails' id="addstockdetails" onclick="sumbitform()">新增</button>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default"
                            data-dismiss="modal" onclick="ok()">关闭
                    </button>
                    <button type="button" class="btn btn-primary" data-dismiss="modal" aria-hidden="true"  id="12" onclick="ok()">
                        确认信息
                    </button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal -->
    </div>
    </div>
    <div class="modal fade" id="adddetails" tabindex="-1" role="dialog"
         aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close"
                            data-dismiss="modal" aria-hidden="true">
                    </button>
                    <h4 class="modal-title" id="adddetailsLab" style="text-align:center;margin-left:auto; margin-right:auto;">
                        入库明细管理
                    </h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" name="from2" id="from2" action="#" method="get" >
                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="select1" style="margin-left: 19% ">器材名称</label>
                            <select class="form-control" id="select1" style="width: 170px;margin-left: 40%" onchange="valuechange()">
                                <option value="0">请选择</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="select2" style="margin-left: 19% ">器材属性</label>
                            <select class="form-control" id="select2" style="width: 170px;margin-left: 40%">
                                <option value="0">请选择</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="select3" style="margin-left: 19% ">货架号</label>
                            <select class="form-control" id="select3" style="width: 170px;margin-left: 40%">
                                <option value="0">请选择</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="barcode" style="margin-left: 19% ">条形后缀</label>
                            <div class="col-sm-4">
                                <input class="form-control" name="barcode" id="barcode" style="margin-left: 7%"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="num" style="margin-left: 19% ">数量</label>
                            <div class="col-sm-4">
                                <input class="form-control" name="num" id="num" style="margin-left: 7%"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="radio-inline" style="margin-left: 31% ">
                                <input type="radio" name="rad" id="inlineRadio1" value="准备入库"> 准备入库
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="rad" id="inlineRadio2" value="入库"> 入库
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="rad" id="inlineRadio3" value="作废"> 作废
                            </label>
                        </div>
                        <input class="form-control" name="id" id="testid" type="hidden"/>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default"
                            data-dismiss="modal" onclick="close()">关闭
                    </button>
                    <button type="button" class="btn btn-primary" data-dismiss="modal" aria-hidden="true"  id="test" onclick="addstockdetails()">
                        提交
                    </button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal -->
    </div>
    </div>



    <!-- /#wrapper -->

    <!-- jQuery -->
    <script src="/bower_components/jquery/dist/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="/bower_components/metisMenu/dist/metisMenu.min.js"></script>

    <!-- DataTables JavaScript -->

    <!-- Custom Theme JavaScript -->
    <script src="/dist/js/sb-admin-2.js"></script>

    <!-- Page-Level Demo Scripts - Tables - Use for reference -->
    <script>
    $(document).ready(function() {
        $('#dataTables-example').DataTable({
                responsive: true
        });
        that.$element.children().eq(0).css("position", "absolute").css({
            "margin":"0px",
            "top": function () {
                return (that.$element.height() - that.$element.children().eq(0).height()-40) / 2 + "px";
            },
            "left": function () {
                return (that.$element.width() - that.$element.children().eq(0).width()) / 2 + "px";
            }
        });
        $('#seacher').click(function(){
            var checkValue=$("input[name='equipmentnames']").val();
            window.location.href="/equipment/"+checkValue;
        });
        $("button[name='deletedetails']").click(function () {
            alert($(this).value);
        })
        $('body').on('hidden.bs.modal', '.modal', function () {
            $(this).removeData('bs.modal');
        });

    });
    </script>

    <script>
       function sumbit() {
           $('#from1').submit();
       }
        function getstockin(e) {
            $.getJSON("/getstockin?id="+e,function (data) {
                $('#stockinid')[0].value=data.stockinid;
                $('#requisitionid')[0].value=data.requisitionid;
                $('#createid')[0].value=data.createid;
                $('#describe')[0].value=data.describe;
                $('#state')[0].value=data.state;
            });
            $('#from1').attr("action","/updatestockin");
        }

      function add() {
          $('#stockinid')[0].value="";
          $('#requisitionid')[0].value="";
          $('#createid')[0].value="";
          $('#describe')[0].value="";
          $('#state')[0].value="";
          $('#from1').attr("action","/addstockin");
      }
      function getdetails(e) {
          $("#addstockdetails").attr('value',e);
          $.getJSON("/getstockindetails?id="+e,function (data) {
              var item;
              $.each(data,function (i, result) {
                  item=" <tr class='odd gradeX'><td>"+(i+1)+"</td><td>"+result.equipmentname+"</td><td>"+result.property+"</td><td>"+result.num+"</td><td>"+result.shelvesid+"</td><td>"+result.barcode+"</td>"+"</td><td>"+result.state+"<td><button class='btn btn-primary' data-toggle='modal' data-target='#adddetails' onclick='editstockindetails("+result.id+")'>修改</button><button  class='btn btn-warning' onclick='deletedetails("+result.id+")'>删除</button></td><tr>";
                  $('#show').append(item);
              });
          });
      }
        function ok() {
            $('#show').html("");
        }
        function deletedetails(e) {
            $.getJSON("/detelestockindetails?id="+e,function () {
                ok();
                getdetails();
            })
        }
        function addstockdetails() {
            var state = $("input[name='rad']:checked").val();
            var equipmentid = $('#select2').val();
            var num = $('#num')[0].value;
            var barcode = $('#barcode')[0].value;
            var shelvesid = $('#select3').val();
            var stockinid = $("#addstockdetails")[0].value;
            alert(barcode);
            $.getJSON("/addstockindetails?equipmentid=" + equipmentid + "&num=" + num + "&state=" + state + "&shelvesid=" + shelvesid + "&stockinid=" + stockinid+"&barcode="+barcode, function (data) {
            });
            close();
        }
       function editstockindetails(e){
           $.getJSON("/getFindStockinDetails?id="+e,function (data) {
               $('#num')[0].value=data[0].num;
               $('#barcode')[0].value=(data[0].barcode).substring(3);
               $('#testid')[0].value=data[0].id;
               $('#select2').empty();
               $.getJSON("/getProperty?name="+data[0].equipmentname,function (data) {
                   var item;
                   $.each(data,function (i,result) {
                       item = "<option value='"+result.equipmentid+"'>"+result.property+"</option>"
                       $('#select2').append(item);
                   })
               })
               $("#select1").children("option").each(function(){
                   var temp_value = $(this).val();
                   if(temp_value == data[0].equipmentname){
                       $(this).attr("selected","selected");
                       $(this).siblings().removeAttr("selected");
                   }
               });
               $("#select2").children("option").each(function(){
                   var temp_value = $(this).val();
                   if(temp_value == data[0].equipmentid){
                       $(this).attr("selected","selected");
                       $(this).siblings().removeAttr("selected");
                   }
               });
               $("#select3").children("option").each(function(){
                   var temp_value = $(this).val();
                   if(temp_value == data[0].shelvesid){
                       $(this).attr("selected","selected");
                       $(this).siblings().removeAttr("selected");
                   }
               });
               $("input[type='radio'][name='rad'][value="+data[0].state+"]").attr("checked",true);
           });
           $("#test").attr('onclick', '').click(updatestockindetails());
       }
       function  updatestockindetails() {
           var state = $("input[name='rad']:checked").val();
           var equipmentid = $('#select2').val();
           var num = $('#num')[0].value;
           var barcode = $('#barcode')[0].value;
           var shelvesid = $('#select3').val();
           var id= $("#testid")[0].value;
           $.getJSON("/updatestockindetails?equipmentid=" + equipmentid + "&num=" + num + "&state=" + state + "&shelvesid=" + shelvesid + "&id=" + id+"&barcode="+barcode, function (data) {
               alert(data);
           });
           close();
       }
       function testok() {
           alert("OK");
       }
        function valuechange() {
            $('#select2').empty();
            $.getJSON("/getProperty?name="+$("#select1").val(),function (data) {
                var item;
                $.each(data,function (i,result) {
                    item = "<option value='"+result.equipmentid+"'>"+result.property+"</option>"
                    $('#select2').append(item);
                })
            })
        }
        function close(){
            $('#num')[0].value="";
            $('#barcode')[0].value="";
            $('#id')[0].value="";
            $("input[type='radio'][name='rad']").attr("checked",false);
            $("#select1").children("option").each(function(){
                var temp_value = $(this).val();
                if(temp_value == 0){
                    $(this).attr("selected","selected");
                    $(this).siblings().removeAttr("selected");
                }
            });
            $("#select2").children("option").each(function(){
                var temp_value = $(this).val();
                if(temp_value == 0){
                    $(this).attr("selected","selected");
                    $(this).siblings().removeAttr("selected");
                }
            });
            $("#select3").children("option").each(function(){
                var temp_value = $(this).val();
                if(temp_value == 0){
                    $(this).attr("selected","selected");
                    $(this).siblings().removeAttr("selected");
                }
            });
       }
        function sumbitform() {
            close();
            $("#test").attr('onclick', '').click(addstockdetails());
        }
    </script>
</body>

</html>
