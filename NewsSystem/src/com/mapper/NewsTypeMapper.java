package com.mapper;

import java.util.List;

import com.pojo.NewsType;

public interface NewsTypeMapper {
	
	boolean insertNewsType(NewsType newsType);
	boolean deleteNewsType(int typeId);
	List<NewsType> findAlllNewstype();
	NewsType selectNewsTypeById(int typeId);

}
