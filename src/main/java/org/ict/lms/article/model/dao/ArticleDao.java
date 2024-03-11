package org.ict.lms.article.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.ict.lms.article.model.vo.Article;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("articleDao")
public class ArticleDao {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public ArrayList<Article> selectFirstCate(){
		List<Article> list = sqlSessionTemplate.selectList("articleMapper.selectFirstCate");
		return (ArrayList<Article>)list;
	}
	
	public ArrayList<Article> selectSecondCate(){
		List<Article> list = sqlSessionTemplate.selectList("articleMapper.selectSecondCate");
		return (ArrayList<Article>)list;
	}
	
	public ArrayList<Article> selectThirdCate(){
		List<Article> list = sqlSessionTemplate.selectList("articleMapper.selectThirdCate");
		return (ArrayList<Article>)list;
	}
	
	public ArrayList<Article> selectFourthCate(){
		List<Article> list = sqlSessionTemplate.selectList("articleMapper.selectFourthCate");
		return (ArrayList<Article>)list;
	}
	
	public ArrayList<Article> selectFifthCate(){
		List<Article> list = sqlSessionTemplate.selectList("articleMapper.selectFifthCate");
		return (ArrayList<Article>)list;
	}
	
	public ArrayList<Article> selectArticleCategory(){
		List<Article> list = sqlSessionTemplate.selectList("articleMapper.selectArticleCategory");
		return (ArrayList<Article>)list;
	}
}
