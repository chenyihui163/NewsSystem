<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
 <head>
		<meta charset="UTF-8">
		<title></title>
        <script type="text/javascript" src="${pageContext.request.contextPath}/style/bootstrap/js/jquery-2.1.4.min.js"></script>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/style/bootstrap/css/bootstrap.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/maint.css" />
        <script type="text/javascript" src="${pageContext.request.contextPath}/style/bootstrap/js/bootstrap.js" ></script>
	
	</head>
	
	<body >
<div class="navbar navbar-default">
<div class="container">
<div class="navbar-header"></div>
	<a href="main.jsp" class="navbar-brand">柠檬新闻</a>
	<ul class="nav navbar-nav">
	<li><a href="<%=basePath%>news/getAllNews" >首页</a></li>
	<li><a href="<%=basePath%>newsType/getAllnews?typeId=1">政治</a>
	<li><a href="<%=basePath%>newsType/getAllnews?typeId=2">娱乐</a>
	<li><a href="<%=basePath%>newsType/getAllnews?typeId=3">体育</a>
	<li><a href="<%=basePath%>newsType/getAllnews?typeId=4">民生</a>

	</ul>
	<ul class="nav navbar-nav navbar-right" style="margin-top:12px;font-size:15px;">
	<li style="margin-right:20px;"><a href="#">当前用户:<font color="red" font-weight="bolder">${sessionScope.user.userId } </font></a></li>
	<li><a href="<%=basePath%>login/quit">退出</a></li>
	</ul>
</div>
</div>

</body>
</html>
