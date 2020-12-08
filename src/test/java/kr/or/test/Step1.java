package kr.or.test;
/**
 * 내장 변수와 배열 사용에 대해서
 * @author 황초희
 *
 */
public class Step1 {

	public static void main(String[] args) {
		//전역 변수는 class 전체에 영향을 미치는 변수(class 내 사용)
		//내부 변수는 method내에서만 영향을 미치는 변수(method 내 사용)
		//필드(=클래스)에 멤버 변수(전역변수) 만들기(아래)
		String name;
		int age;
		String phoneNum;
		//변수에 값을 대입 연산자로 대입(아래)
		name="홍길동"; age=20; phoneNum="000-0000-0000";
		//위 내용을 출력하는 method 사용(아래)
		printMember(name,age,phoneNum);
		name="성춘향"; age=18; phoneNum="111-1111-1111";
		printMember(name,age,phoneNum);
		name="각시탈"; age=28; phoneNum="222-2222-2222";
		printMember(name,age,phoneNum);
		
		//배열을 이용하여 간편하게 입력하고 출력
		String[] names = {"홍길동","성춘향","각시탈"};
		int[] ages = {20,18,28};
		String[] phoneNums = {"000-0000-0000","111-1111-1111","222-2222-2222"};
		printMember(names,ages,phoneNums);//오버로드형 method 다형성 대표 사례
	}

	private static void printMember(String[] names, int[] ages, String[] phoneNums) {
		// member를 출력할 때 배열값을 받아서 구현하기(아래)
		int dataLength = names.length; //사람 명수 구하기
		System.out.println("매개 변수로 받은 names의 사람 명수: "+names.length);
		//고전for문의 반복문 형식은 for(초기값;끝값=반복의조건cnt<2;증가값)
		for(int cnt=0;cnt<dataLength;cnt++) {
			System.out.println("cnt변수의 변화 = "+cnt);
			System.out.println("회원명: "+names[cnt]+" | 나이: "+ages[cnt]+" | 연락처: "+phoneNums[cnt]);
		}
	}

	private static void printMember(String name, int age, String phoneNum) {
		// member를 출력하는 프린트 mehod 구현 내용
		System.out.println("회원명: "+name+" | 나이: "+age+" | 연락처: "+phoneNum);
	}

}
