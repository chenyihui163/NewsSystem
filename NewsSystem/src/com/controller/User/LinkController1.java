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

import com.pojo.Link;
import com.service.LinkService;;
@Controller
@RequestMapping("/link")
public class LinkController1 {
	@Autowired
	private LinkService linkService;
	@RequestMapping("getAllLink")
	public String getAllComment(Model model)
	{
		List<Link> linkList=linkService.findAllLink();
		model.addAttribute("linkList", linkList);
		return "AllLink";
	}
	

	
}
