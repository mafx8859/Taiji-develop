<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 
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
  <title>账号管理</title>

    <jsp:include page="../common/link.jsp" />

  </head>
  <body>
    <jsp:include page="../common/header.jsp" />
    <jsp:include page="../common/sidebar.jsp" />

<!-- START CONTENT -->
<div class="content">

  <!-- Start Page Header -->
  <div class="page-header">
    <h1 class="title">账号管理</h1>
      <ol class="breadcrumb">
        <li><a href="${pageContext.request.contextPath}/user/index">首页</a></li>
        <li class="active">账号管理</li>
      </ol>

  </div>
  <!-- End Page Header -->

<!-- START CONTAINER -->
<div class=" container-widget">


  <!-- Start Row -->
  <div class="row">
      <div class="col-md-12">
        <div class="panel">

          <div class="panel-title">
            账号查询条件
          </div>

          <div class="panel-body">
            <form role="form" action="${pageContext.request.contextPath}/user/list" method="post">

              <div class="form-group clearfix">
                  <div class="col-md-3">
                    <label>所属单位：</label>
                      <label>
                          <select class="form-control" name="organization">
                              <option value="0">请选择</option>
                              <c:forEach items="${organizationList}" var="item">
                                  <option value="${item.id}" <c:if test="${organization eq item.id}">selected</c:if>>${item.name}</option>
                              </c:forEach>
                          </select>
                      </label>
                  </div>
                  <div class="col-md-3">
                    <label>会员类型：</label>
                    <label>
                        <select class="form-control isAdmin" name="isAdmin">
                            <option value="0">请选择</option>
                            <c:if test="${sessionScope.role eq 'super'}">
                                <option value="1" <c:if test="${isAdmin eq 1}">selected</c:if>>系统管理员</option>
                            </c:if>
                            <option value="2" <c:if test="${isAdmin eq 2}">selected</c:if>>单位管理员</option>
                            <option value="3" <c:if test="${isAdmin eq 3}">selected</c:if>>普通会员</option>
                        </select>
                    </label>
                  </div>
                  <div class="col-md-3">
                    <label>审核状态：</label>
                    <label>
                        <select class="form-control filter-status" name="status">
                            <option value="-1" <c:if test="${status eq -1}">selected</c:if>>请选择</option>
                            <option value="0" <c:if test="${status eq 0}">selected</c:if>>审核通过</option>
                            <option value="2" <c:if test="${status eq 2}">selected</c:if>>审核不通过</option>
                        </select>
                    </label>
                  </div>
              </div>
              <div class="form-group clearfix">
                  <div class="col-sm-3">
                    <label>性别：</label>
                    <label>
                      <select class="form-control sex"  name="sex">
                          <option value="-1">请选择</option>
                          <option value="1" <c:if test="${sex eq 1}">selected</c:if>>男</option>
                          <option value="2" <c:if test="${sex eq 2}">selected</c:if>>女</option>
                      </select>
                    </label>
                  </div>
                  <div class="col-sm-6">
                    <label>年龄：</label>
                      <input type="text" class="J_begin_age" value="${age1}">
                      <input type="hidden" name="age1" value="${age1}" class="begin-age">
                       至 
                      <input type="text" class="J_end_age" value="${age2}">
                      <input type="hidden" name="age2" value="${age2}" class="end-age">
                  </div>
              </div>
              <div class="form-group clearfix">
                <div class="col-md-3">
                  <label>裁判员资格：</label>
                  <label>
                    <select class="form-control isJudge" name="isJudge">
                        <option value="-1" <c:if test="${isJudge eq -1}">selected</c:if>>请选择</option>
                        <c:forEach items="${judgeList}" var="judge">
                            <option value="${judge.judgeId}" <c:if test="${isJudge eq judge.judgeId}">selected</c:if>>${judge.name}</option>
                        </c:forEach>
                    </select>
                  </label>
                </div>
                <div class="col-md-3">
                  <label>教练员资格：</label>
                  <label>
                    <select class="form-control isCoach" name="isCoach">
                        <option value="-1" <c:if test="${isCoach eq -1}">selected</c:if>>请选择</option>
                        <c:forEach items="${coachList}" var="coach" >
                            <option value="${coach.couchId}" <c:if test="${isCoach eq coach.couchId}">selected</c:if>>${coach.name}</option>
                        </c:forEach>
                    </select>
                  </label>
                </div>
                <div class="col-md-3">
                  <label>社会体育指导员资格：</label>
                  <label>
                    <select class="form-control isInstructor" name="isInstructor">
                        <option value="-1" <c:if test="${isInstructor eq -1}">selected</c:if>>请选择</option>
                        <c:forEach items="${instructorList}" var="instructor">
                            <option value="${instructor.instructorId}" <c:if test="${isInstructor eq instructor.instructorId}">selected</c:if>>${instructor.name}</option>
                        </c:forEach>
                    </select>
                  </label>
                </div>
                <div class="col-md-3">
                  <label>段位等级：</label>
                  <label>
                    <select class="form-control grade" name="grade">
                        <option value="-1" <c:if test="${grade eq -1}">selected</c:if>>请选择</option>
                        <c:forEach items="${gradeList}" var="item">
                            <option value="${item.gradeId}" <c:if test="${grade eq item.gradeId}">selected</c:if>>${item.name}</option>
                        </c:forEach>
                    </select>
                  </label>
                </div>
              </div>
              <div class="box-footer">
                  <input type="submit" class="btn btn-default" value="查询">
              </div>
            </form>
          </div>

        </div>
      </div>
    <!-- Start Panel -->
    <div class="col-md-12">
      <div class="panel panel-default">
        <div class="panel-title">
          账号管理列表
        </div>
        <div class="panel-body table-responsive">

            <table id="example" class="table display table-bordered">
                <thead>
                    <tr>
                      <th>序号</th>
                      <th>用户名</th>
                      <th>真实姓名</th>
                      <th>性别</th>
                      <th>年龄</th>
                      <th>所属单位</th>
                      <th>会员类型</th>
                      <th>审核状态</th>
                      <th>操作</th>
                    </tr>
                </thead>
            
             
                <tbody>
                <c:forEach items="${list}" var="user" varStatus="status">
                    <tr data-id="${user.id}">
                        <td>${status.count}</td>
                        <td>${user.username}</td>
                        <td>${user.name}</td>
                        <td>${user.sex}</td>
                        <td>${user.age}</td>
                        <td>${user.organization}</td>
                        <td>
                            <c:choose>
                                <c:when test="${user.isAdmin eq '1'}">系统管理员</c:when>
                                <c:when test="${user.isAdmin eq '2'}">单位管理员</c:when>
                                <c:when test="${user.isAdmin eq '3'}">普通会员</c:when>
                            </c:choose>
                        </td>
                        <td class="status-text">
                            <c:choose>
                                <c:when test="${user.status eq 0 or user.status eq '' or user.status == null}">审核通过</c:when>
                                <c:when test="${user.status eq 1}">审核通过</c:when>
                                <c:when test="${user.status eq 2}">审核不通过</c:when>
                            </c:choose>
                        </td>
                        <td>
                            <c:if test="${!(user.isAdmin eq '1')}">
                                <!-- <button type="button" class="btn bg-green set" data-num="${user.id}">设置为单位管理员</button> -->
                                <a href="${pageContext.request.contextPath}/user/detail/${user.id}" class="btn btn-default">查看详情</a>
                                <button type="button" class="btn btn-success pass" data-num="${user.id}">审核通过</button>
                                <button type="button" class="btn btn-warning repulse" data-num="${user.id}">审核不通过</button>
                            </c:if>
                            <button type="button" class="btn btn-default update" data-toggle="modal" data-target="#modal-default" data-num="${user.id}">修改密码</button>
                            <button type="button" class="btn btn-danger delete" data-num="${user.id}">删除</button>
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
  <c:if test="${sessionScope.role eq 'super' or sessionScope.role eq 'admin'}">
      <a class="btn btn-success" href="${pageContext.request.contextPath}/user/admin/add">添加系统管理员</a>
  </c:if>
  <form action="${pageContext.request.contextPath}/export/member" method="post">
    <input type="hidden" name="status" value="${status}" class="export-status">
    <input type="hidden" name="organization" value="${organization}" class="export-organization">
    <input type="hidden" name="isAdmin" value="${isAdmin}" class="export-isAdmin">
    <input type="hidden" name="isJudge" value="${isJudge}" class="export-isJudge">
    <input type="hidden" name="isCoach" value="${isCoach}" class="export-isCoach">
    <input type="hidden" name="isInstructor" value="${isInstructor}" class="export-isInstructor">
    <input type="hidden" name="grade" value="${grade}" class="export-grade">
    <input type="submit" value="导出账号信息为Excel" class="btn btn-default">
  </form>
