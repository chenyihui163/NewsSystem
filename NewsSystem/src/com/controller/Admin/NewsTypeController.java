package com.controller.Admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pojo.NewsType;
import com.service.NewsTypeService;

@Controller
@RequestMapping("/AdminnewsType")
public class NewsTypeController {
	
	@Autowired
	private NewsTypeService newsTypeService;
	
	@RequestMapping("/getAllNewsType")
	public String getAllNewsType(Model model)
	{
		List<NewsType> newsTypeList = newsTypeService.findAlllNewstype();
		model.addAttribute("newsTypeList",newsTypeList);
		return "AdminAllnewsType";
	}
	
	@RequestMapping("/toAddNewsType")
	public String toAddNewsType()
	{
		return "AdminAddNewsType";
	}
	
	@RequestMapping("/addNewsType")
	public String addNewsType(NewsType newsType)
	{
		newsTypeService.insertNewsType(newsType);
		return "redirect:/AdminnewsType/getAllNewsType";
	}
	
	@RequestMapping("/deleteNews")
	public void deleteNews(int typeId,HttpServletRequest request,HttpServletResponse response)
	{
		String result="{\"result\":\"error\"}";
		if(newsTypeService.deleteNewsType(typeId))
		{
			result="{\"result:\":\"success\"}";
		}
		response.setContentType("application/json");
		try {  
            PrintWriter out = response.getWriter();  
            out.write(result);  
        } catch (IOException e) {  
            e.printStackTrace();  
        }  
	}
	
	

}
