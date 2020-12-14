package org.edu.dao;

import java.util.List;

import org.edu.vo.MemberVO;

/**
 * 회원관리 DAO method 명세(목차) interface
 * @author 황초희
 *
 */
public interface IF_MemberDAO {
	public List<MemberVO> selectMember () throws Exception;
}
