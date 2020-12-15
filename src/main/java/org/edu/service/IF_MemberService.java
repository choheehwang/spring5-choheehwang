package org.edu.service;

import java.util.List;

import org.edu.vo.MemberVO;

/**
 * IF_MemberService: DAO 호출 역할
 * @author 황초희
 *
 */
public interface IF_MemberService {
	public List<MemberVO> selectMember() throws Exception;
}
