<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 卓音
  Date: 2017/9/27
  Time: 17:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="loading"><img src="${pageContext.request.contextPath}/resources/img/loading.gif" alt="loading-img"></div>
<!-- End Page Loading -->

 <!-- START TOP -->
 <div id="top" class="clearfix">

   <!-- Start App Logo -->
   <div class="applogo">
     <a href="${pageContext.request.contextPath}/user/index" class="logo">吉林省太极拳协会</a>
   </div>
   <!-- End App Logo -->

   <!-- Start Sidebar Show Hide Button -->
   <a href="#" class="sidebar-open-button"><i class="fa fa-bars"></i></a>
   <a href="#" class="sidebar-open-button-mobile"><i class="fa fa-bars"></i></a>
   <!-- End Sidebar Show Hide Button -->

   <!-- Start Top Right -->
   <ul class="top-right">

   <li class="dropdown link">
     <a href="#" data-toggle="dropdown" class="dropdown-toggle profilebox"><b>您好，
       <c:choose>
         <c:when test="${sessionScope.role eq 'super'}">超级管理员</c:when>
         <c:when test="${sessionScope.role eq 'admin'}">系统管理员</c:when>
         <c:when test="${sessionScope.role eq 'organization'}">单位管理员</c:when>
         <c:when test="${sessionScope.role eq 'person'}">${sessionScope.user.name}</c:when>
       </c:choose>
     </b></a>
   </li>

   <li class="dropdown link">
     <a href="${pageContext.request.contextPath}/user/logout" class="hdbutton">退出登录</a>
   </li>

   </ul>
   <!-- End Top Right -->

 </div>
 <!-- END TOP -->