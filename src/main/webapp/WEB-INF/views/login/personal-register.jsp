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
  <title>个人会员注册</title>

    <jsp:include page="../common/link.jsp" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/js/bootstrap-datepicker/dist/css/bootstrap-datepicker.min.css">
  <style>
    .content1{
      padding: 20px 0 20px 0;
      background: #f5f5f5;
    }
    .content1 .form-group{
      margin: 20px 0;
    }
    .footer{
      border-top: 1px solid #000; 
      background: #f5f5f5;
      margin: 0;
    }
  </style>
  </head>
  <body class="clearfix" style="background: #fff;">
  <div class="loading"><img src="${pageContext.request.contextPath}/resources/img/loading.gif" alt="loading-img"></div>
 <div id="top" class="clearfix">

   <!-- Start App Logo -->
   <div class="applogo">
     <a href="javascript:;" class="logo">吉林省太极拳协会</a>
   </div>
 </div>
 <!-- END TOP -->

<!-- START CONTAINER -->
<div class="container-default">


  <section class="content1">
      <div class="box box-warning">
        <form class="form-horizontal clearfix" action="${pageContext.request.contextPath}/user/register" method="post" enctype="multipart/form-data">
            <input type="hidden" name="isAdmin" value="3" />
          <div class="box-header with-border text-center">
            <h3 class="box-title">用户登录信息</h3>
          </div>
          <div class="box-body">
            <p class="text-center">备注：<span class="color10">*</span>项为必填选项，选填项目请根据自身情况填写，可提高完整性.</p>
            <div class="form-group clearfix">
                <label class="col-sm-2 control-label">
                  <span class="color10">*</span>
                    用户名（登录）：
                </label>
                <div class="col-sm-2">
                  <input type="text" class="form-control require-text username" placeholder="请输入..." name="username">
                </div>

                <label class="col-sm-1 control-label">
                  <span class="color10">*</span>
                  密码：
                </label>
                <div class="col-sm-2">
                  <input type="password" class="form-control require-text psw" placeholder="请输入..." name="password">
                </div>

                <label class="col-sm-1 control-label">
                  <span class="color10">*</span>
                  重复密码：
                </label>
                <div class="col-sm-2">
                  <input type="password" class="form-control require-text psw2" placeholder="请输入...">
                </div>
            </div>
            <p class="username-tip color10 none text-center">此账号已存在请重新输入</p>
            <p class="psw-tip color10 none text-center">两次密码不一致请重新输入</p>
          </div>
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
                      <input type="text" class="form-control require-text" placeholder="请输入..." name="name">
                    </div>

                    <label class="col-sm-1 control-label">
                      <span class="color10">*</span>
                      身份证号：
                    </label>
                    <div class="col-sm-3">
                      <input type="text" id="userID" class="form-control require-text" placeholder="请输入..." name="idNumber">
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
                      <option value="1">男</option>
                      <option value="2">女</option>
                    </select>
                  </div>

                  <label class="col-sm-2 control-label">
                      <span class="color10">*</span>
                  出生日期：
                  </label>
                    <div class="date col-sm-2">
                      <input type="text" class="form-control pull-right datepicker require-text" name="birth">
                    </div>
                </div>

                <div class="form-group clearfix">
                  <label class="col-sm-3 control-label">
                      <span class="color10">*</span>
                  地区：
                  </label>
                  <div class="col-sm-2">
                    <select class="form-control city require-option" name="area">
                      <option value="-1">请选择...</option>
                    </select>
                  </div>

                  <label class="col-sm-2 control-label">
                      <span class="color10">*</span>
                  县区：
                  </label>
                  <div class="col-sm-2">
                    <select class="form-control area require-option" name="area">
                      <option value="-1">请选择...</option>
                    </select>
                  </div>
                </div>

                <div class="form-group clearfix">
                    <label class="col-sm-2 control-label">
                      <span class="color10">*</span>
                      会员单位：
                    </label>
                    <div class="col-sm-2">
                      <select class="form-control company-option require-option" name="organization">
                        <option value="-1">请选择...</option>
                        <c:forEach items="${list}" var="organization" varStatus="status">
                            <option value="${organization.id}">${organization.name}</option>
                        </c:forEach>
                        <option value="-2">暂无</option>
                      </select>
                    </div>
                    <label class="col-sm-1 control-label">
                      政治面貌：
                    </label>
                    <div class="col-sm-2">
                      <select class="form-control" name="political">
                        <option value="-1">请选择</option>
                        <option value="1">中共党员</option>
                        <option value="2">共青团员</option>
                        <option value="3">群众</option>
                        <option value="4">民主党派</option>
                      </select>
                    </div>
                    <label class="col-sm-1 control-label">
                      学历：
                    </label>
                    <div class="col-sm-2">
                      <select class="form-control" name="qualification">
                        <option value="-1">请选择</option>
                        <option value="1">博士研究生</option>
                        <option value="2">硕士研究生</option>
                        <option value="3">本科</option>
                        <option value="4">专科（高职，高专，高技）</option>
                        <option value="5">高中</option>
                        <option value="6">初中</option>
                        <option value="7">小学</option>
                      </select>
                    </div>
                </div>

                <div class="form-group clearfix">
                    <label class="col-sm-2 control-label">
                      工作单位：
                    </label>
                    <div class="col-sm-2">
                      <input type="text" class="form-control" placeholder="请输入..." name="company">
                    </div>
                    <label class="col-sm-1 control-label">
                      职务：
                    </label>
                    <div class="col-sm-2">
                      <input type="text" class="form-control" placeholder="请输入..." name="duty">
                    </div>
                    <label class="col-sm-1 control-label">
                      职称：
                    </label>
                    <div class="col-sm-2">
                      <input type="text" class="form-control" placeholder="请输入..." name="jobTitle">
                    </div>
                </div>
                
                <div class="form-group clearfix">
                    <label class="col-sm-2 control-label">
                      <span class="color10">*</span>
                      联系电话：
                    </label>
                    <div class="col-sm-2">
                      <input type="text" class="form-control require-text" placeholder="请输入..." name="telephone">
                    </div>
                    <label class="col-sm-1 control-label">
                      联系QQ：
                    </label>
                    <div class="col-sm-2">
                      <input type="text" class="form-control" placeholder="请输入..." name="qq">
                    </div>
                    <label class="col-sm-1 control-label">
                      邮箱：
                    </label>
                    <div class="col-sm-2">
                      <input type="text" class="form-control" placeholder="请输入..." name="email">
                    </div>
                </div>
          </div>
          <div class="box-header with-border text-center">
            <h3 class="box-title">其他信息</h3>
          </div>
          <div class="box-body">
                <div class="form-group clearfix">
                    <label class="col-sm-2 control-label">裁判员资格：</label>
                    <div class="col-sm-2">
                      <select class="form-control" name="isJudge">
                          <c:forEach items="${judgeList}" var="judge">
                              <option value="${judge.judgeId}">${judge.name}</option>
                          </c:forEach>
                      </select>
                    </div>

                    <label class="col-sm-1 control-label">证书编号：</label>
                    <div class="col-sm-2">
                      <input type="text" class="form-control" placeholder="请输入..." name="judgeNumber">
                    </div>

                    <label class="col-sm-1 control-label">获批日期：</label>
                      <div class="input-group date col-sm-2">
                        <div class="input-group-addon">
                          <i class="fa fa-calendar"></i>
                        </div>
                        <input type="text" class="form-control pull-right datepicker" name="judgeDate">
                      </div>
                </div>

                <div class="form-group clearfix">
                    <label class="col-sm-2 control-label">教练员资格：</label>
                    <div class="col-sm-2">
                      <select class="form-control" name="isCoach">
                          <c:forEach items="${coachList}" var="coach">
                              <option value="${coach.couchId}">${coach.name}</option>
                          </c:forEach>
                      </select>
                    </div>

                    <label class="col-sm-1 control-label">证书编号：</label>
                    <div class="col-sm-2">
                      <input type="text" class="form-control" placeholder="请输入..." name="coachNumber">
                    </div>

                    <label class="col-sm-1 control-label">获批日期：</label>
                      <div class="input-group date col-sm-2">
                        <div class="input-group-addon">
                          <i class="fa fa-calendar"></i>
                        </div>
                        <input type="text" class="form-control pull-right datepicker" name="coachDate">
                      </div>
                </div>

                <div class="form-group clearfix">
                    <label class="col-sm-2 control-label">社会体育指导员资格：</label>
                    <div class="col-sm-2">
                      <select class="form-control" name="isInstructor">
                          <c:forEach items="${instructorList}" var="instructor">
                              <option value="${instructor.instructorId}">${instructor.name}</option>
                          </c:forEach>
                      </select>
                    </div>

                    <label class="col-sm-1 control-label">证书编号：</label>
                    <div class="col-sm-2">
                      <input type="text" class="form-control" placeholder="请输入..." name="instructorNumber">
                    </div>

                    <label class="col-sm-1 control-label">获批日期：</label>
                      <div class="input-group date col-sm-2">
                        <div class="input-group-addon">
                          <i class="fa fa-calendar"></i>
                        </div>
                        <input type="text" class="form-control pull-right datepicker" name="instructorDate">
                      </div>
                </div>
                
                <div class="form-group clearfix">
                    <label class="col-sm-2 control-label">段位等级：</label>
                    <div class="col-sm-2">
                      <select class="form-control" name="grade">
                          <c:forEach items="${gradeList}" var="grade">
                              <option value="${grade.gradeId}">${grade.name}</option>
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
                      <input type="text" class="form-control" placeholder="请输入..." name="gradeNum">
                    </div>

                    <label class="col-sm-1 control-label">获批日期：</label>
                      <div class="input-group date col-sm-2">
                        <div class="input-group-addon">
                          <i class="fa fa-calendar"></i>
                        </div>
                        <input type="text" class="form-control pull-right datepicker" name="gradeDate">
                      </div>
                </div>

                <div class="form-group clearfix">
                    <label class="col-sm-3 control-label">习练太极拳经历：</label>
                    <div class="col-sm-6">
                      <textarea id="editor1" name="experience" rows="10" cols="80">

                      </textarea>
                    </div>
                </div>

                <div class="form-group clearfix">
                    <label class="col-sm-3 control-label">参与本协会活动情况：</label>
                    <div class="col-sm-6">
                      <textarea id="editor2" name="activity" rows="10" cols="80">
  
                      </textarea>
                    </div>
                </div>
          </div>
            <!-- 单位 -->
          <div class="company none">
            <div class="box-header with-border text-center">
              <h3 class="box-title">单位会员信息</h3>
            </div>
            <div class="box-body">
                  <div class="form-group clearfix">

                    <label class="col-sm-3 control-label">会员级别：</label>
                    <div class="col-sm-2">
                      <select class="form-control" name="level">
                        <option>一级会员</option>
                      </select>
                    </div>

                    <label class="col-sm-1 control-label">主管部门</label>
                    <div class="col-sm-2">
                      <input type="text" class="form-control" placeholder="请输入..." name="">
                    </div>
                  </div>

                  <div class="form-group clearfix">
                      <label class="col-sm-3 control-label">个人业绩：</label>
                      <div class="col-sm-6">
                        <textarea id="editor3" name="performance" rows="10" cols="80">
  
                        </textarea>
                      </div>
                  </div>
                  
                  <!-- <div class="form-group clearfix">
                      <label class="col-sm-3 control-label">会费缴纳记录：</label>
                      <div class="col-sm-6">
                        <textarea id="editor4" name="dues" rows="10" cols="80">
                          请在此输入...
                        </textarea>
                      </div>
                  </div> -->

                   
            </div>
          </div>
          <div class="box-footer text-center">
            <p class="color10 none">信息不完整，请完整填写所需信息</p>
            <a href="${pageContext.request.contextPath}/user/login" class="btn btn-success"> 已有账号,现在就去登录！</a>
            <input type="submit" id="thesubmit" class="btn btn-default J-submit" value="提交申请">
          </div>
        </form>
      </div>
  </section>



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
<script src="${pageContext.request.contextPath}/resources/js/pages/login/personal-register.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/Idcard.js"></script>
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
    $('#editor4').summernote({
       lang: 'zh-CN',
    });
</script>
</body>
</html>