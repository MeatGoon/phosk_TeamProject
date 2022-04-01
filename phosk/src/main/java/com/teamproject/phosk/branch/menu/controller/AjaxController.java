package com.teamproject.phosk.branch.menu.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.teamproject.phosk.branch.menu.service.TestService;
import com.teamproject.phosk.branch.menu.vo.CategoryVO;
import com.teamproject.phosk.branch.menu.vo.MenueVO;
import com.teamproject.phosk.branch.menu.vo.NowPage;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/test/*")
@AllArgsConstructor
public class AjaxController {

	@Autowired
	private TestService testService;

	@GetMapping("/cateList")
	public void cateList(Model model, HttpServletRequest request, NowPage nowPage) {
		log.info("cate List .....");
		String cateTest = request.getParameter("cateTest");
		List<CategoryVO> cateList = testService.cateList();
		if (cateTest != null) {
			nowPage.setNowCate(Integer.parseInt(cateTest));
			model.addAttribute("nowPage", nowPage);
		}
		model.addAttribute("cateTest", testService.getMenue(cateTest));
		model.addAttribute("cateList", cateList);

	}

	@GetMapping("/menueManage") /* 카테고리 숫자 받아서 반환할거 필요할거같음 */
	public void menueManage(Model model, HttpServletRequest request, NowPage nowPage) {
		log.info("menuManage List .....");
		String cateTest = request.getParameter("cateTest");
		if (cateTest != null) {
			nowPage.setNowCate(Integer.parseInt(cateTest));
		}
		List<CategoryVO> cateList = testService.cateList();
		model.addAttribute("cateList", cateList);
		model.addAttribute("cateTest", testService.menuGetAll(cateTest));
		model.addAttribute("nowPage", nowPage);
	}

	@GetMapping("/detailInfo")
	public void detailInfo(String menue_name, Model model) {
		model.addAttribute("meList", testService.detailInfo(menue_name));
	}

	@PostMapping("/modify")
	public String menueModify(MenueVO menueVO, RedirectAttributes rttr) {
		testService.modify(menueVO);
		rttr.addFlashAttribute("result", "modify success");
		return "redirect:/test/cateList";
	}

	@PostMapping("/delete")
	public String menueDelete(MenueVO menueVO, RedirectAttributes rttr, NowPage nowPage) {
		testService.delete(menueVO);
		int nowCate = nowPage.getNowCate();
		rttr.addFlashAttribute("result", "delete success");
		return "redirect:/test/cateList" + nowCate;
	}

	@PostMapping("/deleteChk")
	public String menueDelete(HttpServletRequest request, NowPage nowPage) {
		String[] ajaxData = request.getParameterValues("checkedbtn");
		int nowCate = nowPage.getNowCate();
		for (int i = 0; i < ajaxData.length; i++) {
			testService.chkDel(ajaxData[i]);
		}
		return "redirect:/test/menueManage?cateTest="+ nowCate;
	}

	@GetMapping("/insertMenue")
	public void insertMenue(Model model, NowPage nowPage) {
		log.info("insertMenue List .....");
		List<CategoryVO> cateList = testService.cateList();
		model.addAttribute("cateList", cateList);
		model.addAttribute("nowPage", nowPage);
	}

	@PostMapping("/insertMenue")
	public String insertMenue(MenueVO menueVO, RedirectAttributes rttr) {
		testService.insert(menueVO);
		rttr.addFlashAttribute("result", "insert success");
		return "redirect:/test/cateList";
	}

	@PostMapping("/insrtCategory")
	public String insrtCategory(CategoryVO categoryVO, int nowCate , RedirectAttributes rttr, NowPage nowPage) {
		testService.insrtCategory(categoryVO);
		return "redirect:/test/menueManage?cateTest=" + nowCate;
	}
	
	@PostMapping("/updateCateName")
	public String updateCateName(int category_num, CategoryVO cateVO, RedirectAttributes rttr) {
		testService.updateCateName(cateVO);
		rttr.addFlashAttribute("result", "UpCateName success");
		return "redirect:/test/menueManage?cateTest=" + category_num;
	}
	
	
	@PostMapping("/deleteCategory")
	public String deleteCategory(CategoryVO cateVO, RedirectAttributes rttr) {
		testService.deleteCategory(cateVO);
		rttr.addFlashAttribute("result", "delCate success");
		return "redirect:/test/menueManage";
	}
}
