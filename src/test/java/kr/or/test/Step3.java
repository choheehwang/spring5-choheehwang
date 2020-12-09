package kr.or.test;

import java.util.Calendar;

/**
 * 외부 Enum(enumerate) class를 이용하여 열거형 자료형 test
 * @author 황초희
 *
 */
public class Step3 {

	public static void main(String[] args) {
		// main method-thread start
		Week today = null; //Week 자료형용 today 변수 생성/선언
		//String today2 = null; //String자료형용 today2 변수 생성(위, 아래 모두 같은 명령)
		//MemberVO memberVO = new MemberVO();
		//MemberVO자료형용 memberVO객체 변수/object선언(위)
		//현재 날짜가 무슨 요일인지 한글로 확인하는 프로그램 생성(아래)
		Calendar calendar = Calendar.getInstance();
		//object=객체 변수=인스턴스 변수
		int intWeek = calendar.get(Calendar.DAY_OF_WEEK);
		//switch조건문으로 1~7까지의 반환값을 한글로 변환(아래)
		switch(intWeek) {//switch로 조건을 판단
		case 1:
			today = Week.일; break;
			//break는 case문장을 끝내는 명령
		case 2:
			today = Week.월; break;
		case 3:
			today = Week.화; break;
		case 4:
			today = Week.수; break;
		case 5:
			today = Week.목; break;
		case 6:
			today = Week.금; break;
		case 7:
			today = Week.금; break;
		}
		
		System.out.println("오늘은 "+today+"요일 입니다.");
		
		if(today == Week.수) { //
			System.out.println("수요일에는 축구를 합니다.");
		} else {
			System.out.println("자바를 공부합니다.");
		}
		
		//calendar class는 본인 컴퓨터 달력 날짜이므로 사용자가 임의로 날짜를 수정할 시, 데이터가 훼손될 가능성이 있다.
		//위에 대한 해결책으로 서버 시간을 가져와 출력한다.
		
		
	}

}
