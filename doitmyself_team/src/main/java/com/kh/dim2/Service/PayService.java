package com.kh.dim2.Service;

import org.springframework.stereotype.Service;

import com.kh.dim2.domain.Member;

@Service
public interface PayService {
	
	//회원 배송정보 조회
public Member locInfo(String id);


}
