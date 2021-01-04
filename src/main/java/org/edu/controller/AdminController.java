package org.edu.controller;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import javax.inject.Inject;

import org.edu.dao.IF_BoardDAO;
import org.edu.service.IF_BoardService;
import org.edu.service.IF_MemberService;
import org.edu.util.CommonController;
import org.edu.util.SecurityCode;
import org.edu.vo.BoardVO;
import org.edu.vo.MemberVO;
import org.edu.vo.PageVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

//spring에서 사용 가능한 클래스를 bean이라 한다
@Controller
public class AdminController {
	//@Inject 방식으로 외부 라이브러리=모듈=클래스=인스턴스 불러오기(아래)
	@Inject
	SecurityCode securityCode;
	
	@Inject
	IF_BoardService boardService;
	
	@Inject
	IF_BoardDAO boardDAO;
	
	@Inject
	IF_MemberService memberService;
	
	@Inject
	CommonController commonController;
	
	@RequestMapping(value="/admin/board/board_delete",method=RequestMethod.POST)
	public String board_delete(RedirectAttributes rdat, PageVO pageVO, @RequestParam("bno") Integer bno) throws Exception {
		// 기존 등록된 첨부 파일을 폴더에서 삭제할 UUID 파일명 구하기(아래)
		List<HashMap<String, Object>> delFiles = boardService.readAttach(bno);
		boardService.deleteBoard(bno);
		//첨부파일 삭제: DB부터 먼저 삭제 후 첨부파일 삭제
		for(HashMap<String, Object> file_name:delFiles) {
			//실제 파일 삭제 로직(아래)
			File target = new File(commonController.getUploadPath(), (String) file_name.get("save_file_name"));
			if(target.exists()) {
				target.delete(); // 실제로 삭제됨
			}
		}
		rdat.addFlashAttribute("msg", "삭제");
		return "redirect:/admin/board/board_list?page=" + pageVO.getPage();
	}
	
	@RequestMapping(value="/admin/board/board_update", method=RequestMethod.GET)
	public String board_update(@RequestParam("bno") Integer bno, @ModelAttribute("pageVO") PageVO pageVO, Model model) throws Exception {
		BoardVO boardVO = boardService.readBoard(bno);
		
		List<HashMap<String, Object>> files = boardService.readAttach(bno);
		String[] save_file_names = new String[files.size()];
		String[] real_file_names = new String[files.size()];
		int cnt = 0;
		for(HashMap<String, Object> file_name:files) {//세로데이터를 가로데이터로 변경하는 로직
			save_file_names[cnt] = (String) file_name.get("save_file_name");//형변환 cast
			real_file_names[cnt] = (String) file_name.get("real_file_name");
			cnt = cnt + 1;
		}
		boardVO.setSave_file_names(save_file_names);
		boardVO.setReal_file_names(real_file_names);
		model.addAttribute("checkImgArray", commonController.getCheckImgArray());
		model.addAttribute("boardVO", boardVO);
		return "admin/board/board_update";
	}
	@RequestMapping(value="/admin/board/board_update", method=RequestMethod.POST)
	public String board_update(RedirectAttributes rdat, @RequestParam("file") MultipartFile[] files, BoardVO boardVO, PageVO pageVO) throws Exception {
		List<HashMap<String, Object>> delFiles = boardService.readAttach(boardVO.getBno());
		// jsp에 보낸  보낼 save_file_names, real_file_names 배열변수 초기값 지정
		String[] save_file_names =new String[files.length];
		String[] real_file_names =new String[files.length];
		int index = 0; // 아래 향상된 for문에서 사용할 index값
		// 첨부파일 수정: 시존 첨부파일 삭제 후 신규 파일 업로드(아래부터는 모두 폴더)
		for(MultipartFile file:files) {
			if(file.getOriginalFilename() != "") { // 첨부파일 등록 시 실행
				// 기존 파일 DB에서 삭제 처리할 변수 생성 이유: update jsp 화면에서 첨부파일을 개별 삭제 시 사용할 순서가 필요하기 때문
				int cnt = 0;
				for(HashMap<String, Object> file_name:delFiles) {
					save_file_names[cnt] = (String) file_name.get("save_file_name");
					real_file_names[cnt] = (String) file_name.get("real_file_name");
					cnt = cnt + 1;
				}
				int sun = 0;
				// 기존 파일 폴더에서 실제 파일 삭제 처리
				for(HashMap<String, Object> file_name:delFiles) {
					if(index == sun) { // index는 첨부 파일 개수, sun은 삭제할 개별 순서
						File target = new File(commonController.getUploadPath(), (String) file_name.get("save_file_name"));
						if(target.exists()) {
							target.delete(); // 폴더에서 기존 첨부 파일 삭제
						}
					}
					boardDAO.deleteAttach((String) file_name.get("save_file_name"));
					sun = sun + 1;
				}
				// 신규 파일 폴더에 업로드 처리
				save_file_names[index] = commonController.fileUpload(file); // 폴더에 저장
				real_file_names[index] = file.getOriginalFilename(); // "한글파일명.jpg"
			}
			index = index + 1;
		}
		boardVO.setSave_file_names(save_file_names); // UUID로 생성된 유니크한 파일명
		boardVO.setReal_file_names(real_file_names);
		boardService.updateBoard(boardVO); // DB에서 업데이트
		rdat.addFlashAttribute("msg", "수정");
		return "redirect:/admin/board/board_view?page="+pageVO.getPage()+"&bno="+boardVO.getBno();
	}
	
