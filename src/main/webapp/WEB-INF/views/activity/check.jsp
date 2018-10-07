<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 卓音
  Date: 2017/9/26
  Time: 20:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
  <head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>活动列表-审核</title>

  <jsp:include page="../common/link.jsp" />

  </head>
  <body>
    <jsp:include page="../common/header.jsp" />
    
    <jsp:include page="../common/sidebar.jsp" />
<!-- START CONTENT -->
<div class="content">

  <!-- Start Page Header -->
  <div class="page-header">
    <h1 class="title">活动管理</h1>
      <ol class="breadcrumb">
        <li><a href="${pageContext.request.contextPath}/user/index">首页</a></li>
        <li><a href="#">活动管理</a></li>
        <li class="active">参加人员列表</li>
      </ol>

  </div>
  <!-- End Page Header -->

<!-- START CONTAINER -->
<div class=" container-widget">


  <!-- Start Row -->
  <div class="row">
      <div class="col-md-12">
          <div class="panel">
              <div class="panel-title">
                  管理列表查询条件
              </div>

              <div class="panel-body">
                  <form role="form" action="${pageContext.request.contextPath}/activity/check/${activity.id}" method="post">

                      <div class="form-group">
                          <label>是否需要餐饮：</label>
                          <label>
                              <select class="form-control" name="meal">
                                  <option value="-1">请选择</option>
                                  <option value="1">需要</option>
                                  <option value="0">不需要</option>
                              </select>
                          </label>
                      </div>
                      <div class="form-group">
                          <label>是否需要住宿：</label>
                          <label>
                              <select class="form-control" name="hotel">
                                  <option value="-1">请选择</option>
                                  <option value="1">需要</option>
                                  <option value="0">不需要</option>
                              </select>
                          </label>
                      </div>
                      <div class="box-footer">
                          <input type="submit" class="btn btn-default" value="查询">
                      </div>
                  </form>
              </div>

          </div>
      </div>
    <!-- Start Panel -->
    <div class="col-md-12">
      <div class="panel panel-default">
        <div class="panel-title">
            管理列表
        </div>
        <div class="panel-body table-responsive">

            <table id="example" class="table display table-bordered">
                <thead>
                    <tr>
                      <th>序号</th>
                      <th>活动名称</th>
                      <th>姓名</th>
                      <th>性别</th>
                      <th>年龄</th>
                      <th>联系电话</th>
                      <th>报名时间</th>
                      <th>餐饮</th>
                      <th>住宿</th>
                      <th>审核状态</th>
                      <th>成绩</th>
                      <th>操作</th>
                    </tr>
                </thead>
                <tbody>
                <c:forEach items="${list}" var="application" varStatus="status">
                    <tr data-id="${application.applicationId}">
                        <td>${status.count}</td>
                        <td>${activity.name}</td>
                        <td>${application.memberName}</td>
                        <td>
                            <c:choose>
                                <c:when test="${application.sex eq 1}">男</c:when>
                                <c:when test="${application.sex eq 2}">女</c:when>
                            </c:choose>
                        </td>
                        <td>${application.age}</td>
                        <td>${application.telephone}</td>
                        <td>${application.applyTime}</td>
                        <td>
                            <c:choose>
                                <c:when test="${application.meal eq 0}">不需要</c:when>
                                <c:when test="${application.meal eq 1}">需要</c:when>
                            </c:choose>
                        </td>
                        <td>
                            <c:choose>
                                <c:when test="${application.hotel eq 0}">不需要</c:when>
                                <c:when test="${application.hotel eq 1}">需要</c:when>
                            </c:choose>
                        </td>
                        <td class="status-text">
                            <c:choose>
                                <c:when test="${application.applicationStatus eq 0 or application.applicationStatus eq '' or application.applicationStatus == null}">审核通过</c:when>
                                <c:when test="${application.applicationStatus eq 1}">审核通过</c:when>
                                <c:when test="${application.applicationStatus eq 2}">审核不通过</c:when>
                            </c:choose>
                        </td>
                        <td class="score-text">
                            <c:choose>
                                <c:when test="${application.score == 1}">金牌</c:when>
                                <c:when test="${application.score == 2}">银牌</c:when>
                                <c:when test="${application.score == 3}">铜牌</c:when>
                                <c:when test="${application.score == 4}">合格</c:when>
                                <c:when test="${application.score == 5}">不合格</c:when>
                                <c:when test="${application.score == 6}">参加表演</c:when>
                                <c:when test="${application.score == 7}">无成绩</c:when>
                            </c:choose>
                        </td>
                        <td>
                            <%--<c:if test="${activity.isFinish == 1}">--%>
                                <button type="button" class="btn btn-success pass" data-num="${application.applicationId}">审核通过</button>
                                <button type="button" class="btn btn-danger repulse" data-num="${application.applicationId}">审核不通过</button>
                            <%--</c:if>--%>
                            <%--<c:if test="${activity.isFinish == -1}">--%>
                                <button type="button" class="btn btn-default grade" data-num="${application.applicationId}"  data-toggle="modal" data-target="#grade">评定成绩</button>
                                <a href="${pageContext.request.contextPath}/personal/certificate/${application.applicationId}" class="btn btn-success">查看证书</a>
                                <a href="${pageContext.request.contextPath}/personal/permit/${application.applicationId}" class="btn btn-primary">查看证件</a>
                            <%--</c:if>--%>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>

      </div>
    </div>
    <!-- End Panel -->
  </div>
  <!-- End Row -->
      <a href="${pageContext.request.contextPath}/activity/list" class="btn btn-default">返回列表</a>
      <button type="button" data-toggle="modal" data-target="#add" class="btn btn-success">直接报名并注册</button>
      <button type="button" data-toggle="modal" data-target="#all-grade" class="btn btn-primary">统一评定成绩</button>
