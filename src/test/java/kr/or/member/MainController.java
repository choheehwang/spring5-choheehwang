package kr.or.member;

import java.io.IOException;
import java.net.InetAddress;
//import java.net.SocketException;
//import java.net.UnknownHostException;
//import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.Date;

import org.apache.commons.net.ntp.NTPUDPClient;
import org.apache.commons.net.ntp.TimeInfo;

//import kr.or.member.MemberService;
//import kr.or.member.MemberVO;

public class MainController {

	public static void main(String[] args) throws IOException {
		// 실행 method
		// 자바 인스턴스 생성하는 법: 클래스명 객체명 = new 클래스명();
		MemberVO memberVO = new MemberVO();
		memberVO.setName("홍길동");
		memberVO.setAge(45);
		memberVO.setPhoneNum("000-0000-0000");
		
		MemberVO memberVO2 = new MemberVO();
		memberVO2.setName("성춘향");
		memberVO2.setAge(18);
		memberVO2.setPhoneNum("111-1111-1111");
		
		MemberVO memberVO3 = new MemberVO();
		memberVO3.setName("각시탈");
		memberVO3.setAge(28);
		memberVO3.setPhoneNum("222-2222-2222");
		
		MemberVO memberVO4 = new MemberVO();
		memberVO4.setName("황초희");
		memberVO4.setAge(26);
		memberVO4.setPhoneNum("010-3333-4444");
		
		// 위 4개의 레코드를 하나에 다 담을 배열 클래스 오브젝트 생성(아래)
		MemberVO[] members = new MemberVO[4];
		members[0] = memberVO; //컴퓨터 언어는 0부터 시작
		members[1] = memberVO2;
		members[2] = memberVO3;
		members[3] = memberVO4;
		MemberService memberService = new MemberService();
		memberService.printMember(members); // service class의 method 호출
		
		//서버 시간 가져오기(아래)
		//서버 시간을 가져올 수 있는 maven dependancies 사용하여 commons-net lib를 추가
		NTPUDPClient timeClient = new NTPUDPClient();
		timeClient.setDefaultTimeout(1000);
		//Timeout:Network로 서버 시간을 가져올 때 서버에서 1초 동안 응답이 없으면 재접속하라는 명령
		timeClient.open();
		InetAddress address = InetAddress.getByName("pool.ntp.org");
		//InetAddress.getByName() -> 도메인명을 통해 IP주소 얻음
		TimeInfo timeInfo = timeClient.getTime(address);
		//서버 시간을 담은 timeInfo 객체 변수 사용(아래)
		long returnTime = timeInfo.getMessage().getTransmitTimeStamp().getTime();
		//위 반환 받은 타임스탬프 초 값을 일반적인 시간으로 변환(아래)
		Date nowDate = new Date(returnTime);
		//System.out.println("현재 서버 시간은 " + nowDate);
		//SimpleDateFormat formatDate = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		//System.out.println("현재 서버 시간은 " + formatDate.format(nowDate));
		LocalDateTime localDateTime = nowDate.toInstant()
		//LocalDateTime: LocalDate와 LocalTime을 갖는 복합 클래스
				.atZone(ZoneId.systemDefault())
				.toLocalDateTime();
		System.out.println("서버 시간: " + localDateTime);
		System.out.println("로컬 PC 시간: " + LocalDateTime.now());
	}

}
