package com.tam.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tam.mapper.NoticeMapper;
import com.tam.model.Criteria;
import com.tam.model.NoticeVO;

@Service
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	private NoticeMapper nMapper;
	
	// 게시글 전체 조회 - 페이징
	@Override
	public List<NoticeVO> selectAll(Criteria cri) {
		return nMapper.selectAll(cri); 
	}

	// 전체 게시글 수 - 페이징
	@Override
	public int selectCount(Criteria cri) {
		return nMapper.selectCount(cri);
	}

	// 게시글 하나 조회
	@Override
	public NoticeVO selectOne(int noticeNum) {
		return nMapper.selectOne(noticeNum);
	}
	
	// 게시글 등록
	@Override
	public void postNotice(NoticeVO nVo) {
		nMapper.postNotice(nVo);
	}
	
	// 게시글 삭제
	@Override
	public int deleteNotice(int noticeNum) {
		return nMapper.deleteNotice(noticeNum);
	}

	// 게시글 수정
	@Override
	public int updateNotice(NoticeVO nVo) {
		return nMapper.updateNotice(nVo);
	}
}
