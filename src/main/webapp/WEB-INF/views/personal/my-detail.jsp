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
  <title>个人信息详情</title>

    <jsp:include page="../common/link.jsp" />

  </head>
  <body>
   <jsp:include page="../common/header.jsp" />
   <jsp:include page="../common/sidebar.jsp" />
<!-- START CONTENT -->
<div class="content">

  <!-- Start Page Header -->
  <div class="page-header">
    <h1 class="title">我的信息</h1>
      <ol class="breadcrumb">
        <li><a href="${pageContext.request.contextPath}/user/index">首页</a></li>
        <li><a href="#">我的信息</a></li>
        <li class="active">个人详情</li>
      </ol>

  </div>
  <!-- End Page Header -->



<!-- START CONTAINER -->
<div class=" container-widget">


  <div class="row">
    <div class="col-md-12">
      <div class="box box-solid">
        <div class="box-header with-border">
          <h3 class="box-title">个人信息：</h3>
        </div>
        <!-- /.box-body -->
        <div class="box-body">
          <dl class="dl-horizontal">
            <dt>照片：</dt>
            <dd>
              <c:choose>
                <c:when test="${member.photo != null}">
                  <img src="${pageContext.request.contextPath}/resources/upload/member/${member.photo}" alt="暂无照片" style="width: 120px;height: 155px; border: 1px solid #000;">
                </c:when>
                <c:when test="${member.photo == null}">
                  <img src="${pageContext.request.contextPath}/resources/img/default.png" alt="暂无照片" style="width: 120px;height: 155px;border: 1px solid #000;">
                </c:when>
              </c:choose>
            </dd>
            <dt>姓名：</dt>
            <dd>${member.name}</dd>
            <dt>身份证号：</dt>
            <dd>${member.idNumber}</dd>
            <dt>性别：</dt>
            <dd><c:choose>
              <c:when test="${member.sex eq '1'}">男</c:when>
              <c:when test="${member.sex eq '2'}">女</c:when>
            </c:choose></dd>
            <dt>年龄：</dt>
            <dd>${member.age}</dd>
            <dt>出生日期：</dt>
            <dd>${member.birth}</dd>
            <dt>地区、县区：</dt>
            <dd>${member.area}</dd>
            <dt>会员单位：</dt>
            <dd>${member.organization}</dd>
            <dt>政治面貌：</dt>
            <dd>
              <c:choose>
                <c:when test="${member.political eq 1}">中共党员</c:when>
                <c:when test="${member.political eq 2}">共青团员</c:when>
                <c:when test="${member.political eq 3}">群众</c:when>
                <c:when test="${member.political eq 4}">民主党派</c:when>
              </c:choose>
            </dd>
            <dt>学历：</dt>
            <dd><c:choose>
              <c:when test="${member.qualification eq 1}">博士研究生</c:when>
              <c:when test="${member.qualification eq 2}">硕士研究生</c:when>
              <c:when test="${member.qualification eq 3}">本科</c:when>
              <c:when test="${member.qualification eq 4}">专科（高职，高专，高技）</c:when>
              <c:when test="${member.qualification eq 5}">高中</c:when>
              <c:when test="${member.qualification eq 6}">初中</c:when>
              <c:when test="${member.qualification eq 7}">小学</c:when>
            </c:choose></dd>
            <dt>工作单位：</dt>
            <dd>${member.company}</dd>
            <dt>职务：</dt>
            <dd>${member.duty}</dd>
            <dt>职称：</dt>
            <dd>${member.jobTitle}</dd>
            <dt>联系电话：</dt>
            <dd>${member.telephone}</dd>
            <dt>联系QQ：</dt>
            <dd>${member.qq}</dd>
            <dt>邮箱：</dt>
            <dd>${member.email}</dd>
            <dt>裁判员资格：</dt>
            <dd>
              <c:forEach items="${judgeList}" var="judge">
                <c:if test="${member.isJudge eq judge.judgeId}">${judge.name}</c:if>
              </c:forEach>
            </dd>
            <dt>证书编号：</dt>
            <dd>${member.judgeNumber}</dd>
            <dt>获批日期：</dt>
            <dd>${member.judgeDate}</dd>
            <dt>教练员资格：</dt>
            <dd>
              <c:forEach items="${coachList}" var="coach">
                <c:if test="${member.isCoach eq coach.couchId}">${coach.name}</c:if>
              </c:forEach>
            </dd>
            <dt>证书编号：</dt>
            <dd>${member.coachNumber}</dd>
            <dt>获批日期：</dt>
            <dd>${member.coachDate}</dd>
            <dt>社会体育指导员资格：</dt>
            <dd>
              <c:forEach items="${instructorList}" var="instructor">
                <c:if test="${member.isInstructor eq instructor.instructorId}">${instructor.name}</c:if>
              </c:forEach>
            </dd>
            <dt>证书编号：</dt>
            <dd>${member.instructorNumber}</dd>
            <dt>获批日期：</dt>
            <dd>${member.instructorDate}</dd>
            <dt>段位等级：</dt>
            <dd>
              <c:forEach items="${gradeList}" var="grade">
                <c:if test="${member.grade eq grade.gradeId}">${grade.name}</c:if>
              </c:forEach>
            </dd>
            <dt>段位编号：</dt>
            <dd>${member.gradeNum}</dd>
            <dt>获批日期：</dt>
            <dd>${member.gradeDate}</dd>
            <%--<dt>会员级别：</dt>--%>
            <%--<dd>${member.level}</dd>--%>
            <dt>习太极拳经历：</dt>
            <dd>${member.experience}</dd>
            <dt>参与本协会活动记录：</dt>
            <dd>${member.activity}</dd>
          </dl>
        </div>
      </div>
      <!-- /.box -->
    </div>
  </div>
</div>
<!-- END CONTAINER -->


    <jsp:include page="../common/footer.jsp" />


</div>
<!-- End Content -->

    <jsp:include page="../common/script.jsp" />

</body>
</html>