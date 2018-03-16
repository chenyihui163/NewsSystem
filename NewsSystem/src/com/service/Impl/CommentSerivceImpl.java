package com.service.Impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.mapper.CommentMapper;
import com.pojo.Comment;
import com.service.CommentService;


/**
 * 服务层接口实现类
 * @Service("newsService")用于将当前类注释为一个Spring的bean，名为newsService
 * */
@Service("commentService")  
@Transactional  
//此处不再进行创建SqlSession和提交事务，都已交由spring去管理了。
public class CommentSerivceImpl implements CommentService {

	
	@Resource
	private CommentMapper commentMapper;
	
	public boolean insertComment(Comment comment) {
		// TODO Auto-generated method stub
		return commentMapper.insertComment(comment);
	}

	
	public boolean deleteComment(int commentId) {
		// TODO Auto-generated method stub
		return commentMapper.deleteComment(commentId);
	}

	public List<Comment> findAllComment() {
		// TODO Auto-generated method stub
		return commentMapper.findAllComment();
	}

	
	public Comment selectCommentById(int commentId) {
		// TODO Auto-generated method stub
		return commentMapper.selectCommentById(commentId);
	}

}
