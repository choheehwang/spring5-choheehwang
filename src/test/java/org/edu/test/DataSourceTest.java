package org.edu.test;

import static org.junit.Assert.*;

import java.sql.Connection;
import java.sql.SQLException;
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
	
	@Test
	public void selectMember() throws Exception {
		List<MemberVO> memberList = memberDAO.selectMember();
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
