package com.tam.mapper;

import com.tam.model.MemberVO;

public interface JoinMapper {
	
	// 아이디 중복검사
	public int idCheck(String id);
	
	// 회원가입
	public void memberJoin(MemberVO member);

}
