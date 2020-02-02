package com.kh.dim2.Service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.kh.dim2.domain.Member;
import com.kh.dim2.domain.O_Product;
import com.kh.dim2.domain.Product;
import com.kh.dim2.domain.Q_Product;
import com.kh.dim2.domain.Review;
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

	//스토어 명 중복 체크
	public int sellerNameCheck(String seller_name);

	//찜 목록 개수
	public int wishcount(String user_id);
	
	public List<Product> wishlist(String user_id, int page, int limit);
	
	public int wishdelete(int p_no, String user_id);
	
	public int p_dibsupdate(int p_no);
	
	public List<Q_Product> qnalist(String user_id, String qnaCate);
	
	public List<Q_Product> qnalist(String user_id);
	
	//qna 목록 개수
	public int qnacount(String user_id);
		
	public List<O_Product> orderlist(String user_id, int page, int limit);
	
	//주문내역 개수
	public int ordercount(String user_id);
	
	//리뷰 작성 가능 리스트
	public List<O_Product> reviewablelist(String user_id, int page, int limit);
	
	//리뷰 작성 가능 개수
	public int reviewablecount(String user_id);
	
	public List<O_Product> reviewwritelist(String user_id, int page, int limit);
	
	public int reviewwritecount(String user_id);
	
	public O_Product reviewDetail(int p_no, int review_no);
	
	public Product productDetail(int p_no);
	
	//리뷰 작성
	public int reviewWrite(Review review);
	
	public int reviewUpdate(Review review);
	
	public int reviewDelete(int review_no);
	
	public List<O_Product> cancelreturnlist(String user_id, int page, int limit);
	
	public int cancelreturncount(String user_id);
	
	public int cancelRegister(int order_no);
	
	public O_Product cancelDetail(int order_no);

	public int returnRegister(int order_no);

	
}
