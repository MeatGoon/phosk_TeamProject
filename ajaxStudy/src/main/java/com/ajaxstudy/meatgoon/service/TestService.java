package com.ajaxstudy.meatgoon.service;

import java.util.List;

import com.ajaxstudy.meatgoon.model.CategoryVO;
import com.ajaxstudy.meatgoon.model.MenueVO;

public interface TestService {
	/* public List<BoardVO> boList(); */

	public List<CategoryVO> cateList();

	public List<MenueVO> meList();

	public MenueVO getMenue(String menue_name);

	public int modify(MenueVO menueVO);

	public int delete(MenueVO menueVO);

	public int insert(MenueVO menueVO);

	public int chkDel(String menueVO);

	public int insrtCategory(CategoryVO categoryVO);
}
