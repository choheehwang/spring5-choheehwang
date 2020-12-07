package kr.or.test;
//오리지날 자바프로그램 형식: 자바이론공부 -> 스프링 웹프로그램과는 형식이 틀립니다.
public class ClassApp {

	public static void main(String[] args) {
		// 이 클래스의 진입 메서드 main 실행
		Circle c = new Circle(5); //c라는 인스턴스 오브젝트 클래스 변수(인스턴스 변수) 생성
		Circle c2 = new Circle(10);
		double print_result = c.getchoheehwang();
		System.out.println("첫번째 원의 넓이는 " + print_result + " 입니다.");
		double print_result2 = c2.getchoheehwang();
		System.out.println("두번째 원의 넓이는 " + print_result2 + " 입니다.");
		//아래 new 키워드 생성자를 이용해서 오브젝트를 2개 만들었음. 
		Employee employee = new Employee();
		Salesman salesman = new Salesman();
		Development development = new Development();
		employee.doJob();
		salesman.doJob();
		development.doJob();
		GraphicObject graphicObject = new Triangle();
		graphicObject.draw();//클래스형 변수명을 지정할때, 카멜표기(낙타등)를 적용.
	}

}

//메서드 오버로드(한개의 클래스에서 메서드이름은 고유값이라서 중복해서 사용할 수 없어요, 단, 매개변수(인자값)가 다르면 가능합니다.

//추상클래스에 대한 연습(아래)
//추상클래스또는 인터페이스를 사용하는 목적은 두꺼운책에서 목차를 만드는 것과 똑같은 역할.
abstract class GraphicObject {
	int x, y;//그래픽오브젝트 클래스 멤버번수 선언
	abstract void draw();//명세표만 있고 구현내용이 없는(인터페이스) 추상메서드 선언
	//다른 해석하면, 책에서 목차만 있고, 내용이 없는 구조. 내용은 별도의 클래스에 있음.
}
class Triangle extends GraphicObject {
	//메서드 오버라이드(메서드이름이 같은 것을 상속관계에서 실행) 
	@Override
	void draw() {
		System.out.println("  *");
		System.out.println(" * * ");
		System.out.println("*****");
	}
	
}

//클래스 상속에 대한 연습(아래)
class Employee {//모든 직원들=클래스
	int nSalary;//봉급=멤버변수
	String szDept;//부서명=멤버변수
	public void doJob() {
		System.out.println("환영합니다. 직원분들!");
	}
}
class Salesman extends Employee {
	public Salesman() {//클래스명과 똑같은 메서드를 생성자 메서드 입니다.
		szDept = "판매 부서";//부모클래스 Employee의 szDept멤버변수를 자식 클래스에서도 사용가능
	}
	public void doJob() {
		System.out.println("환영합니다. " + szDept +" 입니다!");
	}
}
class Development extends Employee {
	public Development() {szDept="개발 부서";}
	public void doJob() {
		System.out.println("환영합니다. " + szDept + " 입니다.!");
	}
}

//오브젝트생성과 new키워드사용 연습(아래)
class Circle {
	private int r;//멤버변수 반지름 = 전연변수
	public Circle(int a) {//생성자매서드 a인자=매개변수=파라미터 값은 new키워드로 오브젝트 만들어질때 발생
		r = a;
	}
	public double getchoheehwang() {
		return r*r*3.14;//원의 넓이를 반환
	}
}

