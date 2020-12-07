package kr.or.test;

public class UtilApp {

	public static void main(String[] args) {
		// 클래스 실행 진입점
		// java.lang Math class를 사용하여 랜덤하게 숫자 뽑기
		System.out.println("1부터 100까지 랜덤하게 숫자 뽑기 = "
		+ (int)(Math.random() * 30+1) //+1이면 1부터, 없으면 0부터 시작
		);

	}

}
