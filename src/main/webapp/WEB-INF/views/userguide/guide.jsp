<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>首页</title>

    <jsp:include page="../common/link.jsp" />

</head>
<body>

<jsp:include page="../common/header.jsp" />
<jsp:include page="../common/sidebar.jsp" />

<!-- START CONTENT -->
<div class="content">

    <!-- Start Page Header -->
    <div class="page-header">
        <h1 class="title">用户操作指南</h1>
    </div>
    <!-- End Page Header -->


    <!-- START CONTAINER -->
    <div class="container-widget clearfix">

        <!-- Start Top Stats -->
        <div class="col-md-12">
            <div class="panel panel-default">

                <div class="panel-title">
                    修改操作指南
                </div>

                <div class="panel-body">
                    <form action="${pageContext.request.contextPath}/guide/update" method="post" enctype="multipart/form-data">
                        <input type="file" name="guide" value="上传文件">
                        <input type="submit" value="提交" class="btn btn-primary">
                    </form>
                </div>

            </div>
        </div>
        <!-- End Top Stats -->


    </div>
    <!-- END CONTAINER -->
    <jsp:include page="../common/footer.jsp" />


    
</div>
<!-- End Content -->
<jsp:include page="../common/script.jsp" />
<!-- ================================================
Summernote
================================================ -->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/summernote/summernote.min.js"></script>
<!-- ================================================
zh-CN
================================================ -->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/summernote/zh-CN.js"></script>
<script type="text/javascript">
    $(function () {
        $('#editor1').summernote({
            lang: 'zh-CN',
        });
    })
</script>
</body>
</html>