	@RequestMapping(value="/admin/board/board_write", method=RequestMethod.GET) //URL route
	public String board_write() throws Exception {
		return "admin/board/board_write"; //file route
	}
	@RequestMapping(value="/admin/board/board_write", method=RequestMethod.POST)
	public String board_write(RedirectAttributes rdat, @RequestParam("file") MultipartFile[] files, BoardVO boardVO) throws Exception {
		// 게시물 테러 방지 -> redirect로 이동 처리
		// 첨부파일 미등록 시 게시글DB만 저장, 첨부파일 등록시 게시글+첨부파일DB 저장
		String[] save_file_names = new String[files.length];//배열크기가 존재하는 변수 생성 
		String[] real_file_names = new String[files.length];
		int index = 0;
		for(MultipartFile file:files) {
			if(file.getOriginalFilename() != "") {//첨부파일명이 있으면
				save_file_names[index] = commonController.fileUpload(file);//폴더에 업로드저장완료
				real_file_names[index] = file.getOriginalFilename();//"한글파일명.jpg"
			}
			index = index + 1;//배열 인덱스 변수값 증가처리.
		}
		boardVO.setSave_file_names(save_file_names);//UUID로 생성된 유니크한 파일명
		boardVO.setReal_file_names(real_file_names);
		boardService.insertBoard(boardVO);
		rdat.addFlashAttribute("msg", "저장");
		return "redirect:/admin/board/board_list";
	}
	
	@RequestMapping(value="/admin/board/board_view", method=RequestMethod.GET)
	public String board_view(@ModelAttribute("pageVO") PageVO pageVO, @RequestParam("bno") Integer bno, Model model) throws Exception {
		/*
		 * //jsp로 보낼 더미 데이터를 boardVO에 담아서 보내기(아래) BoardVO boardVO = new BoardVO();
		 * boardVO.setBno(1); boardVO.setTitle("첫 번째 게시물 입니다."); String xss_data =
		 * "첫 번째 내용 입니다.<br>줄바꿈 테스트 입니다.";
		 * boardVO.setContent(securityCode.unscript(xss_data));
		 * boardVO.setWriter("admin"); Date reg_date = new Date();
		 * boardVO.setReg_date(reg_date); boardVO.setView_count(2);
		 * boardVO.setReply_count(0);
		 */
		BoardVO boardVO = boardService.readBoard(bno);
		// secure cording 시작
		String xss_data = boardVO.getContent();
		boardVO.setContent(securityCode.unscript(xss_data));
		// secure cording 끝
		// 첨부파일 리스트 값을 가져와서, 세로데이터를 가로데이터로 변환
		List<HashMap<String, Object>> files = boardService.readAttach(bno);
		String[] save_file_names = new String[files.size()];
		String[] real_file_names = new String[files.size()];
		int cnt = 0;
		for(HashMap<String, Object> file_name:files) {//세로데이터를 가로데이터로 변경하는 로직
			save_file_names[cnt] = (String) file_name.get("save_file_name");//형변환 cast
			real_file_names[cnt] = (String) file_name.get("real_file_name");
			cnt = cnt + 1;
		}
		boardVO.setSave_file_names(save_file_names);
		boardVO.setReal_file_names(real_file_names);
		//model.addAttribute("save_file_names", files);
		model.addAttribute("boardVO", boardVO);
		model.addAttribute("checkImgArray", commonController.getCheckImgArray());
		return "admin/board/board_view";
		}
	
