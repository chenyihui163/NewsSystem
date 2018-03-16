package com.mapper;

import java.util.List;

import com.pojo.Comment;

public interface CommentMapper {
	boolean insertComment(Comment comment);
	boolean deleteComment(int commentId);
	List<Comment> findAllComment();
    Comment selectCommentById(int commentId);
	//Comment selectCommentBynewsId(int newsId);
	

}
