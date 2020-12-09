package kr.or.member;

import java.io.IOException;
import java.net.InetAddress;
import java.net.SocketException;
import java.net.UnknownHostException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.Date;

import org.apache.commons.net.ntp.NTPUDPClient;
import org.apache.commons.net.ntp.TimeInfo;

import kr.or.member.MemberService;
import kr.or.member.MemberVO;

public class MainController {

	public static void main(String[] args) throws IOException {
		// 실행 method
		MemberVO memberVO = new MemberVO(); // 자바 오브젝트 생성하는 법
		memberVO.setName("홍길동");
		memberVO.setAge(20);
		memberVO.setPhoneNum("000-0000-0000");
		MemberVO memberVO2 = new MemberVO();
		memberVO2.setName("성춘향");
		memberVO2.setAge(18);
		memberVO2.setPhoneNum("111-1111-1111");
		MemberVO memberVO3 = new MemberVO();
		memberVO3.setName("각시탈");
		memberVO3.setAge(28);
		memberVO3.setPhoneNum("222-2222-2222");
		// 위 3개의 레코드를 하나에 다 담을 배열 클래스 오브젝트 생성
		MemberVO[] members = new MemberVO[3];
		members[0] = memberVO;
		members[1] = memberVO2;
		members[2] = memberVO3;
		MemberService memberService = new MemberService();
		memberService.printMember(members); // service class의 method 호출
		
		//서버 시간 가져오기(아래)
		//서버 시간을 가져올 수 있는 maven dependancies 사용하여 commons-net lib를 추가
		NTPUDPClient timeClient = new NTPUDPClient();
		timeClient.setDefaultTimeout(1000);
		//Timeout:Network로 서버 시간을 가져올 때 서버에서 1초 동안 응답이 없으면 재접속하라는 명령
		timeClient.open();
		InetAddress address = InetAddress.getByName("pool.ntp.org");
		TimeInfo timeInfo = timeClient.getTime(address);
		//서버 시간은 담은 timeInfo 객체 변수를 사용(아래)
		long returnTime = timeInfo.getMessage().getTransmitTimeStamp().getTime();
		//위 반환 받은 타임스탬프 초 값을 일반적인 시간으로 변환(아래)
		Date nowDate = new Date(returnTime);
		//System.out.println("현재 서버 시간은 " + nowDate);
		//SimpleDateFormat formatDate = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		//System.out.println("현재 서버 시간은 " + formatDate.format(nowDate));
		LocalDateTime localDateTime = nowDate.toInstant()
				.atZone(ZoneId.systemDefault())
				.toLocalDateTime();
		System.out.println("서버 시간: " + localDateTime);
		System.out.println("로컬 PC 시간: " + localDateTime.now());
	}

}
