package com.test;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;

import com.factory.FKSqlSessionFactory;
import com.mapper.NewsMapper;
import com.pojo.Comment;
import com.pojo.News;

public class NewsTest {
	// 获得Session实例
	
	SqlSession session = FKSqlSessionFactory.getSqlSession();
	NewsMapper newsMapper=session.getMapper(NewsMapper.class);
	@Test
	public void Select()
	{
		
		//News news=new News()
		//News news=new News("喜迎十七大","fjiefeij","chenyihui",1,3,1,1,"十九大",1);
		
		//newsMapper.insertNews(news);
	
	   News news1= newsMapper.selectNewsById(1);
	   
	  /* List<Comment> comments=news1.getComment();
	    System.out.println(news1.getTitle());
	   for(Comment comm:comments)
		   System.out.println(comm.getCommentDate());*/
	   
	   System.out.println(news1.getNewsType().getTypeName());
	       // 提交事务
			session.commit();
			// 关闭Session
			session.close();
	
    }
	

	
	
	
}
