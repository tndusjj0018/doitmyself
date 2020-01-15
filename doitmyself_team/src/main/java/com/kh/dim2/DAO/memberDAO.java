package com.kh.dim2.DAO;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.dim2.domain.Member;


@Repository
public class memberDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;


}
