package org.edu.service;

import java.util.List;
import javax.inject.Inject;
import org.edu.dao.IF_BoardDAO;
import org.edu.vo.BoardVO;
import org.edu.vo.PageVO;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service // 스프링 빈으로 사용하기 위해 애노테이션으로 명시
public class BoardServiceImpl implements IF_BoardService {
	
	@Inject // DAO class를 주입 받아서 사용 변수 생성
	private IF_BoardDAO boardDAO;
	
	@Override
	public List<BoardVO> selectBoard(PageVO pageVO) throws Exception {
		// DAO class 사용하는 코드(아래)
		return boardDAO.selectBoard(pageVO);
	}
	
	@Override
	public int countBoard(PageVO pageVO) throws Exception {
		// DAO클래스 사용코드(아래)
		return boardDAO.countBoard(pageVO);
	}
	
	@Transactional
	@Override
	public BoardVO readBoard(Integer bno) throws Exception {
		// bno 번호에 해당하는 게시물 조회 query DAO 연결 + 해당 게시물 조회수 업데이트
		boardDAO.updateViewCount(bno);
		return boardDAO.readBoard(bno);
	}

	@Override
	public List<String> readAttach(Integer bno) throws Exception {
		// bno 번호에 해당하는 첨부파일 조회 query DAO 연결(아래)
		return boardDAO.readAttach(bno);
	}

}
