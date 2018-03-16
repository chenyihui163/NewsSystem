<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'main.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
	<script type="text/javascript" src="${pageContext.request.contextPath}/style/bootstrap/js/jquery-2.1.4.min.js"></script> 
	<link rel="stylesheet" href="${pageContext.request.contextPath}/style/bootstrap/css/bootstrap.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/css.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/animate.js" ></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/style/bootstrap/js/bootstrap.js" ></script>
   	<script>
    //function  OneNews(newsId)
  ///  {
    
  // 
    
    //}
	</script>
  </head>
  
  <body onload="fun()">

<%@ include file="top.jsp" %>
		<div class="container">
<div class="row">
	
		<div class="col-sm-2">
		<div class="side-bar-card1 clearfix">
		<img src="${pageContext.request.contextPath}/img/bjt.jpg">
		<div class="side-bar-card1title">有害信息举报专区</div>
		<div class="side-bar-card1list">举报电话：12345</div>
	</div>	
	</div>
	
	
		
	<div class="col-sm-7">
		<div class="news-list">
		<div id="tran">
        <div id="list" style="left: -600px;">
           <img src="${pageContext.request.contextPath}/img/img1.jpg" alt="1" />
           <img src="${pageContext.request.contextPath}/img/bjtt.jpg" alt="1" />
           <img src="${pageContext.request.contextPath}/img/img1.jpg"  alt="2" />
           	<img src="${pageContext.request.contextPath}/img/bjt.jpg" alt="3" />
            <img src="${pageContext.request.contextPath}/img/img1.jpg"  alt="4" />
            <img src="${pageContext.request.contextPath}/img/bjtt.jpg" alt="5" />
            <img src="${pageContext.request.contextPath}/img/img1.jpg"  alt="5" />
        </div>
        
        <div id="buttons">
            <span index="1" class="on"></span>
            <span index="2"></span>
            <span index="3"></span>
            <span index="4"></span>
            <span index="5"></span>
        </div>
        
        <a href="javascript:;" id="prev" class="arrow">&lt;</a>
        <a href="javascript:;" id="next" class="arrow">&gt;</a>      
   </div>
	<c:if test="${!empty newsList}">
	<c:forEach items="${newsList}" var="news">
	<div class="news-list-item clearfix">
		<div class="col-xs-6">
<img src="<%=basePath%>images/${news.imageName}"  title="${news.title}">

</div>
<div class="col-xs-6">
	<a href="<%=basePath%>news/getNews?newsId=${news.newsId}"  class="title">
     ${news.title }
	</a>
	<div class="info">
		<span>作者:${news.author}</span>
		
		<span>发表时间:${news.publishDate}</span>
	</div>
</div>
</div>
</c:forEach>
</c:if>
</div>
</div>


<%@ include file="you.jsp"%>
<%@ include file="bottom.jsp"%>
</div>
</div>

  </body>
</html>
