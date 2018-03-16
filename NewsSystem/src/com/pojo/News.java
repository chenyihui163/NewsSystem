package com.pojo;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

public class News implements Serializable{
	/*
	 * 新闻编号newsId
新闻题目titile
新闻内容content
新闻发布时间publishDate
新闻作者author
新闻类型编号typeId
新闻类型typeName
新闻点击率click
新闻头条isHead
新闻图片编号isImage
新闻图片名字imageName
新闻热点isHot

	 */
	private int newsId;
	private String title;
	private String content;
	
	private String publishDate;
	private String author;	
	private int typeId;
	
	private int click=0;
	private int isHead;
	private String isImage;
	private String imageName;
	private int isHot;
	private List<Comment> comments;
	private NewsType newsType;
	
	public News()
	{
		super();
	}
	
	public News(String title,String content,String publishDate,String author,int typeId,int isHead,String isImage,String imageName,int isHot,int click)
	
	{
		super();
		
		this.title=title;
		this.content=content;
		//this.publishDate= publishDate;
		this.author=author;
		this.typeId=typeId;
		this.publishDate=publishDate;
		this.click=click;
		
		this.isHead=isHead;
		this.isImage=isImage;
		this.imageName=imageName;
		this.isHot=isHot;
	}
    
	public void Set(String title,String publishDate,String author,int typeId,int isHead,int isHot)
	{
		
		this.title=title;
		this.publishDate=publishDate;
		this.author=author;
		this.typeId=typeId;
		this.isHead=isHead;
		this.isHot=isHot;
		
	}


	

	
	public int getNewsId() {
		return newsId;
	}

	public void setNewsId(int newsId) {
		this.newsId = newsId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getPublishDate() {
		return publishDate;
	}

	public void setPublishDate(String publishDate) {
		this.publishDate = publishDate;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public int getTypeId() {
		return typeId;
	}

	public void setTypeId(int typeId) {
		this.typeId = typeId;
	}

	public int getClick() {
		return click;
	}

	public void setClick(int click) {
		this.click = click;
	}

	public int getIsHead() {
		return isHead;
	}

	public void setIsHead(int isHead) {
		this.isHead = isHead;
	}

	public String getIsImage() {
		return isImage;
	}

	public void setIsImage(String isImage) {
		this.isImage = isImage;
	}

	public String getImageName() {
		return imageName;
	}

	public void setImageName(String imageName) {
		this.imageName = imageName;
	}

	public int getIsHot() {
		return isHot;
	}

	public void setIsHot(int isHot) {
		this.isHot = isHot;
	}

	public List<Comment> getComments() {
		return comments;
	}

	public void setComments(List<Comment> comments) {
		this.comments = comments;
	}

	public NewsType getNewsType() {
		return newsType;
	}

	public void setNewsType(NewsType newsType) {
		this.newsType = newsType;
	}

	public void getAll()
	{
		System.out.println(newsId+" "+author+" "+content+" "+newsType);
	}

	
	

}