	@RequestMapping(value="/admin/board/board_list", method=RequestMethod.GET)
	public String board_list(@ModelAttribute("pageVO") PageVO pageVO, Model model) throws Exception {
		/*
		 * //테스트용 더미 게시판 데이터 생성(아래) BoardVO input_board = new BoardVO();
		 * input_board.setBno(1); input_board.setTitle("첫 번째 게시물 입니다.");
		 * input_board.setContents("첫 번째 내용 입니다.<br>줄바꿈 테스트 입니다.");
		 * input_board.setWriter("admin"); Date reg_date = new Date();
		 * input_board.setReg_date(reg_date); input_board.setView_count(2);
		 * input_board.setReply_count(0); BoardVO[] board_array = new BoardVO[2];
		 * board_array[0] = input_board; //------------------------------------------
		 * BoardVO input_board2 = new BoardVO(); input_board2.setBno(2);
		 * input_board2.setTitle("두 번째 게시물 입니다.");
		 * input_board2.setContents("두 번째 내용 입니다.<br>줄바꿈 테스트 입니다.");
		 * input_board2.setWriter("user02"); input_board2.setReg_date(reg_date);
		 * input_board2.setView_count(2); input_board2.setReply_count(0); board_array[1]
		 * = input_board2; //------------------------------------------ List<BoardVO>
		 * board_list = Arrays.asList(board_array); //array 타입을 List 타입으로 변경하는 절차
		 */
		
		// selectMember마이바티스쿼리를 실행하기전에 set이 발생해야 변수값이 할당(아래)
		if(pageVO.getPage() == null) { //int면 null에서 에러나서 pageVO의 page 변수형을 Integer로 변경
		pageVO.setPage(1);
		}
		pageVO.setPerPageNum(8); //리스트 하단에 보이는 페이징 번호의 개수
		pageVO.setQueryPerPageNum(10); //한 페이지당 보여줄 게시물수 10명으로 강제 정함
		//검색된 전체 게시물수 구하기 호출(아래)
		int countBoard = 0;
		countBoard = boardService.countBoard(pageVO);
		pageVO.setTotalCount(countBoard); //전체 게시물수를 구한 변수값을 매개변수로 입력
		
		List<BoardVO> board_list = boardService.selectBoard(pageVO);
		model.addAttribute("board_list", board_list);
		//model.addAttribute("pageVO", pageVO); // @ModelAttribute으로 대체
		return "admin/board/board_list";
	}
	@RequestMapping(value="/admin/member/member_write", method=RequestMethod.POST)
	public String member_write(MemberVO memberVO) throws Exception {
		//아래 GET방식 폼 출력 화면에서 전송된 데이터를 처리하는 바인딩 영역(do)
		//redirect는 글쓰기 후 새로고침을 이용한 게시판 테러를 방지하는 목적
		memberService.insertMember(memberVO);
		return "redirect:/admin/member/member_list";
	}
	
	@RequestMapping(value="/admin/member/member_write", method=RequestMethod.GET)
	public String member_write() throws Exception {
		return "/admin/member/member_write";
	}
	
	@RequestMapping(value="/admin/member/member_update", method=RequestMethod.GET)
	public String member_update(@RequestParam("user_id") String user_id, @ModelAttribute("pageVO") PageVO pageVO, Model model) throws Exception {
		// GET방식이므로 업데이트 form file만 보여줌
		MemberVO memberVO = memberService.readMember(user_id);
		model.addAttribute("memberVO", memberVO);
		return "admin/member/member_update";
	}
	
	@RequestMapping(value="/admin/member/member_update", method=RequestMethod.POST)
	public String member_update(PageVO pageVO, MemberVO memberVO) throws Exception {
		// POST방식으로 넘어온 값을 DB 수정 처리
		memberService.updateMember(memberVO);
		// redirect 역할: 새로고침했을 때, 위 updateMember method 재실행 방지
		return "redirect:/admin/member/member_view?page="+pageVO.getPage()+"&user_id=" + memberVO.getUser_id();
	}
	
	@RequestMapping(value="/admin/member/member_delete", method=RequestMethod.POST)
	public String member_delete(RedirectAttributes rdat, @RequestParam("user_id") String user_id) throws Exception {
		// Redirect로 페이지 이동 시 전송값을 숨겨서 전달하는 클래스 = RedirectAttribute
		rdat.addFlashAttribute("msg", "DELETE");
		memberService.deleteMember(user_id);
		return "redirect:/admin/member/member_list";
	}
	
	// jsp에서 data를 수신하는 명령어 = @RequestParam("key") = request parameter
	// 현재 controller class에서 jsp로 data 송신하는 명령어 = model class 사용
	// data flow: member_list.jsp->@RequestParam("user_id") 수신-> model 송신-> member_view.jsp
	@RequestMapping(value="/admin/member/member_view", method=RequestMethod.GET)
	public String member_view(@ModelAttribute("pageVO") PageVO pageVO, @RequestParam("user_id") String user_id,  Model model) throws Exception {
		MemberVO memberVO = memberService.readMember(user_id);
		model.addAttribute("memberVO", memberVO);
		//model.addAttribute("user_id2", user_id + " 님");
		return "/admin/member/member_view";
	}
	
