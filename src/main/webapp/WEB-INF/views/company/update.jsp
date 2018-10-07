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
  <title>修改单位信息</title>
    <jsp:include page="../common/link.jsp" />

  </head>
  <body>
    <jsp:include page="../common/header.jsp" />
    <jsp:include page="../common/sidebar.jsp" />
<!-- START CONTENT -->
<div class="content">

  <!-- Start Page Header -->
  <div class="page-header">
    <h1 class="title">单位管理</h1>
      <ol class="breadcrumb">
        <li><a href="${pageContext.request.contextPath}/user/index">首页</a></li>
        <li><a href="#">单位管理</a></li>
        <li class="active">修改单位</li>
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
        <div class="panel-body table-responsive">
              <form class="form-horizontal clearfix" action="${pageContext.request.contextPath}/organization/update" method="post">
                  <input type="hidden" name="id" value="${organization.id}">
                  <input type="hidden" name="status" value="${organization.status}">
                <div class="box-header with-border">
                  <h3 class="box-title">修改单位信息</h3>
                </div>
                <div class="box-body">
                      <div class="form-group clearfix">
                        <label class="col-sm-3 control-label">
                            <span class="color10">*</span>
                            单位名称：
                        </label>
                        <div class="col-sm-5">
                          <input type="text" class="form-control require-text" placeholder="请输入..." name="name" value="${organization.name}">
                        </div>
                      </div>

                      <div class="form-group clearfix">
                        <label class="col-sm-3 control-label">
                            <span class="color10">*</span>
                            单位地址：
                        </label>
                        <div class="col-sm-5">
                          <input type="text" class="form-control require-text" placeholder="请输入..." name="address" value="${organization.address}">
                        </div>
                      </div>

                      <div class="form-group clearfix">
                        <label class="col-sm-3 control-label">主管部门：</label>
                        <div class="col-sm-5">
                          <input type="text" class="form-control" placeholder="请输入..." name="department" value="${organization.department}">
                        </div>
                      </div>

                      <div class="form-group clearfix">
                        <label class="col-sm-3 control-label">单位QQ群：</label>
                        <div class="col-sm-5">
                          <input type="text" class="form-control" placeholder="请输入..." name="qqGroup" value="${organization.qqGroup}">
                        </div>
                      </div>

                      <div class="form-group clearfix">
                          <label class="col-sm-3 control-label">
                              <span class="color10">*</span>
                              负责人1：
                          </label>
                          <div class="col-sm-2">
                            <input type="text" class="form-control require-text" placeholder="请输入..." name="principal1" value="${organization.principal1}">
                          </div>
                          <label class="col-sm-1 control-label">
                              <span class="color10">*</span>
                              职务：
                          </label>
                          <div class="col-sm-2">
                            <input type="text" class="form-control require-text" placeholder="请输入..." name="job1" value="${organization.job1}">
                          </div>
                      </div>
                      <div class="form-group clearfix">
                        <label class="col-sm-3 control-label">职称：</label>
                        <div class="col-sm-2">
                          <input type="text" class="form-control" placeholder="请输入..." name="title1" value="${organization.title1}">
                        </div>
                        <label class="col-sm-1 control-label">
                              <span class="color10">*</span>
                              联系方式：
                          </label>
                          <div class="col-sm-2">
                              <input type="text" class="form-control require-text" placeholder="请输入..." name="tel1" value="${organization.tel1}">
                          </div>
                      </div>
                      <div class="form-group clearfix">
                        <label class="col-sm-3 control-label">
                            <span class="color10">*</span>
                            负责人2：
                        </label>
                        <div class="col-sm-2">
                          <input type="text" class="form-control require-text" placeholder="请输入..." name="principal2" value="${organization.principal2}">
                        </div>
                        <label class="col-sm-1 control-label">
                            <span class="color10">*</span>
                            职务：
                        </label>
                        <div class="col-sm-2">
                          <input type="text" class="form-control require-text" placeholder="请输入..." name="job2" value="${organization.job2}">
                        </div>
                      </div>
                      <div class="form-group clearfix">
                          <label class="col-sm-3 control-label">职称：</label>
                          <div class="col-sm-2">
                            <input type="text" class="form-control" placeholder="请输入..." name="title2" value="${organization.title2}">
                          </div>
                          
                          <label class="col-sm-1 control-label">
                              <span class="color10">*</span>
                              联系方式：
                          </label>
                          <div class="col-sm-2">
                              <input type="text" class="form-control require-text" placeholder="请输入..." name="tel2" value="${organization.title2}">
                          </div>
                      </div>
                      <div class="form-group clearfix">
                        <label class="col-sm-3 control-label">单位管理员：</label>
                        <div class="col-sm-2">
                          <select class="form-control" name="admin">
                            <option value="-1">请选择...</option>
                              <c:forEach items="${list}" var="member" >
                                  <option value="${member.id}" <c:if test="${organization.admin eq member.id.toString()}">selected</c:if>>${member.name}</option>
                              </c:forEach>
                          </select>
                        </div>
                      </div>
                      <div class="form-group clearfix">
                          <label class="col-sm-3 control-label">会员级别：</label>
                          <div class="col-sm-2">
                              <select class="form-control" name="">
                                  <option value="">一级会员</option>
                                  <option value="">二级会员</option>
                              </select>
                          </div>
                      </div>
                      
                      <div class="form-group clearfix">
                          <label class="col-sm-3 control-label">经营范围及主要业绩：</label>
                          <div class="col-sm-6">
                            <textarea id="editor1" name="performance" rows="10" cols="80">
                              ${organization.performance}
                            </textarea>
                          </div>
                      </div>
                      
                      <div class="form-group clearfix">
                          <label class="col-sm-3 control-label">参与本协会活动情况：：</label>
                          <div class="col-sm-6">
                            <textarea id="editor2" name="dues" rows="10" cols="80">
                              ${organization.dues}
                            </textarea>
                          </div>
                      </div>

                </div>
                <div class="box-footer text-center">
                  <p class="color10 tip none">信息不完整，请完整填写所需信息</p>
                  <a href="${pageContext.request.contextPath}/organization/list" class="btn btn-default">暂不修改,返回单位列表</a>
                  <input type="submit" class="btn btn-success J-submit" value="提交信息">
                </div>
              </form>
        </div>

      </div>
    </div>
    <!-- End Panel -->
  </div>
  <!-- End Row -->
  


</div>
    <jsp:include page="../common/footer.jsp" />
</div>
    <jsp:include page="../common/script.jsp" />

<!-- ================================================
Bootstrap Date Range Picker
================================================ -->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/bootstrap-daterangepicker/daterangepicker.js"></script>
<!-- ================================================
Summernote
================================================ -->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/summernote/summernote.min.js"></script>
<!-- ================================================
zh-CN
================================================ -->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/summernote/zh-CN.js"></script>
<!-- ===========================
  基本函数
=============================== -->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/pages/common/verify.js"></script>


  <script type="text/javascript">
      function init() {
        $('#editor1').summernote({
           lang: 'zh-CN',
        });
        $('#editor2').summernote({
           lang: 'zh-CN',
        });
      };
      $(document).ready(function() {
          init();
      });
  </script>
</body>
</html>