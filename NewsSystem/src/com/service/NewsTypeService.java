package com.service;

import java.util.List;

import com.pojo.NewsType;

public interface NewsTypeService {
	boolean insertNewsType(NewsType newsType);
	boolean deleteNewsType(int typeId);
	List<NewsType> findAlllNewstype();
	NewsType selectNewsTypeById(int typeId);
	

}
