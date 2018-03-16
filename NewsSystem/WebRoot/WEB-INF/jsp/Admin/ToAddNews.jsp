<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'ToAddNews.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
   <script type="text/javascript" src="${pageContext.request.contextPath}/bootstrap/js/jquery-2.1.4.min.js"></script>
        <link href='${pageContext.request.contextPath}/css/opa-icons.css' rel='stylesheet'>
       <script src="${pageContext.request.contextPath}/style/jquery.min.js"></script>

	   <link href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.css" rel="stylesheet"/>
		<script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.js"></script>
	    <link  href="${pageContext.request.contextPath}/css/bootstrap-table.css" rel="stylesheet"/>
		<script src="${pageContext.request.contextPath}/style/bootstrap-table.js"></script>
		<script src="${pageContext.request.contextPath}/style/bootstrap-table-zh-CN.js"></script>
		<script src="${pageContext.request.contextPath}/style/bootstrap-modal.js"	></script>
		<script src="${pageContext.request.contextPath}/js/News.js"></script>
	 <script src="${pageContext.request.contextPath}/layer/layer.js"></script>
	<script src="${pageContext.request.contextPath}/layer/extend/layer.ext.js"></script>
  </head>
   <style>
   
    .control-label
		{
			color:red;
			font-size:15px;
			font-weight: bold;
		}
   </style>
  <body>
   <div class="container">
   <form  class="form-horizontal" action="${pageContext.request.contextPath}/Adminnews/addNews" enctype="multipart/form-data" method="post">
    <br>
    <div class="form-group">
    <br>
					<label class="control-label col-sm-4">新闻题目</label>
			        &nbsp;&nbsp;
					
					<input type="text" class="form-control col-sm-8" name="title" id="title"  placeholder="请输入新闻题目"/>	
				
				</div>
				<br>
				 <div class="form-group">
					<label class="control-label col-sm-4" >新闻作者</label>
			        &nbsp;&nbsp;
					
					<input type="text" class="form-control col-sm-8" name="author" id="author"  placeholder="请输入新闻作者" />	
				
				</div>
				
				<br>
				<div class="form-group">
					<label class="control-label col-sm-4" >新闻类型</label>
			        &nbsp;&nbsp;
					
					<select class="form-control col-sm-8" name="typeId" id="typeId" >	
					<option value="1">政治</option>
					<option value="2">娱乐</option>
				    <option value="3">体育</option>
				    <option value="4">民生</option>
				    </select>
				</div>
				
				<br>
				<div class="form-group">
					<label class="control-label">设置头条</label>&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="radio" name="isHead" value="1" id="YesHead">是&nbsp;&nbsp;
					<input type="radio" name="isHead" value="0" id="NoHead">否
				</div>
				<br>
				
				<div class="form-group">
					<label class="control-label">设置热点</label>&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="radio" name="isHot" value="1" id="YesHot">是&nbsp;&nbsp;
					<input type="radio" name="isHot" value="0" id="NoHot">否
				</div>
				<br>
					
               <div class="form-group">
					<label class="control-label col-sm-4">发布时间</label>
			        &nbsp;&nbsp;
					
					<input type="date" class="form-control col-sm-8" name="publishDate" id="publishDate" />	
				
				</div>
				<br>
				<div class="form-group">
					<label class="control-label col-sm-4">新闻内容</label>
			        &nbsp;&nbsp;
					
						<textarea  class="form-control col-sm-8" name="content" id="content" rows="6" placeholder="请输入新闻内容" cols="10">	</textarea>					
				
				</div>
				<br>
				<div class="form-group">
					<label class="control-label" for="FileUpload1"  class="control-label col-sm-4">上传图片</label>
                 
                      <input  class="form-control col-sm-8" type="file" name="file"   />
                     
                  
				  </div>
				<br>
				<input type="submit" class="btn btn-primary" value="增加新闻" onclick="add()" style="margin-left: 100px">
					
				</button>
				
			</form>
   
   
   </div>
     <script >
  
  
   function add()
   {
   layer.alert("增加新闻成功",{
 			   icon:1,
 			   skin: 'layer-ext-moon',
 			 time:200000000*10
 	});
   }
  
  
  </script>
  </body>
</html>
