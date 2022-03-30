package com.teamproject.phosk.branch.menu.service;

import java.util.List;

import com.teamproject.phosk.branch.menu.vo.CategoryVO;
import com.teamproject.phosk.branch.menu.vo.MenueVO;

public interface TestService {

	public List<CategoryVO> cateList();

	public List<MenueVO> meList();

	public MenueVO detailInfo(String menue_name);

	public int modify(MenueVO menueVO);

	public int delete(MenueVO menueVO);

	public int insert(MenueVO menueVO);

	public int chkDel(String menueVO);

	public int insrtCategory(CategoryVO categoryVO);

	public List<MenueVO> getMenue(String cateTest);

	public List<MenueVO> menuGetAll(String cateTest);
}
