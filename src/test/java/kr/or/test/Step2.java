package kr.or.test;

/**
 * 클래스 자료형 사용에 대한 내용
 * @author 황초희
 *
 */
class MemberVO {
	//멤버 변수 생성(아래)
	private String name;
	private int age;
	private String phoneNum;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getPhoneNum() {
		return phoneNum;
	}
	public void setPhoneNum(String phoneNum) {
		this.phoneNum = phoneNum;
	}

	@Override
	public String toString() {
		return "디버그용 MemberVO [name=" + name + ", age=" + age + ", phoneNum=" + phoneNum + "]";
	}

}

class MemberService {//회원 출력에 관련된 method 집합(아래)
	public void printMember(MemberVO[] members) {
		//서비스 구현 내용
		//향상된 for 반복문 사용
		int cnt=0;
		for(MemberVO member:members) {
			cnt = cnt +1;
			System.out.println(cnt + "번째 레코드는" + member.toString());
		}
	}
}

public class Step2 {
	public static void main(String[] args) {
		// 실행 method
		MemberVO memberVO = new MemberVO(); //자바 오브젝트 생성하는 법
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
		//위 3개의 레코드를 하나에 다 담을 배열 클래스 오브젝트 생성
		MemberVO[] members = new MemberVO[3];
		members[0] = memberVO;
		members[1] = memberVO2;
		members[2] = memberVO3;
		MemberService memberService = new MemberService();
		memberService.printMember(members); //service class의 method 호출
	}

}
