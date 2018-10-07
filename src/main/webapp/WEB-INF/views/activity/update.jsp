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
  <title>修改活动</title>

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
        <li><a href="index.html">首页</a></li>
        <li><a href="#">活动管理</a></li>
        <li class="active">修改活动</li>
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
              <form class="form-horizontal clearfix" href="${pageContext.request.contextPath}/activity/new" method="post">
                  <div class="box-header with-border">
                      <h3 class="box-title">修改活动内容</h3>
                  </div>
                  <div class="box-body">
                      <div class="form-group clearfix">
                        <label class="col-sm-3 control-label">活动名称：</label>
                        <div class="col-sm-6">
                            <input type="text" name="name" value="${activity.name}" class="form-control require-text" placeholder="请输入...">
                        </div>
                    </div>

                    <div class="form-group clearfix">
                        <label class="col-sm-3 control-label">主办单位：</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control require-text" name="sponsor" value="${activity.sponsor}" placeholder="请输入...">
                        </div>
                    </div>

                    <div class="form-group clearfix">
                        <label class="col-sm-3 control-label">承办单位：</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control require-text" name="organization" value="${activity.organization}" placeholder="请输入...">
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-3 control-label">活动时间：</label>
                        <div class="col-sm-6">
                            <div class="input-group">
                                <div class="input-group-addon">
                                    <i class="fa fa-calendar"></i>
                                </div>
                                <input type="text" name="time" value="${activity.time}" class="form-control pull-right" id="reservation">
                            </div>
                        </div>
                    </div>

                    <div class="form-group clearfix">
                        <label class="col-sm-3 control-label">费用/人：</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control require-text" name="budget" value="${activity.budget}" placeholder="请输入...">
                        </div>
                    </div>
                    <div class="form-group clearfix">
                        <label class="col-sm-3 control-label">联系电话：</label>
                        <div class="col-sm-3">
                            <input type="text" class="form-control require-text" placeholder="请输入..." name="tel" value="${activity.tel}">
                        </div>
                        <label class="col-sm-1 control-label">联系QQ：</label>
                        <div class="col-sm-2">
                            <input type="text" class="form-control require-text" placeholder="请输入..." name="qq" value="${activity.qq}">
                        </div>
                    </div>
                      
                      <div class="form-group clearfix">
                          <div class="col-sm-6">
                              <label class="col-sm-6 control-label">是否提供订餐：</label>
                              <div class="radio radio-inline">
                                  <input type="radio" id="inlineRadio1" value="1" name="provideMeal" <c:if test="${activity.provideMeal eq 1}">checked = "checked"</c:if>>
                                  <label for="inlineRadio1"> 提供 </label>
                              </div>
                              <div class="radio radio-inline">
                                  <input type="radio" id="inlineRadio2" value="0" name="provideMeal" <c:if test="${activity.provideMeal eq 0}">checked = "checked"</c:if>>
                                  <label for="inlineRadio2"> 不提供 </label>
                              </div>
                          </div>
                          <div class="col-sm-6">
                              <label class="col-sm-3 control-label">是否提供住宿：</label>
                              <div class="radio radio-inline">
                                  <input type="radio" id="inlineRadio3" value="1" name="provideHotel" <c:if test="${activity.provideHotel eq 1}">checked = "checked"</c:if>>
                                  <label for="inlineRadio3"> 提供 </label>
                              </div>
                              <div class="radio radio-inline">
                                  <input type="radio" id="inlineRadio4" value="0" name="provideHotel" <c:if test="${activity.provideHotel eq 0}">checked = "checked"</c:if>>
                                  <label for="inlineRadio4"> 不提供 </label>
                              </div>
                          </div>
                      </div>

                      <div class="form-group clearfix">
                          <label class="col-sm-3 control-label">是否需提交身份证复印件：</label>
                          <div class="radio radio-inline">
                              <input type="radio" id="inlineRadio5" value="1" name="needIdCard" <c:if test="${activity.needIdCard eq 1}">checked = "checked"</c:if>>
                              <label for="inlineRadio5"> 需要</label>
                          </div>
                          <div class="radio radio-inline">
                              <input type="radio" id="inlineRadio6" value="0" name="needIdCard" <c:if test="${activity.needIdCard eq 0}">checked = "checked"</c:if>>
                              <label for="inlineRadio6"> 不需要</label>
                          </div>
                      </div>

                      <div class="form-group clearfix">
                          <label class="col-sm-3 control-label">是否需提交健康证明：</label>
                          <div class="radio radio-inline">
                              <input type="radio" id="inlineRadio7" value="1" name="needHealth" <c:if test="${activity.needHealth eq 1}">checked = "checked"</c:if>>
                              <label for="inlineRadio7"> 需要 </label>
                          </div>
                          <div class="radio radio-inline">
                              <input type="radio" id="inlineRadio8" value="0" name="needHealth" <c:if test="${activity.needHealth eq 0}">checked = "checked"</c:if>>
                              <label for="inlineRadio8"> 不需要 </label>
                          </div>
                      </div>

                      <div class="form-group clearfix">
                          <label class="col-sm-3 control-label">是否提交保险证明：</label>
                          <div class="radio radio-inline">
                              <input type="radio" id="inlineRadio9" value="1" name="needInsurance" <c:if test="${activity.needInsurance eq 1}">checked = "checked"</c:if>>
                              <label for="inlineRadio9"> 需要 </label>
                          </div>
                          <div class="radio radio-inline">
                              <input type="radio" id="inlineRadio10" value="0" name="needInsurance" <c:if test="${activity.needInsurance eq 0}">checked = "checked"</c:if>>
                              <label for="inlineRadio10"> 不需要 </label>
                          </div>
                      </div>

                      <div class="form-group clearfix">
                          <label class="col-sm-3 control-label">是否签订安全责任书：</label>
                          <div class="radio radio-inline">
                              <input type="radio" id="inlineRadio11" value="1" name="needSafe" <c:if test="${activity.needSafe eq 1}">checked = "checked"</c:if>>
                              <label for="inlineRadio11"> 需要 </label>
                          </div>
                          <div class="radio radio-inline">
                              <input type="radio" id="inlineRadio12" value="0" name="needSafe" <c:if test="${activity.needSafe eq 0}">checked = "checked"</c:if>>
                              <label for="inlineRadio12"> 不需要 </label>
                          </div>
                      </div>

                      <div class="form-group clearfix">
                          <label class="col-sm-3 control-label">活动具体内容：</label>
                          <div class="col-sm-6">
                            <textarea id="editor1" name="content" rows="10" cols="80">
                              ${activity.content}
                            </textarea>
                          </div>
                      </div>

                  </div>
                  <div class="box-footer text-center">
                      <p class="color10 tip none">信息不完整，请完整填写所需信息</p>
                      <a href="${pageContext.request.contextPath}/activity/list" class="btn btn-default">返回活动列表</a>
                      <input type="submit" class="btn btn-success J-submit" value="确认提交">
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
<jsp:include page="../common/script.jsp" />


<!-- ================================================
Bootstrap Date Range Picker
================================================ -->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/date-range-picker/daterangepicker.js"></script>

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
          //定义locale汉化插件
          var locale = {
              "format": 'YYYY-MM-DD',
              "separator": " 到 ",
              "applyLabel": "确定",
              "cancelLabel": "取消",
              "fromLabel": "起始时间",
              "toLabel": "结束时间'",
              "customRangeLabel": "自定义",
              "weekLabel": "W",
              "daysOfWeek": ["日", "一", "二", "三", "四", "五", "六"],
              "monthNames": ["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月"],
              "firstDay": 1
          };
          //初始化显示当前时间
          $('#reservation span').html(moment().subtract('hours', 1).format('YYYY-MM-DD') + ' - ' + moment().format('YYYY-MM-DD'));
          //日期控件初始化
          $('#reservation').daterangepicker(
              {
                  'locale': locale,
                  //汉化按钮部分
                  startDate: moment().subtract(29, 'days'),
                  endDate: moment()
              },
              function (start, end) {
                  $('#daterange-btn span').html(start.format('YYYY-MM-DD') + ' - ' + end.format('YYYY-MM-DD'));
              }
          );
      };
      $(document).ready(function() {
          init();
      });
  </script>
</body>
</html>