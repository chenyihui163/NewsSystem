package com.service.Impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.mapper.LinkMapper;
import com.pojo.Link;
import com.service.LinkService;

/**
 * 服务层接口实现类
 * @Service("newsService")用于将当前类注释为一个Spring的bean，名为newsService
 * */

@Service("linkService")  
@Transactional  
//此处不再进行创建SqlSession和提交事务，都已交由spring去管理了。
public class LinkServiceImpl implements LinkService{
	@Resource
	private LinkMapper linkMapper;
	public boolean insertLink(Link link)
	{
		return linkMapper.insertLink(link);
	}
	
	public boolean deleteLink(int linkId)
	{
		return linkMapper.deleteLink(linkId);
	}
	
	public boolean updateLink(Link link)
	{
		return linkMapper.updateLink(link);
	}
	
	public List<Link> findAllLink()
	{
		return linkMapper.findAllLink();
	}
	
	public Link selectLinkById(int linkId)
	{
		return  linkMapper.selectLinkById(linkId);
	}
	
	

}
