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
    
    <title>My JSP 'AdminNews.jsp' starting page</title>
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
		#newsTable thead th{
			text-align: center;
			font-size: 15px;
		}
	#newsTable	tbody tr td
		{
			text-align: center;
			font-size: 12px;
		}
		#toolbar
		{
			margin: 20px;
			padding: 2px;
			position: relative;
		}
    .control-label
		{
			color:red;
			font-size:12px;
			font-weight: bold;
		}
		
	</style>
  <body>
  
  <div class="row-fluid">
				<table class="table table-striped table-bordered bootstrap-datatable datatable" id="newsTable">
					<thead>
						<tr>
							<th><input type="checkbox" id="allChecks" /></th>
							<th data-field="newsId" >编号</th>
							<th data-field="title">题目</th>
							<th data-field="author">作者</th>
							
							<th data-field="click">新闻点击率</th>
							<th data-field="publishDate">发布时间</th>
							
					        <th data-filed="caozuo">操作</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${!empty newsList}">
	          <c:forEach items="${newsList}" var="news">
						<tr>
						<td><input type="checkbox" name="check" id="check" /></td>
						<td>${news.newsId}</td>
						<td>${news.title }</td>
						<td>${news.author }</td>					
						<td>${news.click }</td>						
						<td>${news.publishDate }</td>
						<td class="center"><a class="btn btn-success" onclick="Detail()">
										<i class="icon-zoom-in icon-white"></i>  
										查看详情                                        
									</a>
									&nbsp;&nbsp;
						<a class="btn btn-info" data-target="edit" data-toggle="modal"   onclick="Edit(this)">
										<i class="icon-edit icon-white"></i>  
										修改                                            
									</a>
									&nbsp;&nbsp;
									<a class="btn btn-danger" href="javascript:void(0);" onclick="Delete(this)">
										<i class="icon-trash icon-white"></i> 
										删除
									</a>
									
						</td>
						</tr>
						</c:forEach>
						</c:if>
					</tbody>
					 <div id="toolbar" class="btn-group pull-left" >
	           
	          <a class="btn btn-success"  href="<%=basePath%>Adminnews/toAddNews" >
				<i class="icon-plus icon-white"></i> 
				增加
		         </a>
		          <a class="btn btn-primary"  onclick="Dao('')" style="margin-left:20px">
		      <i class="icon-file icon-white"></i> 
			   批量删除
		       </a>
		      
			 
       	</div>
				</table>
				
			</div>	
			
			



	<div class="modal fade" id="edit" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog" >
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					&times;
				</button>
				<h4 class="modal-title" id="myModalLabel">
					修改新闻信息
				</h4>
			</div>
			<div class="modal-body">
			<form class="form-horizontal" action="Adminnews/updateNews" method="post" >
				<br>
				 <div class="form-group">
					<label class="control-label col-sm-4" >新闻编号</label>
			        &nbsp;&nbsp;
					
					<input type="text" class="form-control col-sm-8" name="newsId" id="newsId"  />	
				
				</div>
				  <br>
				 <div class="form-group">
					<label class="control-label col-sm-4">新闻题目</label>
			        &nbsp;&nbsp;
					
					<input type="text" class="form-control col-sm-8" name="title" id="title"  placeholder="请输入新闻题目" height="30px"  />	
				
				</div>
				<br>
				 <div class="form-group">
					<label class="control-label col-sm-4" >新闻作者</label>
			        &nbsp;&nbsp;
					
					<input type="text" class="form-control col-sm-8" name="author" id="author" placeholder="请输入新闻作者" />	
				
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
					
					<input type="date" class="form-control col-sm-8" name="publishDate" id="publishDate"  />	
				
				</div>
				
				
				
			</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭
				</button>
					<input type="submit" class="btn btn-primary" value="提交更改" />
					
				
				
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal -->
</div>
			
	<div class="modal fade" id="detail" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					&times;
				</button>
				<h4 class="modal-title" id="myModalLabel">
					查看新闻详情
				</h4>
			</div>
			<div class="modal-body">
			<form class="form-horizontal">
		
				 <div class="form-group">
					<label class="control-label col-sm-4">新闻类型</label>
			        &nbsp;&nbsp;
					
					<input type="text" class="form-control col-sm-8" name="typeName" id="typeName"  placeholder="请输入新闻题目" />	
				
				</div>
					<br>
               <div class="form-group">
					<label class="control-label">新闻热点</label>&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="radio" name="isHot" value="1" id="YesHot">是&nbsp;&nbsp;
					<input type="radio" name="isHot" value="0" id="NoHot">否
				</div>
				<br>
				 <div class="form-group">
					<label class="control-label">新闻热点</label>&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="radio" name="isHead" value="1" id="YesHead">是&nbsp;&nbsp;
					<input type="radio" name="isHead" value="0" id="NoHead">否
				</div>
				<br>
				<div class="form-group">
					<label class="control-label col-sm-4">新闻内容</label>
			        &nbsp;&nbsp;
					
					<textarea  class="form-control col-sm-8" name="content" id="content" rows="6">	</textarea>				
				
				</div>
				<br>
				<div class="form-group">
					<label class="control-label col-sm-4">查看图片</label>
			        &nbsp;&nbsp;
					
					<input type="text" class="form-control col-sm-8" name="isImage" id="isImage"  />	
				</div>
				<br>
				
				<br>
				
			</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭
				</button>
				
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal -->
</div>
		
		<script>
		
		
	$('#newsTable').bootstrapTable({
  
            striped: true,                      //是否显示行间隔色
            cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
            pagination: true,                   //是否显示分页（*）
            sortable: true,                     //是否启用排序
            sortOrder: "asc",                   //排序方式
            sidePagination: "client",           //分页方式：client客户端分页，server服务端分页（*）
            pageNumber:1,                       //初始化加载第一页，默认第一页
            pageSize: 5,                       //每页的记录行数（*）
            pageList: [5, 10, 50, 100],        //可供选择的每页的行数（*）
            search: true,                       //是否显示表格搜索，此搜索是客户端搜索，不会进服务端，所以，个人感觉意义不大
            strictSearch: true,
            showColumns: true,                  //是否显示所有的列
            showRefresh: true,                  //是否显示刷新按钮
            minimumCountColumns: 2,             //最少允许的列数
            clickToSelect: true,                //是否启用点击选中行
            height:400,
            uniqueId: "newsId",                     //每一行的唯一标识，一般为主键列
            showToggle:true,                    //是否显示详细视图和列表视图的切换按钮
            cardView: false,                    //是否显示详细视图
            detailView: false,                   //是否显示父子表
        
        });
			
		
 

			   
		</script>
  </body>
</html>
