package com.tam.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tam.mapper.AdminOrderMapper;
import com.tam.model.Criteria;
import com.tam.model.OrderVO;

@Service
public class AdminOrderServlceImpl implements AdminOrderService {

	@Autowired
	private AdminOrderMapper aoMapper;
	
	// 관리자 주문 목록
	@Override
	public List<OrderVO> pagingList(Criteria cri) {
		// TODO Auto-generated method stub
		return aoMapper.pagingList(cri);
	}

	// 주문 상태 업데이트
	@Override
	public int updateOrder(OrderVO oVo) {
		// TODO Auto-generated method stub
		return aoMapper.updateOrder(oVo);
	}

	// 주문 조회
	@Override
	public OrderVO readOrder(int orderNum) {
		// TODO Auto-generated method stub
		return aoMapper.readOrder(orderNum);
	}

	// 주문 총 갯수 + 검색 기능
	@Override
	public int searchOrder(Criteria cri) {
		// TODO Auto-generated method stub
		return aoMapper.searchOrder(cri);
	}

}
