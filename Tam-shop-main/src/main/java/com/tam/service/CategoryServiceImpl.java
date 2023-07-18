package com.tam.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tam.mapper.CategoryMapper;
import com.tam.model.CateVO;
import com.tam.model.Criteria;
import com.tam.model.ProductVO;

@Service
public class CategoryServiceImpl implements CategoryService {
   
   @Autowired
   private CategoryMapper cateMapper;
   
   // 카테고리 조회
   @Override
   public List<CateVO> getCateList() {
      // TODO Auto-generated method stub
      return cateMapper.getCateList();
   }

   // 전체 상품 조회
   @Override
   public List<ProductVO> getProdList(Criteria cri) {
      // TODO Auto-generated method stub
      return cateMapper.getProdList(cri);
   }
   
// 전체 상품 조회
   @Override
   public List<ProductVO> getCateProd(Criteria cri) {
      // TODO Auto-generated method stub
      return cateMapper.getCateProd(cri);
   }
   
   // 상품 총 갯수
    @Override
   public int getProdTotal(Criteria cri) {
      // TODO Auto-generated method stub
      return cateMapper.getProdTotal(cri);
   }

}