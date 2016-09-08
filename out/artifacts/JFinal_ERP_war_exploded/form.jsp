
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
                    <div class="modal-header">
                        <button type="button" class="close"
                                data-dismiss="modal" aria-hidden="true">
                        </button>
                        <h4 class="modal-title" id="myModalLabel" >
                                 添加器材
                        </h4>
                    </div>
                    <div class="modal-body">
                        <form class="form-horizontal" name="from1" id="from1" action="/addequipment" method="get" >
                            <div class="form-group">
                                <label class="col-sm-2 control-label"  style="margin-left: 12% "for="equipment.equipmentname">器材名称</label>
                                <div class="col-sm-4">
                                    <input class="form-control" name="equipment.equipmentname" id="equipment.equipmentname" style="margin-left: 7%"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="equipment.equipmenttypeid" style="margin-left: 12% ">类别代码</label>
                                <div class="col-sm-4">
                                    <input class="form-control" name="equipment.equipmenttypeid" id="equipment.equipmenttypeid" style="margin-left: 7%"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="equipment.num" style="margin-left: 12% ">库存量</label>
                                <div class="col-sm-4">
                                    <input class="form-control" name="equipment.num" id="equipment.num" style="margin-left: 7%"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="equipment.describe" style="margin-left: 12% ">器材描述</label>
                                <div class="col-sm-4">
                                    <input class="form-control" name="equipment.describe" id="equipment.describe" style="margin-left: 7%"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="equipment.unit" style="margin-left: 12% " >单位</label>
                                <div class="col-sm-4">
                                    <input class="form-control" name="equipment.unit" id="equipment.unit" style="margin-left: 7%"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="equipment.flag" style="margin-left: 12% " > 条码前缀</label>
                                <div class="col-sm-4">
                                    <input class="form-control" name="equipment.flag" id="equipment.flag"style="margin-left: 7%"/>
                                </div>
                            </div>
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



</html>
