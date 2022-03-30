package com.teamproject.phosk.branch.menu.dao;

import java.util.List;

import com.teamproject.phosk.branch.menu.vo.CategoryVO;
import com.teamproject.phosk.branch.menu.vo.MenueVO;

public interface TestMapper {
	
	List<CategoryVO> cateList();

	List<MenueVO> meList();

	MenueVO detailInfo(String menue_name);

	int modify(MenueVO menueVO);

	int delete(MenueVO menueVO);

	int insert(MenueVO menueVO);

	int chkDel(String menueVO);

	int insrtCategory(CategoryVO categoryVO);

	List<MenueVO> getMenue(String cateTest);

	List<MenueVO> menuGetAll(String cateTest); 
}
