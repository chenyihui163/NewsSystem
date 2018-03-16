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

import com.pojo.Link;
import com.service.LinkService;;
@Controller
@RequestMapping("/Adminlink")
public class LinkController {
	@Autowired
	private LinkService linkService;
	@RequestMapping("getAllLink")
	public String getAllComment(Model model)
	{
		List<Link> linkList=linkService.findAllLink();
		model.addAttribute("linkList", linkList);
		return "AdminAllLink";
	}
	
	@RequestMapping("/toAddLink")
	public String toAddLink()
	{
		return "AdminAddLink";
	}
	
	@RequestMapping("/addLink")
	public String addLink(Link link)
	{
		linkService.insertLink(link);
		return "redirect:/Adminlink/getAllComment";
		
	}
	
	@RequestMapping("/updateLink")
	public String updateLink(Link link,Model model)
	{
		if(linkService.updateLink(link))
		{
			link=linkService.selectLinkById(link.getLinkId());
			model.addAttribute("link", link);
			return "redirect:/Adminlink/getAllLink";
		}
		else
			return "/error";
	}
	
	@RequestMapping("/getLink")
	public String getLink(int linkId,Model model)
	{
		model.addAttribute("link" ,linkService.selectLinkById(linkId));
		return "/AdminEditLink";
	}
	
	@RequestMapping("/deleteLink")
	public void deleteLink(int linkId,HttpServletRequest request,HttpServletResponse response)
	{
		String result="{\"result\":\"error\"}";
		if(linkService.deleteLink(linkId))
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
