package com.kh.dim2.Service;

import org.springframework.stereotype.Service;

import com.kh.dim2.domain.Member;

@Service
public interface MemberService {
	
	//회원 정보 가져오기
	public Member memberInfo(String id);

	//회원 정보 수정하기
	public int memberUpdate(Member member);

	//현재 비밀번호 확인
	public int passCheck(String user_id, String user_password);

	public int passChange(String change_password, String user_id);

}
