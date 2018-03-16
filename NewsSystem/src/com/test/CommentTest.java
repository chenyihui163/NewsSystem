package com.test;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;

import com.factory.FKSqlSessionFactory;
import com.mapper.CommentMapper;
import com.mapper.NewsMapper;
import com.pojo.Comment;
import com.pojo.News;
import com.util.*;
public class CommentTest {
	SqlSession session = FKSqlSessionFactory.getSqlSession();

	@Test
	public void CommentSelect()
	{
		CommentMapper commentMapper=session.getMapper(CommentMapper.class);
		Comment comment=commentMapper.selectCommentById(1);
		//System.out.println(comment.getCommentId()+" "+comment.getNewsId()+" "+comment.getUserId()+" "+DateUtil.formatDate(comment.getCommentDate()));
		System.out.println(comment.getNews().getAuthor());
		/*News news=new News();
		news=comment.getNews();
		//System.out.println(news.getAuthor());
		news.getAll();*/
		
	       // 提交事务
				session.commit();
				// 关闭Session
				session.close();
	}
	
	@Test
	public void Add()
	{
		CommentMapper commentMapper=session.getMapper(CommentMapper.class);
		//Comment comment=new Comment(1,2,"快乐jiijjoijio");
	//	commentMapper.insertComment(comment);
		//System.out.println(comment);

	       // 提交事务
				session.commit();
				// 关闭Session
				session.close();
				
		
	}

}
