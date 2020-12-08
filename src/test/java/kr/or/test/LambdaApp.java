package kr.or.test;

import java.util.function.IntSupplier;

public class LambdaApp {
	public static int method(int x, int y) {
		//intSupplier class: 계산된 결과값을 반환할 때 int형으로 반환하는 명령이 모인 class
		//람다식 적용 전(아래)
		IntSupplier intSupplier = new IntSupplier() {

			@Override
			public int getAsInt() {
				int sum = x+y;
				return sum;
			}
			
		};
		//위 intSupplier object를 호출해야만 실행됨
		int result = intSupplier.getAsInt();
		//람다식 적용 후(아래)
		IntSupplier intSupplier2 = () -> {
		//구현 내용 ->(arrow function 추가 및 method명, new, @Override 생략)
				int sum = x+y;
				return sum;
		};
		int result2 = intSupplier2.getAsInt();
		
		return result2;
	}
	public static void main(String[] args) {
		// 자바 애플리케이션의 진입 실행 함수
		System.out.println("람다식 테스트용 method 반환값 출력= " + method(3,5) );
	}

}