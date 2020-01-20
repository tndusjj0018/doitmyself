package com.kh.dim2.Service;

import org.springframework.stereotype.Service;

import com.kh.dim2.domain.Member;

@Service
public interface MainService {

	int insert(Member member);
	int isId(String uSER_ID);

}
