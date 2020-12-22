package org.edu.service;

import java.util.List;

import org.edu.vo.MemberVO;
import org.edu.vo.PageVO;

/**
 * IF_MemberService: DAO 호출 역할
 * @author 황초희
 *
 */
public interface IF_MemberService {
	public int countMember (PageVO pageVO) throws Exception;
	public List<MemberVO> selectMember(PageVO pageVO) throws Exception;
	public MemberVO readMember(String user_id) throws Exception;
	public void deleteMember(String user_id) throws Exception;
	// 업데이트 후 member_view.jsp 이동
	public void updateMember(MemberVO memberVO) throws Exception;
	public void insertMember(MemberVO memberVO) throws Exception;
}
