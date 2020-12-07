package kr.or.test;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

public class FileInputOutput {

	public static void main(String[] args) throws IOException {
		// PC에 저장된 메모장 파일 불러와 출력하기 구현 내용
		//내부 변수 선언
		FileInputStream fileInputStream = null;
		FileOutputStream fileOutputStream = null;
		//object = instant = 실행가능한 클래스형 변수 생성
		try {
			fileInputStream = new FileInputStream("C:\\egov\\workspace\\choheehwang\\manifest.yml");
			//fileOutputStream = new FileOutputStream("");
			//반복문: for문(시작값;끝값;증가값 필요), while문(for 대신 사용)
			int byte_content;
			while( (byte_content = fileInputStream.read()) != -1 ) {
				System.out.println("byte형 문자 읽어들이기 " + (char)byte_content);
			}
		} catch (FileNotFoundException e) {
			System.out.println("경로에서 파일을 찾을 수 없습니다. " + e.toString());
			e.printStackTrace();
		}
	}

}
