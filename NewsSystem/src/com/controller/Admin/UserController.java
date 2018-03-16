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

import com.pojo.User;
import com.service.UserService;

@Controller
@RequestMapping("/Adminuser")
public class UserController {
	@Autowired
	private UserService userService;
	
	@RequestMapping("/getAllUser")
	public String getAllUser(Model model)
	{
		List<User> userList=userService.findAllUser();
		model.addAttribute("userList",userList);
		return "AdminAllUser";
	}
	
	@RequestMapping("/toAddUser")
	public String toAddUser()
	{
		return "AdminaddUser";
	}
	
	@RequestMapping("/addUser")
	public String addUser(User user)
	{
		userService.insertUser(user);
		return "redirect:/Adminuser/getAllUser";
	}
	
	@RequestMapping("/updateUser")
	public String updateUser(int userId,Model model)
	{
		if(userService.updateUser(userId))
		{
			User user=userService.selectUserById(userId);
			model.addAttribute("user",user);
			return "redirect:/Adminuser/getAllUser";
		}
		else
		{
			return "/error";
		}
	}
	
	@RequestMapping("/getUser")
	public String getUser(int userId,Model model)
	{
		model.addAttribute("user",userService.selectUserById(userId));
		return "/AdminEditUser";
	}
	
	@RequestMapping("/deleteUser")
	public void deleteUser(int userId,HttpServletRequest request,HttpServletResponse response)
	{
		String result="{\"result\":\"error\"}";
		if(userService.deleteUser(userId))
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
