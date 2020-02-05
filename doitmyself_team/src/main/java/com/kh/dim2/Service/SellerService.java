package com.kh.dim2.Service;

import java.util.List;

import com.kh.dim2.domain.Category;
import com.kh.dim2.domain.Order;
import com.kh.dim2.domain.Product;
import com.kh.dim2.domain.Qna;
import com.kh.dim2.domain.Seller;
import com.kh.dim2.domain.SubCategory;

public interface SellerService {
	//판매자 정보
	List<Seller> sellerInfo(String id);

	//판매자 정보 수정
	int infoUpdate(Seller s);

	//카테고리 불러오기
	List<Category> productCategory();

	//서브카테고리 불러오기
	List<SubCategory> productSubCategory(int c_no);
	
	//상품등록
	void insertProduct(Product product);
	
	//가게이름 가져옴
	String getSellerName(String USER_ID);

	//order 리스트 수
	int getOrderListCount(String USER_ID);
	
	//판매관리 판매리스트
	List<Product> SaleList(String USER_ID, String saleSelect);

	//상품 수정 페이지
	Product productInfo(int p_NO);
	
	//상품 수정
	int productUpdate(Product product);
	
	//상품 삭제
	int productDelete(int p_NO);
	
	//주문 상태 변경
	int orderStatus(int P_NO, String ORDER_TRNO, int orderDeliveryVal);

	//상품문의 답변 리스트
	List<Qna> sellerQna(String USER_ID);

	//상품문의 답변 뷰페이지
	Qna QnaReplyView(int q_p_no);

	//상품문의 답변 답변작성
	int QnaUpdate(int qnaNo, String qnaAnswer);
	
	//배송중 확인시 재고수량 감소
	int OrderAmountM(int ORDER_AMOUNT, int ORDER_P_NO);

	//주문관리 주문리스트
	List<Order> getOrderList(String USER_ID, int page, int limit, String viewSelect, int index, String search_word,
			String startDate, String endDate, String status);

	//상품명 중복검사
	String productNameCheck(String p_name);
	
	//취소상품 리스트
	List<Order> CancelList(String USER_ID, int status);
	
}
