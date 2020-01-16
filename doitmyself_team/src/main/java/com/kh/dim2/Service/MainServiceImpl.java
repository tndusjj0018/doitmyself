package com.kh.dim2.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.dim2.DAO.mainDAO;

@Service
public class MainServiceImpl implements MainService{

	@Autowired
	public mainDAO dao;
}
