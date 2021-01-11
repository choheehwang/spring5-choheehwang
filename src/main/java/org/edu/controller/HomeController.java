package org.edu.controller;

import org.edu.vo.BoardVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page. 앱을 위한 홈페이지 요청을 처리한다.
 * http://localhost:8080/ 요청을 받았을 때, 변수를 만들어서 화면에 뿌려준다.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
		//전역 홈페이지 스프링 진입 전 발생하는 에러페이지 처리
		@RequestMapping(value="/home/error/404", method=RequestMethod.GET)
		public String error404() throws Exception {
			return "home/error/404";
		}
		
		//사용자 홈페이지 게시판 상세보기 매핑
		@RequestMapping(value="/home/board/board_view",method=RequestMethod.GET)
		public String board_view() throws Exception {

			return "home/board/board_view";
		}

		//사용자 홈페이지 게시판 쓰기 매핑(POST) 오버로드(매개변수의 개수또는 타입이 틀린)메서드이용
		//jsp에서 board_write메서드를 호출합니다 -> 호출할때 폼의 필드값을 컨트롤러로 보냅니다.
		//컨트롤러에서 받을때 사용하는 매개변수 BoardVO boardVO입니다.
		//위에서 받은 boardVO 를 DAO에서 받아서 DB테이블에 쿼리명령으로 입력합니다.
		@RequestMapping(value="/home/board/board_write",method=RequestMethod.POST)
		public String board_write(BoardVO boardVO) throws Exception {
			//위에서 받은 boardVO를 서비스로 보내기.
			return "redirect:/home/board/board_view";
		}
		//사용자 홈페이지 게시판 쓰기 매핑(GET)
		@RequestMapping(value="/home/board/board_write",method=RequestMethod.GET)
		public String board_write() throws Exception {

			return "home/board/board_write";
		}

		//사용자 홈페이지 게시판 리스트 매핑
		@RequestMapping(value="/home/board/board_list",method=RequestMethod.GET)
		public String board_list() throws Exception {

			return "home/board/board_list";
		}
	
	// 사용자 홈페이지 회원 마이페이지 접근 mapping
	@RequestMapping(value="/member/mypage", method=RequestMethod.GET)
	public String mypage() throws Exception {
		
		return "home/member/mypage";
	}
	
	// 사용자 홈페이지 회원가입 접근 mapping
	@RequestMapping(value="/join", method=RequestMethod.GET)
	public String join() throws Exception {
		
		return "home/join";
	}
	
	// 사용자 홈페이지 로그인 접근 mapping
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public String login() throws Exception {
		
		return "home/login";
	}
	
	// 사용자 홈페이지 루트(최상위) 접근  mapping
	@RequestMapping(value="/", method=RequestMethod.GET)
	public String home() throws Exception{
		
		return "home/home";
	}
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value="/sample/contact", method=RequestMethod.POST)//post방식은 데이터를 전송하는 역할
	public String contact_send() {
		//데이터 전송 후에 화면이 글쓰기 상태로 계속 있는 것을 방지하기 위해 페이지 이동이 필요, 중복글 방지 및 게시글 테러 방지
		return "redirect:/sample/sns";
	}
	@RequestMapping(value="/sample/contact", method=RequestMethod.GET)//get방식은 폼form 페이지를 보여주는 역할
	public String contact() {
		return "sample/contact";
	}
	@RequestMapping(value="/sample/blog", method=RequestMethod.GET)
	public String blog() {
		return "sample/blog";
	}
	@RequestMapping(value="/sample/work", method=RequestMethod.GET)
	public String work() {
		return "sample/work";
	}
	@RequestMapping(value="/sample/weare", method=RequestMethod.GET)
	public String weare() {
		//외부에서 /weare라는 경로에 접근했을 때 sample/weare.jsp와 맵핑시키라는 의미(=쉽게 말해 we are 메뉴 만든 거임)
		return "sample/weare";
	}
	@RequestMapping(value="/sample", method=RequestMethod.GET)
	/* RequestMapping은 자바에서 기본적으로 제공하는 class */
	public String index() {
	//함수(메소드)의 리턴(출력)형태 지정 메소드명(매개변수) {구현내용} String index () {}
	//상단 리퀘스트맵핑에서 지정한 경로로 접근을 하게 되면 아래에 있는 인덱스 메소드를 실행하라는 명령
	//public(공공, 타 클래스에서 접근 가능), private(내부, 현재 홈컨트롤러 클래스에서만 접근 가능)
	//method 기본 형태: public String index() {}
	//j query 기본 형태: $(document).ready(function){};
	//리턴 변환값으로 사용한 스트링 클래스는 문자열을 반환하고
		//여기서는 index.jsp와 매칭되는 문자열을 반환. 여기서 상대경로 필요.
		//스프링 MVC 프로젝트에 상대경로 최상위는 views 폴더 최상위 root폴더
	//index(prefix 접두사, 파일명).jsp(suffix 접미사, 확장자)
		return "sample/index";//접두사만 반환값으로 넣기
	}
	/*@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("환영합니다! 현재 여러분 컴퓨터 언어는 {} 입니다.", locale);
		System.out.println("위에 Locale 클래스를 사용하는 이유는 다국어 지원때문");
		System.out.println("함수-C언어나 자바스크립트-와 메소드-자바, 스프링-는 같은 대상을 가리킨다.");
		System.out.println("함수-메소드-는 함수명(입력값-매개변수-){구현내용}형식이고, 입력값->출력값으로 구현");
		Date date = new Date();
		//Data 날짜관련 클래스형 변수 Date를 선언함. date라는 변수 메소드를 사용가능=오브젝트 됐다고도 한다.
		//Data 변수=실행가능한 변수=클래스형 변수=오브젝트=인스턴스
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		//DateFormat이라는 클래스형 변수가 선언->실행 가능한 변수
		String formattedDate = dateFormat.format(date);
		//변수 실행.
		//위 변수가 실행되어서 출력된 결과값이 아래 serverTime 변수값으로 jsp파일로 이동
		model.addAttribute("TomcatserverTime", formattedDate );
		//위 모델이라는 클래스형 변수를 이용해서 serverTime이라는 변수값을 아래 home.jsp로 전송
		System.out.println("현재 서버의 시간은" + formattedDate );
		return "home";//결과적으로 리턴값(출력값)이 home(.jsp 생략됨)에 연동
	}*/
	
}
