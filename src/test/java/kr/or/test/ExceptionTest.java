package kr.or.test;

import java.io.IOException;

public class ExceptionTest {

	public static void main(String[] args) {
		//진입 method(실행 method) 구현 내용
		int b = 0;
		try {
			b = System.in.read();
		} catch (IOException ex) {
			System.out.println(ex);
		}
		System.out.println((char)b);
	}
}
