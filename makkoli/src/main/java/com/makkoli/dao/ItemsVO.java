package com.makkoli.dao;

import java.util.Date;

public class ItemsVO {
	private String name;
	private String area;
	private String company;
	private Date regday;
	private int cost;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public Date getRegday() {
		return regday;
	}
	public void setRegday(Date regday) {
		this.regday = regday;
	}
	public int getCost() {
		return cost;
	}
	public void setCost(int cost) {
		this.cost = cost;
	}
}
