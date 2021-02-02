package org.edu.test;

import static org.junit.Assert.*;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.inject.Inject;
import javax.sql.DataSource;

import org.edu.dao.IF_BoardDAO;
import org.edu.dao.IF_MemberDAO;
import org.edu.vo.BoardVO;
import org.edu.vo.MemberVO;
import org.edu.vo.PageVO;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.context.annotation.PropertySource;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

/**
 * JUnit 자바단위테스트이고, DataSource 지정 후 DB(HSQL, MySQL, Oracle) 접속
 * DB Table CRUD(Create, Read, Update, Delete) 테스트용 클래스
 * JUnit4 class 사용
 * @author 황초희
 *
 */

@RunWith(SpringJUnit4ClassRunner.class)
// @PropertySource("classpath:properties/local.properties") // 현재 클래스에서 전역변수사용시 필요 
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
@WebAppConfiguration
public class DataSourceTest {

	@Inject
	DataSource dataSource; //java에서처럼 new 오브젝트 생성 안 하고 스프링에서는 @inject로 오브젝트 생성
	
	@Inject
	IF_MemberDAO memberDAO;
	
	@Inject
	IF_BoardDAO boardDAO;
	
	@Inject //사용하면 안 되는 이유: 클래스상단에 @Controller, @Service, @Repository, @Component 이런 내용만 @Inject합니다.
	MemberVO memberVO; //기존자바처럼 new MemberVO() 오브젝트를 생성하지 않고, 주입해서 사용. 
	
	public String memberPrimaryKey() throws Exception {
		//사용자 프라이머리키 생성하는 메서드 년월일시분초 -> 대량 더미데이터 입력 시 유니크 에러 발생 -> UUID로 변경
		/*
		 * Date primaryKey = new Date(); SimpleDateFormat newFormat = new
		 * SimpleDateFormat("yyyyMMddHHmmssSSS"); System.out.println("프라이머리키: " +
		 * newFormat.format(primaryKey));
		 */
		PageVO pageVO = new PageVO();
		pageVO.setPage(1);
		pageVO.setPerPageNum(8);//리스트하단에 보이는 페이징번호의 개수
		pageVO.setQueryPerPageNum(10);//쿼리에서 1페이지당 보여줄 게시물수 10개로 입력 놓았습니다.
		//검색된 전체 게시물수 구하기 서비스 호출
		int countMember = 0;
		countMember = memberDAO.countMember(pageVO);
		return "dummy_" + (countMember+1);
	}
	
	@Test
	public void updateMember() throws Exception {
		// CRUD 중 Update test
		// MemberVO memberVO = new MemberVO();
		memberVO.setUser_name("홍길동");
		memberVO.setUser_pw(""); //이 셋을 적용하면, 공백값 memberVO.getUser_pw() == ""
		// memberVO.setUser_pw(""); // 이 셋을 주석으로 적용하면, 아예보내지 않음 null값 memberVO.getUser_pw() == null
		memberVO.setEmail("test@test.com");
		memberVO.setPoint(100);
		memberVO.setUser_id("admin");
		memberVO.setEnabled(true);
		memberVO.setLevels("ROLE_ADMIN");
		String user_id = memberVO.getUser_id();
		memberDAO.updateMember(memberVO);
	}
	
	@Test
	public void readMember() throws Exception {
		//CRUD 중 Read test
		//MemberVO memberVO = new MemberVO();
		memberVO = memberDAO.readMember("admin");
		System.out.println("admin에 대한 상세정보입니다.");
		System.out.println(memberVO.toString());
	}
	
	@Test
	public void deleteMember() throws Exception {
		//CRUD 중 Delete test(query->DAO->memberDAO)
		memberDAO.deleteMember("user_20201215152550549");
		//삭제 메서드 -> 쿼리 호출
	}
	
	@Test
	public void insertBoard() throws Exception {
		BoardVO boardVO = new BoardVO();
		boardVO.setBoard_type("gallery");
		boardVO.setTitle("더미 게시물");
		boardVO.setContent("더미 내용입니다.");
		boardVO.setWriter("일반 사용자");
		// boardVO.setBno(프라이머리키);
		for(int cnt=0;cnt<=0;cnt++) { // 더미게시물 100입력
			Date reg_date = new Date();
			Calendar cal = Calendar.getInstance();//+
			cal.setTime(reg_date);//+
			cal.add(Calendar.SECOND, cnt);//+ cnt초 더하기
			//???????????????????????????????????????????
			boardVO.setReg_date(cal.getTime());//이부분이 작동을 하지 않아서 문제
			//???????????????????????????????????????????
			boardDAO.insertBoard(boardVO);
			Thread.sleep(1000);
			// 스레드란 현재 실행 중인 클래스를 말한다.
		}
	}
	
