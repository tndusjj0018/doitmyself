package com.kh.dim2.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.dim2.DAO.adminDAO;
import com.kh.dim2.domain.Member;
@Service
public class AdminServiceImpl implements AdminService{
	@Autowired
	private adminDAO adminDAO;
	
	@Override
	public int getListCount() {
		System.out.println("여기는 AdminServiceImpl getListCount");
		return adminDAO.getListCount();
	}

	@Override
	public List<Member> getMemberList(int page, int limit) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("page", page);
		map.put("limit", limit);
		return adminDAO.getMemberList(map);
	}
}
