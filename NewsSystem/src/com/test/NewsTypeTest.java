package com.test;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;

import com.factory.FKSqlSessionFactory;
import com.mapper.NewsTypeMapper;
import com.pojo.News;
import com.pojo.NewsType;

public class NewsTypeTest {
	
	SqlSession session = FKSqlSessionFactory.getSqlSession();
	NewsTypeMapper n=session.getMapper(NewsTypeMapper.class);
	@Test
	public void Add()
	{
		NewsType mm=new NewsType("体育1");
		n.insertNewsType(mm);
		// 提交事务
					session.commit();
					// 关闭Session
					session.close();
	}
	@Test
	public void selectNews()
	{
		NewsType mm=n.selectNewsTypeById(2);
		List<News> newss=mm.getNewss();
		for(News nn:newss)
			System.out.println(nn.getAuthor());
	}

}
