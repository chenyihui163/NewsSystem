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

import com.pojo.Comment;
import com.service.CommentService;
@Controller
@RequestMapping("/Admincomment")
public class CommentController {
	@Autowired
	private CommentService commentService;
	
	@RequestMapping("/getAllComment")
	public String getAllComment(Model model)
	{
		List<Comment> commentList=commentService.findAllComment();
		model.addAttribute("commentList", commentList);
		return "AdminAllComment";
	}
	
	@RequestMapping("/toAddComment")
	public String toAddComment()
	{
		return "AdminAddComment";
	}
	
	@RequestMapping("/addComment")
	public String addComment(Comment comment)
	{
		commentService.insertComment(comment);
		return "redirect:/Admincomment/getAllComment";
	}
	
	
	@RequestMapping("/getComment")
	public String getComment(int commentId,Model model)
	{
		model.addAttribute("comment",commentService.selectCommentById(commentId));
		return "/AdminEditComment";
	}
	
	@RequestMapping("/deleteComment")
	public void deleteComment(int commentId,HttpServletRequest request,HttpServletResponse response)
	{
		String result="{\"result\":\"error\"}";
		if(commentService.deleteComment(commentId))
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
