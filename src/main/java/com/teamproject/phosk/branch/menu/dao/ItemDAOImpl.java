package com.teamproject.phosk.branch.menu.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.teamproject.phosk.branch.menu.vo.CategoryVO;
import com.teamproject.phosk.branch.menu.vo.ItemVO;

@Repository
public class ItemDAOImpl implements ItemDAO {

	@Autowired
	private SqlSession session;

	@Override
	public List<CategoryVO> cateList() {
		return session.selectList("cateList");
	}

	@Override
	public List<ItemVO> meList() {
		return session.selectList("meList");
	}

	@Override
	public ItemVO detailInfo(String menue_name) {
		return session.selectOne("detailInfo", menue_name);
	}

	@Override
	public int modify(ItemVO menueVO) {
		return session.update("menueModify", menueVO);
	}

	@Override
	public int delete(ItemVO menueVO) {
		return session.delete("menueDelete", menueVO);
	}

	@Override
	public int insert(ItemVO menueVO) {
		return session.insert("menueInsert", menueVO);
	}

	@Override
	public int chkDel(String menueVO) {
		return session.delete("menueDelete", menueVO);
	}

	@Override
	public int insrtCategory(CategoryVO categoryVO) {
		return session.insert("insrtCategory", categoryVO);
	}

	@Override
	public List<ItemVO> getMenue(String cateTest) {
		System.out.println(cateTest + " 맵퍼의 값");
		return session.selectList("getMenue", cateTest);
	}

	@Override
	public List<ItemVO> menuGetAll(String cateTest) {
		return session.selectList("menuGetAll", cateTest);
	}

	@Override
	public int deleteCategory(CategoryVO cateVO) {
		return session.delete("deleteCategory", cateVO);
	}

	@Override
	public int updateCateName(CategoryVO cateVO) {
		return session.update("updateCateName", cateVO);
	}

	@Override
	public int delBestMenu(String menueVO) {
		return session.delete("deleteBestMenu", menueVO);
	}

	@Override
	public int addBestMenu(String menueVO) {
		System.out.println(menueVO);
		return session.insert("addBestMenu", menueVO);
	}

}
