package kr.or.test;

import java.sql.Driver;
import java.sql.DriverManager;
import java.util.Enumeration;

public class OracleDriverTest {

	public static void main(String[] args) {
		// ojdbc6.jar: Spring에서 사용할 oracle driver test
		// Oracle driver를 수동으로 로드하는 메서드 = Class.forName();
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			System.out.println("ojdbc6 driver load success!");
		} catch (ClassNotFoundException e) {
			// ojdbc6.jar class를 사용할 수 없을 때 에러 발생
			System.out.println("ojdbc6 driver load fail!");
		}
		// 현재 dependence로 등록된 jdbc driver 개수 확인
		// ex. ojdbc6, MySQL, HSQL 총 3개
		// Driver manager class는 jdbc driver instance(실행 클래스)를 관리하는 class
		// .getDrivers() method를 이용하여 현재 등록된 드라이버를 가져올 수 있음
		// 데이터 타입 중 enumerate는 반복되는 현태의 자료를 나타낼 때 사용
		Enumeration<Driver> driverList =  DriverManager.getDrivers();
		while(driverList.hasMoreElements()) {
			Driver driver = driverList.nextElement();
			System.out.println("Dependency로 등록된 jdbc driver: " + driver);
		}
	}

}
