package org.edu.controller;

import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	public String board_list(Model model) throws Exception {
		
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
		//hash# data 타입:<키(key),값(value)> -> {"user_id":"admin","user_name":"관리자",...}
		//Map타입이 부모 클래스, HashMap타입이 자식 클래스
		//Map타입을 상속 받아서, HashMap타입의 오브젝트를 생성하는 방식
		Map<String,Integer> mapTest = new HashMap<String,Integer>();
		String ageValue = "40";
		int ageValue2 = 40;
		mapTest.put("ageValue2", ageValue2);
		mapTest.put("age", Integer.parseInt(ageValue) );
		//제네릭 타입을 사용하면, parseInt형변환을 할 필요가 없기 때문에
		//제네릭 타입의 근본 목적은 데이터 타입에 대해서 명시적인 코딩(코드를 단순화)을 하기 위해서이다
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("user_id", "admin");
		paramMap.put("user_name", "관리자");
		paramMap.put("age", 40);
		System.out.println("해시데이터 타입 출력" + paramMap);
		
		//members 2차원 배열 변수를 MemberVO 클래스형 오브젝트로(members_array) 변경(아래)
		MemberVO members_input = new MemberVO();
		members_input.setUser_id("admin");
		members_input.setUser_name("찐관리자");
		members_input.setEmail("admin@abc.com");
		members_input.setEnabled(true); //enabled data형(type)이 boolean형이기 때문에 true, false 두 값만 입력 가능
		Date toDay = new Date(); //java의 data class를 이용하여 현재 날짜를 가진 toDay변수 생성
		members_input.setReg_date(toDay); //reg_date data타입이 data형이기 때문에 java 날짜 데이터 입력
		members_input.setLevels("ROLE_ADMIN");
		members_input.setPoint(10); //point는 데이터 타입이 integer형이기 때문에 숫자만 입력(큰 따옴표 넣으면 문자로 인식)
		//위 members_input object에는 2개의 line(record)만 입력되어 있으므로 이 object를 array object에 저장(아래)
		MemberVO[] members_array = new MemberVO[2]; //class형 array object 생성
		members_array[0] = members_input;
		members_array[1] = members_input;
		//---------------------------------------------------------------------------------
		List<MemberVO> members_list = Arrays.asList(members_array);
		System.out.println("List타입의 오브젝트 클래스 내용을 출력" + members_list.toString());
		model.addAttribute("members", members_list); //members 2차원 배열을 members_array class object로 변경(20.12.08)
		return "admin/member/member_list";//member_list.jsp로 members 변수 데이터 전송
	}
	
	@RequestMapping(value="/admin", method=RequestMethod.GET)
	public String admin() throws Exception {
		return "admin/home";
	}
}
