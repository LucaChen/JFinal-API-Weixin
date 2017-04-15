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

    <title>微信后台管理系统</title>

    <!-- Bootstrap Core CSS -->
    <link href="/bower_components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="//cdn.bootcss.com/bootstrap/4.0.0-alpha.2/css/bootstrap.css" rel="stylesheet">
    <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
    <link href="//cdn.bootcss.com/bootstrap/4.0.0-alpha.2/css/bootstrap.css" rel="stylesheet">
    <link href="./css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">

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
            window.location.href="/event?type="+checkValue;
        });
//        $.getJSON("/getEquipmentType",function (data) {
//            var item;
//            $.each(data,function (i,result) {
//                item = "<option value='"+result.equipmenttypeid+"'>"+result.equipmenttypename+"</option>"
//                $('#select').append(item);
//            })
//        })
        $('.form_date').datetimepicker('update');
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
                <a class="navbar-brand" style="font-family: 'Microsoft YaHei';margin-top: 9px" >微信后台管理系统</a>
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
                            <a href="#"><i class="fa fa-bar-chart-o fa-fw"></i> 用户管理</a>
                        </li>
                        <li>
                            <a href="/equipment"><i class="fa fa-table fa-fw"></i> 订单管理</a>
                        </li>
                        <li>
                            <a href="/storage"><i class="fa fa-edit fa-fw"></i> 流量统计</a>
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
                    <h1 class="page-header" style="font-family: 'Microsoft YaHei'">订单管理</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading"  style="height: 55px">
                            <div  id="1" style="float: left">
                                <div class="controls input-append date form_date" data-date="" data-date-format="dd MM yyyy" data-link-field="dtp_input2" data-link-format="yyyy-mm-dd">
                                    <input size="16" type="text" value="2017-05-15" id="datatime" readonly>
                                    <span class="add-on"><i class="icon-remove"></i></span>
                                    <span class="add-on"><i class="icon-th"></i></span>
                                </div>
                            </div>
                            <div  id="2"  style="float: right;margin-top: -3px" >
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
                                            <th>订单号</th>
                                            <th>用户名</th>
                                            <th>上传时间</th>
                                            <th>状态</th>
                                            <th>操作</th>
                                        </tr>
                                    </thead>
                                    <c:forEach items="${eventPage}"  var= "event">
                                    <tbody>
                                        <tr class="odd gradeX">
                                            <td>${event.eventid }</td>
                                            <td>${event.ordernumber }</td>
                                            <td>${event.customername }</td>
                                            <td class="center">${event.creattime }</td>
                                            <td class="center">${event.eventtype }</td>
                                            <td>
                                                <button class=" btn btn-primary" >下载二维码</button>
                                                <button class="	btn btn-inverse"><a href="/deleteequipment/${event.equipmentid }">删除</a></button>
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
                                        <li ><a href="/event?type=${type}&page=1">1</a></li>
                                    </c:if>
                                    <c:if test="${num>1 }">

                                        <li class="am-active"><a href="/event?type=${type}&page=1">1</a></li>
                                        <c:forEach var="i" begin="2" end="${num }" varStatus="status">
                                            <li><a href="/event?type=${type}&page=${status.index}">${status.index}</a></li>
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
    <%--<script type="text/javascript" src="./jquery/jquery-1.8.3.min.js" charset="UTF-8"></script>--%>
    <script type="text/javascript" src="./bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="./js/bootstrap-datetimepicker.js" charset="UTF-8"></script>
    <script type="text/javascript" src="./js/locales/bootstrap-datetimepicker.zh-CN.js" charset="UTF-8"></script>
    <script type="text/javascript">
        $('.form_date').datetimepicker({
            format:'yyyy-mm-dd',
            language:  'zh-CN',
            weekStart: 1,
            todayBtn:  1,
            autoclose: 1,
            todayHighlight: 1,
            startView: 2,
            minView: 2,
            forceParse: 0
        });
        $('.form_date').datetimepicker()
            .on('changeDate', function(ev){
                    alert($('#datatime').val());
            });

    </script>

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
    });
    </script>

    <script>
       function sumbit() {

       }
        function getequipment(e) {
            $.getJSON("/getequipment?id="+e,function (data) {
                var  test = (data.equipmenttypeid);
                $('#equipmentname')[0].value=data.equipmentname;
                $('#equipmenttypeid')[0].value=data.equipmenttypeid;
                $('#property')[0].value=data.property;
                $('#unit')[0].value=data.unit;
                $('#describe')[0].value=data.describe;
                $('#itemcode')[0].value=data.itemcode;
                $('#equipmentid')[0].value=data.equipmentid;
                $("#select").children("option").each(function(){
                    var temp_value = $(this).val();
                    if(temp_value == test){
                        $(this).attr("selected","selected");
                        $(this).siblings().removeAttr("selected");
                    }
                });
            });
            $('#from1').attr("action","/updateequipment");
        }

      function add() {
          $('#equipmentname')[0].value="";
          $('#equipmenttypeid')[0].value="";
          $('#property')[0].value="";
          $('#unit')[0].value="";
          $('#describe')[0].value="";
          $('#itemcode')[0].value="";
          $('#equipmentid')[0].value="";
          $('#from1').attr("action","/addequipment");
      }
    </script>




</body>

</html>
