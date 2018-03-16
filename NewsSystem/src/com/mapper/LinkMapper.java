package com.mapper;

import java.util.List;

import com.pojo.Link;

public interface LinkMapper {
	
	boolean insertLink(Link link);
	boolean updateLink(Link link);
	boolean deleteLink(int linkId);
	List<Link> findAllLink();
	Link selectLinkById(int linkId);

}
