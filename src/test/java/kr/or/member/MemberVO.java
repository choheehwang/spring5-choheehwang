package kr.or.member;

public class MemberVO {
		//MemberVO: DB 테이블로 부터 조회한 컬럼값(데이터)을 변수에 저장하거나
		//또는 변수에 저장된값을 VO객체를 생성하여 DB에 추가하는 역할
		//테이블의 컬럼명과 동일한 자료형과 이름으로 변수를 선언하고, getter/setter 메소드 생성
		
		//멤버 변수 생성(아래)
		private String name;
		private int age;
		private String phoneNum;
		//getter and setter 사용 이유: 외부에서 데이터의 직접 접근을 막기 위해.
		//getter: private 필드 값 읽기 전용, setter: private 필드 값 쓰기 전용
		//getter and setter 없으면 외부 접근 제어
		
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
		public String toString() { //멤버 변수 값들이 출력되게끔 리턴값을 설정하는 메소드
		//숫자와 문자열을 섞어서 출력해야하는 경우, toString()을 활용하여 확실하게 문자열로 바꾸어 주면 불필요한 오류 미리 방지 가능
			return "디버그용 MemberVO [name=" + name + ", age=" + age + ", phoneNum=" + phoneNum + "]";
		}

	}