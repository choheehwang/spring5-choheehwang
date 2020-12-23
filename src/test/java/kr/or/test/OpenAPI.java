package kr.or.test;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.Calendar;
import java.util.concurrent.ScheduledThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

/**
 * OpenAPI class로 HRD-Net에서 제공하는 구직훈련과정 API 목록을 출력하는 자바앱
 * @author 황초희
 *
 */
public class OpenAPI {
	// 외부 연계 역할 메서드
	public static void serviceAPI() {
		/*
		 * BufferedReader br = new BufferedReader(new InputStreamReader(System.in));//선언
		 * String s = br.readLine(); //String
		 * int i = Integer.pareseInt(br.readLine()); //Int
		 * 입력은 readLine();이라는 메소드 활용 readLine()시 리턴값을 String으로 고정되기에
		 * String이 아닌 다른타입으로 입력을 받을려면 형변환 필수 예외 처리 필수.
		 * readLine을 할 때마다 try&catch를 활용하여 예외처리를 해주어도 되고, throws IOException을 통하여 작업해도 됨.
		 */
		BufferedReader bufferedReader = null; // HRD-Net에서 전송받은 데이터를 임시저장하는 저장공간
		String urlStr = "http://www.hrd.go.kr/hrdp/api/apipo/APIPO0101T.do?returnType=XML&pageSize=10&srchTraArea1=44&authKey=BReWYFUj0RDZfsrZyK97EQ7bJh0Ka37I&sort=DESC&outType=1&srchTraStDt=20201108&pageNum=1&sortCol=TR_STT_DT&srchTraEndDt=20201231&srchTraPattern=N1&srchPart=-99&apiRequstPageUrlAdres=/jsp/HRDP/HRDPO00/HRDPOA60/HRDPOA60_1.jsp&apiRequstIp=49.169.145.116";
		try { URL url = new URL(urlStr);
			try { HttpURLConnection urlConnection = (HttpURLConnection) url.openConnection(); //형 변환
				urlConnection.setRequestMethod("GET"); // URL 쿼리 스트링으로 파라미터를 보낸다.
				bufferedReader = new BufferedReader(new InputStreamReader(urlConnection.getInputStream(),"euc-kr"));
				String result="";
				String line;
				int cnt = 0;
				// while 반복문(아래)
				while( (line=bufferedReader.readLine()) !=null ) {
					cnt = cnt + 1;
					result = result + line + "\n"; // \n은 Newline 나타내는 기호, 결과는 엔터와 같다
				}
				System.out.println("버퍼리더로 읽어들인  최종 결과값은 아래 입니다. while 반복 횟수는" + cnt);
				// System.out.println(result); 2줄로 읽고 끝
				// XmlUtils.java class를 이용해서 xml 태그를 정리된 모습으로 출력(아래)
				String result_xmlUtils = XmlUtils.formatXml(result);
				System.out.println(result_xmlUtils);
			} catch (IOException e) {
				// Http 웹 접근 에러 상황 발생
				System.out.println("Http 웹 접근에 실패하였습니다." + e.toString());
			}
			
		} catch (MalformedURLException e) {
			// 외부 연계 URL 주소 형식이 잘못되었을 때 에러 상황 발생
			System.out.println("URL 주소 형식이 잘못되었습니다." + e.toString());
		} finally { //예외 발생 여부와 상관없이 무조건 실행됨(finally 블록) - 생략가능
			// console 화면에 현재 PC시간을 표시하여 진짜 5초 단위로 스케줄대로 작동되는지 테스트
			Calendar calendar = Calendar.getInstance();
			System.out.println(calendar.getTime());
		}
	}
	
	public static void main(String[] args) {
		// 메인 스레드는 1개, 다른 스레드를 추가로 실행할 때는 runnable 메서드를 이용(아래)
		// 추가 스레드를 주기적(스케쥴)으로 실행할 때 실행간격 변수(10초)
		int sleepSec = 10;
		// 주기적인 스레드 작업(concurrent 동시작업)을 위한 코딩 -> 변수 new 키워드로 실행 가능한 오브젝트 변수인 exec 변수 생성
		// final은 현재 클래스에서만 사용하겠다는 명시적인 의미
		final ScheduledThreadPoolExecutor exec = new ScheduledThreadPoolExecutor(1);
		exec.scheduleAtFixedRate(new Runnable() {
			public void run() {
				serviceAPI();
			}
		}, 0, sleepSec, TimeUnit.SECONDS);
		
		/*
		 * 일반 메서드와 스태틱 메서드의 호출 차이 StaticTest staticTest = new StaticTest();
		 * staticTest.test2(); //일반 메서드는 오브젝트 생성 후 접근 가능 StaticTest.test(); //스태틱 메서드는
		 * 오브젝트 생성없이 클래스로 바로 접근 가능
		 */
		
		//int sum = 0; while(sum < 10) { sum = sum +1; //sum = sum +1 누적 로직 확인 테스트
		//System.out.println("지금까지 누적된 값은" + sum); }
	}

}

class StaticTest {
	public static void test () { // 클래스를 읽어들이는 순간 실행 가능
		System.out.println("Static test");
	}
	public void test2() { // 일반 메서드는 new키워드로 오브젝트를 생성할 때 실행 가능
		System.out.println("General test");
	}
}