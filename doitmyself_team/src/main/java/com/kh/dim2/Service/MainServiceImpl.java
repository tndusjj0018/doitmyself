package com.kh.dim2.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.dim2.DAO.mainDAO;
import com.kh.dim2.domain.Member;

@Service
public class MainServiceImpl implements MainService{

	@Autowired
	public mainDAO dao;

	@Override
	public int insert(Member member) {
		return dao.insert(member);
	}

	@Override
	public int isId(String uSER_ID) {
		return dao.idcheck(uSER_ID);
	}
}
