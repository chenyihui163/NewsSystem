package com.controller.User;


import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pojo.Comment;
import com.pojo.Link;
import com.pojo.News;
import com.pojo.NewsType;
import com.pojo.User;
import com.service.*;

@Controller
@RequestMapping("/news")
public class NewsController1 {
	
	@Autowired
	
	private NewsService newsService;
	@Autowired
	private NewsTypeService newsTypeService;
	
	@Autowired
	private LinkService linkService;
	
	@RequestMapping("/getAllNews")
	public String getAllNews(Model model,HttpServletRequest request)
	{
		List<News> newsList =newsService.findAllNews();
		List<News> headList=newsService.findHeadNews();
		List<News> hotList=newsService.findHotNews();
		List<Link> linkList=linkService.findAllLink();
		request.setAttribute("headList", headList);
		request.setAttribute("hotList", headList);
		model.addAttribute("newsList" ,newsList);
	    model.addAttribute("linkList",linkList);
		List<NewsType> newsTypeList = newsTypeService.findAlllNewstype();
		model.addAttribute("newsTypeList",newsTypeList);
		
		for(News news:headList)
		{
			System.out.println(news.getAuthor()+" "+news.getTitle());
		}
		for(News news:hotList)
		{
			System.out.println(news.getAuthor()+" "+news.getTitle());
		}
		return "main";
	}
	
	
	@RequestMapping("/getNews")
	public String getNews(int newsId,Model model,HttpServletRequest request)
	{
		newsService.CountClick(newsId);
		News news= newsService.selectNewsById(newsId);
	
		model.addAttribute("news",newsService.selectNewsById(newsId));
		NewsType type=newsTypeService.selectNewsTypeById( news.getTypeId());
		System.out.println(type.getTypeName());
		request.setAttribute("typeName", type.getTypeName());
		
		for(Comment comment:news.getComments())
		{
			System.out.println(comment.getCommentId());
		}
		return "news";
	}
	
	
	
	
   
	
	
	
	
	

}

