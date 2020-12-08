package kr.or.member;

import kr.or.member.MemberVO;

public class MemberService {
	public void printMember(MemberVO[] members) {
		// 서비스 구현 내용
		// 향상된 for 반복문 사용
		int cnt = 0;
		for (MemberVO member : members) {
			cnt = cnt + 1;
			System.out.println(cnt + "번째 레코드는" + member.toString());
		}
		//데이터 가공(아래)
		//CRUD 구현 내용
	}
}
