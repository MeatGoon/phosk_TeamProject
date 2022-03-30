package com.teamproject.phosk.branch.menu.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.teamproject.phosk.branch.menu.dao.TestMapper;
import com.teamproject.phosk.branch.menu.vo.CategoryVO;
import com.teamproject.phosk.branch.menu.vo.MenueVO;

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

	@Override
	public List<MenueVO> getMenue(String cateTest) {
		System.out.println(cateTest + " 서비스의 값");
		return testMapper.getMenue(cateTest);

	}

	@Override
	public List<MenueVO> menuGetAll(String cateTest) {
		return testMapper.menuGetAll(cateTest);
	}

}
