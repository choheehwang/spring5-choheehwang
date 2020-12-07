package kr.or.test;

public class InterfaceApp {

	public static void main(String[] args) {
		//자바 프로그램은 항상 main() 진입점에서 실행, 웹 프로그램은 해당사항 없음
		AllCalc allCalc = new AllCalc();//실행 오브젝트 변수 생성
		//동적바인딩: method를 호출할 때, (5,5) 이렇게 매개변수가 고정되지 않고 동적으로 묶이는 방식
		allCalc.add(5, 5);
		allCalc.sub(5, 5);
		allCalc.mul(5, 5);
		allCalc.div(5, 5);
	}

}

//인터페이스 실습
interface CalcAddSub {
	void add(double dx, double dy);
	void sub(double dx, double dy);
}
interface CalcMulDiv extends CalcAddSub {
	void mul(double dx, double dy);
	void div(double dx, double dy);
}
class AllCalc implements CalcAddSub, CalcMulDiv {

	@Override
	public void mul(double dx, double dy) {
		//구현 내용
		System.out.println("곱하기 결과는 " + dx*dy);
	}

	@Override
	public void div(double dx, double dy) {
		//구현 내용
		System.out.println("나누기 결과는 " + dx/dy);
	}

	@Override
	public void add(double dx, double dy) {
		//구현 내용
		System.out.println("더하기 결과는 " + (dx+dy));
	}

	@Override
	public void sub(double dx, double dy) {
		//구현 내용
		System.out.println("빼기 결과는 " + (dx-dy));
	}

}