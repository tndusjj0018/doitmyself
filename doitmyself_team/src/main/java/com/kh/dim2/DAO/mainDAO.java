package com.kh.dim2.DAO;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.dim2.domain.Member;
import com.kh.dim2.domain.Product;
import com.kh.dim2.domain.Recent_View;

@Repository
public class mainDAO {
	
	@Autowired
	public SqlSessionTemplate sqlSession;

	public int insert(Member member) {
		return sqlSession.insert("Main.insert" , member);
	}

	public Member idcheck(String uSER_ID) {
		return sqlSession.selectOne("Main.idcheck" , uSER_ID);
	}

	public Member emailcheck(String uSER_EMAIL) {
		return sqlSession.selectOne("Main.emailcheck" , uSER_EMAIL);
	}

	public Member login(String uSER_ID, String uSER_PASSWORD) {
		return sqlSession.selectOne("Main.login" , uSER_ID);
	}

	public int sellercheck(String uSER_ID) {
		return sqlSession.selectOne("Main.sellercheck" , uSER_ID);
	}

	public Member admin_check(String uSER_ID) {
		return sqlSession.selectOne("Main.admin_check" , uSER_ID);
	}

	public List<Product> getBestProduct_List() {
		return sqlSession.selectList("Main.getBestProduct_List");
	}

	public List<Product> getNewProduct_List() {
		return sqlSession.selectList("Main.getNewProduct_List");
	}

	public int getCart_count(String id) {
		return sqlSession.selectOne("Main.getCart_count" , id);
	}

	public int recentView_Count(String uSER_ID) {
		return sqlSession.selectOne("Main.recentView_Count" , uSER_ID);
	}

	public List<HashMap<String, String>> getRecent_View_List(String uSER_ID) {
		return sqlSession.selectList("Main.getRecent_View_List" , uSER_ID);
	}

	public int NaverInsert(HashMap<String, String> map) {
		return sqlSession.insert("Main.NaverInsert" , map);
	}

	public int isNaverId(String n_Id) {
		return sqlSession.selectOne("Main.Naver_IdCheck" , n_Id);
	}

	public Member Find_check(String uSER_ID , String uSER_EMAIL) {
		return sqlSession.selectOne("Main.Find_check" , uSER_ID);
	}

	public int addRecent(HashMap<String , String> map) {
		return sqlSession.insert("Main.Add_Recent" , map);
	}

	public List<Product> getSearchList(Map<String, Object> map) {
		return sqlSession.selectList("Main.getSearchList" , map);
	} 
  
	public int getSearchListCount(Map<String, String> map) {
		return sqlSession.selectOne("Main.searchCount" , map);
	}

	public Member isEmail_Id(String uSER_ID, String uSER_EMAIL) {
		return sqlSession.selectOne("Main.idcheck" , uSER_ID);
	}

	public int codeInsert(HashMap<String, Object> map) {
		return sqlSession.insert("Main.codeInsert" , map);
	}

	public int isCode(String fIND_CODE) {
		return sqlSession.selectOne("Main.isCode" , fIND_CODE);
	}

	public Member isPass(Member m) {
		return sqlSession.selectOne("Main.isPass" , m);
	}

	public int AddReadCount(int p_no) {
		return sqlSession.update("Main.AddReadCount" , p_no);
	}
}
