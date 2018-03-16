<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		 <script type="text/javascript" src="${pageContext.request.contextPath}/style/bootstrap/js/jquery-2.1.4.min.js" ></script> 
		 <link rel="stylesheet" href="${pageContext.request.contextPath}/style/bootstrap/css/bootstrap.css" />
		 <link rel="stylesheet" href="${pageContext.request.contextPath}/style/css/maint.css" />
        <script type="text/javascript" src="${pageContext.request.contextPath}/style/bootstrap/js/bootstrap.min.js" ></script>
	</head>
	<body>
		<div class="col-sm-3">
	
	<div class="side-bar-card2">
		<div class="card-title">
			热点新闻
		</div>
		<div class="card-body">
			<div class="list">
			<c:if test="${!empty hotList}">
	      <c:forEach items="${hotList}" var="hot" begin="0" end="5" varStatus="status" >
			<a href="<%=basePath%>news/getNews?newsId=${hot.newsId}" target="mainFrame" class="item">
				<div class="title">${hot.title }</div>
				<div class="desc">阅读量:${hot.click }</div>
			</a>
		</c:forEach>
		</c:if>
		
			
			</div>
		</div>	
	</div>
	
	
	<div class="side-bar-card3">
		<div class="card-title">
			最新新闻
		</div>
		<div class="card-body">
			<div class="list">
				<c:if test="${!empty headList}">
	      <c:forEach items="${headList}" var="head" begin="0" end="5" varStatus="status" >
			<a href="<%=basePath%>news/getNews?newsId=${head.newsId}" target="mainFrame"  class="item">
				<div class="title">${head.title }</div>
				<div class="desc">阅读量:${head.click }</div>
			</a>
		 </c:forEach>
		 </c:if>
			
			</div>
		</div>	
	</div>
	
</div>
	</body>
</html>
