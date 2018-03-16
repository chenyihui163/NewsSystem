<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
   <meta charset="UTF-8">
		<title></title>
		 <script type="text/javascript" src="${pageContext.request.contextPath}/style/bootstrap/js/jquery-2.1.4.min.js" ></script> 
		 <link rel="stylesheet" href="${pageContext.request.contextPath}/style/bootstrap/css/bootstrap.css" />
		 <link rel="stylesheet" href="${pageContext.request.contextPath}/css/maint.css" />
        <script type="text/javascript" src="${pageContext.request.contextPath}/style/bootstrap/js/bootstrap.js" ></script>
	             <script src="${pageContext.request.contextPath}/layer/layer.js"></script>
	  <script src="${pageContext.request.contextPath}/layer/extend/layer.ext.js"></script>
	</head>
	<body>
   <%@ include file="top.jsp"%>
 <div class="container">
<div class="row">
<div class="col-sm-12">
	<h1 class="news-title">${news.title}</h1>
	<div class="news-status">
	发布时间：${news.publishDate}  作者：${news.author }   新闻类别:${typeName }    阅读次数:${news.click }
	</div>
	<div class="news-content">
		${news.content }
		<img src="<%=basePath%>images/${news.imageName}">
		
	</div>
	
	<div class="dataHeader">用户评论</div>
	<div class="commentDatas">
	<c:if test="${!empty news.comments}" >
	<c:forEach items="${news.comments }" var="comment">
	
		<div class="comment">
		用户<font style="font-size:12px;color:red">${ comment.commentId}:</font> 
		
		发表时间${ comment.commentDate}
		<br>
		<div>${comment.commentContent }</div>
		<br><br>
	</div>
	</c:forEach>
	</c:if>
	<a href="<%=basePath %>ShangPage" >上一页</a>&nbsp;&nbsp;&nbsp;<a href="<%=basePath %>XiaPage" >下一页</a>
	</div>
	
	<div class="discuss" style="margin-bottom:50px">
	<label>当前用户:${comment.userId }</label>
	<br>
		<textarea rows="3" name="commentContent" id="commentContent"></textarea>
		<br><br>
		<button type="button" class="btn btn-primary" id="button_submit" onClick="faSong1();">发表评论</button>
	</div>

</div>


</div>
</div>
<script >
 $(document).ready(function(){
 
 $("#button_submit").click(function(){
 var date = new Date();
    var seperator1 = "-";
    var seperator2 = ":";
    var month = date.getMonth() + 1;
    var strDate = date.getDate();
    if (month >= 1 && month <= 9) {
        month = "0" + month;
    }
    if (strDate >= 0 && strDate <= 9) {
        strDate = "0" + strDate;
    }
    var commentDate = date.getFullYear() + seperator1 + month + seperator1 + strDate
            + " " + date.getHours() + seperator2 + date.getMinutes()
            + seperator2 + date.getSeconds();
   var userId=${user.userId};
    var newsId=${news.newsId};
     var commentContent=$('#commentContent').val();
     alert(commentDate+" "+userId+" "+newsId+" "+commentContent);
 
     $.ajax({
     
     type:"POST",
     url:"${pageContext.request.contextPath}/comment/addComment",
     data:"newsId="+newsId+"&userId="+userId+"&commentContent="+commentContent+"&commentDate="+commentDate,
     
     contentType: "application/x-www-form-urlencoded; charset=utf-8", 
   
     success:function(data)
     {
    
      layer.alert("评论成功",{
 			   icon:1,
 			   skin: 'layer-ext-moon',
 			 time:200000000*10
 	});
     window.location.reload();//刷新当前页面.
     },
     error:function()
     {
     alert("评论失败");
     }
     
     
     });
    
 
 
 });
 
 });

</script>

	</body>
</html>
