<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
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
  <title>综合查询</title>

    <jsp:include page="../common/link.jsp" />

  </head>
  <body>
    <jsp:include page="../common/header.jsp" />
    <jsp:include page="../common/sidebar.jsp" />
<!-- START CONTENT -->
<div class="content">

  <!-- Start Page Header -->
  <div class="page-header">
    <h1 class="title">综合查询</h1>
      <ol class="breadcrumb">
        <li><a href="${pageContext.request.contextPath}/user/index">首页</a></li>
        <li class="active">综合查询</li>
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
          综合查询条件
        </div>

        <div class="panel-body">
          <form role="form" action="${pageContext.request.contextPath}/query/" method="post">
            
              <div class="form-group clearfix">
                  <div class="col-md-3">
                      <label>审核状态：</label>
                      <label>
                        <select name="status">
                          <option value="-1" <c:if test="${status eq '-1'}">selected</c:if>>请选择</option>
                          <option value="0" <c:if test="${status eq '0'}">selected</c:if>>审核通过</option>
                          <option value="2" <c:if test="${status eq '2'}">selected</c:if>>审核不通过</option>
                        </select>
                      </label>
                  </div>
                  <div class="col-md-3">
                    <label>所属单位：</label>
                      <label>
                          <select class="form-control organization-id" name="organizationId">
                              <option value="0">请选择</option>
                              <c:forEach items="${organizationList}" var="organization">
                                  <option value="${organization.id}" <c:if test="${organizationId eq organization.id}">selected</c:if>>${organization.name}</option>
                              </c:forEach>
                          </select>
                      </label>
                  </div>
                  <div class="col-md-6">
                    <label>活动名称：</label>
                      <label>
                          <select class="form-control activity-id" name="activityId">
                              <option value="0">请选择</option>
                              <c:forEach items="${activityList}" var="activity">
                                  <option value="${activity.id}"<c:if test="${activityId eq activity.id}">selected</c:if>>${activity.name}</option>
                              </c:forEach>
                          </select>
                     </label>
                  </div>
              </div>

              <div class="form-group clearfix">
                <div class="col-md-3">
                    <label>活动成绩：</label>
                    <label>
                        <select class="form-control score" name="score">
                            <option value="0" <c:if test="${score eq 0}">selected</c:if>>请选择</option>
                            <option value="4" <c:if test="${score eq 4}">selected</c:if>>合格</option>
                            <option value="5" <c:if test="${score eq 5}">selected</c:if>>不合格</option>
                            <option value="1" <c:if test="${score eq 1}">selected</c:if>>金牌</option>
                            <option value="2" <c:if test="${score eq 2}">selected</c:if>>银牌</option>
                            <option value="3" <c:if test="${score eq 3}">selected</c:if>>铜牌</option>
                            <option value="6" <c:if test="${score eq 6}">selected</c:if>>参加表演</option>
                            <option value="7" <c:if test="${score eq 7}">selected</c:if>>无成绩</option>
                        </select>
                    </label>
                </div>
                  <div class="col-sm-3">
                    <label>性别：</label>
                    <label>
                      <select class="form-control sex"  name="sex">
                          <option value="-1">请选择</option>
                          <option value="1" <c:if test="${sex eq 1}">selected</c:if>>男</option>
                          <option value="2" <c:if test="${sex eq 2}">selected</c:if>>女</option>
                      </select>
                    </label>
                  </div>
                  <div class="col-sm-6">
                    <label>年龄：</label>
                      <input type="text" class="J_begin_age" value="${age1}">
                      <input type="hidden" name="age1" value="${age1}" class="begin-age">
                      至
                      <input type="text" class="J_end_age" value="${age2}">
                      <input type="hidden" name="age2" value="${age2}" class="end-age">
                  </div>
              </div>
              
              <div class="box-footer">
                  <input type="submit" class="btn btn-success" value="查询">
              </div>
          </form>
        </div>

      </div>
    </div>

    <!-- Start Panel -->
    <div class="col-md-12">
      <div class="panel panel-default">
        <div class="panel-title">
          活动综合列表
        </div>
        <div class="panel-body table-responsive">

            <table id="example" class="table display table-bordered">
              <thead>
                  <tr>
                    <th>活动编号</th>
                    <th>活动名称</th>
                    <th>参与者姓名</th>
                    <th>性别</th>
                    <th>年龄</th>
                    <th>联系电话</th>
                    <th>所属单位</th>
                    <th>报名时间</th>
                    <th>成绩</th>
                  </tr>
              </thead>
              <tbody>
              <c:forEach items="${list}" var="query" varStatus="status">
                  <tr>
                      <td>
                        ${query.year}<fmt:formatNumber type="number" value="${query.activityId}" pattern="000" />
                      </td>
                      <td>${query.activityName}</td>
                      <td>${query.memberName}</td>
                      <td>${query.sex}</td>
                      <td>${query.age}</td>
                      <td>${query.tel}</td>
                      <td>${query.organization}</td>
                      <td>${query.applyTime}</td>
                      <td>
                          <c:choose>
                              <c:when test="${query.score eq 1}">金牌</c:when>
                              <c:when test="${query.score eq 2}">银牌</c:when>
                              <c:when test="${query.score eq 3}">铜牌</c:when>
                              <c:when test="${query.score eq 4}">合格</c:when>
                              <c:when test="${query.score eq 5}">不合格</c:when>
                              <c:when test="${query.score eq 6}">参加表演</c:when>
                              <c:when test="${query.score == null or query.score eq '' or query.score eq 7}">无成绩</c:when>
                          </c:choose>
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
  <form action="${pageContext.request.contextPath}/export/query" method="get">  
    <input type="hidden" name="activity" class="export-activity" value="${activityId}">
    <input type="hidden" name="organization" class="export-organization" value="${organizationId}">
    <input type="hidden" name="score" class="export-score" value="${score}">
    <input type="hidden" name="status" class="export-status" value="${status}">
    <input type="submit" value="导出活动参报人员表为Excel" class="btn btn-default export">
  </form>
</div>
<!-- END CONTAINER -->


    <jsp:include page="../common/footer.jsp" />

</div>
<!-- End Content -->
    <jsp:include page="../common/script.jsp" />
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/pages/query/list.js"></script>
<script>
$(document).ready(function() {
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
    // 增添输入框效果
    if($('.J_begin_age').val() == -1){
        $('.J_begin_age').val('');
    }
    if($('.J_end_age').val() == -1){
        $('.J_end_age').val('');
    }
    $('.J_begin_age').change(function () {
        $('.begin-age').val($(this).val());
    })
    $('.J_end_age').change(function () {
        $('.end-age').val($(this).val());
    })
});
</script>
</body>
</html>