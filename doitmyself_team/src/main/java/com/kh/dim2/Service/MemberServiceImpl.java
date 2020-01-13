package com.kh.dim2.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.dim2.domain.Member;
import com.kh.dim2.DAO.memberDAO;;

@Service
public class MemberServiceImpl implements MemberService{
	@Autowired
	private memberDAO memberDAO;
	
	@Override
	public int getListCount() {
		return memberDAO.getListCount();
	}

	@Override
	public List<Member> getMemberList(int page, int limit) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("page", page);
		map.put("limit", limit);
		return memberDAO.getMemberList(map);
	}
	
}
