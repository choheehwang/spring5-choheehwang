package org.edu.dao;

import java.util.List;

import org.edu.vo.MemberVO;

/**
 * 회원관리 DAO method 명세(목차) interface
 * @author 황초희
 *
 */
public interface IF_MemberDAO {
	public List<MemberVO> selectMember (String search_type, String search_keyword) throws Exception;
	public void insertMember(MemberVO memberVO) throws Exception;
	public void deleteMember(String user_id) throws Exception;
	//throws 스프링을 예외로 보내면 나중에 예외 처리 전용 error.jsp를 만들어서 에러 메세지를 뿌리는 사용자단 사용할 예정
	//회원 상세보기에 대한 결과물(아래)
	public MemberVO readMember(String user_id) throws Exception;
	public void updateMember(MemberVO memberVO) throws Exception;
}
