package com.tam.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tam.mapper.ProdDetailMapper;
import com.tam.model.ProductVO;

@Service
public class ProdDetailServiceImpl implements ProdDetailService {

	@Autowired
	private ProdDetailMapper pdMapper;
	
	// 상품 상세조회
	@Override
	public ProductVO getProdDetail(int prodNum) {
		// TODO Auto-generated method stub
		return pdMapper.getProdDetail(prodNum);
	}

}
