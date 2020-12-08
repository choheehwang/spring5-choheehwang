package kr.or.member;

import kr.or.member.MemberService;
import kr.or.member.MemberVO;

public class MainController {

	public static void main(String[] args) {
		// 실행 method
		MemberVO memberVO = new MemberVO(); // 자바 오브젝트 생성하는 법
		memberVO.setName("홍길동");
		memberVO.setAge(20);
		memberVO.setPhoneNum("000-0000-0000");
		MemberVO memberVO2 = new MemberVO();
		memberVO2.setName("성춘향");
		memberVO2.setAge(18);
		memberVO2.setPhoneNum("111-1111-1111");
		MemberVO memberVO3 = new MemberVO();
		memberVO3.setName("각시탈");
		memberVO3.setAge(28);
		memberVO3.setPhoneNum("222-2222-2222");
		// 위 3개의 레코드를 하나에 다 담을 배열 클래스 오브젝트 생성
		MemberVO[] members = new MemberVO[3];
		members[0] = memberVO;
		members[1] = memberVO2;
		members[2] = memberVO3;
		MemberService memberService = new MemberService();
		memberService.printMember(members); // service class의 method 호출

	}

}
