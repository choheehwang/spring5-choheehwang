package org.edu.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.edu.vo.BoardVO;
import org.edu.vo.PageVO;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDAOImpl implements IF_BoardDAO {
	
	@Inject //SqlSession templet을 inject받아서 변수로 지정
	private SqlSession sqlSession;
	
	@Override
	public List<BoardVO> selectBoard(PageVO pageVO) throws Exception {
		// SqlSession templet(select, update, delete같은 method 포함되어 있음) Mapper query 지정(아래)
		// Mapper query(위 쿼리+insert 등)를 실행할 때, 개발자가 DB connection이나 disconnection을 생각할 필요없이
		// 사용 가능한 method 집합을 구성해놓은 것이 SqlSession templet이다.
		return sqlSession.selectList("boardMapper.selectBoard", pageVO);
	}
	
	@Override
	public int countBoard(PageVO pageVO) throws Exception {
		// sql세션템플릿 사용해서 게시물개수 구하기 매퍼쿼리 연결(아래)
		return sqlSession.selectOne("boardMapper.countBoard", pageVO);
	}

	@Override
	public BoardVO readBoard(Integer bno) throws Exception {
		// 게시물 상세보기 mapper query 연결(아래)
		return sqlSession.selectOne("boardMapper.readBoard", bno);
	}

	@Override
	public List<String> readAttach(Integer bno) throws Exception {
		// 게시물 첨부파일 보기  mapper query 연결(아래)
		return sqlSession.selectList("boardMapper.readAttach", bno);
	}

	@Override
	public void updateViewCount(Integer bno) throws Exception {
		// 게시물 상세보기 조회수 +1 업데이트 mapper query 연결(아래)
		sqlSession.update("boardMapper.updateViewCount", bno);
	}
	
}
