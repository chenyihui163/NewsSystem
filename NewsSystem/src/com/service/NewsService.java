package com.service;

import java.util.List;

import com.pojo.News;

public interface NewsService {
	boolean insertNews(News news);
	boolean updateNews(News news);
	boolean deleteNews(int newsId);
	List<News> findAllNews();
	News selectNewsById(int newsId);
	void CountClick(int newsId);
	List<News> findHotNews();
	List<News> findHeadNews();
	
}
