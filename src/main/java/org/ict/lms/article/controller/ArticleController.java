package org.ict.lms.article.controller;

import java.util.ArrayList;

import org.ict.lms.article.model.service.ArticleService;
import org.ict.lms.article.model.vo.Article;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ArticleController {
	@Autowired
	private ArticleService articleService;
	
	@RequestMapping("itNews.do")
	public String formList(Model model) {
		ArrayList<Article> cateOfFirst = articleService.selectFirstCate();
		ArrayList<Article> cateOfSecond = articleService.selectSecondCate();
		ArrayList<Article> cateOfThird = articleService.selectThirdCate();
		ArrayList<Article> cateOfFourth = articleService.selectFourthCate();
		ArrayList<Article> cateOfFifth = articleService.selectFifthCate();
		
		ArrayList<Article> cateList = articleService.selectArticleCategory();
		
		model.addAttribute("cateOfFirst", cateOfFirst);
		model.addAttribute("cateOfSecond", cateOfSecond);
		model.addAttribute("cateOfThird", cateOfThird);
		model.addAttribute("cateOfFourth", cateOfFourth);
		model.addAttribute("cateOfFifth", cateOfFifth);
		model.addAttribute("cateList", cateList);
		return "itNews/itNewsList";
	}
}