	@Test
	public void insertMember() throws Exception {
		// CRUD 중 Create test
		// MemberVO memberVO = new MemberVO();
		// String memberIDKey = memberPrimaryKey();
		memberVO.setUser_name("사용자03");
		// 패스워드 암호화 처리(필수이지만 스프링 시큐리티할 때 처리 예정)
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		memberVO.setUser_pw(passwordEncoder.encode("1234"));
		memberVO.setEmail("user03@abc.com");
		memberVO.setPoint(100);
		memberVO.setEnabled(true);
		memberVO.setLevels("ROLE_USER");
		for(int cnt=0;cnt<=0;cnt++) {//더미사용자 100명 입력
			memberVO.setUser_id(memberPrimaryKey());
			Date reg_date = new Date();
			Calendar cal = Calendar.getInstance();//+
			cal.setTime(reg_date);//+
			cal.add(Calendar.SECOND, cnt);//+ cnt초 더하기
			//???????????????????????????????????????????
			memberVO.setReg_date(cal.getTime());//이부분이 작동을 하지 않아서 문제
			//???????????????????????????????????????????
			memberDAO.insertMember(memberVO);
			Thread.sleep(1000);
			// 스레드란 현재 실행 중인 클래스를 말한다.
		}
		
	}
	
	@Test
	public void selectMember() throws Exception {
		PageVO pageVO = new PageVO();
		pageVO.setSearch_type("user_id");
		pageVO.setSearch_keyword("admin");
		
		//초기 페이징 처리에 필요한 필수값(아래 3줄)
		pageVO.setPage(1);
		pageVO.setPerPageNum(5); //리스트 하단에 보이는 페이징 번호의 개수
		pageVO.setQueryPerPageNum(10); //한 페이지당 보여줄 회원수 10명으로 강제 정함
		
		List<MemberVO> memberList = memberDAO.selectMember(pageVO);
		System.out.println("회원 리스트 테스트 입니다.");
		System.out.println(memberList.toString());
	}
	
	@Test
	public void oldQueryTest() throws Exception {
		//Connection connection = dataSource.getConnection();//root-context사용
		Connection connection = null;
		connection = DriverManager.getConnection("jdbc:hsqldb:file:c:/egov/workspace/embeded/hsql_file.db;hsqldb.lock_file=false","sa","");
		/* mysql(MariaDB)
		 * .getConnection("jdbc:log4jdbc:mysql://127.0.0.1:3306/edu","root","apmsetup");
		 */
		//직접 쿼리를 날립니다.(아래)
		Statement stmt = connection.createStatement();
		/* 인서트 쿼리실행(아래) 
		for(int cnt=0;cnt<=100;cnt++) { //고전 방식으로 더미 데이터 입력하기(아래)
		stmt.executeQuery("INSERT INTO tbl_board VALUES("
				+ "(select count(*) from tbl_board)+1"
				+ ",'강제 수정된 글입니다.', '수정 테스트 ', 'user00', now(),now(), 0, 0)");
		}
		*/
		/* 셀렉트 쿼리실행(아래) */
		ResultSet rs = stmt.executeQuery("select * from tbl_board");
		System.out.println("번호\t\t제목\t\t내용\t\t작성자");
		while(rs.next()) {
			System.out.print(rs.getString("bno"));
			System.out.print(rs.getString("title"));
			System.out.print(rs.getString("content"));
			System.out.print(rs.getString("writer"));
			System.out.println();
		}
		if(rs !=null)rs.close();
		if(stmt !=null)stmt.close();
		if(connection !=null)connection.close();
	}
	
	@Test
	public void dbConnectionTest () throws Exception {
		try {
			Connection connection = dataSource.getConnection();
		} catch (SQLException e) {
			System.out.println("DB 접속 실패" + e);
			e.printStackTrace();
		}
		System.out.println("DB 접속 성공");
	}
	@Test
	public void test() {
		//fail("Not yet implemented");
		System.out.println("JUnit Test Start!");
	}

}
