package kr.or.test;

public class RunnableApp implements Runnable {

	public static void main(String[] args) {
		// Runnable interface 구현 내용
		(new Thread(new RunnableApp())).start();
	}

	@Override
	public void run() {
		// runnable interface 구현 내용
		//RunnableApp start() 하면 자동 실행
		System.out.println("Runnable sart 시 자동 실행됩니다.");
	}

}
