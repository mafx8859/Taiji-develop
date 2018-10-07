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
  <title>证书与证件管理</title>

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
        <li class="active">证书与证件管理</li>
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
        <div class="panel-title" >
          证件管理：
        </div>
        <div class="panel-body table-responsive">
            <p>现使用默认证件，如果需要改变证件下载权限，请点击修改证件下载权限！</p>
            <button type="button" class="btn btn-success" data-toggle="modal" data-target="#entry-pass-upload">重新上传证件并选择下载权限</button>
            <button type="button" class="btn btn-default" data-toggle="modal" data-target="#entry-pass">修改证件下载权限</button>
        </div>
        <div class="panel-title" style="margin-top:20px;">
          证书管理：
        </div>
        <div class="panel-body table-responsive">
            <c:if test="${(activity.certificate == null or activity.certificate eq '')}">
              <p>现使用默认证书，如果需要上传新证书，请点击上传证书！</p>
            </c:if>
            <c:if test="${!(activity.certificate == null or activity.certificate eq '')}">
              <p>证书如下！</p>
            </c:if>
            <button type="button" class="btn btn-success" data-toggle="modal" data-target="#upload">重新上传证书并选择下载权限</button>
            <button type="button" class="btn btn-default" data-toggle="modal" data-target="#modify">修改证书下载权限</button>
            <p>
              <c:if test="${!(activity.certificate == null or activity.certificate eq '')}">
                证书预览：
                <a class="pdf" href="${pageContext.request.contextPath}/resources/upload/certificate/${activity.certificate}"></a>
              </c:if>
            </p>
        </div>
      </div>
    </div>
    <!-- End Panel -->
  </div>
  


</div>
  <%-- 上传+修改权限--%>
  <div class="modal fade" id="upload">
    <div class="modal-dialog">
      <form class="modal-content" action="${pageContext.request.contextPath}/activity/upload" method="post" enctype="multipart/form-data">
        <input type="hidden" name="id" value="${activity.id}">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span></button>
          <h4 class="modal-title">上传证书文件：</h4>
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
  <%-- 只修改权限 --%>
  <div class="modal fade" id="modify">
    <div class="modal-dialog">
      <form class="modal-content" action="${pageContext.request.contextPath}/activity/authority" method="post">
        <input type="hidden" name="id" value="${activity.id}">
        <input type="hidden" name="certificate" value="${activity.certificate}">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span></button>
          <h4 class="modal-title">修改权限：</h4>
        </div>
        <div class="modal-body">
          <div class="form-group clearfix">
            <label>选择证书下载打印权限：</label>
            <select class="form-control" name="whoCertificate">
              <option value="self">普通会员可自行打印证书</option>
              <option value="admin">只有系统、超级管理员可以打印证书</option>
            </select>
          </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-primary pull-left" data-dismiss="modal">关闭</button>
          <button type="submit" class="btn btn-default">确认提交</button>
        </div>
      </form>
      <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
  </div>

  <!-- 入场证上传+修改权限 -->
  <div class="modal fade" id="entry-pass-upload">
    <div class="modal-dialog">
      <form class="modal-content" action="${pageContext.request.contextPath}/activity/permit/upload" method="post" enctype="multipart/form-data">
        <input type="hidden" name="id" value="${activity.id}">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span></button>
          <h4 class="modal-title">上传证件文件：</h4>
        </div>
        <div class="modal-body">
                <div class="form-group clearfix">
                  <label>选择证件下载打印权限：</label>
                  <select class="form-control" name="whoPermit">
                    <option value="self">普通会员可自行打印证件</option>
                    <option value="admin">只有系统、超级管理员可以打印证件</option>
                  </select>
                </div>
                <div class="form-group clearfix">
                  <label>选择文件：</label>
                  <input type="file" name="permit" class="form-control" id="exampleInputFile2">
                </div>
                <input type="hidden" name="applicationId" id="applicationId">
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-primary pull-left" data-dismiss="modal">关闭</button>
          <button type="submit" class="btn btn-default sub-grade2">确认提交</button>
        </div>
      </form>
      <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
  </div>

  <!-- 证件修改 -->

  <div class="modal fade" id="entry-pass">
      <div class="modal-dialog">
        <form class="modal-content" action="${pageContext.request.contextPath}/activity/permit" method="post">
          <input type="hidden" name="id" value="${activity.id}">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title">修改权限：</h4>
          </div>
          <div class="modal-body">
            <div class="form-group clearfix">
              <label>选择证书下载打印权限：</label>
              <select class="form-control" name="whoPermit">
                <option value="self">普通会员可自行打印证书</option>
                <option value="admin">只有系统、超级管理员可以打印证书</option>
              </select>
            </div>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-primary pull-left" data-dismiss="modal">关闭</button>
            <button type="submit" class="btn btn-default">确认提交</button>
          </div>
        </form>
        <!-- /.modal-content -->
      </div>
      <!-- /.modal-dialog -->
    </div>


    <jsp:include page="../common/footer.jsp" />
</div>
<!-- End Content -->

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