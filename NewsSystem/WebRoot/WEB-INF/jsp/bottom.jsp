<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		 <script type="text/javascript" src="${pageContext.request.contextPath}/style/bootstrap/js/jquery-2.1.4.min.js" ></script> 
		 <link rel="stylesheet" href="${pageContext.request.contextPath}/style/bootstrap/css/bootstrap.css" />
		 <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css" />
        <script type="text/javascript" src="${pageContext.request.contextPath}/style/bootstrap/js/bootstrap.js" ></script>
	</head>
	<body>
	<div class="Links">
	    <div class="col-sm-3"></div>
	    <div class="col-sm-9">
		<div class="col-sm-3">友情链接</div>
		<div class="col-sm-9">
		<c:if test="${!empty linkList }">
		<c:forEach items="${linkList }" var="link">
		<a href="${link.linkUrl }"  target="_blank" class="Link-list">${link.linkName }</a>
		</c:forEach>
		</c:if>
		</div>
	</div>
	<div class="col-sm-3"></div>
</div>
	</body>
</html>
