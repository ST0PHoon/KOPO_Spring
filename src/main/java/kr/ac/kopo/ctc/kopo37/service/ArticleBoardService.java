package kr.ac.kopo.ctc.kopo37.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import kr.ac.kopo.ctc.kopo37.domain.ArticleBoard;
import kr.ac.kopo.ctc.kopo37.dto.Pagination;

public interface ArticleBoardService {
	// C, U
	void createArticle(ArticleBoard articleBoard);
	
	void updateArticle(ArticleBoard articleBoard);
	
	void updateArticleBoardView(Long id);
	// R
	ArticleBoard findOneById(Long id);	// 하나
	
	List<ArticleBoard> findAll();	// 전체
	
	List<ArticleBoard> findByIdGreaterThanOrderByIdDesc(Integer currentPage);	// 페이징
	
	List<ArticleBoard> findByTitleContainingOrderByIdDesc(String containedWord, Integer currentPage);	// 검색 + 페이징
	
	Pagination getPagination(String searchWord, Integer currentPage); // 페이지 이동처리
	
	// D
	void deleteById(Long id);
}
