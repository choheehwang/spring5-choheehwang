package kr.or.test;

public class ThreadApp {

	public static void main(String[] args) {
		// 메인 스레드 시작 진입점 main()
		//(new ThreadApp()).start();
		//아래 2줄 결과 = 위 1줄 결과
		MyThread myThread1 = new MyThread("myThread1");
		MyThread myThread2 = new MyThread("myThread2");
		MyThread myThread3 = new MyThread("myThread3");
		myThread1.start();
		myThread2.start();
		myThread3.start();
	}

}

class MyThread extends Thread {
	public MyThread(String szName) {
		super(szName);
	}
	public void run() {
		//MyThread start() 호출해야지만 실행되는 method
		for(int cnt=0;cnt<100;cnt++) {
			System.out.println(this.getName() + " ");
		}
	}
}