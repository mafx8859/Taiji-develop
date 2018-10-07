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
    <h1 class="title">我的活动</h1>
      <ol class="breadcrumb">
        <li><a href="${pageContext.request.contextPath}/user/index">首页</a></li>
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
              <a class="pdf" href="${pageContext.request.contextPath}/resources/upload/certificate/${activity.name}/${member.name}.pdf"></a>
        </div>
      </div>
    </div>
    <!-- End Panel -->
  </div>
</div>
    <jsp:include page="../common/footer.jsp" />
</div>
<!-- End Content -->

  <jsp:include page="../common/script.jsp" />


<script src="${pageContext.request.contextPath}/resources/js/jquery.media.js"></script>
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