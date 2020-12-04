package kr.or.test;

public class LoopApp {

	public static void main(String[] args) {
		//반복문 중에 for문
		//method에서 사용하는 변수 (아래)
		int[] numbers = {1,2,3,4,5,6,7,8,9,10};//배열 변수 선언
		int cnt;//반복 횟수 카운트 변수 선언
		//for(반복의 시작값 정의;반복의 종료값 정의;반복할 때 증가하는 값) { 반복할 구현 내용 } 아래 함수 설명
		for(cnt=0;cnt<10;cnt++) {//cnt++ -> cnt=cnt+1; 1씩 증가한다는 의미
			System.out.println("현재 카운터는" + numbers[cnt]);
			//println function는 한번 출력 후 newline 엔터 쳐주는 역할
			//10번 반복 -> numbers[0], numbers[1], ..., numbers[9] 출력
		}
		
		//향상된 for문, 스프링 jsp에서 제일 많이 사용하게 되는 구문
		//배열타입[] 1차원 배열 = 가로선 <-단일 row
		//String에서 큰 따옴표(")는 문자열 데이터, 작은 따옴표(')는 1개 문자 데이터를 나타낼 때 사용
		String[] names = {"사용자1","사용자2","사용자3","사용자4","사용자5"};
		//향상된 for문에서는 시작값, 끝값, 증가값이 필요없다
		for(String user_name:names) {
			System.out.println("등록된 사용자 이름은 " + user_name);
		}
		
		//향상된 for문, 회원 정보를 jsp로 출력하기, 현업에서 사용하는 것과 비슷하게 구현
		//배열타입[][] 2차원 배열 = 표 1row, 2row <-list가 있는 row
		String[][] members = {
				{"admin","관리자","admin@abc.com","true","2020-12-04","ROLE_ADMIN"},
				{"user","사용자","user@abc.com","false","2020-12-04","ROLE_USER"}
		};
		System.out.println("=====Member List=====");
		System.out.println("user_id | user_name | e-mail | use | regdate | levels");
		for(String[] member:members) {
			System.out.println(member[0]+"|"+member[1]+"|"+member[2]+"|"+member[3]+"|"+member[4]+"|"+member[5]+"|");
		}
	}
}
