package com.ajaxstudy.meatgoon.mapper;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ajaxstudy.meatgoon.model.CategoryVO;
import com.ajaxstudy.meatgoon.model.MenueVO;

@Repository
public class TestMapperImpl implements TestMapper {
	
	@Autowired
	private SqlSession session;

	/*
	 * @Override public List<BoardVO> boList() { return
	 * session.selectList("boList"); }
	 */

	@Override
	public List<CategoryVO> cateList() {
		return session.selectList("cateList");
	}

	@Override
	public List<MenueVO> meList() {
		// TODO Auto-generated method stub
		return session.selectList("meList");
	}

	@Override
	public MenueVO getMenue(String menue_name) {
		return session.selectOne("getMenue", menue_name);
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

}
