package org.edu.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page. 앱을 위한 홈페이지 요청을 처리한다.
 * http://localhost:8080/ 요청을 받았을 때, 변수를 만들어서 화면에 뿌려준다.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("환영합니다! 현재 여러분 컴퓨터 언어는 {} 입니다.", locale);
		System.out.println("위에 Locale 클래스를 사용하는 이유는 다국어 지원때문에 변수로 사용하게 된다.");
		System.out.println("함수-C언어나 자바스크립트-와 메소드-자바, 스프링-는 같은 대상을 가리킨다.");
		System.out.println("함수-메소드-는 함수명(입력값-매개변수-){구현내용}형식이고, 입력값->출력값으로 구현된다.");
		Date date = new Date();
		//Data 날짜관련 클래스형 변수 Date를 선언함. date라는 변수 메소드를 사용가능하게 된다. 오브젝트 됐다고도 한다.
		//Data 변수=실행가능한 변수=클래스형 변수=오브젝트=인스턴스
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		//DateFormat이라는 클래스형 변수가 선언되었고, 실행 가능한 변수로 되었다.
		String formattedDate = dateFormat.format(date);
		//변수가 실행됩니다.
		//위 변수가 실행되어서 출력된 결과값이 아래 serverTime 변수값으로 jsp파일로 이동하게 된다.
		model.addAttribute("TomcatserverTime", formattedDate );
		//위 모델이라는 클래스형 변수를 이용해서 serverTime이라는 변수값을 아래 home.jsp로 전송한다.
		System.out.println("현재 서버의 시간은" + formattedDate );
		return "home";//결과적으로 리턴값(출력값)이 home(.jsp 생략됨)에 연동된다.
		//스프링에서 뷰단으로 데이터 이동(전송)에 대해서 살펴 봄.
	}
	
}
