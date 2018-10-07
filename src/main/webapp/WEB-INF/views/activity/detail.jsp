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
  <title>活动列表-审核</title>

  <jsp:include page="../common/link.jsp" />

  </head>
  <body>
    <jsp:include page="../common/header.jsp" />
    <jsp:include page="../common/sidebar.jsp" />
<!-- START CONTENT -->
<div class="content">

  <!-- Start Page Header -->
  <div class="page-header">
    <h1 class="title">活动详情</h1>
      <ol class="breadcrumb">
        <li><a href="${pageContext.request.contextPath}/user/index">首页</a></li>
        <li><a href="#">活动管理</a></li>
        <li class="active">活动详情</li>
      </ol>

  </div>
  <!-- End Page Header -->

<!-- START CONTAINER -->
<div class=" container-widget">


  <div class="row">
    <div class="col-md-12">
      <div class="box box-solid">
        <div class="box-header with-border">
          <h3 class="box-title">活动具体信息</h3>
        </div>
        <div class="box-body">
          <dl class="dl-horizontal">
            <dt>活动名称：</dt>
            <dd>${activity.name}</dd>
            <dt>活动内容：</dt>
            <dd>${activity.content}</dd>
            <dt>主办单位：</dt>
            <dd>${activity.sponsor}</dd>
            <dt>承办单位：</dt>
            <dd>${activity.organization}</dd>
            <dt>活动时间：</dt>
            <dd>${activity.time}</dd>
            <dt>是否需提交身份证复印件：</dt>
            <dd>
              <c:if test="${activity.needIdCard eq '1'}">
                需要
              </c:if>
              <c:if test="${activity.needIdCard eq '0'}">
                不需要
              </c:if>
            </dd>
            <dt>是否需提交健康证明：</dt>
            <dd>
              <c:if test="${activity.needHealth eq '1'}">
                需要
              </c:if>
              <c:if test="${activity.needHealth eq '0'}">
                不需要
              </c:if>
            </dd>
            <dt>是否需提交保险证明：</dt>
            <dd>
              <c:if test="${activity.needInsurance eq '1'}">
                需要
              </c:if>
              <c:if test="${activity.needInsurance eq '0'}">
                不需要
              </c:if>
            </dd>
            <dt>是否需签订安全责任书：</dt>
            <dd>
              <c:if test="${activity.needSafe eq '1'}">
                需要
              </c:if>
              <c:if test="${activity.needSafe eq '0'}">
                不需要
              </c:if>
            </dd>
            <dt>订餐信息：</dt>
            <dd>
              <c:if test="${activity.provideMeal eq '1'}">
                提供
              </c:if>
              <c:if test="${activity.provideMeal eq '0'}">
                不提供
              </c:if>
            </dd>
            <dt>住宿信息：</dt>
            <dd>
              <c:if test="${activity.provideHotel eq '1'}">
                提供
              </c:if>
              <c:if test="${activity.provideHotel eq '0'}">
                不提供
              </c:if>
            </dd>
          </dl>
        </div>
      </div>
      <!-- /.box -->
    </div>
  </div>
  <button type="button" class="btn btn-default" onclick="window.history.back(-1);">返回列表</button>
</div>
<!-- END CONTAINER -->


  <jsp:include page="../common/footer.jsp" />
</div>
  <jsp:include page="../common/script.jsp" />
</body>
</html>