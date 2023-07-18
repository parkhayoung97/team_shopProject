package com.tam.mapper;

import com.tam.model.ProductVO;

public interface ProdDetailMapper {
	
	// 상품 상세정보 조회
	public ProductVO getProdDetail(int prodNum);

}
