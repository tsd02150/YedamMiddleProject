package com.yedam.product.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yedam.product.domain.ThemeVO;

public interface ThemeService {
	
	//테마
		public List<ThemeVO> themeList(ThemeVO vo);

		
		
}
