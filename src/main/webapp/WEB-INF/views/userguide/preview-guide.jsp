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
  <title>系统操作指南在线预览</title>
<!-- 
    <jsp:include page="../common/link.jsp" /> -->

  </head>
  <body>

<!-- START CONTENT -->
<div class="content">

<div class=" container-widget">


  <!-- Start Row -->
  <div class="row">

    <!-- Start Panel -->
    <div class="col-md-12">
      <div class="panel panel-default">
        <div class="panel-body table-responsive">
              <a class="pdf" href="${pageContext.request.contextPath}/resources/upload/guide/${guide}" ></a>
        </div>
      </div>
    </div>
    <!-- End Panel -->
  </div>

    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.media.js"></script>
<script>
    $(function () {
        $('.pdf').media({
            width:1200,
            height:800
        })
    })
</script>
</body>
</html>