package com.kh.dim2.Service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.dim2.DAO.qnaDAO;
import com.kh.dim2.domain.Qna;

@Service
public class qnaServiceImpl implements qnaService {

	@Autowired
	private qnaDAO dao;
	
	@Override
	public int insertQna(Qna qna) {
		return dao.insertQna(qna);
				
	}

	@Override
	public int getListCount(int p_no) {
		return dao.getListCount(p_no);
	}

	@Override
	public List<Qna> getQnaList(int p_no, int page, int limit) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		int startrow = (page-1)*limit+1;
		int endrow = startrow+limit-1;
		map.put("QNA_P_NO", p_no);
		map.put("start", startrow);
		map.put("end", endrow);
		return dao.getQnaList(map);
	}

	@Override
	public int qnaUpdate(Qna qna) {
		return dao.qnaUpdate(qna);
	}

	@Override
	public Qna getDetail(int num) {
		return dao.getDetail(num);
	}

	@Override
	public int qnaDelete(int qna_no) {
        return dao.qnaDelete(qna_no);
	}
	
}
