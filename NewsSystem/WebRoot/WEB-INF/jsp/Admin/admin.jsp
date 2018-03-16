<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
     <title>柠檬新闻后台管理系统</title>
   <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
   <link href="${pageContext.request.contextPath}/assets/css/dpl-min.css" rel="stylesheet" type="text/css" />
   <link href="${pageContext.request.contextPath}/assets/css/bui-min.css" rel="stylesheet" type="text/css" />
   <link href="${pageContext.request.contextPath}/assets/css/main-min.css" rel="stylesheet" type="text/css" />
   <script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery-1.8.1.min.js"></script>
   <script type="text/javascript" src="${pageContext.request.contextPath}//assets/js/bui.js"></script>
   <script type="text/javascript" src="${pageContext.request.contextPath}//assets/js/config.js"></script>

  </head>
  
  <body>
  
    <div class="header">
    
      <div class="dl-title">
       
          <span class="lp-title-port">柠檬新闻</span><span class="dl-title-text">后台管理</span>
        </a>
      </div>

    <div class="dl-log">欢迎您，管理员<span class="dl-log-user">${user.userId }</span><a href="<%=basePath%>login/quit" title="退出系统" class="dl-log-quit">[退出]</a><a href="http://http://sc.chinaz.com/" title="文档库" class="dl-log-quit">新闻首页</a>
    </div>
  </div>
   <div class="content">
    <div class="dl-main-nav">
      <div class="dl-inform"><div class="dl-inform-title">***<s class="dl-inform-icon dl-up"></s></div></div>
      <ul id="J_Nav"  class="nav-list ks-clear">
        <li class="nav-item dl-selected"><div class="nav-item-inner nav-home">首页</div></li>
        
        <li class="nav-item"><div class="nav-item-inner nav-inventory">系统管理</div></li>
       
      </ul>
    </div>
    <ul id="J_NavContent" class="dl-tab-conten">

    </ul>
   </div>
  

  <script>
    BUI.use('common/main',function(){
      var config = [{
          id:'menu', 
          homePage : 'Shouye',
          menu:[{
          text:'首页',
          items:[
               
                {id:'Shouye',text:'新闻公告',href:'${pageContext.request.contextPath}/Shouye.jsp',closeable : false}
              
              ]
          
          }
          
          ,{
              text:'新闻管理',
              items:[
                {id:'News',text:'新闻管理操作',href:'Adminnews/getAllNews'}
              
              ]
            },{
              text:'新闻类别管理',
              items:[
                {id:'NewsType',text:'新闻类别管理操作',href:'AdminAllnews.jsp'}
             
              ]
            },{
            	 text:'新闻评论管理',
                items:[
                {id:'Comment',text:'新闻评论操作',href:'AdminAllComment.jsp'}
             
              ]
            	
            },{
            	text:'新闻用户管理',
                items:[
                {id:'User',text:'新闻用户操作',href:'AdminAllUser.jsp'}
             
              ]
            	
            },{
            	text:'新闻链接管理',
                items:[
                {id:'Link',text:'新闻链接操作',href:'AdminAllLink.jsp'}
             
              ]
            	
            }]
          },{
            id:'form',
            menu:[{
                text:'系统管理',
                items:[
                  {id:'code',text:'刷新服务器缓存',href:'form/code.jsp'}
                 
                ]
              
              }]
          }];
      new PageUtil.MainPage({
        modulesConfig : config
      });
    });
  </script>
  <script>
  
  function News()
  {
  
  
  
  }
  
  </script>
  </body>
</html>
