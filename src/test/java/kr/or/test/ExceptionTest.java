package kr.or.test;

import java.io.IOException;

import org.edu.vo.MemberVO;
//import java.io.InputStreamReader;

public class ExceptionTest {

	public static void main(String[] args) {
		//진입 method(실행 method) 구현 내용
		MemberVO memberVO = new MemberVO();
		System.out.println("회원 정보 클래스의 멤버변수값 출력 = " + memberVO.getUser_email()
		+ memberVO.getLevels() + memberVO.getUser_id()
		+ memberVO.getUser_name() + memberVO.getUser_pw());
		
		int number = 0;
		//InputStreamReader inputStreamReader = new InputStreamReader(System.in);
		System.out.print("0~9까지의 숫자 중 하나의 숫자를 입력해주세요.");
		try {
			number = System.in.read();
			//System.in.read();는 한 문자만 입력 받아서 반환
			number = (char)number;
			System.out.println(); //Enter쳐서 줄바꿈하는 효과
			//number = inputStreamReader.read();
			//inputStreamReader.read();는 한 문자만 입력 받아서 char형으로 반환
		} catch (IOException e) {
			System.out.println("숫자를 입력하지 않으셨습니다.");
			e.printStackTrace();
		}

		System.out.println("입력하신 숫자(바이트형)는 " + number + " 입니다.");
		System.out.println("입력하신 숫자(문자형)는 " + (char)number + " 입니다.");
		//Integer.toString(); -> int to string
		//try {
			//b = System.in.read();
		//} catch (IOException ex) {
			//System.out.println(ex);
		//}
		//System.out.println((char)b);
	}
}
