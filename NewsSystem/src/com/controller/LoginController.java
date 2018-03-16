package com.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.pojo.User;
import com.service.UserService;

@Controller
@RequestMapping("/login")
public class LoginController {
	
	@Autowired
	private UserService userService;

	@RequestMapping("/loginUser")
	public String loginUser(@RequestParam("userId") int userId,
			@RequestParam("password") String password,Model model,HttpSession session)
	{
		System.out.println("成功进入");
		if(userService.selectUserById(userId)!=null)
		{
			User user1=userService.selectUserById(userId);
			if((user1.getPassword()).equals(password))
			{
				session.setAttribute("user", user1);
				System.out.println(user1.getUserId());
				model.addAttribute("message","success");
				if((user1.getUserType()).equals("admin"))
					return "Admin/admin";
				else
					return "redirect:/news/getAllNews";
			}
			else
			{
				model.addAttribute("message","passworderror");
				return "index";
			}
			
		}
		else
		{
			model.addAttribute("message","userIderror");
			return "index";
		}
	}
	
	
	@RequestMapping("/quit")
	public String quit(HttpSession session){  
        // 销毁session  
		 session.removeAttribute("user");
		 return "index"; 
    }  
	

}
