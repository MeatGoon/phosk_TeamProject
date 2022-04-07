package com.teamproject.phosk.branch.menu.dao;

import java.util.List;

import com.teamproject.phosk.branch.menu.vo.CategoryVO;
import com.teamproject.phosk.branch.menu.vo.ItemVO;

public interface ItemDAO {
	
	List<CategoryVO> cateList();

	List<ItemVO> meList();

	ItemVO detailInfo(String menue_name);

	int modify(ItemVO menueVO);

	int delete(ItemVO menueVO);

	int insert(ItemVO menueVO);

	int chkDel(String menueVO);

	int insrtCategory(CategoryVO categoryVO);

	List<ItemVO> getMenue(String cateTest);

	List<ItemVO> menuGetAll(String cateTest);

	int deleteCategory(CategoryVO cateVO);

	int updateCateName(CategoryVO cateVO);

	int delBestMenu(String menueVO);

	int addBestMenu(String menueVO); 
}
