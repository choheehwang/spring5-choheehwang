package kr.or.member;

import kr.or.member.MemberVO;

public class MemberService {
	public void printMember(MemberVO[] members) {//members는 레코드가 여러개=3개(성춘향, 홍길동, 각시탈) 레코드가 들어감
		//서비스 구현 메서드 내용(아래) 향상된 for반복문 사용
		//기존 for문-> for(초기화; 조건식: 증감식){ 내용;}
		//확장(향상)된  for문-> for(변수명 : 반복대상){내용;}
		int cnt = 0;
		for (MemberVO member : members) {// members여러 레코드중 1개의 레코드를 member 오브젝트로 대입
			cnt = cnt + 1;
			//cnt + 1을 할 경우 결과가 "1"번째 레코드는~ 라는 결과가 나오고
			//안 했을 경우 "0"번째 레코드는~ 라는 결과가 나오게 되므로 cnt + 1을 해준 것이다
			System.out.println(cnt + "번째 레코드는 " + member.toString());
			//클래스형 변수를 호출할 때, toString() 자동 호출된다->확실치 않음 아마도...?
		}
	}
}