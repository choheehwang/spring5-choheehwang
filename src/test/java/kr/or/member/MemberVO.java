package kr.or.member;

public class MemberVO {
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
		public String toString() {
			return "디버그용 MemberVO [name=" + name + ", age=" + age + ", phoneNum=" + phoneNum + "]";
		}

	}