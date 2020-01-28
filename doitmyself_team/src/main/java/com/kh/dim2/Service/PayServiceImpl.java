package com.kh.dim2.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.dim2.DAO.payDAO;
import com.kh.dim2.domain.Member;

@Service
public class PayServiceImpl implements PayService {

	@Autowired
	private payDAO dao;
	
	@Override
	public Member locInfo(String id) {
		return dao.locInfo(id);
	}

	
}
