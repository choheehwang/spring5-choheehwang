package org.edu.service;

import java.util.List;

import javax.inject.Inject;

import org.edu.dao.IF_MemberDAO;
import org.edu.vo.MemberVO;
import org.springframework.stereotype.Service;

/**
 * MemberServiceImpl: DAO method 호출 구현
 * @author 황초희
 *
 */
@Service
public class MemberServiceImpl implements IF_MemberService {

	@Inject
	IF_MemberDAO memberDAO;
	//IF_MemberDAO interface를 inject해서 memberDAO라는 오브젝트 생성
	
	@Override
	public List<MemberVO> selectMember() throws Exception {
		// 회원정보 조회 DAO class의 method 호출(아래)
		return memberDAO.selectMember();
	}

}
