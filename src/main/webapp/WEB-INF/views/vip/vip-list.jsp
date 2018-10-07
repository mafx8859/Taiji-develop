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
  <title>单位会员-审核</title>

    <jsp:include page="../common/link.jsp" />

  </head>
  <body>
    <jsp:include page="../common/header.jsp" />
    <jsp:include page="../common/sidebar.jsp" />

<!-- START CONTENT -->
<div class="content">

  <!-- Start Page Header -->
  <div class="page-header">
    <h1 class="title">会员管理</h1>
      <ol class="breadcrumb">
        <li><a href="${pageContext.request.contextPath}/user/index">首页</a></li>
        <li class="active">单位管理员审核人员</li>
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
          本单位个人会员列表
        </div>
        <div class="panel-body table-responsive">

            <table id="example" class="table display table-bordered">
                <thead>
                  <tr>
                      <th>序号</th>
                      <th>姓名</th>
                      <th>性别</th>
                      <th>年龄</th>
                      <th>联系电话</th>
                      <th>所属单位</th>
                      <th>审核状态</th>
                      <th>操作</th>
                  </tr>
                </thead>
            
             
                <tbody>
                <c:forEach items="${memberList}" var="member" varStatus="status">
                    <tr data-id="${member.id}">
                        <td>${status.count}</td>
                        <td>${member.name}</td>
                        <td>${member.sex}</td>
                        <td>${member.age}</td>
                        <td>${member.telephone}</td>
                        <td>${member.organization}</td>
                        <td class="status-text">
                            <c:choose>
                                <c:when test="${member.status eq 0 or member.status eq '' or member.status == null}">审核通过</c:when>
                                <c:when test="${member.status eq 1}">审核通过</c:when>
                                <c:when test="${member.status eq 2}">审核不通过</c:when>
                            </c:choose>
                        </td>
                        <td>
                            <a href="${pageContext.request.contextPath}/user/detail/${member.id}" class="btn btn-default">查看详情</a>
                            <button type="button" class="btn btn-success pass" data-num="${member.id}">审核通过</button>
                            <button type="button" class="btn btn-danger repulse" data-num="${member.id}">审核不通过</button>
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
  <a href="${pageContext.request.contextPath}/user/add" class="btn btn-success">添加会员</a>
</div>

    <jsp:include page="../common/footer.jsp" />

</div>
<!-- End Content -->

<jsp:include page="../common/script.jsp" />
<script src="${pageContext.request.contextPath}/resources/js/pages/vip/vip-list.js"></script>

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