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
  <title>单位管理</title>
    <jsp:include page="../common/link.jsp" />

  </head>
  <body>
    <jsp:include page="../common/header.jsp" />
    <jsp:include page="../common/sidebar.jsp" />
<!-- START CONTENT -->
<div class="content">

  <!-- Start Page Header -->
  <div class="page-header">
    <h1 class="title">单位管理</h1>
      <ol class="breadcrumb">
        <li><a href="${pageContext.request.contextPath}/user/index">首页</a></li>
        <li class="active">单位管理</li>
      </ol>

  </div>
  <!-- End Page Header -->


 
<!-- START CONTAINER -->
<div class="container-widget">


  <!-- Start Row -->
  <div class="row">

    <!-- Start Panel -->
    <div class="col-md-12">
      <div class="panel panel-default">
        <div class="panel-title">
          单位管理
        </div>
        <div class="panel-body table-responsive">

            <table id="example" class="table display table-bordered">
                <thead>
                    <tr>
                      <th>序号</th>
                      <th>单位名称</th>
                      <th>负责人1</th>
                      <th>负责人2</th>
                      <th>单位管理员</th>
                      <th>审核状态</th>
                      <th>操作</th>
                    </tr>
                </thead>
                <tbody>
                <c:forEach items="${list}" varStatus="status" var="organization">
                    <tr data-id="${organization.id}">
                        <td>${status.count}</td>
                        <td>${organization.name}</td>
                        <td>${organization.principal1}</td>
                        <td>${organization.principal2}</td>
                        <td>${organization.admin}</td>
                        <td class="status-text">
                            <c:choose>
                                <c:when test="${organization.status eq 0 or organization.status eq '' or organization.status == null}">未审核</c:when>
                                <c:when test="${organization.status eq 1}">审核通过</c:when>
                                <c:when test="${organization.status eq 2}">审核不通过</c:when>
                            </c:choose>
                        </td>
                        <td>
                            <a href="${pageContext.request.contextPath}/organization/detail/${organization.id}" class="btn btn-default pass">查看单位详情</a>
                            <a href="${pageContext.request.contextPath}/organization/update/${organization.id}" class="btn btn-primary">修改单位信息</a>
                            <button type="button" class="btn btn-success pass" data-num="${organization.id}">审核通过</button>
                            <button type="button" class="btn btn-warning repulse" data-num="${organization.id}">审核不通过</button>
                            <c:if test="${sessionScope.role eq 'super'}">
                                <button type="button" class="btn btn-danger delete" data-num="${organization.id}">删除此单位</button>
                            </c:if>
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
  <a href="${pageContext.request.contextPath}/organization/new" class="btn btn-success">添加单位</a>
</div>
<!-- END CONTAINER -->

    <jsp:include page="../common/footer.jsp" />
</div>
<!-- End Content -->
    <jsp:include page="../common/script.jsp" />


<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/pages/company/list.js"></script>

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