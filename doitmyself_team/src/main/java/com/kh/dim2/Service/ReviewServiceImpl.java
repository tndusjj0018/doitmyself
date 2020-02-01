package com.kh.dim2.Service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.dim2.DAO.reviewDAO;
import com.kh.dim2.domain.Review;

@Service
public class ReviewServiceImpl implements ReviewService {

	@Autowired
	private reviewDAO dao;

	@Override
	public List<Review> getReviewList(int p_no, int page, int limit) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		int startrow = (page-1)*limit+1;
		int endrow = startrow+limit-1;
		map.put("review_p_no", p_no);
		map.put("start", startrow);
		map.put("end", endrow);
		return dao.getReviewList(map);
	}
	

	@Override
	public int getListCount(int p_no) {
		return dao.getListCount(p_no);
	}
	

	
}
