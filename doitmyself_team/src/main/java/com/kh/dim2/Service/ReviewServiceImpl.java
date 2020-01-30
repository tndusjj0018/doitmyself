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
	public List<Review> getReviewList(int page, int limit) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		int startrow = (page-1)*limit+1;
		int endrow = startrow+limit-1;
		map.put("start", startrow);
		map.put("end", endrow);
		return dao.getReviewList(map);
	}
	

	@Override
	public int getListCount() {
		return dao.getListCount();
	}
	

	
}
