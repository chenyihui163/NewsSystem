package com.controller.User;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.pojo.Comment;
import com.service.CommentService;
@Controller
@RequestMapping("/comment")
public class CommentController1 {
	@Autowired
	private CommentService commentService;
	
/*	@ModelAttribute("comment")
	public Comment commentBean(@RequestParam("newsId") int newsId,@RequestParam("userId") int userId,@RequestParam("commemtDate") String commentDate,@RequestParam("commentContent") String commentContent)
	{
		Comment comment =new Comment(newsId,userId,commentContent,commentDate);
		System.out.println("新建"+" "+newsId+" "+commentDate);
		return comment;
	}*/
	
	
	@RequestMapping("/getAllComment")
	public String getAllComment(Model model)
	{
		List<Comment> commentList=commentService.findAllComment();
		model.addAttribute("commentList", commentList);
		return "allComment";
	}
	
	@RequestMapping("/toAddComment")
	public String toAddComment()
	{
		return "addComment";
	}
	@RequestMapping("/addComment")
	public void addComment( HttpServletRequest request,HttpServletResponse response)
	{
		int newsId=Integer.valueOf(request.getParameter("newsId"));
		int userId=Integer.valueOf(request.getParameter("userId"));
		String commentContent=request.getParameter("commentContent");
		String commentDate=request.getParameter("commentDate");
		Comment comment =new Comment(newsId,userId,commentContent,commentDate);
		System.out.println("增加评论");
		System.out.println(comment.getCommentContent());
		String result="{\"result\":\"error\"}";
		if(commentService.insertComment(comment))
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

