package com.example.spring.demo.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.example.spring.demo.dto.Article;

@Mapper
public interface ArticleDao {

	List<Article> getArticles();

	void write(Map<String, Object> param);

	Article getArticle(@Param(value = "id")int id);

	void modify(Map<String, Object> param);

	void remove(@Param(value = "id") int id);

}
