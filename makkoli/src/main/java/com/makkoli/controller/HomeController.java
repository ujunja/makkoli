package com.makkoli.controller;


import java.text.SimpleDateFormat;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.makkoli.dao.ItemsVO;
import com.makkoli.service.SearchService;


@Controller
public class HomeController {
	
	@Autowired SearchService searchService;
	
	@RequestMapping(value = {"/",""})
	public ModelAndView home() {
		
		ModelAndView mav = new ModelAndView("home");
		mav.addObject("list", searchService.AllSearch());
		mav.addObject("total", searchService.totalNum());
		mav.addObject("areaCount", searchService.areaCount());
		return mav;
	}
	
	
}