</div>
    <%--单人评定成绩--%>
    <div class="modal fade" id="grade">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title">评定成绩：</h4>
          </div>
          <div class="modal-body">
                  <div class="form-group clearfix">
                    <label>成绩结果：</label>
                        <select class="form-control score">
                          <option value="4" selected="selected">合格</option>
                          <option value="5">不合格</option>
                          <option value="1">金牌</option>
                          <option value="2">银牌</option>
                          <option value="3">铜牌</option>
                          <option value="6">参加表演</option>
                          <option value="7">无成绩</option>
                        </select>
                    </div>
                  <input type="hidden" name="applicationId" id="applicationId">
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-primary pull-left" data-dismiss="modal">关闭</button>
            <button type="button" class="btn btn-default sub-grade">评定成绩</button>
          </div>
        </div>
        <!-- /.modal-content -->
      </div>
      <!-- /.modal-dialog -->
    </div>
    <%--统一评定成绩--%>
    <div class="modal fade" id="all-grade">
        <div class="modal-dialog">
            <form class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">统一评定成绩：</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group clearfix">
                        <label>成绩结果：</label>
                        <select class="form-control score">
                            <option value="4" selected="selected">合格</option>
                            <option value="5">不合格</option>
                            <option value="1">金牌</option>
                            <option value="2">银牌</option>
                            <option value="3">铜牌</option>
                            <option value="6">参加表演</option>
                            <option value="7">无成绩</option>
                        </select>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary pull-left" data-dismiss="modal">关闭</button>
                    <input type="submit" value="统一评定成绩" class="btn btn-default">
                </div>
            </form>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
     <%--管理员直通报名--%>
    <div class="modal fade" id="add">
        <div class="modal-dialog">
            <form class="modal-content" action="${pageContext.request.contextPath}/application/admin" method="post">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">直接报名并注册：</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group clearfix">
                        <label>用户名：</label>
                        <input type="text" class="form-control require-text username" name="username">
                        <!-- 密码，有默认值,不需要填写 -->
                        <input type="hidden" value="123" name="password">
                        <input type="hidden" value="${activity.id}" name="activityId">
                    </div>
                    <div class="form-group clearfix">
                        <label>姓名：</label>
                        <input type="text" class="form-control require-text" name="name">
                    </div>
                    <div class="form-group clearfix">
                        <label>性别：</label>
                        <select class="form-control" name="sex">
                            <option value="1">男</option>
                            <option value="2">女</option>
                        </select>
                    </div>
                    <div class="form-group clearfix">
                        <label>出生年月日：</label>
                        <div class="input-group date">
                            <div class="input-group-addon">
                                <i class="fa fa-calendar"></i>
                            </div>
                            <input type="text" class="form-control pull-right datepicker require-text" name="birth">
                        </div>
                    </div>
                    <div class="form-group clearfix">
                        <label>身份证：</label>
                        <input type="text" class="form-control require-text id-number" name="idNumber">
                    </div>
                    <div class="form-group clearfix">
                        <label>联系电话：</label>
                        <input type="text" class="form-control require-text" name="telephone">
                    </div>
                    <div class="form-group clearfix">
                        <label>需要承办方提供餐饮：</label>
                        <div class="radio radio-inline">
                            <input type="radio" name="meal" value="1" checked="checked" id="1">
                            <label for="1">需要</label>
                        </div>
                        <div class="radio radio-inline">
                            <input type="radio" name="meal" value="0" id="2">
                            <label for="2">不需要</label>
                        </div>
                    </div>
                    <div class="form-group clearfix">
                        <label>需要承办方提供餐饮：</label>
                        <div class="radio radio-inline">
                            <input type="radio" name="hotel" value="1" checked="checked" id="3">
                            <label for="3">需要</label>
                        </div>
                        <div class="radio radio-inline">
                            <input type="radio" name="hotel" value="0" id="4">
                            <label for="4">不需要</label>
                        </div>
                    </div>
                    <input type="hidden" name="isAdmin" id="" value="3">
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary pull-left" data-dismiss="modal">关闭</button>
                    <button type="submit" class="btn btn-success J-submit">报名并注册</button>
                </div>
            </form>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>


  <jsp:include page="../common/footer.jsp" />

</div>
<!-- ./wrapper -->

  <jsp:include page="../common/script.jsp" />
<!-- ================================================
Bootstrap Date Range Picker
================================================ -->
  <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/bootstrap-datepicker/dist/js/bootstrap-datepicker.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/pages/common/verify.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/pages/activity/check.js"></script>

<script>
$(document).ready(function() {
    $('.datepicker').datepicker({
        autoclose: true
    });
    $('#example').DataTable({
      "language":{
        "emptyTable": "暂无数据",  
        "loadingRecords": "加载中...",  
        "processing": "查询中...",  
        "search": "关键字搜索:",  
        "lengthMenu": "每页 _MENU_ 条",  
        "zeroRecords": "暂无数据",  
        "paginate": {  
            "first":      "第一页",  
            "last":       "最后一页",  
            "next":       "下一页",  
            "previous":   "上一页"  
        },  
        "info": "第 _PAGE_ 页 / 总 _PAGES_ 页",  
        "infoEmpty": "当前数据条数为0",  
        "infoFiltered": "（搜索后的信息总共 _MAX_ 条）" 
      }
    });
});
</script>
</body>
</html>