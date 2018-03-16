package com.service;

import java.util.List;

import com.pojo.Comment;

public interface CommentService {
	 boolean insertComment(Comment comment);
	boolean deleteComment(int commentId);
	List<Comment> findAllComment();
    Comment selectCommentById(int commentId);
	

}
