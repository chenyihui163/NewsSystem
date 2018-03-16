package com.controller.Admin;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;


import org.springframework.web.portlet.ModelAndView;

import com.pojo.News;
import com.service.NewsService;
import com.service.NewsTypeService;


@Controller
@RequestMapping("/Adminnews")
public class NewsController {
	
	@Autowired
	
	private NewsService newsService;
	
	@Autowired
	private NewsTypeService newsTypeService;
	
	@RequestMapping("/getAllNews")
	public String getAllNews(Model model)
	{
		
		List<News> newsList =newsService.findAllNews();
		for(News news:newsList)
		{
			//System.out.println(news.getNewsType().getTypeName());
		}
		
		model.addAttribute("newsList" ,newsList);
		return "Admin/AdminAllNews";
	}
	
	@RequestMapping("/toAddNews")
	public String toAddNews()
	{
		return "Admin/ToAddNews";
	}
	
	
	// 上传文件会自动绑定到MultipartFile中
		 @RequestMapping(value="/upload",method=RequestMethod.POST)
		 public String upload(HttpServletRequest request,
		
				@RequestParam("file") MultipartFile file) throws Exception{
	   
			
				// 上传文件路径
				String path = request.getServletContext().getRealPath(
		                "/images/");
				// 上传文件名
				String filename = file.getOriginalFilename();
			    File filepath = new File(path,filename);
				// 判断路径是否存在，如果不存在就创建一个
		        if (!filepath.getParentFile().exists()) { 
		        	filepath.getParentFile().mkdirs();
		        }
		        // 将上传文件保存到一个目标文件当中
				file.transferTo(new File(path+File.separator+ filename));
				System.out.println("上传成功");
			return "error";
		 }

			 
		 
	// 上传文件会自动绑定到MultipartFile中
	@RequestMapping(value="/addNews",method=RequestMethod.POST)
	public String addNews(HttpServletRequest request,@RequestParam("file") MultipartFile file)throws Exception
	{
        
         String title=request.getParameter("title");
         String author=request.getParameter("author");
         int isHead=Integer.valueOf(request.getParameter("isHead"));
         int isHot=Integer.valueOf(request.getParameter("isHot"));
         String publishDate=request.getParameter("publishDate");
         String content=request.getParameter("content");
         int typeId=Integer.valueOf(request.getParameter("typeId"));
	
         // 上传文件路径
			String isImage = request.getServletContext().getRealPath(
	                "/images/");
			// 上传文件名
			String imageName = file.getOriginalFilename();
		    File filepath = new File(isImage,imageName);
			// 判断路径是否存在，如果不存在就创建一个
	        if (!filepath.getParentFile().exists()) { 
	        	filepath.getParentFile().mkdirs();
	        }
	        
	        // 将上传文件保存到一个目标文件当中
			file.transferTo(new File(isImage+File.separator+ imageName));
		   System.out.println("上传成功");
		   System.out.println(imageName);
			
			//
		  int click=0;//设置点击率为0
		News  news=new News(title,content,publishDate,author,typeId,isHead,isImage,imageName,isHot,click);
		newsService.insertNews(news);
		
		return "redirect:/Adminnews/getAllNews";
	}
		
	
	
	@RequestMapping(value="/updateNews",method=RequestMethod.POST)
	public String updateNews(Model model,HttpServletRequest request)
	{
		int newsId=Integer.valueOf(request.getParameter("newsId"));
		String title=request.getParameter("title");
		String author=request.getParameter("author");
		 int isHead=Integer.valueOf(request.getParameter("isHead"));
         int isHot=Integer.valueOf(request.getParameter("isHot"));
         String publishDate=request.getParameter("publishDate");
         int typeId=Integer.valueOf(request.getParameter("typeId"));
         News news=newsService.selectNewsById(newsId);
         news.Set( title, publishDate,author, typeId, isHead, isHot);//更改数据
		if(newsService.updateNews(news))
		{
			news=newsService.selectNewsById(news.getNewsId());
			model.addAttribute("news",news);
			return "redirect:/Adminnews/getAllNews";
		}
		else
		{
			return "/error";
		}
	}
	
	@RequestMapping(value="/getNews", method=RequestMethod.POST )
	public void getNews(int newsId,Model model, HttpServletResponse response)
	{
		   
		News news=newsService.selectNewsById(newsId);
		model.addAttribute("news",news);
		
	}
	
	@RequestMapping("/deleteNews")
	public String deleteNews(@RequestParam("newsId") int newsId,HttpServletRequest request,HttpServletResponse response)
	{
		
		String result="{\"result\":\"error\"}";
		if(newsService.deleteNews(newsId))
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
		
		return "redirect:/Adminnews/getAllNews";
	}

}
