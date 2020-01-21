package com.kh.dim2.Service;

import org.springframework.stereotype.Service;

import com.kh.dim2.domain.Member;

@Service
public interface MainService {

	int insert(Member member);
	int isId(String uSER_ID);
	int isEmail(String uSER_EMAIL);
	int isId(String uSER_ID, String uSER_PASSWORD);
	int isSeller(String uSER_ID);
	Member isAdmin(String uSER_ID);

}
