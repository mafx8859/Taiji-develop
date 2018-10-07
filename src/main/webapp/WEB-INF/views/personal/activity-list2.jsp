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
  <title>已报名活动列表</title>

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
        <li><a href="#">我的活动</a></li>
        <li class="active">已报名活动</li>
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
          已报名活动列表
        </div>
        <div class="panel-body table-responsive">

            <table id="example" class="table display table-bordered">
              <thead>
              <tr>
                  <th>序号</th>
                  <th>活动名称</th>
                  <th>活动时间</th>
                  <th>身份证复印件</th>
                  <th>保险</th>
                  <th>健康证明</th>
                  <th>责任书</th>
                  <th>是否需要餐饮</th>
                  <th>是否需要住宿</th>
                  <th>费用/人</th>
                  <th>报名审核状态</th>
                  <th>活动时间状态</th>
                  <th>操作</th>
              </tr>
              </thead>
              <tbody>
              <c:forEach items="${list}" varStatus="status" var="activity">
                  <tr>
                      <td>${status.count}</td>
                      <td>${activity.name}</td>
                      <td>${activity.time}</td>
                      <td>
                          不需要，
                          需要
                      </td>
                      <td>
                          <c:choose>
                              <c:when test="${activity.insurance eq 0 or activity.insurance eq '' or activity.insurance == null}">不需要</c:when>
                              <c:when test="${activity.insurance eq 1}">需要</c:when>
                          </c:choose>
                      </td>
                      <td>
                          <c:choose>
                              <c:when test="${activity.health eq 0 or activity.health eq '' or activity.health == null}">不需要</c:when>
                              <c:when test="${activity.health eq 1}">需要</c:when>
                          </c:choose>
                      </td>
                      <td>
                          <c:choose>
                              <c:when test="${activity.liability eq 0 or activity.liability eq '' or activity.liability == null}">不需要</c:when>
                              <c:when test="${activity.liability eq 1}">需要</c:when>
                          </c:choose>
                      </td>
                      <td>
                          <c:choose>
                              <c:when test="${activity.meal eq 0 or activity.meal eq '' or activity.meal == null}">不需要</c:when>
                              <c:when test="${activity.meal eq 1}">需要</c:when>
                          </c:choose>
                      </td>
                      <td>
                          <c:choose>
                              <c:when test="${activity.hotel eq 0 or activity.hotel eq '' or activity.hotel == null}">无</c:when>
                              <c:when test="${activity.hotel eq 1}">有</c:when>
                          </c:choose>
                      </td>
                      <td>${activity.budget}</td>
                      <td>
                          <c:choose>
                              <c:when test="${activity.applicationStatus eq 0 or activity.applicationStatus eq '' or activity.applicationStatus == null}">未审核</c:when>
                              <c:when test="${activity.applicationStatus eq 1}">审核通过</c:when>
                              <c:when test="${activity.applicationStatus eq 2}">审核不通过</c:when>
                          </c:choose>
                      </td>
                      <td>
                          <c:choose>
                              <c:when test="${activity.isFinish == 1}">未开始</c:when>
                              <c:when test="${activity.isFinish == 0}">进行中</c:when>
                              <c:when test="${activity.isFinish == -1}">已结束</c:when>
                          </c:choose>
                      </td>
                      <td>
                          <a href="${pageContext.request.contextPath}/activity/detail/${activity.activityId}" class="btn btn-default">查看活动详情</a>
                          <c:choose>
                              <c:when test="${activity.applicationStatus eq '2'}">
                                  <a href="javascript:;" class="btn btn-success" onclick="alert('报名审核未通过，请联系管理员！')">查看证书</a>
                              </c:when>
                              <c:when test="${!(activity.applicationStatus eq '2')}">
                                  <c:choose>
                                      <c:when test="${(activity.isFinish != -1)}">
                                          <a href="javascript:;" class="btn btn-success" onclick="alert('此活动尚未结束，无法打印证书！')">查看证书</a>
                                      </c:when>
                                      <c:when test="${(activity.isFinish == -1)}">
                                          <c:if test="${activity.whoCertificate eq 'self'}">
                                              <a href="${pageContext.request.contextPath}/personal/certificate/${activity.applicationId}" class="btn btn-success">查看证书</a>
                                          </c:if>
                                          <c:if test="${activity.whoCertificate == null or activity.whoCertificate eq 'admin' or activity.whoCertificate eq ''}">
                                              <a href="javascript:;" class="btn btn-success" onclick="alert('此活动证书暂无打印权限，请联系系统管理员打印！')">查看证书</a>
                                          </c:if>
                                          <%--<c:if test="${(activity.permit == null or activity.permit eq '')}">
                                              <a href="javascript:;" class="btn btn-success" onclick="alert('此活动暂无证书，请等待管理员上传证书！')">查看证书</a>
                                          </c:if>--%>
                                      </c:when>
                                  </c:choose>
                              </c:when>
                          </c:choose>
                          <c:choose>
                              <c:when test="${activity.applicationStatus eq '2'}">
                                  <a href="javascript:;" class="btn btn-primary" onclick="alert('报名审核未通过，请联系管理员！')">查看入场证</a>
                              </c:when>
                              <c:when test="${!(activity.applicationStatus eq '2')}">
                                  <c:choose>
                                      <c:when test="${activity.whoPermit eq 'self'}">
                                          <a href="${pageContext.request.contextPath}/personal/permit/${activity.applicationId}" class="btn btn-primary">查看入场证</a>
                                      </c:when>
                                      <c:when test="${!(activity.whoPermit eq 'self')}">
                                          <a href="javascript:;" onclick="alert('此活动入场证暂无打印权限，请联系系统管理员打印！')" class="btn btn-primary">查看入场证</a>
                                      </c:when>
                                  </c:choose>
                              </c:when>
                          </c:choose>
                          <a href="${pageContext.request.contextPath}/application/sign/out/${activity.applicationId}" class="btn btn-danger" onclick="if(confirm('确定要取消报名吗？')==false)return false;">取消报名</a>
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
</div>
<!-- END CONTAINER -->

    <jsp:include page="../common/footer.jsp" />

</div>
<!-- End Content -->

<jsp:include page="../common/script.jsp" />

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