<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
  <head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>报名活动</title>

    <jsp:include page="../common/link.jsp" />

  </head>
  <body>
  <jsp:include page="../common/header.jsp" />
  <jsp:include page="../common/sidebar.jsp" />
<!-- START CONTENT -->
<div class="content">

  <!-- Start Page Header -->
  <div class="page-header">
    <h1 class="title">活动报名</h1>
      <ol class="breadcrumb">
        <li><a href="${pageContext.request.contextPath}/user/index">首页</a></li>
        <li><a href="#">我的活动</a></li>
        <li class="active">活动报名</li>
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
          <div class="box box-warning">
              <form class="form-horizontal clearfix" action="${pageContext.request.contextPath}/application/sign/in" method="post">
                  <input type="hidden" name="memberId" value="${sessionScope.user.id}">
                  <input type="hidden" name="activityId" value="${activity.id}">
                <div class="box-header with-border">
                  <h3 class="box-title">报名活动</h3>
                </div>
                <div class="box-body">
                      <div class="form-group clearfix">
                        <label class="col-sm-4 text-right">活动名称：</label>
                        <div class="col-sm-4">
                          <p>
                            ${activity.name}
                          </p>
                        </div>
                      </div>

                      <div class="form-group clearfix">
                        <label class="col-sm-4 text-right">活动简介：</label>
                        <div class="col-sm-4">
                          ${activity.content}
                        </div>
                      </div>

                      <div class="form-group clearfix">
                          <label class="col-sm-4 text-right">主办单位：</label>
                          <div class="col-sm-4">
                              <p>
                                  ${activity.organization}
                              </p>
                          </div>
                      </div>
                      <div class="form-group clearfix">
                        <label class="col-sm-4 text-right">承办单位：</label>
                        <div class="col-sm-4">
                          <p>
                            ${activity.organization}
                          </p>
                        </div>
                      </div>

                      <div class="form-group">
                        <label class="col-sm-4 text-right">活动时间：</label>
                        <div class="col-sm-4">
                          <p>
                            ${activity.time}
                          </p>
                        </div>
                      </div>
                    <div class="form-group clearfix">
                        <label class="col-sm-4 text-right">是否需提交身份证复印件：</label>
                        <div class="col-sm-4">
                            <p>
                                <c:if test="${activity.needIdCard eq '1'}">
                                    需要
                                </c:if>
                                <c:if test="${activity.needIdCard eq '0'}">
                                    不需要
                                </c:if>
                            </p>
                        </div>
                    </div>

                    <div class="form-group clearfix">
                        <label class="col-sm-4 text-right">是否需提交提交健康证明：</label>
                        <div class="col-sm-4">
                            <p>
                                <c:if test="${activity.needHealth eq '1'}">
                                    需要
                                </c:if>
                                <c:if test="${activity.needHealth eq '0'}">
                                    不需要
                                </c:if>
                            </p>
                        </div>
                    </div>

                    <div class="form-group clearfix">
                        <label class="col-sm-4 text-right">是否需提交提交保险证明：</label>
                        <div class="col-sm-4">
                            <p>
                                <c:if test="${activity.needInsurance eq '1'}">
                                    需要
                                </c:if>
                                <c:if test="${activity.needInsurance eq '0'}">
                                    不需要
                                </c:if>
                            </p>
                        </div>
                    </div>

                    <div class="form-group clearfix">
                        <label class="col-sm-4 text-right">是否需签订安全责任书：</label>
                        <div class="col-sm-4">
                            <p>
                                <c:if test="${activity.needSafe eq '1'}">
                                    需要
                                </c:if>
                                <c:if test="${activity.needSafe eq '0'}">
                                    不需要
                                </c:if>
                            </p>
                        </div>
                    </div>

                    <c:if test="${activity.provideMeal eq '1'}">
                        <div class="form-group clearfix">
                            <label class="col-sm-4 control-label">需要承办方提供餐饮：</label>
                            <div class="radio radio-inline">
                                <input type="radio" name="meal" value="1" checked="checked" id="7">
                                <label for="7">需要</label>
                            </div>
                            <div class="radio radio-inline">
                                <input type="radio" name="meal" value="0" id="8">
                                <label for="8">不需要</label>
                            </div>
                        </div>
                    </c:if>

                    <c:if test="${activity.provideHotel eq '1'}">
                        <div class="form-group clearfix">
                            <label class="col-sm-4 control-label">需要承办方提供住宿：</label>
                            <div class="radio radio-inline">
                                <input type="radio" name="hotel" value="1" checked="checked" id="9">
                                <label for="9">需要</label>
                            </div>
                            <div class="radio radio-inline">
                                <input type="radio" name="hotel" value="0" id="10">
                                <label for="10">不需要</label>
                            </div>
                        </div>
                    </c:if>

                      <p class="color10 tip"></p>

                </div>
                <div class="box-footer text-center">
                  <a href="${pageContext.request.contextPath}/personal/list" class="btn btn-default">返回活动列表</a>
                  <input type="submit" class="btn btn-success" value="参与报名">
                </div>
              </form>
          </div>
        </div>

      </div>
    </div>
    <!-- End Panel -->
  </div>
  <!-- End Row -->
  


</div>
<!-- END CONTAINER -->


    <jsp:include page="../common/footer.jsp" />


</div>
<!-- End Content -->

    <jsp:include page="../common/script.jsp" />


<!-- ================================================
Bootstrap Date Range Picker
================================================ -->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/bootstrap-daterangepicker/daterangepicker.js"></script>
<!-- ================================================
Summernote
================================================ -->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/summernote/summernote.min.js"></script>
<!-- ===========================
  基本函数
=============================== -->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/pages/common/verify.js"></script>
</body>
</html>