package com.yedam.product.mapper;

import java.util.List;

import com.yedam.product.domain.ThemeVO;

public interface ThemeMapper {
	
	
	//테마전
	public List<ThemeVO> selectTheme(ThemeVO vo);
	
	

}
