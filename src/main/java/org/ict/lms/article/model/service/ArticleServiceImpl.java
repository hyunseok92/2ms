package org.ict.lms.article.model.service;

import java.util.ArrayList;

import org.ict.lms.article.model.dao.ArticleDao;
import org.ict.lms.article.model.vo.Article;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("articleService")
public class ArticleServiceImpl implements ArticleService {
	
	@Autowired
	private ArticleDao articleDao;

	public ArticleServiceImpl() {}
	
	@Override
	public ArrayList<Article> selectFirstCate() {
		return articleDao.selectFirstCate();
	}
	
	@Override
	public ArrayList<Article> selectSecondCate() {
		return articleDao.selectSecondCate();
	}
	
	@Override
	public ArrayList<Article> selectThirdCate() {
		return articleDao.selectThirdCate();
	}
	
	@Override
	public ArrayList<Article> selectFourthCate() {
		return articleDao.selectFourthCate();
	}
	
	@Override
	public ArrayList<Article> selectFifthCate() {
		return articleDao.selectFifthCate();
	}
	
	@Override
	public ArrayList<Article> selectArticleCategory() {
		return articleDao.selectArticleCategory();
	}
}
