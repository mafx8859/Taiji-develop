<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: 卓音
  Date: 2017/9/28
  Time: 15:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
  <head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>活动列表页</title>

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
        <li class="active">活动列表</li>
      </ol>

  </div>
  <!-- End Page Header -->
<!-- START CONTAINER -->
<div class=" container-widget">


  <!-- Start Row -->
  <div class="row">

    <!-- Start Panel -->
    <div class="col-md-12">
      <div class="panel panel-default">
        <div class="panel-title">
          活动管理列表
        </div>
        <div class="panel-body table-responsive">

            <table id="example" class="table display table-bordered">
                <thead>
                <tr>
                    <th>序号</th>
                    <th>活动编号</th>
                    <th>活动名称</th>
                    <th>主办单位</th>
                    <th>承办单位</th>
                    <th>活动时间</th>
                    <th>费用/人</th>
                    <th>活动时间状态</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${list}" var="activity" varStatus="status">
                    <tr data-id="${activity.id}">
                        <td>${status.count}</td>
                        <td>${activity.year}<fmt:formatNumber type="number" value="${activity.id}" pattern="000" /></td>
                        <td>${activity.name}</td>
                        <td>${activity.sponsor}</td>
                        <td>${activity.organization}</td>
                        <td>${activity.time}</td>
                        <td>${activity.budget}</td>
                        <td>
                            <c:choose>
                                <c:when test="${activity.isFinish == 1}">未开始</c:when>
                                <c:when test="${activity.isFinish == 0}">进行中</c:when>
                                <c:when test="${activity.isFinish == -1}">已结束</c:when>
                            </c:choose>
                        </td>
                        <td>
                            <a href="${pageContext.request.contextPath}/activity/detail/${activity.id}"
                               class="btn btn-default">查看活动详情</a>
                            <a href="${pageContext.request.contextPath}/activity/update/${activity.id}"
                               class="btn btn-success">修改活动信息</a>
                            <a href="${pageContext.request.contextPath}/activity/upload/${activity.id}"
                               class="btn btn-primary">证书与证件管理</a>
                            <a href="${pageContext.request.contextPath}/activity/check/${activity.id}"
                               class="btn btn-warning">参加人员管理</a>
                            <button type="button" class="btn btn-danger delete" data-num="${activity.id}">删除该活动</button>
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
  <a href="${pageContext.request.contextPath}/activity/new" class="btn btn-success">添加活动</a>
  <a href="${pageContext.request.contextPath}/export/activity" class="btn btn-default">导出活动列表为Excel</a>
  


</div>
<!-- END CONTAINER -->


    <jsp:include page="../common/footer.jsp" />



</div>
<!-- End Content -->

  <jsp:include page="../common/script.jsp" />


<script src="${pageContext.request.contextPath}/resources/js/pages/common/verify.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/pages/activity/list.js"></script>

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
});
</script>
</body>
</html>