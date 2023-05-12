package com.yedam.product.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.yedam.common.DataSource;
import com.yedam.product.domain.ThemeVO;
import com.yedam.product.mapper.ThemeMapper;

public class ThemeServiceImpl implements ThemeService {

	SqlSession session = DataSource.getInstance().openSession(true);
	ThemeMapper mapper = session.getMapper(ThemeMapper.class);


	@Override
	public List<ThemeVO> themeList(ThemeVO vo) {
		return mapper.selectTheme(vo);
	}
}
