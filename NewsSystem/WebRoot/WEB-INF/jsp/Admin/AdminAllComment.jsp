<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'AdminAllComment.jsp' starting page</title>
    
	<script src="${pageContext.request.contextPath}/style/jquery-1.11.1.js"></script>
		<link href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css" rel="stylesheet"/>
		<script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.min.js"></script>
		<link href="${pageContext.request.contextPath}/bootstrap-fileinput-master/css/fileinput.css" rel="stylesheet"/>
		<script src="${pageContext.request.contextPath}/bootstrap-fileinput-master/js/fileinput.js"/>
		<script src="${pageContext.request.contextPath}/bootstrap-fileinput-master/js/locales/zh.js"></script>
	    <link  href="${pageContext.request.contextPath}/css/bootstrap-table.css" rel="stylesheet"/>
		<script src="${pageContext.request.contextPath}/style/bootstrap-table.js"></script>
		<script src="${pageContext.request.contextPath}/style/bootstrap-table-zh-CN.js"></script>
		<script src="${pageContext.request.contextPath}/style/bootstrap-modal.js"	></script>
		<script src="${pageContext.request.contextPath}/js/Comment.js"></script>

  </head>
  <style>
		#commentTable thead th{
			text-align: center;
			font-size: 15px;
		}
	#commentTable	tbody tr td
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
				<table class="table table-striped table-bordered bootstrap-datatable datatable" id="commentTable">
					<thead>
						<tr>
							<th><input type="checkbox" id="allChecks" onclick="ckAll()"/></th>
							<th data-field="commentId">评论编号</th>
							<th data-field="newsId">新闻编号</th>
							<th data-field="userId">评论者</th>
							<th data-field="commentDate">评论时间</th>
							<th data-filed="caozuo">操作</th>
						</tr>
					</thead>
					<tbody>
						<tr>
						<td><input type="checkbox" name="check" /></td>
						<td>fjie</td>
						<td>fjie</td>
						<td>fjie</td>
						<td>fjie</td>
						<td class="center">
							<a class="btn btn-info" data-target="edit" data-toggle="modal"   onclick="Edit()">
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
						<tr>
						<td><input type="checkbox" name="check" /></td>
						<td>fjie</td>
						<td>fjie</td>
						<td>fjie</td>
						<td>fjie</td>
						<td class="center">
							<a class="btn btn-info" data-target="edit" data-toggle="modal"   onclick="Edit()">
										<i class="icon-edit icon-white"></i>  
										修改                                            
									</a>
									&nbsp;&nbsp;
									<a class="btn btn-danger" href="javascript:void(0);" onclick="deleteCustom(this)">
										<i class="icon-trash icon-white"></i> 
										删除
									</a>
									
						</td>
						</tr>
					</tbody>
					 <div id="toolbar" class="btn-group pull-left" >
	           
	          <a class="btn btn-success"  onclick="Add('+rowIndex+')" >
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
			
			
	<div class="modal fade" id="add" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					&times;
				</button>
				<h4 class="modal-title" id="myModalLabel">
					增加新闻评论
				</h4>
			</div>
			<div class="modal-body">
			<form class="form-horizontal">
				
				   <div class="form-group">
					<label class="control-label col-sm-4">评论编号</label>
			        &nbsp;&nbsp;
					
					<input type="text" class="form-control col-sm-8" name="commentId" id="commentId" disabled  />	
				
				</div>
				<br>
				 <div class="form-group">
					<label class="control-label col-sm-4">新闻编号</label>
			        &nbsp;&nbsp;
					
					<input type="text" class="form-control col-sm-8" name="newsId" id="newsId"  placeholder="请输入新闻编号" />	
				
				</div>
				<br>
				
				 <div class="form-group">
					<label class="control-label col-sm-4">评论者IP</label>
			        &nbsp;&nbsp;
					
					<input type="text" class="form-control col-sm-8" name="userId" id="userId"  placeholder="请输入评论者IP" />	
				
				</div>
				<br>
				
				 <div class="form-group">
					<label class="control-label col-sm-4">评论时间</label>
			        &nbsp;&nbsp;
					
					<input type="text" class="form-control col-sm-8" name="commentDate" id="commentDate" disabled />	
				
				</div>
				<br>
				
				
				
			</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭
				</button>
					<button type="button" class="btn btn-primary" onclick="">
					提交更改
				</button>
				
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal -->
</div>


	<div class="modal fade" id="edit" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					&times;
				</button>
				<h4 class="modal-title" id="myModalLabel">
					修改新闻评论
				</h4>
			</div>
			<div class="modal-body">
			<form class="form-horizontal">
				 <div class="form-group">
					<label class="control-label col-sm-4">评论编号</label>
			        &nbsp;&nbsp;
					
					<input type="text" class="form-control col-sm-8" name="commentId" id="commentId" disabled  />	
				
				</div>
				<br>
				 <div class="form-group">
					<label class="control-label col-sm-4">新闻编号</label>
			        &nbsp;&nbsp;
					
					<input type="text" class="form-control col-sm-8" name="newsId" id="newsId"  placeholder="请输入新闻编号" />	
				
				</div>
				<br>
				
				 <div class="form-group">
					<label class="control-label col-sm-4">评论者IP</label>
			        &nbsp;&nbsp;
					
					<input type="text" class="form-control col-sm-8" name="userId" id="userId"  placeholder="请输入评论者IP" />	
				
				</div>
				<br>
				
				 <div class="form-group">
					<label class="control-label col-sm-4">评论时间</label>
			        &nbsp;&nbsp;
					
					<input type="text" class="form-control col-sm-8" name="commentDate" id="commentDate" disabled />	
				
				</div>
				  
				<br>
				 
				
			</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭
				</button>
					<button type="button" class="btn btn-primary" onclick="">
					提交更改
				</button>
				
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal -->
</div>
			
	
		
		<script>
	$('#commentTable').bootstrapTable({
          
         
           
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
			
		function ckAll(){
          var flag=document.getElementById("allChecks").checked;
          var cks=document.getElementsByName("check");
        for(var i=0;i<cks.length;i++){
        cks[i].checked=flag;
       }
 }
		
	
   

		   
		</script>
  </body>
</html>
