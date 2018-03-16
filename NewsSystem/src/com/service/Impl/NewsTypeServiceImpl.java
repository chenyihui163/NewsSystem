package com.service.Impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.mapper.NewsTypeMapper;
import com.pojo.NewsType;
import com.service.NewsTypeService;
/**
 * 服务层接口实现类
 * @Service("newsService")用于将当前类注释为一个Spring的bean，名为newsService
 * */

@Service("newsTypeService")  
@Transactional  
//此处不再进行创建SqlSession和提交事务，都已交由spring去管理了。
public class NewsTypeServiceImpl implements NewsTypeService {

	
	@Resource
	private NewsTypeMapper newsTypeMapper;
	
	public boolean insertNewsType(NewsType newsType) {
		// TODO Auto-generated method stub
		return newsTypeMapper.insertNewsType(newsType);
	}

	
	public boolean deleteNewsType(int typeId) {
		// TODO Auto-generated method stub
		return newsTypeMapper.deleteNewsType(typeId);
	}

	
	public List<NewsType> findAlllNewstype() {
		// TODO Auto-generated method stub
		return newsTypeMapper.findAlllNewstype();
	}

	
	public NewsType selectNewsTypeById(int typeId) {
		// TODO Auto-generated method stub
		return newsTypeMapper.selectNewsTypeById(typeId);
	}

}
