package com.controller.User;



import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pojo.News;
import com.pojo.NewsType;
import com.service.NewsTypeService;

@Controller
@RequestMapping("/newsType")
public class NewsTypeController1 {
	
	@Autowired
	private NewsTypeService newsTypeService;
	
	@RequestMapping("/getAllNewsType")
	public void getAllNewsType(Model model)
	{
		List<NewsType> newsTypeList = newsTypeService.findAlllNewstype();
		model.addAttribute("newsTypeList",newsTypeList);
		
	}
	
	@RequestMapping("/getAllnews")
	public String getAllnews(Model model,int typeId)
	{
		NewsType type=newsTypeService.selectNewsTypeById(typeId);	
		model.addAttribute("typeName",type.getTypeName());
		List<News> newsList=type.getNewss();
		model.addAttribute("newsList",newsList);
		return "newsType";
	}
}