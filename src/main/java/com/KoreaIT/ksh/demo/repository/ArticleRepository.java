package com.KoreaIT.ksh.demo.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.KoreaIT.ksh.demo.vo.Article;

@Mapper
public interface ArticleRepository {

	public void writeArticle(String title, String body);
	//INSERT INTO article SET regDate = NOW(), updateDate = NOW(), title = ?, `body` = ?
	

	public List<Article> getArticles(); 
	//SELECT *FROM article ORDER BY id DESC
	

	public Article getArticleById(int id) ;
	//SELECT *FROM article WHERE id = ?
	

	public void deleteArticle(int id) ;
	//DELETE FROM article WHERE id = ?
	

	public void modifyArticle(int id, String title, String body);
	//UPDATE article SET title = ?, `body`=? WHERE id = ?
	
	public int getLastInsertId();
}