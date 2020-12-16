package org.edu.test;

import static org.junit.Assert.*;

import java.sql.Connection;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.inject.Inject;
import javax.sql.DataSource;

import org.edu.dao.IF_MemberDAO;
import org.edu.vo.MemberVO;
import org.junit.Test;
import org.junit.runner.RunWith;
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
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
@WebAppConfiguration
public class DataSourceTest {

	@Inject
	DataSource dataSource; //java에서처럼 new 오브젝트 생성 안 하고 스프링에서는 @inject로 오브젝트 생성
	
	@Inject
	IF_MemberDAO memberDAO;
	
	@Inject //사용하면 안 되는 이유: 클래스상단에 @Controller, @Service, @Repository, @Component 이런 내용만 @Inject합니다.
	MemberVO memberVO; //기존자바처럼 new MemberVO() 오브젝트를 생성하지 않고, 주입해서 사용. 
	
	public String memberPrimaryKey() {
		//user create rule: prefix: user_, suffix: 년월일시분초
		//user create result ex. user_20201215142132
		Date primaryKey = new Date();
		SimpleDateFormat newFormat = new SimpleDateFormat("yyyyMMddHHmmssSSS");
		System.out.println("프라이머리키: " + newFormat.format(primaryKey));
		return "user_" + newFormat.format(primaryKey);
	}
	
	@Test
	public void updateMember() throws Exception {
		//CRUD 중 Update test
		//MemberVO memberVO = new MemberVO();
		memberVO.setUser_name("홍길동");
		memberVO.setUser_pw(""); //암호를 수정하는 것을 원하지 않는 사람이라 가정
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
	public void insertMember () throws Exception {
		//CRUD 중 Create test
		//MemberVO memberVO = new MemberVO();
		String memberIDKey = memberPrimaryKey();
		memberVO.setUser_id(memberPrimaryKey());
		memberVO.setUser_pw("1234");
		memberVO.setUser_name("사용자03");
		//패스워드 암호화 처리(필수이지만 스프링 시큐리티할 때 처리 예정)
		memberVO.setEmail("user03@abc.com");
		memberVO.setPoint(100);
		memberVO.setEnabled(true);
		memberVO.setLevels("ROLE_USER");
		Date reg_date = new Date();
		memberVO.setReg_date(reg_date); //Mapper query에서 처리로 대체
		memberDAO.insertMember(memberVO);
	}
	
	@Test
	public void selectMember() throws Exception {
		List<MemberVO> memberList = memberDAO.selectMember("user_name","홍길동");
		System.out.println("회원 리스트 테스트 입니다.");
		System.out.println("회원 리스트 테스트" + memberList.toString());
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