	@RequestMapping(value="/admin/member/member_list", method=RequestMethod.GET)
	public String member_list(@ModelAttribute("pageVO") PageVO pageVO, Model model) throws Exception {
		//고전적인 방식의 검색코드(아래)
		//public String member_list(@RequestParam(value="search_type", required=false) String search_type, @RequestParam(value="search_keyword", required=false) String search_keyword, Model model)
		/*
		 * String[][] members = {
		 * {"admin","관리자","admin@abc.com","true","2020-12-04","ROLE_ADMIN"},
		 * {"user","사용자","user@abc.com","false","2020-12-04","ROLE_USER"} }; //hash#
		 * data 타입:<키(key),값(value)> -> {"user_id":"admin","user_name":"관리자",...}
		 * //Map타입이 부모 클래스, HashMap타입이 자식 클래스 //Map타입을 상속 받아서, HashMap타입의 오브젝트를 생성하는 방식
		 * Map<String,Integer> mapTest = new HashMap<String,Integer>(); String ageValue
		 * = "40"; int ageValue2 = 40; mapTest.put("ageValue2", ageValue2);
		 * mapTest.put("age", Integer.parseInt(ageValue) ); //제네릭 타입을 사용하면, parseInt형변환을
		 * 할 필요가 없기 때문에 //제네릭 타입의 근본 목적은 데이터 타입에 대해서 명시적인 코딩(코드를 단순화)을 하기 위해서이다
		 * 
		 * Map<String, Object> paramMap = new HashMap<String, Object>();
		 * paramMap.put("user_id", "admin"); paramMap.put("user_name", "관리자");
		 * paramMap.put("age", 40); System.out.println("해시데이터 타입 출력" + paramMap);
		 * 
		 * //members 2차원 배열 변수를 MemberVO 클래스형 오브젝트로(members_array) 변경(아래) MemberVO
		 * members_input = new MemberVO(); members_input.setUser_id("admin");
		 * members_input.setUser_name("찐관리자"); members_input.setEmail("admin@abc.com");
		 * members_input.setEnabled(true); //enabled data형(type)이 boolean형이기 때문에 true,
		 * false 두 값만 입력 가능 Date toDay = new Date(); //java의 data class를 이용하여 현재 날짜를 가진
		 * toDay변수 생성 members_input.setReg_date(toDay); //reg_date data타입이 data형이기 때문에
		 * java 날짜 데이터 입력 members_input.setLevels("ROLE_ADMIN");
		 * members_input.setPoint(10); //point는 데이터 타입이 integer형이기 때문에 숫자만 입력(큰 따옴표 넣으면
		 * 문자로 인식) //위 members_input object에는 2개의 line(record)만 입력되어 있으므로 이 object를
		 * array object에 저장(아래) MemberVO[] members_array = new MemberVO[2]; //class형
		 * array object 생성 members_array[0] = members_input; members_array[1] =
		 * members_input;
		 * //---------------------------------------------------------------------------
		 * ------ List<MemberVO> members_list = Arrays.asList(members_array);
		 * System.out.println("List타입의 오브젝트 클래스 내용을 출력" + members_list.toString());
		 */
		
		// selectMember마이바티스쿼리를 실행하기전에 set이 발생해야 변수값이 할당(아래)
		if(pageVO.getPage() == null) { //int면 null에서 에러나서 pageVO의 page 변수형을 Integer로 변경
			pageVO.setPage(1);
		}
		pageVO.setPerPageNum(8); //리스트 하단에 보이는 페이징 번호의 개수
		pageVO.setQueryPerPageNum(10); //한 페이지당 보여줄 회원수 10명으로 강제 정함
		//검색된 전체 회원수 구하기 호출(아래)
		int countMember = 0;
		countMember = memberService.countMember(pageVO);
		pageVO.setTotalCount(countMember); //전체 회원수를 구한 변수값을 매개변수로 입력
		
		List<MemberVO> members_list = memberService.selectMember(pageVO);
		model.addAttribute("members", members_list); //members 2차원 배열을 members_array class object로 변경(20.12.08)
		
		//model.addAttribute("pageVO", pageVO);
		//System.out.println("디버그 스타트 페이지는" + pageVO.getStartPage());
		//System.out.println("디버그 엔드 페이지는" + pageVO.getEndPage());
		return "admin/member/member_list";//member_list.jsp로 members 변수 데이터 전송
	}
	
	@RequestMapping(value="/admin", method=RequestMethod.GET)
	public String admin() throws Exception {
		return "admin/home";
	}
}
