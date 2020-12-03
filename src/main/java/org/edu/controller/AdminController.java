package org.edu.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
//spring에서 사용 가능한 클래스를 bean이라 한다
@Controller
public class AdminController {

	@RequestMapping(value="/admin/board/board_list", method=RequestMethod.GET)
	public String board_list() {
		return "admin/board/board_list";
	}
	@RequestMapping(value="/admin/member/member_write", method=RequestMethod.POST)
	public String member_write_do() {
		//아래 GET방식 폼 출력 화면에서 전송된 데이터를 처리하는 바인딩 영역(do)
		//redirect는 글쓰기 후 새로고침을 이용한 게시판 테러를 방지하는 목적
		return "redirect:/admin/member/member_list";
	}
	
	@RequestMapping(value="/admin/member/member_write", method=RequestMethod.GET)
	public String member_write() {
		return "/admin/member/member_write";
	}
	
	@RequestMapping(value="/admin/member/member_view", method=RequestMethod.GET)
	public String member_view() {
		return "/admin/member/member_view";
	}
	
	@RequestMapping(value="/admin/member/member_list", method=RequestMethod.GET)
	public String member_list() {
		return "admin/member/member_list";
	}
	
	@RequestMapping(value="/admin", method=RequestMethod.GET)
	public String admin() {
		return "admin/home";
	}
}
