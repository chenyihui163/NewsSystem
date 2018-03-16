package com.service;

import java.util.List;

import com.pojo.Link;

public interface LinkService {
	
	boolean insertLink(Link link);
	boolean updateLink(Link link);
	boolean deleteLink(int linkId);
	List<Link> findAllLink();
	Link selectLinkById(int linkId);
	

}
