package com.ajaxstudy.meatgoon.mapper;

import java.util.List;

import com.ajaxstudy.meatgoon.model.CategoryVO;
import com.ajaxstudy.meatgoon.model.MenueVO;

public interface TestMapper {
	
	List<CategoryVO> cateList();

	List<MenueVO> meList();

	MenueVO detailInfo(String menue_name);

	int modify(MenueVO menueVO);

	int delete(MenueVO menueVO);

	int insert(MenueVO menueVO);

	int chkDel(String menueVO);

	int insrtCategory(CategoryVO categoryVO);

	/* int getMenue(String category_num); */
}