</div>
<!-- END CONTAINER -->
<div class="modal fade" id="modal-default">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">修改用户密码：</h4>
      </div>
      <div class="modal-body">
        <input type="hidden" id="dataId">
        <div class="form-group">
            <label>新密码：</label>
            <input type="password" class="form-control a-require-text password1" placeholder="请输入...">
        </div>
        <div class="form-group">
            <label>重复密码：</label>
            <input type="password" class="form-control a-require-text password2" placeholder="请输入...">
        </div>
        <p class="text-red tip"></p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary pull-left" data-dismiss="modal">关闭</button>
        <button type="button" class="btn btn-default J-ajax-submit">修改</button>
      </div>
    </div>
    <!-- /.modal-content -->
  </div>
  <!-- /.modal-dialog -->
</div>

    <jsp:include page="../common/footer.jsp" />


</div>
<!-- End Content -->

  <jsp:include page="../common/script.jsp" />
<script src="${pageContext.request.contextPath}/resources/js/pages/common/verify.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/pages/vip/account-list.js"></script>

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
    // 增添输入框效果
    if($('.J_begin_age').val() == -1){
        $('.J_begin_age').val('');
    }
    if($('.J_end_age').val() == -1){
        $('.J_end_age').val('');
    }
    $('.J_begin_age').change(function () {
        $('.begin-age').val($(this).val());
    })
    $('.J_end_age').change(function () {
        $('.end-age').val($(this).val());
    })
    $('input[type="search"]').val('');
});
</script>
</body>
</html>