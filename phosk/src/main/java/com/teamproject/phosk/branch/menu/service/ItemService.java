package com.teamproject.phosk.branch.menu.service;

import java.util.List;

import com.teamproject.phosk.branch.menu.vo.CategoryVO;
import com.teamproject.phosk.branch.menu.vo.ItemVO;

public interface ItemService {

	public List<CategoryVO> cateList();

	public List<ItemVO> meList();

	public ItemVO detailInfo(String menue_name);

	public int modify(ItemVO menueVO);

	public int delete(ItemVO menueVO);

	public int insert(ItemVO menueVO);

	public int chkDel(String menueVO);

	public int insrtCategory(CategoryVO categoryVO);

	public List<ItemVO> getMenue(String cateTest);

	public List<ItemVO> menuGetAll(String cateTest);

	public int deleteCategory(CategoryVO cateVO);

	public int updateCateName(CategoryVO cateVO);

	public int delBestMenu(String menueVO);

	public int addBestMenu(String menueVO);
}
