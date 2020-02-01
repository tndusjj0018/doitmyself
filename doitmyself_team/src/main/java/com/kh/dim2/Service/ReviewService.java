package com.kh.dim2.Service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.kh.dim2.domain.Review;

@Service
public interface ReviewService {

	//리뷰 갯수 구하기
	public int getListCount(int p_no);

	//리뷰 목록 보기
	public List<Review> getReviewList(int p_no, int page2, int limit2);
	
	



}
