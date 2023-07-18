package com.tam.service;

import java.util.List;

import com.tam.model.CateVO;
import com.tam.model.Criteria;
import com.tam.model.ProductVO;

public interface AdminProdService {
	
	// 카테고리 조회
	public List<CateVO> getCateList();
	
	// 상품 목록(selectAll)
	public List<ProductVO> pagingList(Criteria cri);
	
	// 상품 등록
	public void createProd(ProductVO pVo);
	
	// 상품 조회(selectOne)
	public ProductVO readProd(int pno);

	// 상품 수정
	public int updateProd(ProductVO pVo);

	// 상품 삭제
	public int deleteProd(int pno);

	// 상품 총 갯수 + 검색 기능
	public int searchProd(Criteria cri);
}
