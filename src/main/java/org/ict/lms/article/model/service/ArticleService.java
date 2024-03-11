package org.ict.lms.article.model.service;

import java.util.ArrayList;

import org.ict.lms.article.model.vo.Article;

public interface ArticleService {
	public ArrayList<Article> selectFirstCate();
	public ArrayList<Article> selectSecondCate();
	public ArrayList<Article> selectThirdCate();
	public ArrayList<Article> selectFourthCate();
	public ArrayList<Article> selectFifthCate();
	public ArrayList<Article> selectArticleCategory();
}
