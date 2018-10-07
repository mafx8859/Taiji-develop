<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
  <head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>修改个人信息</title>

  <!-- ========== Css Files ========== -->
    <jsp:include page="../common/link.jsp" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/js/bootstrap-datepicker/dist/css/bootstrap-datepicker.min.css">

  </head>
  <body>
  

    <jsp:include page="../common/header.jsp" />
    <jsp:include page="../common/sidebar.jsp" />
<!-- START CONTENT -->
<div class="content">

  <div class="page-header">
    <h1 class="title">会员管理</h1>
      <ol class="breadcrumb">
        <li><a href="${pageContext.request.contextPath}/user/index">首页</a></li>
        <li class="active">修改个人信息</li>
      </ol>

  </div>

<!-- START CONTAINER -->
<div class="container-widget">

  <div class="panel">
    <div class="panel-title">
      修改照片
    </div>
    <div class="panel-body">
      <form action="${pageContext.request.contextPath}/user/photo" method="post" enctype="multipart/form-data">
          <input type="hidden" name="id" value="${member.id}">
          <!-- 照片信息 -->
          <div class="box-header with-border text-center">
              <h3 class="box-title">照片信息</h3>
          </div>
          <div class="box-body">
              <div class="form-group clearfix">
                  <label class="col-sm-3 control-label">上传头像照片：</label>
                  <div class="col-sm-4">
                      <input type="file" id="exampleInputFile" name="photo">
                  </div>
                  <div class="col-sm-3">
                      <c:choose>
                          <c:when test="${member.photo != null}">
                              <img src="${pageContext.request.contextPath}/resources/upload/${member.photo}" id="portrait" alt="已有照片">
                          </c:when>
                          <c:when test="${member.photo == null}">
                              <img src="${pageContext.request.contextPath}/resources/upload/default.jpg" id="portrait" alt="暂无照片">
                          </c:when>
                      </c:choose>
                  </div>
              </div>
              <p class="photo-tip text-red text-center">请先上传个人照片，保证信息完整性。</p>
          </div>
          <div class="box-footer text-center">
              <a href="${pageContext.request.contextPath}/user/update" class="btn btn-default">返回修改信息页面</a>
              <input type="submit" class="btn btn-success photo-upload" value="上传照片">
          </div>
      </form>
    </div>
  </div>



</div>
<!-- END CONTAINER -->


    <jsp:include page="../common/footer.jsp" />

</div>

<jsp:include page="../common/script.jsp" />

<!-- ================================================
Bootstrap Date Range Picker
================================================ -->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/bootstrap-datepicker/dist/js/bootstrap-datepicker.js"></script>
<!-- ================================================
Summernote
================================================ -->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/summernote/summernote.min.js"></script>
<!-- ===========================
  基本函数
=============================== -->
<!-- 验证模块 -->
<script src="${pageContext.request.contextPath}/resources/js/pages/common/verify.js"></script>
</body>
</html>