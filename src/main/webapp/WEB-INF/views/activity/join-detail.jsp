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
  <title>活动统一报名</title>

    <jsp:include page="../common/link.jsp" />

  </head>
  <body>
    <jsp:include page="../common/header.jsp" /> 
    <jsp:include page="../common/sidebar.jsp" /> 
<!-- START CONTENT -->
<div class="content">

  <!-- Start Page Header -->
  <div class="page-header">
    <h1 class="title">活动统一报名</h1>
      <ol class="breadcrumb">
        <li><a href="${pageContext.request.contextPath}/user/index">首页</a></li>
        <li class="active">活动报名列表</li>
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
          活动报名列表
        </div>
        <div class="panel-body table-responsive">

            <table id="example" class="table display table-bordered">
                <thead>
                    <tr>
                      <th>序号</th>
                      <th>活动名称</th>
                      <th>姓名</th>
                      <th>性别</th>
                      <th>年龄</th>
                      <th>身份证复印件</th>
                      <th>保险</th>
                      <th>健康证明</th>
                      <th>责任书</th>
                      <th>订餐</th>
                      <th>住宿</th>
                      <th>报名状态</th>
                      <th>审核状态</th>
                      <th>操作</th>
                    </tr>
                </thead>
                <tbody>
                <c:forEach items="${memberList}" varStatus="status" var="member">
                    <tr data-id="${member.memberId}">
                        <td>${status.count}</td>
                        <td>${activity.name}</td>
                        <td>${member.memberName}</td>
                        <td>${member.sex}</td>
                        <td>${member.age}</td>
                        <td class="insurance-text">
                            <c:if test="${activity.needIdCard eq 1}">需要</c:if>
                            <c:if test="${activity.needIdCard eq 0}">不需要</c:if>
                        </td>
                        <td class="insurance-text">
                            <c:if test="${activity.needInsurance eq 1}">需要</c:if>
                            <c:if test="${activity.needInsurance eq 0}">不需要</c:if>
                        </td>
                        <td class="health-text">
                            <c:if test="${activity.needHealth eq 1}">需要</c:if>
                            <c:if test="${activity.needHealth eq 0}">不需要</c:if>
                        </td>
                        <td class="liability-text">
                            <c:if test="${activity.needSafe eq 1}">需要</c:if>
                            <c:if test="${activity.needSafe eq 0}">不需要</c:if>
                        </td>
                        <td class="catering-text">
                            <c:if test="${member.meal == null or member.meal == 0 or member.meal eq ''}">不需要</c:if>
                            <c:if test="${member.meal != 0 and member.meal != '' and member.meal != null}">需要</c:if>
                        </td>
                        <td class="accommodation-text">
                            <c:if test="${member.hotel == null or member.hotel == 0 or member.hotel eq ''}">不需要</c:if>
                            <c:if test="${member.hotel != 0 and member.hotel != '' and member.hotel != null}">需要</c:if>
                        </td>
                        <td class="apply-text">
                            <c:if test="${member.applicationId == null or member.applicationId == 0}">未报名</c:if>
                            <c:if test="${member.applicationId != 0}">已报名</c:if>
                        </td>
                        <td class="status-text">
                            <c:if test="${member.applicationStatus == null or member.applicationStatus == 0 or member.applicationStatus eq ''}">审核通过</c:if>
                            <c:if test="${member.applicationStatus ==1}">审核通过</c:if>
                            <c:if test="${member.applicationStatus ==2}">审核不通过</c:if>
                        </td>
                        <td>
                            <c:if test="${member.applicationId == null or member.applicationId == 0}">
                                <button type="button" class="btn btn-success update" data-toggle="modal" data-target="#join-one" data-num="${member.memberId}"  data-activity="${activity.id}">报名</button>
                                <button type="button" class="btn btn-danger repulse" data-num="${member.applicationId}" data-id="${member.memberId}" disabled="disabled">未报名</button>
                            </c:if>
                            <c:if test="${member.applicationId != 0}">
                                <button type="button" class="btn btn-success update" data-toggle="modal" data-target="#join-one" data-num="${member.memberId}"  data-activity="${activity.id}" disabled="disabled">已报名</button>
                                <button type="button" class="btn btn-danger repulse" data-num="${member.applicationId}" data-id="${member.memberId}">取消报名</button>
                            </c:if>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>


        </div>

      </div>
    </div>
  </div>
  <a href="${pageContext.request.contextPath}/organization/activity/list" class="btn btn-default">返回活动统一报名列表</a>
  <button type="button" class="btn btn-success" data-toggle="modal" data-target="#join-all">全体报名</button>

</div>
    <jsp:include page="../common/footer.jsp" />

