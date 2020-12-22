package org.edu.util;

import javax.inject.Inject;

import org.edu.service.IF_MemberService;
import org.edu.vo.MemberVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Common Controller = Admin, Home에서 공통으로 사용
 * @author 황초희
 *
 */
@Controller
public class CommonController {
	
	@Inject
	IF_MemberService memberService;
	
	//REST-API controller로 사용(아래 @ResponseBody = json text data 반환)
	@RequestMapping(value="/id_check", method=RequestMethod.GET)
	@ResponseBody
	public String id_check(@RequestParam("user_id") String user_id) {
		String result = "0"; // id 중복값 체크
		try {
			MemberVO memberVO = memberService.readMember(user_id);
			if(memberVO != null) {
				result = "1";
			}
		} catch (Exception e) {
			// 위 readMember method 에러 발생시
			result = e.toString();
		}
		return result;
	}
}
