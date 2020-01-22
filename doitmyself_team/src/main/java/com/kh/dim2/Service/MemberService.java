package com.kh.dim2.Service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.kh.dim2.domain.Member;
import com.kh.dim2.domain.Product;
import com.kh.dim2.domain.Seller;

@Service
public interface MemberService {
	
	//회원 정보 가져오기
	public Member memberInfo(String id);

	//회원 정보 수정하기
	public int memberUpdate(Member member);

	//현재 비밀번호 확인
	public int passCheck(String user_id, String user_password);

	//비밀번호 수정하기
	public int passChange(String change_password, String user_id);

	//회원 탈퇴하기
	public int memberLeave(String user_id);

	//판매자 전환하기
	public int sellerChange(Seller seller);
	
	//판매자인지 확인
	public int isSeller(String user_id);

	public int sellerNameCheck(String seller_name);

	public int wishcount(String user_id);
	
	public List<Product> wishlist(String user_id);
}
