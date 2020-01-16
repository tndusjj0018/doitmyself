package com.kh.dim2.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.dim2.DAO.memberDAO;
import com.kh.dim2.domain.Member;

@Service

public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private memberDAO dao;
	
	@Override
	public Member memberInfo(String id) {
		return dao.memberInfo(id);
	}

}
