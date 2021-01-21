package kr.or.mentoring;

public class Page134Exercise04 {

	public static void main(String[] args) {
		// 이것이 자바다 p.134 4번 예제
		while(true) {
			int a = (int)(Math.random()*5)+1;
			int b = (int)(Math.random()*5)+1;
			System.out.println("("+a+","+b+")");
			if(a+b == 5) {
				break;
			}
		}
	}

}