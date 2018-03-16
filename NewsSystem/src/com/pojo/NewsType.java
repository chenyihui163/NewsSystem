package com.pojo;

import java.io.Serializable;
import java.util.List;

public class NewsType implements Serializable {
	private int typeId;
	private String typeName;
	
	private List<News> newss;
	public NewsType()
	{
		super();
	}
	public NewsType(String typeName)
	{
		super();
		this.typeName=typeName;
	}
	public int getTypeId() {
		return typeId;
	}
	public void setTypeId(int typeId) {
		this.typeId = typeId;
	}
	public String getTypeName() {
		return typeName;
	}
	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}
	public List<News> getNewss() {
		return newss;
	}
	public void setNewss(List<News> newss) {
		this.newss = newss;
	}
	
	

}
