package com.teamproject.phosk.branch.menu.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.teamproject.phosk.branch.menu.vo.CategoryVO;
import com.teamproject.phosk.branch.menu.vo.MenueVO;

@Repository
public class TestMapperImpl implements TestMapper {

	@Autowired
	private SqlSession session;

	@Override
	public List<CategoryVO> cateList() {
		return session.selectList("cateList");
	}

	@Override
	public List<MenueVO> meList() {
		return session.selectList("meList");
	}

	@Override
	public MenueVO detailInfo(String menue_name) {
		return session.selectOne("detailInfo", menue_name);
	}

	@Override
	public int modify(MenueVO menueVO) {
		return session.update("menueModify", menueVO);
	}

	@Override
	public int delete(MenueVO menueVO) {
		return session.delete("menueDelete", menueVO);
	}

	@Override
	public int insert(MenueVO menueVO) {
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
	public List<MenueVO> getMenue(String cateTest) {
		System.out.println(cateTest + " 맵퍼의 값");
		return session.selectList("getMenue", cateTest);
	}

	@Override
	public List<MenueVO> menuGetAll(String cateTest) {
		return session.selectList("menuGetAll", cateTest);
	}

}
