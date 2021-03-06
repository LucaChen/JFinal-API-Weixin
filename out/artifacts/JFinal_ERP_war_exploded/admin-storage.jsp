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

    <!-- MetisMenu CSS -->
    <link href="/bower_components/metisMenu/dist/metisMenu.min.css" rel="stylesheet">

    <!-- DataTables CSS -->
    <link href="/bower_components/datatables-plugins/integration/bootstrap/3/dataTables.bootstrap.css" rel="stylesheet">

    <!-- DataTables Responsive CSS -->
    <link href="/bower_components/datatables-responsive/css/dataTables.responsive.css" rel="stylesheet">

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
            window.location.href="/storage?type="+checkValue;
        });
        $.getJSON("/getWareHouse",function (data) {
            var item;
            $.each(data,function (i,result) {
                item = "<option value='"+result.warehouseid+"'>"+result.warehousename+"</option>"
                $('#select').append(item);
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

            <div class="navbar-default sidebar" role="navigation"style="width: 234px">
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
                    <h1 class="page-header" style="font-family: 'Microsoft YaHei'">仓储管理</h1>
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
                                            <th>仓储ID</th>
                                            <th>器材名称</th>
                                            <th>库存量</th>
                                            <th>器材条形码</th>
                                            <th>仓库名称</th>
                                            <th>货架号</th>
                                            <th>操作</th>
                                        </tr>
                                    </thead>
                                    <c:forEach items="${storagePage.list }"  var= "storage">
                                    <tbody>
                                        <tr class="odd gradeX">
                                            <td>${storage.storageid }</td>
                                            <td>${storage.equipmentname }</td>
                                            <td>${storage.num }</td>
                                            <td class="center">${storage.barcode }</td>
                                            <td class="center">${storage.warehousename }</td>
                                            <td class="center">${storage.shelvesid }</td>
                                            <td>

                                                <button class=" btn btn-primary" data-toggle="modal" data-target="#myModal" onclick="getstorage(${storage.storageid })" value="${storage.storageid }" id="edit">修改</button>
                                                <button class="	btn btn-inverse"><a href="/deletestorage/${storage.storageid }">删除</a></button>
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
                                        <li ><a href="/equipment?type=${type}&page=1">1</a></li>
                                    </c:if>
                                    <c:if test="${num>1 }">

                                        <li class="am-active"><a href="/storage?type=${type}&page=1">1</a></li>
                                        <c:forEach var="i" begin="2" end="${num }" varStatus="status">
                                            <li><a href="/storage?type=${type}&page=${status.index}">${status.index}</a></li>
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
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close"
                                data-dismiss="modal" aria-hidden="true">
                        </button>
                        <h4 class="modal-title" id="myModalLabel" style="text-align:center;margin-left:auto; margin-right:auto;">
                                     仓储位管理
                        </h4>
                    </div>
                    <div class="modal-body">
                        <form class="form-horizontal" name="from1" id="from1" action="/addstorage" method="get" >
                            <div class="form-group">
                                <label class="col-sm-2 control-label"  style="margin-left: 19% "for="shelvesid" v>货架号</label>
                                <div class="col-sm-4">
                                    <input class="form-control" name="storage.shelvesid" id="shelvesid"  style="margin-left: 7%"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="select" style="margin-left: 19% ">存储仓库</label>
                                <select class="form-control" id="select" style="width: 170px;margin-left: 40%">
                                </select>
                            </div>
                            <input class="form-control" name="storage.storageid" id="storageid"type="hidden"/>
                            <input class="form-control" name="storage.warehouseid" id="warehouseid" type="hidden">
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

    <!-- /#wrapper -->

    <!-- jQuery -->
    <script src="/bower_components/jquery/dist/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="/bower_components/metisMenu/dist/metisMenu.min.js"></script>

    <!-- DataTables JavaScript -->
    <script src="/bower_components/datatables/media/js/jquery.dataTables.min.js"></script>
    <script src="/bower_components/datatables-plugins/integration/bootstrap/3/dataTables.bootstrap.min.js"></script>

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
    });
    </script>

    <script>
       function sumbit() {
           $('#warehouseid')[0].value=$("#select").val();
           $('#from1').submit();
       }
        function getstorage(e) {
            $.getJSON("/getstorage?id="+e,function (data) {
                $('#shelvesid')[0].value=data.shelvesid;
                $('#warehouseid')[0].value=data.warehouseid;
                $('#storageid')[0].value=data.storageid;
                $("#select").children("option").each(function(){
                    var temp_value = $(this).val();
                    if(temp_value == test){
                        alert(temp_value);
                        $(this).attr("selected","selected");
                        $(this).siblings().removeAttr("selected");
                    }
                });
            });
            $('#from1').attr("action","/updatestorage");
        }
      function add() {
          $("#myModal").on("hidden.bs.modal", function() {
              $(this).removeData("bs.modal");
          });
          $('#from1').attr("action","/addstorage");
      }
    </script>




</body>

</html>
