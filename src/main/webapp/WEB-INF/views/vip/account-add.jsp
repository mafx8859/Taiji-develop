<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
  <head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>添加系统管理员</title>

    <jsp:include page="../common/link.jsp" />

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
        <li><a href="#">会员管理</a></li>
        <li class="active">添加系统管理员</li>
      </ol>
  </div>

<!-- START CONTAINER -->
<div class="container-widget">

  <div class="col-md-12">
    <div class="panel panel-default">
      <div class="panel-title">
      </div>
      <div class="panel-body table-responsive">

          <form class="form-horizontal clearfix" action="${pageContext.request.contextPath}/user/register" method="post" enctype="multipart/form-data">
              <input type="hidden" name="isAdmin" value="1" />
            <div class="box-header with-border text-center">
              <h3 class="box-title">系统管理员登录信息</h3>
            </div>
            <div class="box-body">
              <div class="form-group clearfix">
                  <label class="col-sm-3 control-label">用户名（登录）：</label>
                  <div class="col-sm-3">
                    <input type="text" class="form-control require-text username" placeholder="请输入..." name="username">
                  </div>
                  <label class="col-sm-1 control-label">真实姓名：</label>
                  <div class="col-sm-3">
                    <input type="text" class="form-control require-text" placeholder="请输入..." name="name">
                  </div>
                  
              </div>
              <div class="form-group clearfix">
                <label class="col-sm-3 control-label">密码：</label>
                <div class="col-sm-3">
                  <input type="password" class="form-control require-text psw" placeholder="请输入..." name="password">
                </div>

                <label class="col-sm-1 control-label">重复密码：</label>
                <div class="col-sm-3">
                  <input type="password" class="form-control require-text psw2" placeholder="请输入...">
                </div>
              </div>

              <div class="form-group clearfix">
                <label class="col-sm-3 control-label">身份证：</label>
                <div class="col-sm-3">
                  <input type="text" class="form-control require-text" placeholder="请输入..." name="idNumber" id="userID">
                </div>
              </div>
              
              <p class="username-tip color10 none text-center">此账号已存在请重新输入</p>
              <p class="psw-tip color10 none text-center">两次密码不一致请重新输入</p>
            </div>
            <div class="box-footer text-center">
              <p class="color10 none">信息不完整，请完整填写所需信息</p>
              <input type="submit" class="btn btn-success J-submit" id="thesubmit" value="确认添加">
            </div>
          </form>


      </div>

    </div>
  </div>
</div>
<!-- END CONTAINER -->
    <jsp:include page="../common/footer.jsp" />
</div>
    <jsp:include page="../common/script.jsp" />
<!-- 验证模块 -->
<script src="${pageContext.request.contextPath}/resources/js/pages/common/verify.js">
</script>
<script src="${pageContext.request.contextPath}/resources/js/Idcard.js">
</script>

</body>
</html>