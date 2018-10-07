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
  <title>未报名活动列表</title>

    <jsp:include page="../common/link.jsp" />

  </head>
  <body>
   <jsp:include page="../common/header.jsp" />
   
   <jsp:include page="../common/sidebar.jsp" />
<!-- START CONTENT -->
<div class="content">

  <!-- Start Page Header -->
  <div class="page-header">
    <h1 class="title">我的活动</h1>
      <ol class="breadcrumb">
        <li><a href="${pageContext.request.contextPath}/user/index">首页</a></li>
        <li><a href="#">我的活动</a></li>
        <li class="active">未报名活动</li>
      </ol>

  </div>
  <!-- End Page Header -->



 <!-- //////////////////////////////////////////////////////////////////////////// --> 
<!-- START CONTAINER -->
<div class=" container-widget">


  <!-- Start Row -->
  <div class="row">

    <!-- Start Panel -->
    <div class="col-md-12">
      <div class="panel panel-default">
        <div class="panel-title">
          未报名活动列表
        </div>
        <div class="panel-body table-responsive">

            <table id="example" class="table display table-bordered">
              <thead>
                    <tr>
                      <th>序号</th>
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
                <c:forEach items="${list}" varStatus="status" var="activity">
                    <tr>
                        <td>${status.count}</td>
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
                            <a href="${pageContext.request.contextPath}/activity/detail/${activity.activityId}" class="btn btn-default">查看活动详情</a>
                            <c:choose>
                                <c:when test="${activity.isFinish != -1}">
                                    <a href="${pageContext.request.contextPath}/application/detail/${activity.activityId}" class="btn btn-success">报名此活动</a>
                                </c:when>
                                <c:when test="${activity.isFinish == -1}">
                                    <a href="javascript:;" class="btn btn-danger" onclick="alert('此活动已结束，无法报名！')">此活动已结束</a>
                                </c:when>
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
</div>
<!-- END CONTAINER -->


    <jsp:include page="../common/footer.jsp" />


</div>
<!-- End Content -->

    <jsp:include page="../common/script.jsp" />

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