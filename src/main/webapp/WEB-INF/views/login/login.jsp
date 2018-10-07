<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
  <head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>登录</title>

    <jsp:include page="../common/link.jsp" />
    <jsp:include page="../common/script.jsp" />
  <style type="text/css">
    body{
      background: #F5F5F5;
      text-align: center;
    }
    .form-area .company,
    .form-area .guide{
      height: 222px;
      overflow-y: scroll;
    }
    .login-form{
      vertical-align: top;
    }
    .company ul li{
      text-align: left;
    }
    .login-form{
      +zoom:1;
      +display:inline;
    }
  </style>
  </head>
  <body>

    <div class="login-form">
      <form action="${pageContext.request.contextPath}/user/login" method="post">
        <div class="top">
          <img src="${pageContext.request.contextPath}/resources/img/icon.jpg" alt="icon" class="icon">
          <h1>吉林省太极拳协会管理系统</h1>
        </div>
        <div class="form-area">
          <div class="group">
            用户名：
            <input type="text" class="form-control" placeholder="用户名" name="username">
          </div>
          <div class="group">
            密码：
            <input type="password" class="form-control" placeholder="密码" name="password">
          </div>
          <button type="submit" class="btn btn-default btn-block">登录</button>
        </div>
        <div class="footer-links row text-center">
          <p>忘记密码请联系单位管理员</p>
          <p class="color10">${message}</p>
          <p class="color7">${tip}</p>
          <div class="col-xs-6"><a href="${pageContext.request.contextPath}/user/register" class="btn"><i class="fa fa-user"></i> 个人会员注册</a></div>
          <div class="col-xs-6 text-right"><a href="${pageContext.request.contextPath}/user/company/register" class="btn"><i class="fa fa-users"></i> 单位会员注册</a></div>
        </div>
      </form>
    </div>
    <div class="login-form">
      <form>
        <div class="top">
          <img src="${pageContext.request.contextPath}/resources/img/stadium.jpg" alt="icon" class="icon" style="width: 135px;">
          <!-- <h1 class="guide">管理系统操作指南</h1> -->
          <h1 class="company" style="font-weight: 100;font-size: 20px;">已注册单位列表</h1>
        </div>
        <div class="form-area">
          <!-- <div class="guide group">
            ${guide}
          </div> -->
          <div class="company group">
            <ul class="list">
              <c:forEach items="${organizationList}" var="organization">
                <li>${organization.name}</li>
              </c:forEach>
            </ul>
          </div>
        </div>
        <div class="footer-links row text-center">
          <div class="col-xs-6"><a href="${pageContext.request.contextPath}/guide/preview" class="btn btn-guide" target="_blank"><i class="fa fa-book"></i> 系统操作指南</a></div>
          <div class="col-xs-6 text-right"><a href="javascript:;" class="btn btn-group btn-company"><i class="fa fa-users"></i> 单位列表排序</a></div>
        </div>
      </form>
    </div>
    <script>
      // 点击实现 首字母排序
      $(function () {
        var arr = [];
        var list = $('.list li');
        for(var i=0;i<list.length;i++){
          arr.push($(list[i]).text());
        }
        $('.btn-company').click(function () {
          $('.list li').remove();
          arr.sort(function (a,b) {
            return a.localeCompare(b,'zh');
          });
          $(arr).each(function(index,value){
            $('.list').append('<li>' + value + '</li>');
          })
        })
      })
    </script>
</body>
</html>