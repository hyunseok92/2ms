package org.ict.lms.article.model.vo;

import java.io.Serializable;

public class Article implements Serializable {

	private static final long serialVersionUID = -8216410078992786777L;
	
	private String category;
	private String title;
	private String content;
	private String urlAddress;
	
	public Article() {
		super();
	}
	public Article(String category, String title, String content, String urlAddress) {
		super();
		this.category = category;
		this.title = title;
		this.content = content;
		this.urlAddress = urlAddress;
	}
	@Override
	public String toString() {
		return "Article [category=" + category + ", title=" + title + ", content=" + content + ", urlAddress="
				+ urlAddress + "]";
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
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
	public String getUrlAddress() {
		return urlAddress;
	}
	public void setUrlAddress(String urlAddress) {
		this.urlAddress = urlAddress;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
}
