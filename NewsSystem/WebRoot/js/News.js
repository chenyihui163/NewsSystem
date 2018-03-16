
function Detail()
{
	$('#detail').modal('show');
}

  $("#allChecks").click( 
		  function(){ 
		    if(this.checked){ 
		        $("input[name='check']").attr('checked', true)
		    }else{ 
		        $("input[name='check']").attr('checked', false)
		    } 
		  } 
		);  
  
function Edit(obj)
{

	
	  var $td=$(obj).parents('tr').children('td');
	  $('#newsId').val($td.eq(1).text());
	  $('#title').val($td.eq(2).text());
	  $('#author').val($td.eq(3).text());
	
	$('#edit').modal('show');
}

function Delete(obj)
{
	 var $td=$(obj).parents('tr').children('td');
	  var newsId=$td.eq(1).text();
	  layer.confirm('确认删除?删除后将不能恢复', {
          btn: ['确认','取消'] //按钮
      }, function(index){
          layer.msg('已成功删除', {icon: 1,time:200000});
	   $.ajax({
		   type:"post",
		   url:"Adminnews/deleteNews",
		   data:"newsId="+newsId,
		  // dataType:'html', 
		   contentType: "application/x-www-form-urlencoded; charset=utf-8",  
		   success:function(data)
		   {
		    alert('删除成功');
		  
		   }
	   
		   });
      }, function(index){
          layer.msg('已取消删除', {
              time: 2000 //2s后自动关闭
             
          });
      
   });
 		
	
}


