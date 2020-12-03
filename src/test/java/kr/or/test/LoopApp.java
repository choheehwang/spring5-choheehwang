package kr.or.test;

public class LoopApp {

	public static void main(String[] args) {
		//반복문 중에 for문
		//method에서 사용하는 변수 (아래)
		int[] numbers = {1,2,3,4,5,6,7,8,9,10};//배열 변수 선언
		int cnt;//반복 횟수 카운트 변수 선언
		for(cnt=0;cnt<10;cnt++) {//cnt++ -> cnt=cnt+1; 1씩 증가한다는 의미
			System.out.println("현재 카운터는" + numbers[cnt]);
			//println function는 한번 출력 후 newline 엔터 쳐주는 역할
			//10번 반복 -> numbers[0], numbers[1], ..., numbers[9] 출력
		}
	}

}
