package com.example.spring.demo.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.spring.demo.dto.Article;
import com.example.spring.demo.service.ArticleService;

@Controller
public class ArticleController {
	@Autowired
	ArticleService articleService;

	@RequestMapping("/article/getArticles")
	@ResponseBody
	public List<Article> getArticles() {
		List<Article> articles = articleService.getArticles();

		return articles;
	}

	@RequestMapping("/article/list")
	public String showList(Model model) {
		List<Article> articles = articleService.getArticles();

		model.addAttribute("articles", articles);
		return "article/list";
	}

	@RequestMapping("/article/write")
	public String showWrite() {
		return "article/write";
	}

	@RequestMapping("/article/doWrite")
	public String doWrite(Model model, @RequestParam Map<String, Object> param) {
		Map<String, Object> rs = articleService.write(param);

		String redirectUrl = "/article/detail?id=" + rs.get("id");

		model.addAttribute("jsAlertMsg", rs.get("msg"));
		model.addAttribute("jsLocationReplaceUrl", redirectUrl);

		return "redirect";
	}

	@RequestMapping("/article/detail")
	public String showDetail(Model model, int id) {
		Article article = articleService.getArticle(id);

		model.addAttribute("article", article);
		return "article/detail";
	}

	@RequestMapping("/article/modify")
	public String showModify(Model model, int id) {
		Article article = articleService.getArticle(id);

		model.addAttribute("article", article);
		return "article/modify";
	}

	@RequestMapping("/article/doModify")
	public String doModify(Model model, @RequestParam Map<String, Object> param) {
		Map<String, Object> rs = articleService.modify(param);
		
		model.addAttribute("jsLocationReplaceUrl", "/article/detail?id=" + rs.get("id"));
		model.addAttribute("jsAlert", rs.get("msg"));

		return "redirect";
	}
	
	@RequestMapping("/article/doDelete")
	public String doDelete(Model model, int id) {
		Map<String, Object> rs = articleService.remove(id);

		model.addAttribute("jsLocationReplaceUrl", "/article/list?id=" + rs.get("id"));
		model.addAttribute("jsAlert", rs.get("msg"));

		return "redirect";
	}
}
