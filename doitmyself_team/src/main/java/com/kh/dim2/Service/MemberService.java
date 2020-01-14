package com.kh.dim2.Service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.kh.dim2.domain.Member;

@Service
public interface MemberService {
	//유저 수 구하기
	public int getListCount();
	
	//유저 목록 보기
	public List<Member> getMemberList(int page, int limit);
}
