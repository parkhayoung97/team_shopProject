package com.tam.service;

import com.tam.model.ProductVO;

public interface ProdDetailService {
	
	// 상품 상세정보 조회
	public ProductVO getProdDetail(int prodNum);

}
