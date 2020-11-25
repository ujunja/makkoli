package com.makkoli.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.makkoli.dao.ItemsVO;
import com.makkoli.dao.MakkoliDAO;

@Service
public class SearchService {

	@Autowired MakkoliDAO dao;

	public List<ItemsVO> AllSearch() {
		return dao.AllList();
	}

	public int totalNum() {
		return dao.totalNum();
	}

	public List<Integer> areaCount() {
		return dao.areaCount();
	}
}
