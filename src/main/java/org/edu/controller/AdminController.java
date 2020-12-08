package org.edu.controller;

import org.edu.vo.MemberVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

//spring에서 사용 가능한 클래스를 bean이라 한다
@Controller
public class AdminController {

	@RequestMapping(value="/admin/board/board_list", method=RequestMethod.GET)
	public String board_list() throws Exception {
		return "admin/board/board_list";
	}
	@RequestMapping(value="/admin/member/member_write", method=RequestMethod.POST)
	public String member_write_do() throws Exception {
		//아래 GET방식 폼 출력 화면에서 전송된 데이터를 처리하는 바인딩 영역(do)
		//redirect는 글쓰기 후 새로고침을 이용한 게시판 테러를 방지하는 목적
		return "redirect:/admin/member/member_list";
	}
	
	@RequestMapping(value="/admin/member/member_write", method=RequestMethod.GET)
	public String member_write() throws Exception {
		return "/admin/member/member_write";
	}
	
	//jsp에서 data를 수신하는 명령어 = @RequestParam("key") = request parameter
	//현재 controller class에서 jsp로 data 송신하는 명령어 = model class 사용
	//data flow: member_list.jsp->@RequestParam("user_id") 수신-> model 송신-> member_view.jsp
	@RequestMapping(value="/admin/member/member_view", method=RequestMethod.GET)
	public String member_view(@RequestParam("user_id") String user_id,  Model model) throws Exception {
		model.addAttribute("user_id2", user_id + " 님");
		return "/admin/member/member_view";
	}
	
	@RequestMapping(value="/admin/member/member_list", method=RequestMethod.GET)
	public String member_list(Model model) throws Exception {
		String[][] members = {
				{"admin","관리자","admin@abc.com","true","2020-12-04","ROLE_ADMIN"},
				{"user","사용자","user@abc.com","false","2020-12-04","ROLE_USER"}
		};
		//hash data -> {"user_id":"admin","user_name":"관리자",...}
		
		//members 2차원 배열 변수를 MemberVO 클래스형 오브젝트로(members_array) 변경(아래)
		MemberVO members_input = new MemberVO();
		members_input.setUser_id("admin");
		members_input.setUser_name("찐관리자");
		members_input.setUser_email("admin@abc.com");
		members_input.setEnabled(true);
		members_input.set
		
		model.addAttribute("members", members);
		return "admin/member/member_list";//member_list.jsp로 members 변수 데이터 전송
	}
	
	@RequestMapping(value="/admin", method=RequestMethod.GET)
	public String admin() throws Exception {
		return "admin/home";
	}
}
