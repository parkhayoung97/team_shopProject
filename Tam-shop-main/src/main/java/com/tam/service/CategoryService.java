package com.tam.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.tam.model.CateVO;
import com.tam.model.Criteria;
import com.tam.model.ProductVO;

public interface CategoryService {
   
   // 카테고리 조회
   public List<CateVO> getCateList();
   
   // 전체 상품 조회
   public List<ProductVO> getProdList(Criteria cri);
   
   // 카테고리 상품 조회
   public List<ProductVO> getCateProd(Criteria cri);
   
   // 상품 총 갯수
   public int getProdTotal(Criteria cri);


}