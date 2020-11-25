package com.makkoli.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MakkoliDAO {

	@Autowired SqlSessionTemplate sst;
	
	public List<ItemsVO> AllList() {
		return sst.selectList("LswnMakkoli.AllList");
	}

	public int totalNum() {
		return sst.selectOne("LswnMakkoli.totalNum");
	}

	public List<Integer> areaCount() {
		List<Integer> areaList = new ArrayList<Integer>();
		
		areaList.add((Integer) sst.selectOne("LswnMakkoli.areaCount", "서울/경기도"));
		areaList.add((Integer) sst.selectOne("LswnMakkoli.areaCount", "충청도"));
		areaList.add((Integer) sst.selectOne("LswnMakkoli.areaCount", "강원도"));
		areaList.add((Integer) sst.selectOne("LswnMakkoli.areaCount", "전라도"));
		areaList.add((Integer) sst.selectOne("LswnMakkoli.areaCount", "경상도"));
		areaList.add((Integer) sst.selectOne("LswnMakkoli.areaCount", "제주도"));
		
		System.out.println("나나나나나나 : " + areaList.get(5));
		
		for (int i = 0; i < areaList.size(); i++) {
			if (areaList.get(i) == null) {
				areaList.remove(i);
				areaList.add(i, 0);
			}
		}
		return areaList;
	}

}
