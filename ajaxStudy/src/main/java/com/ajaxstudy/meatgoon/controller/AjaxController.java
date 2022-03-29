package com.ajaxstudy.meatgoon.controller;

import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ajaxstudy.meatgoon.model.CategoryVO;
import com.ajaxstudy.meatgoon.model.MenueVO;
import com.ajaxstudy.meatgoon.service.TestService;

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
	public void cateList(Model model, HttpServletRequest request) {
		log.info("cate List .....");
		String cateTest = request.getParameter("cateTest");
		List<CategoryVO> cateList = testService.cateList();
		model.addAttribute("cateTest", testService.getMenue(cateTest));
		model.addAttribute("cateList", cateList);
	}

	@GetMapping("/menueManage") /* 카테고리 숫자 받아서 반환할거 필요할거같음 */
	public void menueManage(Model model) {
		log.info("menuManage List .....");
		List<CategoryVO> cateList = testService.cateList();
		List<MenueVO> meList = testService.meList();
		model.addAttribute("cateList", cateList);
		model.addAttribute("meList", meList);
	}

	@GetMapping("/detailInfo")
	public void detailInfo(String menue_name, Model model) {
		model.addAttribute("meList", testService.detailInfo(menue_name));
	}

	/*
	 * @GetMapping("/getMenue") public void getMenue(int category_num, Model model)
	 * { model.addAttribute("menues", category_num); } 이부분은 form으로 이동할때 사용할 메서드였음
	 */

	@PostMapping("/modify")
	public String menueModify(MenueVO menueVO, RedirectAttributes rttr) {
		testService.modify(menueVO);
		rttr.addFlashAttribute("result", "modify success");
		return "redirect:/test/cateList";
	}

	@PostMapping("/delete")
	public String menueDelete(MenueVO menueVO, RedirectAttributes rttr) {
		testService.delete(menueVO);
		rttr.addFlashAttribute("result", "delete success");
		return "redirect:/test/cateList";
	}

	@PostMapping("/deleteChk")
	public String menueDelete(HttpServletRequest request) {
		String[] ajaxData = request.getParameterValues("checkedbtn");
		for (int i = 0; i < ajaxData.length; i++) {
			testService.chkDel(ajaxData[i]);
		}
		return "redirect:/test/menueManage";
	}

	@GetMapping("/insertMenue")
	public void insertMenue(Model model) {
		log.info("insertMenue List .....");
		List<CategoryVO> cateList = testService.cateList();
		model.addAttribute("cateList", cateList);
	}

	@PostMapping("/insertMenue")
	public String insertMenue(MenueVO menueVO, RedirectAttributes rttr) {
		testService.insert(menueVO);
		rttr.addFlashAttribute("result", "insert success");
		return "redirect:/test/cateList";
	}

	@PostMapping("/insrtCategory")
	public String insrtCategory(CategoryVO categoryVO, RedirectAttributes rttr) {
		testService.insrtCategory(categoryVO);
		rttr.addFlashAttribute("result", "insert success");
		return "redirect:/test/menueManage";
	}

	/*
	 * @GetMapping("/getMenue") public void getMenue(Model model, HttpServletRequest
	 * request) { String cateTest = request.getParameter("cateTest");
	 * model.addAttribute("cateTest", testService.getMenue(cateTest));
	 * System.out.println(cateTest + " 컨트롤러의 값"); }
	 */

}
