package kr.or.test;

public class ClassApp {

	public static void main(String[] args) {
		//이 클래스의 집입에서도 main 실행
		Circle c = new Circle(5); //c라는 인스턴스 오브젝트 클래스 변수(인스턴스 변수) 생성
		Circle c2 = new Circle(10);
		double print_result = c.getchoheehwang();
		System.out.println("첫 번째 원의 넓이는 " + print_result + " 입니다");
		double print_result2 = c2.getchoheehwang();
		System.out.println("두번 째 원의 넓이는 " + print_result2 + " 입니다");

		Employee employee = new Employee();
		Salesman salesman = new Salesman();
		employee.doJob();
		salesman.doJob();
	}

}
class Employee {//회사 모든 직원들
	int nSalary;
	String szDept;//부서명 멤버변수
	public void doJob() {
		System.out.println("Just do it!");
	}
}
class Salesman extends Employee {
	public Salesman() {
		szDept = "영업부";
	}
	public void doJob() {
		System.out.println("환영합니다. "+ szDept +" 입니다.");
	}
}

class Circle {
	int r; //멤버 변수 반지름
	public Circle(int a) {
		r = a;
	}
	public double getchoheehwang() {
		return r*r*3.14;//원의 넓이 반환
	}
}