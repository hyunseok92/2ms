package org.ict.lms.formdata.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class FormData implements Serializable{
	private static final long serialVersionUID = 8157284301908426012L;
	
	private String form_no;
	private String form_title;
	private String form_author;
	private Date form_date;
	private String form_content;
	private int readcount;
	private String originalfilename;
	private String renamefilename;
	private String form_author_name;
	public FormData() {
		super();
	}
	public FormData(String form_no, String form_title, String form_author, Date form_date, String form_content,
			int readcount, String originalfilename, String renamefilename, String form_author_name) {
		super();
		this.form_no = form_no;
		this.form_title = form_title;
		this.form_author = form_author;
		this.form_date = form_date;
		this.form_content = form_content;
		this.readcount = readcount;
		this.originalfilename = originalfilename;
		this.renamefilename = renamefilename;
		this.form_author_name = form_author_name;
	}
	public String getForm_no() {
		return form_no;
	}
	public void setForm_no(String form_no) {
		this.form_no = form_no;
	}
	public String getForm_title() {
		return form_title;
	}
	public void setForm_title(String form_title) {
		this.form_title = form_title;
	}
	public String getForm_author() {
		return form_author;
	}
	public void setForm_author(String form_author) {
		this.form_author = form_author;
	}
	public Date getForm_date() {
		return form_date;
	}
	public void setForm_date(Date form_date) {
		this.form_date = form_date;
	}
	public String getForm_content() {
		return form_content;
	}
	public void setForm_content(String form_content) {
		this.form_content = form_content;
	}
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	public String getOriginalfilename() {
		return originalfilename;
	}
	public void setOriginalfilename(String originalfilename) {
		this.originalfilename = originalfilename;
	}
	public String getRenamefilename() {
		return renamefilename;
	}
	public void setRenamefilename(String renamefilename) {
		this.renamefilename = renamefilename;
	}
	public String getForm_author_name() {
		return form_author_name;
	}
	public void setForm_author_name(String form_author_name) {
		this.form_author_name = form_author_name;
	}
	@Override
	public String toString() {
		return "FormData [form_no=" + form_no + ", form_title=" + form_title + ", form_author=" + form_author
				+ ", form_date=" + form_date + ", form_content=" + form_content + ", readcount=" + readcount
				+ ", originalfilename=" + originalfilename + ", renamefilename=" + renamefilename
				+ ", form_author_name=" + form_author_name + "]";
	}
	
	
	
	
}
