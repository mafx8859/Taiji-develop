<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
  <title>证书预览</title>

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
        <li class="active">证书预览</li>
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
          证书预览
        </div>
        <div class="panel-body table-responsive">
              <a class="pdf" href="${pageContext.request.contextPath}/resources/upload/certificate/${activity.certificate}"></a>
        </div>
      </div>
      <button type="button" class="btn btn-success" data-toggle="modal" data-target="#upload">重新上传证书</button>
    </div>
    <!-- End Panel -->
  </div>
</div>
    <jsp:include page="../common/footer.jsp" />
</div>
<!-- End Content -->
    <div class="modal fade" id="upload">
      <div class="modal-dialog">
        <form class="modal-content" action="${pageContext.request.contextPath}/activity/upload" method="post" enctype="multipart/form-data">
          <input type="hidden" name="id" value="${activity.id}">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title">上传文件：</h4>
          </div>
          <div class="modal-body">
            <div class="form-group clearfix">
              <label>选择证书下载打印权限：</label>
              <select class="form-control" name="whoCertificate">
                <option value="self">普通会员可自行打印证书</option>
                <option value="admin">只有系统、超级管理员可以打印证书</option>
              </select>
            </div>
            <div class="form-group clearfix">
              <label>选择文件：</label>
              <input type="file" name="certificate" class="form-control" id="exampleInputFile">
            </div>
            <input type="hidden" name="applicationId" id="applicationId">
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-primary pull-left" data-dismiss="modal">关闭</button>
            <button type="submit" class="btn btn-default sub-grade">确认提交</button>
          </div>
        </form>
        <!-- /.modal-content -->
      </div>
      <!-- /.modal-dialog -->
    </div>

  <jsp:include page="../common/script.jsp" />


<script src="${pageContext.request.contextPath}/resources/js/jquery.media.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/pages/common/pdf_upload.js"></script>
<script>
    $(function () {
        $('.pdf').media({
            width:1000,
            height:800
        })
    })
</script>
</body>
</html>