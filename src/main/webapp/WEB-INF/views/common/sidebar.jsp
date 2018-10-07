<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 卓音
  Date: 2017/9/27
  Time: 17:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="sidebar clearfix">

<ul class="sidebar-panel nav">
    <c:if test="${sessionScope.role eq 'admin' or sessionScope.role eq 'super' or sessionScope.role eq 'organization'}">
        <c:if test="${sessionScope.role eq 'super' or sessionScope.role eq 'admin'}">
          <li>
            <a href="${pageContext.request.contextPath}/user/list">
              <span class="icon color5">
                <i class="fa fa-user"></i>
              </span>
              账号管理
            </a>
          </li>
        </c:if>
        <c:if test="${sessionScope.role eq 'organization'}">
              <li>
                <a href="${pageContext.request.contextPath}/organization/check">
                  <span class="icon color5">
                    <i class="fa fa-user"></i>
                  </span>
                  审核人员
                </a>
              </li>
        </c:if>
    </c:if>
    <c:if test="${sessionScope.role eq 'admin' or sessionScope.role eq 'super'}">
          <li>
            <a href="${pageContext.request.contextPath}/organization/list">
              <span class="icon color5">
                <i class="fa fa-users"></i>
              </span>
              单位管理
            </a>
          </li>
    </c:if>
    
    <c:if test="${sessionScope.role eq 'admin' or sessionScope.role eq 'super' or sessionScope.role eq 'organization'}">
        <c:if test="${sessionScope.role eq 'super' or sessionScope.role eq 'admin'}">
          <li>
            <a href="#" class="active">
              <span class="icon color7">
                <i class="fa fa-folder"></i>
              </span>活动管理
              <span class="caret"></span>
            </a>
            <ul style="display: block">
              <li>
                <a href="${pageContext.request.contextPath}/activity/list">活动列表</a>
              </li>
              <li>
                <a href="${pageContext.request.contextPath}/query/">综合查询</a>
              </li>
              <li>
                <a href="https://www.baidu.com/">太极拳比赛</a>
              </li>
            </ul>
          </li>
        <c:if test="${sessionScope.role eq 'admin' or sessionScope.role eq 'super'}">
            <li>
                <a href="${pageContext.request.contextPath}/guide/update">
                  <span class="icon color5">
                    <i class="fa fa-book"></i>
                  </span>
                    用户操作指南
                </a>
            </li>
        </c:if>
        </c:if>
        <c:if test="${sessionScope.role eq 'organization'}">
            <li>
            <a href="${pageContext.request.contextPath}/organization/activity/list">
                <span class="icon color5">
                <i class="fa fa-files-o"></i>
                </span>
                活动统一报名
            </a>
            </li>
        </c:if>
    </c:if>
    <c:if test="${sessionScope.role eq 'organization' or sessionScope.role eq 'person'}">

      <li>
        <a href="#" class="active">
          <span class="icon color7">
            <i class="fa fa-hand-o-right"></i>
          </span>我的活动
          <span class="caret"></span>
        </a>
        <ul style="display: block">
          <li>
            <a href="${pageContext.request.contextPath}/personal/list2">已报名活动</a>
          </li>
          <li>
            <a href="${pageContext.request.contextPath}/personal/list">未报名活动</a>
          </li>
          <li>
            <a href="https://www.baidu.com/">太极拳比赛</a>
          </li>
        </ul>
      </li>
      <li>
        <a href="#" class="active">
          <span class="icon color7">
            <i class="fa fa-file"></i>
          </span>我的信息
          <span class="caret"></span>
        </a>
        <ul style="display: block">
          <li>
            <a href="${pageContext.request.contextPath}/user/detail/${sessionScope.user.id}">查看信息</a>
          </li>
          <li>
            <a href="${pageContext.request.contextPath}/user/update">修改信息</a>
          </li>
        </ul>
      </li>
    </c:if>

</div>
<!-- END SIDEBAR -->
<!-- //////////////////////////////////////////////////////////////////////////// --> 