<div class="modal fade" id="join-all">
  <div class="modal-dialog">
    <form class="modal-content" action="${pageContext.request.contextPath}/application/sign/all" method="post">
        <c:forEach items="${memberList}" var="member" varStatus="status">
            <c:if test="${member.applicationId == 0 or member.applicationId == null}">
                <label>
                    <input type="hidden" name="memberIds[${status.count - 1}]" value="${member.memberId}" checked="checked">
                </label>
            </c:if>
        </c:forEach>
        <input type="hidden" name="activityId" value="${activity.id}">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">全体报名：</h4>
      </div>
      <div class="modal-body">
                  <div class="form-group clearfix">
                      <label class="col-sm-6 text-right">是否需提交身份证复印件：</label>
                      <div class="col-sm-6">
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
                      <label class="col-sm-6 text-right">是否需提交提交健康证明：</label>
                      <div class="col-sm-6">
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
                      <label class="col-sm-6 text-right">是否需提交提交保险证明：</label>
                      <div class="col-sm-6">
                          <p>
                              <c:if test="${activity.needInsurance eq 1}">
                                  需要
                              </c:if>
                              <c:if test="${activity.needInsurance eq 0}">
                                  不需要
                              </c:if>
                          </p>
                      </div>
                  </div>

                  <div class="form-group clearfix">
                      <label class="col-sm-6 text-right">是否需签订安全责任书：</label>
                      <div class="col-sm-6">
                          <p>
                              <c:if test="${activity.needSafe eq 1}">
                                  需要
                              </c:if>
                              <c:if test="${activity.needSafe eq 0}">
                                  不需要
                              </c:if>
                          </p>
                      </div>
                  </div>

                  <div class="form-group clearfix">
                    <label class="col-sm-6 text-right">需要承办方提供餐饮：</label>
                    <div class="radio radio-inline">
                        <input type="radio" name="meal" value="1" checked="checked" id="7">
                      <label for="7">需要</label>
                    </div>
                    <div class="radio radio-inline">
                        <input type="radio" name="meal" value="0" id="8">
                      <label for="8">不需要</label>
                    </div>
                  </div>
                  <div class="form-group clearfix">
                    <label class="col-sm-6 text-right">需要承办方提供餐饮：</label>
                    <div class="radio radio-inline">
                        <input type="radio" name="hotel" value="1" checked="checked" id="9">
                      <label for="9">需要</label>
                    </div>
                    <div class="radio radio-inline">
                        <input type="radio" name="hotel" value="0" id="10">
                      <label for="10">不需要</label>
                    </div>
                </div>
        <p class="color10 tip"></p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary pull-left" data-dismiss="modal">关闭</button>
        <button type="submit" class="btn btn-default">报名</button>
      </div>
    </form>
    <!-- /.modal-content -->
  </div>
  <!-- /.modal-dialog -->
</div>
<div class="modal fade" id="join-one">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">报名活动：</h4>
      </div>
      <div class="modal-body">
        <input type="hidden" id="dataId">
        <input type="hidden" id="acitivityId">
          <div class="form-group clearfix">
              <label class="col-sm-6 text-right">是否需提交身份证复印件：</label>
              <div class="col-sm-6">
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
              <label class="col-sm-6 text-right">是否需提交提交健康证明：</label>
              <div class="col-sm-6">
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
              <label class="col-sm-6 text-right">是否需提交提交保险证明：</label>
              <div class="col-sm-6">
                  <p>
                      <c:if test="${activity.needInsurance eq 1}">
                          需要
                      </c:if>
                      <c:if test="${activity.needInsurance eq 0}">
                          不需要
                      </c:if>
                  </p>
              </div>
          </div>

          <div class="form-group clearfix">
              <label class="col-sm-6 text-right">是否需签订安全责任书：</label>
              <div class="col-sm-6">
                  <p>
                      <c:if test="${activity.needSafe eq 1}">
                          需要
                      </c:if>
                      <c:if test="${activity.needSafe eq 0}">
                          不需要
                      </c:if>
                  </p>
              </div>
          </div>

                <div class="form-group clearfix">
                    <label class="col-sm-6 text-right">需要承办方提供餐饮：</label>
                    <div class="radio radio-inline">
                        <input type="radio" name="meal-one" value="1" checked="checked" id="17">
                      <label for="17">需要</label>
                    </div>
                    <div class="radio radio-inline">
                        <input type="radio" name="meal" value="0" id="18">
                      <label for="18">不需要</label>
                    </div>
                </div>
                <div class="form-group clearfix">
                    <label class="col-sm-6 text-right">需要承办方提供餐饮：</label>
                    <div class="radio radio-inline">
                        <input type="radio" name="hotel-one" value="1" checked="checked" id="19">
                      <label for="19">需要</label>
                    </div>
                    <div class="radio radio-inline">
                        <input type="radio" name="hotel" value="0" id="20">
                      <label for="20">不需要</label>
                    </div>
                </div>
        <p class="color10 tip"></p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary pull-left" data-dismiss="modal">关闭</button>
        <button type="button" class="btn btn-default J-ajax-submit">报名</button>
      </div>
    </div>
    <!-- /.modal-content -->
  </div>
  <!-- /.modal-dialog -->
</div>



</div>
<!-- End Content -->

    <jsp:include page="../common/script.jsp" />

  <script src="${pageContext.request.contextPath}/resources/js/pages/common/verify.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/pages/activity/join-detail.js"></script>


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
} );
</script>
</body>
</html>