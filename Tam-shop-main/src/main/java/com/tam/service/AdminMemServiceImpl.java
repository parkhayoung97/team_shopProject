package com.tam.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tam.mapper.AdminMemMapper;
import com.tam.model.Criteria;
import com.tam.model.MemberVO;

@Service
public class AdminMemServiceImpl implements AdminMemService {

	@Autowired
	private AdminMemMapper mapper;
	
	// 유저 리스트
	@Override
	public List<MemberVO> getList() {
		return mapper.getList();
	}

	// 유저 리스트 페이징 처리
	@Override
	public List<MemberVO> getListPaging(Criteria cri) {
		return mapper.getListPaging(cri);
	}

	// 유저 리스트 총 페이지
	@Override
	public int getTotal() {	
		return mapper.getTotal();
	}
}
