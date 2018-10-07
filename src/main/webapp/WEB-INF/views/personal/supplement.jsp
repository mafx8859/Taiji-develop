<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%--
  Created by IntelliJ IDEA.
  User: Bryan
  Date: 2017/10/15
  Time: 15:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
  <head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>修改个人信息</title>

  <!-- ========== Css Files ========== -->
    <jsp:include page="../common/link.jsp" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/js/bootstrap-datepicker/dist/css/bootstrap-datepicker.min.css">

  </head>
  <body>
    <jsp:include page="../common/header.jsp" />
    <jsp:include page="../common/sidebar.jsp" />
<!-- START CONTENT -->
<div class="content">

  <div class="page-header">
    <h1 class="title">会员管理</h1>
      <ol class="breadcrumb">
        <li><a href="${pageContext.request.contextPath}/user/index">首页</a></li>
        <li class="active">修改个人信息</li>
      </ol>

  </div>

 <!-- //////////////////////////////////////////////////////////////////////////// --> 
<!-- START CONTAINER -->
<div class="container-default">

  <div class="box box-warning">
            <p class="color10 none">信息不完整，请完整填写所需信息</p>

            <!-- 照片信息 -->
          <div class="box-header with-border text-center">
              <h3 class="box-title">照片信息</h3>
          </div>
          <p class="text-center">备注：<span class="color10">*</span>项为必填选项，选填项目请根据自身情况填写，可提高完整性.</p>
          <div class="box-body">
              <div class="form-group clearfix">
                  <div class="col-sm-12 text-center">
                      <c:choose>
                          <c:when test="${member.photo != null}">
                              <img src="${pageContext.request.contextPath}/resources/upload/member/${member.photo}" id="portrait" alt="暂无照片">
                          </c:when>
                          <c:when test="${member.photo == null}">
                              <img src="${pageContext.request.contextPath}/resources/img/default.png" id="portrait" alt="暂无照片">
                          </c:when>
                      </c:choose>
                  </div>
              </div>
          </div>
          <div class="box-footer text-center">
              <a class="btn btn-success" href="${pageContext.request.contextPath}/user/photo/${member.id}">完善照片信息</a>
          </div>
      <form class="form-horizontal clearfix" action="${pageContext.request.contextPath}/user/update" method="post">
          <input type="hidden" name="id" value="${member.id}">
          <input type="hidden" name="photo" value="${member.photo}">
          <input type="hidden" name="isAdmin" value="${member.isAdmin}">
          <!-- 登录信息 -->
          <div class="box-header with-border text-center">
              <h3 class="box-title">用户登录信息</h3>
          </div>
          <div class="box-body">
              <div class="form-group clearfix">
                  <label class="col-sm-2 control-label">
                      <span class="color10">*</span>
                      用户名（登录）：
                  </label>
                  <div class="col-sm-2">
                      <input type="text" class="form-control" name="username" readonly="readonly" value="${member.username}">
                  </div>

                  <label class="col-sm-1 control-label">
                      <span class="color10">*</span>
                      新密码：
                  </label>
                  <div class="col-sm-2">
                      <input type="password" class="form-control require-text psw" placeholder="请输入..." name="password" value="${member.password}">
                  </div>

                  <label class="col-sm-1 control-label">
                      <span class="color10">*</span>
                      重复密码：
                  </label>
                  <div class="col-sm-2">
                      <input type="password" class="form-control require-text psw2" placeholder="请输入..." value="${member.password}">
                  </div>
              </div>
              <p class="psw-tip color10 none text-center">两次密码不一致请重新输入</p>
          </div>
          <!-- 基本信息 -->
          <div class="box-header with-border text-center">
              <h3 class="box-title">基本信息</h3>
          </div>
          <div class="box-body">
              <div class="form-group clearfix">
                  <label class="col-sm-3 control-label">
                      <span class="color10">*</span>
                      姓名：
                  </label>
                  <div class="col-sm-2">
                      <input type="text" class="form-control" name="name" value="${member.name}">
                  </div>

                  <label class="col-sm-1 control-label">
                      <span class="color10">*</span>
                      身份证号：
                  </label>
                  <div class="col-sm-3">
                      <input type="text" class="form-control" name="idNumber" value="${member.idNumber}">
                  </div>
              </div>

              <div class="form-group clearfix">
                  <label class="col-sm-3 control-label">
                      <span class="color10">*</span>
                      性别：
                  </label>
                  <div class="col-sm-2">
                      <select class="form-control require-option" name="sex">
                          <option value="-1">请选择...</option>
                          <option value="1" <c:if test="${member.sex eq '1'}">selected</c:if>>男</option>
                          <option value="2" <c:if test="${member.sex eq '2'}">selected</c:if>>女</option>
                      </select>
                  </div>

                  <label class="col-sm-1 control-label">
                      <span class="color10">*</span>
                      出生日期：
                  </label>
                  <div class="date col-sm-3">
                    <input type="text" class="form-control pull-right datepicker" name="birth" value="${member.birth}">
                  </div>
              </div>

              <div class="form-group clearfix">
                  <label class="col-sm-3 control-label">
                      <span class="color10">*</span>
                      地区：
                  </label>
                  <div class="col-sm-2">
                      <select class="form-control require-option city" name="area">
                          <option value="-1" selected="selected">请选择</option>
                          <option value="${(fn:split(member.area, ','))[0]}">${(fn:split(member.area, ','))[0]}</option>
                      </select>
                  </div>

                  <label class="col-sm-1 control-label">
                      <span class="color10">*</span>
                      区县：
                  </label>
                  <div class="col-sm-3" name="area">
                      <select class="form-control require-option area" name="area">
                          <option value="-1" selected="selected">请选择</option>
                          <option value="${(fn:split(member.area, ','))[1]}">${(fn:split(member.area, ','))[1]}</option>
                      </select>
                  </div>
              </div>
              <div class="form-group clearfix">
                  <label class="col-sm-2 control-label">
                      <span class="color10">*</span>
                      会员单位：
                      <!-- 原单位-->
                      <input type="hidden" name="originOrg" value="${member.organization}">
                  </label>
                  <div class="col-sm-2">
                      <select class="form-control" name="organization">
                          <option value="">请选择</option>
                          <c:forEach items="${list}" var="organization">
                              <option value="${organization.id}" <c:if test="${member.organization eq organization.name}">selected</c:if>>${organization.name}</option>
                          </c:forEach>
                          <option value="-2" <c:if test="${member.organization eq '-2'}">selected</c:if>>暂无</option>
                      </select>
                  </div>
                  <label class="col-sm-1 control-label">
                    政治面貌：
                  </label>
                  <div class="col-sm-2">
                    <select class="form-control company-option" name="political">
                        <option value="-1">请选择</option>
                      <option value="1" <c:if test="${member.political eq '1'}">selected</c:if>>中共党员</option>
                      <option value="2" <c:if test="${member.political eq '2'}">selected</c:if>>共青团员</option>
                      <option value="3" <c:if test="${member.political eq '3'}">selected</c:if>>群众</option>
                      <option value="3" <c:if test="${member.political eq '4'}">selected</c:if>>民主党派</option>
                    </select>
                  </div>
                  <label class="col-sm-1 control-label">
                    学历：
                  </label>
                  <div class="col-sm-2">
                    <select class="form-control company-option" name="qualification">
                      <option value="-1">请选择</option>
                      <option value="1" <c:if test="${member.qualification eq '1'}">selected</c:if>>博士研究生</option>
                      <option value="2" <c:if test="${member.qualification eq '2'}">selected</c:if>>硕士研究生</option>
                      <option value="3" <c:if test="${member.qualification eq '3'}">selected</c:if>>本科</option>
                      <option value="4" <c:if test="${member.qualification eq '4'}">selected</c:if>>专科（高职，高专，高技）</option>
                      <option value="5" <c:if test="${member.qualification eq '5'}">selected</c:if>>高中</option>
                      <option value="6" <c:if test="${member.qualification eq '6'}">selected</c:if>>初中</option>
                      <option value="7" <c:if test="${member.qualification eq '7'}">selected</c:if>>小学</option>
                    </select>
                  </div>
              </div>
              <div class="form-group clearfix">
                  <label class="col-sm-2 control-label">
                    工作单位：
                  </label>
                  <div class="col-sm-2">
                    <input type="text" class="form-control" placeholder="请输入..." name="company" value="${member.company}">
                  </div>
                  <label class="col-sm-1 control-label">
                    职务：
                  </label>
                  <div class="col-sm-2">
                    <input type="text" class="form-control" placeholder="请输入..." name="duty" value="${member.duty}">
                  </div>
                  <label class="col-sm-1 control-label">
                    职称：
                  </label>
                  <div class="col-sm-2">
                    <input type="text" class="form-control" placeholder="请输入..." name="jobTitle" value="${member.jobTitle}">
                  </div>
              </div>

              <div class="form-group clearfix">
                  <label class="col-sm-2 control-label">
                    <span class="color10">*</span>
                    联系电话：
                  </label>
                  <div class="col-sm-2">
                    <input type="text" class="form-control require-text" placeholder="请输入..." name="telephone" value="${member.telephone}">
                  </div>
                  <label class="col-sm-1 control-label">
                    联系QQ：
                  </label>
                  <div class="col-sm-2">
                    <input type="text" class="form-control" placeholder="请输入..." name="qq" value="${member.qq}">
                  </div>
                  <label class="col-sm-1 control-label">
                    邮箱：
                  </label>
                  <div class="col-sm-2">
                    <input type="text" class="form-control" placeholder="请输入..." name="email" value="${member.email}">
                  </div>
              </div>
          </div>
          <!-- 专业信息 -->
          <div class="box-header with-border text-center">
            <h3 class="box-title">其他信息</h3>
          </div>
          <div class="box-body">
                <div class="form-group clearfix">
                    <label class="col-sm-2 control-label">裁判员资格：</label>
                    <div class="col-sm-2">
                      <select class="form-control" name="isJudge">
                          <c:forEach items="${judgeList}" var="judge">
                              <option value="${judge.judgeId}" <c:if test="${member.isJudge eq judge.judgeId}">selected</c:if>>${judge.name}</option>
                          </c:forEach>
                      </select>
                    </div>

                    <label class="col-sm-1 control-label">证书编号：</label>
                    <div class="col-sm-2">
                      <input type="text" class="form-control" placeholder="请输入..." name="judgeNumber" value="${member.judgeNumber}">
                    </div>

                    <label class="col-sm-1 control-label">获批日期：</label>
                      <div class="input-group date col-sm-2">
                        <div class="input-group-addon">
                          <i class="fa fa-calendar"></i>
                        </div>
                        <input type="text" class="form-control pull-right datepicker" name="judgeDate" value="${member.judgeDate}">
                      </div>
                </div>

                <div class="form-group clearfix">
                    <label class="col-sm-2 control-label">教练员资格：</label>
                    <div class="col-sm-2">
                      <select class="form-control" name="isCoach">
                          <c:forEach items="${coachList}" var="couch">
                              <option value="${couch.couchId}" <c:if test="${member.isCoach eq couch.couchId}">selected</c:if>>${couch.name}</option>
                          </c:forEach>
                      </select>
                    </div>

                    <label class="col-sm-1 control-label">证书编号：</label>
                    <div class="col-sm-2">
                      <input type="text" class="form-control" placeholder="请输入..." name="coachNumber" value="${member.coachNumber}">
                    </div>

                    <label class="col-sm-1 control-label">获批日期：</label>
                      <div class="input-group date col-sm-2">
                        <div class="input-group-addon">
                          <i class="fa fa-calendar"></i>
                        </div>
                        <input type="text" class="form-control pull-right datepicker" name="coachDate" value="${member.coachDate}">
                      </div>
                </div>

                <div class="form-group clearfix">
                    <label class="col-sm-2 control-label">社会体育指导员资格：</label>
                    <div class="col-sm-2">
                      <select class="form-control" name="isInstructor">
                          <c:forEach items="${instructorList}" var="instructor">
                              <option value="${instructor.instructorId}" <c:if test="${member.isInstructor eq instructor.instructorId}">selected</c:if>>${instructor.name}</option>
                          </c:forEach>
                      </select>
                    </div>

                    <label class="col-sm-1 control-label">证书编号：</label>
                    <div class="col-sm-2">
                      <input type="text" class="form-control" placeholder="请输入..." name="instructorNumber" value="${member.instructorNumber}">
                    </div>

                    <label class="col-sm-1 control-label">获批日期：</label>
                      <div class="input-group date col-sm-2">
                        <div class="input-group-addon">
                          <i class="fa fa-calendar"></i>
                        </div>
                        <input type="text" class="form-control pull-right datepicker" name="instructorDate" value="${member.instructorDate}">
                      </div>
                </div>
                
                <div class="form-group clearfix">
                    <label class="col-sm-2 control-label">段位等级：</label>
                    <div class="col-sm-2">
                      <select class="form-control" name="grade">
                          <c:forEach items="${gradeList}" var="grade">
                              <option value="${grade.gradeId}" <c:if test="${member.grade eq grade.gradeId}">selected</c:if>>${grade.name}</option>
                          </c:forEach>
                      </select>
                    </div>
                    
                    <!-- <label class="col-sm-1 control-label">晋段项目：</label>
                    <div class="col-sm-2">
                      <select class="form-control" name="item">
                        <option>请选择...</option>
                        <option value="">杨氏太极拳</option>
                        <option value="">陈氏太极拳</option>
                        <option value="">吴氏太极拳</option>
                      </select>
                    </div> -->

                    <label class="col-sm-1 control-label">段位编号：</label>
                    <div class="col-sm-2">
                      <input type="text" class="form-control" placeholder="请输入..." name="gradeNum" value="${member.gradeNum}">
                    </div>

                    <label class="col-sm-1 control-label">获批日期：</label>
                      <div class="input-group date col-sm-2">
                        <div class="input-group-addon">
                          <i class="fa fa-calendar"></i>
                        </div>
                        <input type="text" class="form-control pull-right datepicker" name="gradeDate" value="${member.gradeDate}">
                      </div>
                </div>

                <div class="form-group clearfix">
                    <label class="col-sm-3 control-label">习练太极拳经历：</label>
                    <div class="col-sm-6">
                      <textarea id="editor1" name="experience" rows="10" cols="80">
                        ${member.experience}
                      </textarea>
                    </div>
                </div>

                <div class="form-group clearfix">
                    <label class="col-sm-3 control-label">参与本协会活动情况：</label>
                    <div class="col-sm-6">
                      <textarea id="editor2" name="activity" rows="10" cols="80">
                          ${member.activity}
                      </textarea>
                    </div>
                </div>
          </div>
          <!-- 单位 -->
          <%--<div class="box-header with-border text-center">--%>
              <%--<h3 class="box-title">单位会员信息</h3>--%>
          <%--</div>--%>
          <%--<div class="box-body">--%>
              <%--<div class="form-group clearfix">--%>
                  <%--<label class="col-sm-3 control-label">会员级别：</label>--%>
                  <%--<div class="col-sm-2">--%>
                      <%--<select class="form-control" name="level">--%>
                          <%--<option>一级会员</option>--%>
                      <%--</select>--%>
                  <%--</div>--%>

                  <%--<label class="col-sm-2 control-label">主管部门：</label>--%>
                  <%--<div class="col-sm-2">--%>
                      <%--<input type="text" class="form-control" placeholder="请输入..." name="">--%>
                  <%--</div>--%>
              <%--</div>--%>

              <%--<div class="form-group clearfix">--%>
                  <%--<label class="col-sm-3 control-label">个人业绩：</label>--%>
                  <%--<div class="col-sm-6">--%>
                  <%--<textarea id="editor3" name="performance" rows="10" cols="80">--%>
                    <%--${member.performance}--%>
                  <%--</textarea>--%>
                  <%--</div>--%>
              <%--</div>--%>
          <%--</div>--%>

          <div class="box-footer text-center">
              <input type="submit" class="btn btn-success J-submit" value="确认修改">
          </div>
      </form>
  </div>



</div>
<!-- END CONTAINER -->
    <jsp:include page="../common/footer.jsp" />


</div>

  <jsp:include page="../common/script.jsp" />
<!-- ================================================
Bootstrap Date Range Picker
================================================ -->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/bootstrap-datepicker/dist/js/bootstrap-datepicker.js"></script>
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
<!-- 验证模块 -->
<script src="${pageContext.request.contextPath}/resources/js/pages/common/verify.js"></script>
<!-- 省市联动 -->
<script src="${pageContext.request.contextPath}/resources/js/pages/common/city_linkage.js"></script>
<script type="text/javascript">
  //Date picker
    $('.datepicker').datepicker({
      autoclose: true
    });
    // summernote
    $('#editor1').summernote({
       lang: 'zh-CN',
    });
    $('#editor2').summernote({
       lang: 'zh-CN',
    });
    $('#editor3').summernote({
       lang: 'zh-CN',
    });
</script>


</body>
</html>