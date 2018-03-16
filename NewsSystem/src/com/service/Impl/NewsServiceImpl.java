package com.service.Impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.mapper.NewsMapper;
import com.pojo.News;
import com.service.NewsService;
/**
 * 服务层接口实现类
 * @Service("newsService")用于将当前类注释为一个Spring的bean，名为newsService
 * */

@Service("newsService")  
@Transactional  
//此处不再进行创建SqlSession和提交事务，都已交由spring去管理了。
public class NewsServiceImpl implements NewsService {
	/**
	 * 自动注入newsMapper
	 * */
	@Resource
	private NewsMapper newsMapper;
	
	public boolean insertNews(News news)
	{
		return newsMapper.insertNews(news);
	}
	
	public boolean updateNews(News news)
	{
		return newsMapper.updateNews(news);
	}
	
	public boolean deleteNews(int newsId)
	{
		return newsMapper.deleteNews(newsId);
	}
	
	public List<News> findAllNews()
	{
		return newsMapper.findAllNews();
	}
	
	public News selectNewsById(int newsId)
	{
		return newsMapper.selectNewsById(newsId);
	}
	public void CountClick(int newsId)
	{
		newsMapper.CountClick(newsId);
	}
	public List<News> findHotNews()
	{
		return newsMapper.findHotNews();
	}
    public 	List<News> findHeadNews()
    {
    	return newsMapper.findHeadNews();
    }
	

}
