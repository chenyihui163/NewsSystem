<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
   <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>登录界面模板</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/body.css"/> 
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/layer/skin/layer.css"/> 
	<script type="text/javascript" src="${pageContext.request.contextPath}/bootstrap/js/jquery-2.1.4.min.js"></script>
<script src="${pageContext.request.contextPath}/js/yanzheng.js"></script>
  <script src="${pageContext.request.contextPath}/layer/layer.js"></script>
	<script src="${pageContext.request.contextPath}/layer/extend/layer.ext.js"></script>


</head>

<body onload="createCode()">
<div class="container">
	<section id="content">
		<form id="form1" action="login/loginUser">
			<h1>新闻登录</h1>
			<div>
				<input type="text" placeholder="账号"  id="userId" name="userId" />
			</div>
			<div>
				<input type="password" placeholder="密码"  id="password"  name="password" />
			</div>
				
			<div> 
              <input type="text" id="inputCode" name="validateCode"  placeholder="请输入正确的验证码" style="width:40%;"/>
              <span class="code" id="checkCode" onclick="createCode()"  title="点击更换" style="color:red;font-size:25px;font-weight:bolder">  </span>
			</div>	
			
			 <div class="">
				<span class="help-block u-errormessage" id="js-server-helpinfo">&nbsp;</span>
			</div>
			<div>
				<!-- <input type="submit" value="Log in" /> -->
				<input type="submit" id="submit"   value="登录"  class="btn btn-primary"  onclick="validateCode()" />
				<a href="change.html">忘记密码?</a>
				<!-- <a href="#">Register</a> -->
			</div>
		</form><!-- form -->
		 <div class="button">
			<span class="help-block u-errormessage" id="js-server-helpinfo">&nbsp;</span>
			<div class="bq">柠檬新闻网</div>	
		</div> <!-- button -->
	</section><!-- content -->
</div>
<!-- container -->


<br><br><br><br>


</body>
  
</html>
