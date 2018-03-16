package com.test;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.mapper.NewsMapper;
import com.mapper.NewsTypeMapper;
import com.pojo.News;
import com.pojo.NewsType;
import com.service.NewsService;
import com.service.NewsTypeService;


@RunWith(SpringJUnit4ClassRunner.class)     //表示继承了SpringJUnit4ClassRunner类  
@ContextConfiguration("/config/spring-common.xml")
public class NewsTest1 {
	//  private static Logger logger = Logger.getLogger(NewsTest1.class);  
	@Autowired
	private NewsTypeMapper n;
	
	@Test
	public void add()
	{
	NewsType m=new NewsType("情感");
	n.insertNewsType(m);
	System.out.println("增加成功");
	}

}
