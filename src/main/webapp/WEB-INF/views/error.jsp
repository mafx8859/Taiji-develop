<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
  <head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>发生错误</title>

  <jsp:include page="common/link.jsp" />
  <style type="text/css">
    body{background: #F5F5F5;}
  </style>
  </head>
  <body>

    <div class="error-pages">

        <img src="${pageContext.request.contextPath}/resources/img/404.png" alt="404" class="icon" width="400" height="260">
        <h1>对不起，您的操作存在问题</h1>
        <h4>我们找不到您要找的那一页。您可以：</h4>

        <div class="bottom-links">
          <a href="javascript:;" onclick="window.history.back(-1);" class="btn btn-default">返回上一步</a>
          或
          <a href="${pageContext.request.contextPath}/user/index" class="btn btn-light">返回首页</a>
        </div>

    </div>

</body>
</html>