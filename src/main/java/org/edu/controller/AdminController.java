package org.edu.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
//spring에서 사용 가능한 클래스를 bean이라 한다
@Controller
public class AdminController {

	@RequestMapping(value="/admin", method=RequestMethod.GET)
	public String admin() {
		return "admin/home";
	}
}
