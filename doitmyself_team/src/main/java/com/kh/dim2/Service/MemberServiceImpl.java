package com.kh.dim2.Service;

import java.util.HashMap;
import java.util.Map;

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
	
	@Override
	public int memberUpdate(Member m) {
		return dao.memberUpdate(m);
	}

	@Override
	public int passCheck(String user_id, String user_password) {
		Member m = dao.memberInfo(user_id);
		if(m.getUSER_PASSWORD().equals(user_password)) {
			System.out.println("현재 비밀번호 맞음");
			return 1;
		} else {
			System.out.println("현재 비밀번호 틀림");
			return -1;
		}		
	}

	@Override
	public int passChange(String change_password, String user_id) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("change_password", change_password);
		map.put("USER_ID", user_id);
		
		return dao.passChange(map);
	}

}
