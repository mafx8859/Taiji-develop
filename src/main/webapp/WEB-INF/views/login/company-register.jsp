<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
  <head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>单位会员注册</title>

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
        <form class="form-horizontal clearfix" action="${pageContext.request.contextPath}/organization/register" method="post">
            <input type="hidden" name="isAdmin" value="2" />
           <!-- 登录信息 -->
          <!-- 单位注册 -->
          <div class="box-header with-border text-center">
            <h3 class="box-title">会员单位信息</h3>
          </div>
          <div class="box-body">
              <p class="text-center">备注：<span class="color10">*</span>项为必填选项，选填项目请根据自身情况填写，可提高完整性.</p>
                <div class="form-group clearfix">
                  <label class="col-sm-3 control-label">
                      <span class="color10">*</span>
                      单位名称：
                  </label>
                  <div class="col-sm-6">
                    <input type="text" class="form-control require-text" placeholder="请输入..." name="name">
                  </div>
                </div>

                <div class="form-group clearfix">
                  <label class="col-sm-3 control-label">
                      <span class="color10">*</span>
                      单位地址：
                  </label>
                  <div class="col-sm-6">
                    <input type="text" class="form-control require-text" placeholder="请输入..." name="address">
                  </div>
                </div>

                <div class="form-group clearfix">
                    <label class="col-sm-3 control-label">主管部门：</label>
                    <div class="col-sm-6">
                        <input type="text" class="form-control" placeholder="请输入..." name="department">
                    </div>
                </div>
                
                <div class="form-group clearfix">
                  <label class="col-sm-3 control-label">单位QQ群：</label>
                  <div class="col-sm-6">
                    <input type="text" class="form-control" placeholder="请输入..." name="qqGroup">
                  </div>
                </div>

                 <div class="form-group clearfix">
                    <label class="col-sm-4 control-label">
                        <span class="color10">*</span>
                        负责人1：
                    </label>
                    <div class="col-sm-4">
                      <input type="text" class="form-control require-text" placeholder="请输入..." name="principal1">
                    </div>
                </div>
                <div class="form-group clearfix">
                  <label class="col-sm-4 control-label">
                      <span class="color10">*</span>
                      职务：
                  </label>
                    <div class="col-sm-4">
                      <input type="text" class="form-control require-text" placeholder="请输入..." name="job1">
                    </div>
                </div>
                <div class="form-group clearfix">
                  <label class="col-sm-4 control-label">职称：</label>
                  <div class="col-sm-4">
                    <input type="text" class="form-control" placeholder="请输入..." name="title1">
                  </div>
                </div>
                <div class="form-group clearfix">
                  <label class="col-sm-4 control-label">
                      <span class="color10">*</span>
                      联系方式：
                  </label>
                  <div class="col-sm-4">
                    <input type="text" class="form-control require-text" placeholder="请输入..." name="tel1">
                  </div>
                </div>
                <div class="form-group clearfix">
                    <label class="col-sm-4 control-label">
                        <span class="color10">*</span>
                        负责人2：
                    </label>
                    <div class="col-sm-4">
                      <input type="text" class="form-control require-text" placeholder="请输入..." name="principal2">
                    </div>
                </div>
                <div class="form-group clearfix">
                  <label class="col-sm-4 control-label">
                      <span class="color10">*</span>
                      职务：
                  </label>
                  <div class="col-sm-4">
                    <input type="text" class="form-control require-text" placeholder="请输入..." name="job2">
                  </div>
                </div>
                <div class="form-group clearfix">
                  <label class="col-sm-4 control-label">职称：</label>
                  <div class="col-sm-4">
                    <input type="text" class="form-control" placeholder="请输入..." name="title2">
                  </div>
                </div>
                <div class="form-group clearfix">
                  <label class="col-sm-4 control-label">
                      <span class="color10">*</span>
                      联系方式：
                  </label>
                  <div class="col-sm-4">
                    <input type="text" class="form-control require-text" placeholder="请输入..." name="tel2">
                  </div>
                </div>
                <div class="form-group clearfix">
                    <label class="col-sm-3 control-label">经营范围及主要业绩：</label>
                    <div class="col-sm-6">
                      <textarea id="editor1" name="performance" rows="10" cols="80">
                        请在此输入...
                      </textarea>
                    </div>
                </div>
                
                <div class="form-group clearfix">
                    <label class="col-sm-3 control-label">参与本协会活动情况：</label>
                    <div class="col-sm-6">
                      <textarea id="editor2" name="dues" rows="10" cols="80">
                        请在此输入...
                      </textarea>
                    </div>
                </div>
          </div>

          <div class="box-footer text-center">
            <p class="text-red none">信息不完整，请完整填写所需信息</p>
            <a href="${pageContext.request.contextPath}/user/login" class="btn btn-success"> 暂不申请！</a>
            <input type="submit" class="btn btn-default J-submit" value="提交申请">
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
</script>
</body>
</html>