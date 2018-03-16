package com.pojo;

import java.io.Serializable;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class Comment implements Serializable {
	/*
	 * 评论编号commentId
新闻编号newsId
新闻题目newsTitle
新闻内容content
评论者账号 userId
评论时间commentDate

	 */
	private News news;
	private int commentId;
	private int newsId;
	private int userId;
	private String commentContent;
	
	private String commentDate;
	//新闻和评论是一对多的关系
	
	public Comment()
	{
		super();
	}
	public Comment(int newsId,int userId,String commentContent,String commentDate)
	{
		super();
		
		this.newsId = newsId;
		this.commentDate=commentDate;
		this.userId = userId;
		this.commentContent=commentContent;
		
	}
	public News getNews() {
		return news;
	}
	public void setNews(News news) {
		this.news = news;
	}
	public int getCommentId() {
		return commentId;
	}
	public void setCommentId(int commentId) {
		this.commentId = commentId;
	}
	public int getNewsId() {
		return newsId;
	}
	public void setNewsId(int newsId) {
		this.newsId = newsId;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getCommentContent() {
		return commentContent;
	}
	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
	}
	public String getCommentDate() {
		return commentDate;
	}
	public void setCommentDate(String commentDate) {
		this.commentDate = commentDate;
	}

	
	

}
