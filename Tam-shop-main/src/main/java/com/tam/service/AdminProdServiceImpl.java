package com.tam.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tam.mapper.AdminProdMapper;
import com.tam.model.CateVO;
import com.tam.model.Criteria;
import com.tam.model.ProductVO;

@Service
public class AdminProdServiceImpl implements AdminProdService {
	
	@Autowired
	private AdminProdMapper apMapper;
	
	// 카테고리 조회
	@Override
	public List<CateVO> getCateList(){
		// TODO Auto-generated method stub
		return apMapper.getCateList();
	}
	
	// 상품 조회(selectAll)
	@Override
	public List<ProductVO> pagingList(Criteria cri) {
		return apMapper.pagingList(cri);
	}
	
	// 상품 등록
	@Override
	public void createProd(ProductVO pVo) {
		// TODO Auto-generated method stub
		apMapper.createProd(pVo);
	}
	
	// 상품 조회(selectOne
	@Override
	public ProductVO readProd(int pno) {
		return apMapper.readProd(pno);
	}
	
	// 상품 수정
	@Override
	public int updateProd(ProductVO pVo) {
		return apMapper.updateProd(pVo);
	}

	// 상품 삭제
	@Override
	public int deleteProd(int pno) {
		return apMapper.deleteProd(pno);
	}

	// 상품 검색
	@Override
	public int searchProd(Criteria cri) {
		return apMapper.searchProd(cri);
	}
}
