package com.ajaxstudy.meatgoon.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ajaxstudy.meatgoon.mapper.TestMapper;
import com.ajaxstudy.meatgoon.model.CategoryVO;
import com.ajaxstudy.meatgoon.model.MenueVO;

@Service
public class TestServiceImpl implements TestService {

	@Autowired
	private TestMapper testMapper;

	@Override
	public List<CategoryVO> cateList() {
		return testMapper.cateList();
	}

	@Override
	public List<MenueVO> meList() {
		return testMapper.meList();
	}

	@Override
	public MenueVO detailInfo(String menue_name) {
		return testMapper.detailInfo(menue_name);
	}

	@Override
	public int modify(MenueVO menueVO) {
		return testMapper.modify(menueVO);

	}

	@Override
	public int delete(MenueVO menueVO) {
		return testMapper.delete(menueVO);
	}

	@Override
	public int insert(MenueVO menueVO) {
		return testMapper.insert(menueVO);
	}

	@Override
	public int chkDel(String menueVO) {
		return testMapper.chkDel(menueVO);
	}

	@Override
	public int insrtCategory(CategoryVO categoryVO) {
		return testMapper.insrtCategory(categoryVO);
	}

	/*
	 * @Override public int getMenue(String category_num) { return
	 * testMapper.getMenue(category_num);
	 * 
	 * }
	 */

}
