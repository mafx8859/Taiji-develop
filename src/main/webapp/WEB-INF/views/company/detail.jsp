<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
  <head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>单位详情</title>
    <jsp:include page="../common/link.jsp" />

  </head>
  <body>
    <jsp:include page="../common/header.jsp" />
    <jsp:include page="../common/sidebar.jsp" />
<!-- START CONTENT -->
<div class="content">

  <!-- Start Page Header -->
  <div class="page-header">
    <h1 class="title">单位管理</h1>
      <ol class="breadcrumb">
        <li><a href="${pageContext.request.contextPath}/user/index">首页</a></li>
        <li><a href="#">单位管理</a></li>
        <li class="active">单位详情</li>
      </ol>

  </div>
  <!-- End Page Header -->


 
<!-- START CONTAINER -->
<div class=" container-widget">


  <div class="row">
    <div class="col-md-12">
      <div class="box box-solid">
        <div class="box-header with-border">
          <h3 class="box-title">会员单位信息：</h3>
        </div>
        <div class="box-body">
          <dl class="dl-horizontal">
            <dt>单位名称：</dt>
            <dd>${organization.name}</dd>
            <dt>单位地址：</dt>
            <dd>${organization.address}</dd>
            <dt>主管部门：</dt>
            <dd>${organization.department}</dd>
            <dt>单位QQ群：</dt>
            <dd>${organization.qqGroup}</dd>
            <dt>负责人1：</dt>
            <dd>${organization.principal1}</dd>
            <dt>职务：</dt>
            <dd>${organization.job1}</dd>
            <dt>职称：</dt>
            <dd>${organization.title1}</dd>
            <dt>联系方式：</dt>
            <dd>${organization.tel1}</dd>
            <dt>负责人2：</dt>
            <dd>${organization.principal2}</dd>
            <dt>职务：</dt>
            <dd>${organization.job2}</dd>
            <dt>职称：</dt>
            <dd>${organization.title2}</dd>
            <dt>联系方式：</dt>
            <dd>${organization.tel2}</dd>
            <dt>经营范围及主要业绩：</dt>
            <dd>${organization.performance}</dd>
            <dt>参与本协会活动情况：</dt>
            <dd>${organization.dues}</dd>
          </dl>
        </div>
      </div>
      <!-- /.box -->
    </div>
  </div>
  <a href="${pageContext.request.contextPath}/organization/list" class="btn btn-default">返回单位列表</a>

</div>
<!-- END CONTAINER -->


    <jsp:include page="../common/footer.jsp" />

</div>
<!-- End Content -->

    <jsp:include page="../common/script.jsp" />
</body>
</html>