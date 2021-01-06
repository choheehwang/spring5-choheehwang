package org.edu.controller;

import java.util.List;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.edu.dao.IF_ReplyDAO;
import org.edu.vo.PageVO;
import org.edu.vo.ReplyVO;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

/**
 * ReplyController.java Class
 * 댓글 구현 Rest-API 컨트롤러
 * @author 황초희
 *
 */
@RestController
public class ReplyController {
	
	@Inject
	private IF_ReplyDAO replyDAO;
	
	//댓글 리스트 method
	@RequestMapping(value="/reply/reply_list/{bno}/{page}", method=RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> reply_list(@PathVariable("bno") Integer bno, @PathVariable("page") Integer page) throws Exception {
		// 페이징 계산식 처리 start
		PageVO pageVO = new PageVO();
		pageVO.setPage(page); // 조건은 ajax로 호출 시 페이지 변수는 반드시 보내야함
		pageVO.setPerPageNum(3); // 현재 페이지 하단에 보이는 페이징 번호 개수
		pageVO.setQueryPerPageNum(5); // 페이징당 보여줄 댓글 개수
		int replyCount = replyDAO.selectReplyCount(bno);
		pageVO.setTotalCount(replyCount);
		// 페이징 계산식 처리 end
		// 현재 게시물 댓글 전체 개수 구하기: MySQL 게시물 관리 테이블에 있는 reply_count를 가져다 쓸 것
		
		System.out.println("디버그: PathVariable 변수는 " + bno);
		ResponseEntity<Map<String, Object>> result = null;
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		// Map변수=데이터형 [{'key':'List<>'},{'key':'Class'},{'':''},...]
		// {"replyList":[{"reply_text":"1test","replyer":"admin"},
		//				 {"reply_text":"2test","replyer":"admin"}]
		Map<String, Object> dummyMap1 = new HashMap<String, Object>();
		dummyMap1.put("rno", "1");
		dummyMap1.put("replyer", "관리자1");
		dummyMap1.put("reply_text", "댓글1 입력 테스트 입니다.");
		Map<String, Object> dummyMap2 = new HashMap<String, Object>();
		dummyMap2.put("rno", "2");
		dummyMap2.put("replyer", "admin");
		dummyMap2.put("reply_text", "test2");
		List<Object> dummyMapList = new ArrayList<Object>();
		dummyMapList.add(0, dummyMap1);
		dummyMapList.add(1, dummyMap2);
		// resultMap.put("replyList", dummyMapList);
		// ----------------------------------------------
		try {
			List<ReplyVO> replyList = replyDAO.selectReply(bno, pageVO);
			if(replyList.isEmpty()) {
				// result = null;
				result = new ResponseEntity<Map<String,Object>>(resultMap, HttpStatus.NO_CONTENT);
			}else {
				resultMap.put("replyList", replyList);
				resultMap.put("pageVO", pageVO);
				// resultMap을 JSON data를 반환하려면 jackson-databind 모듈 필수
				result = new ResponseEntity<Map<String,Object>>(resultMap, HttpStatus.OK);
			}
		} catch (Exception e) {
			result = new ResponseEntity<Map<String, Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return result;
	}
	
	// 댓글 삭제 method
	@RequestMapping(value="/reply/reply_delete/{bno}/{rno}", method=RequestMethod.DELETE)
	public ResponseEntity<String> reply_delete(@PathVariable("bno") Integer bno, @PathVariable("rno") Integer rno) {
		ResponseEntity<String> result = null;
		try {
			replyDAO.deleteReply(rno);
			result = new ResponseEntity<String> ("success", HttpStatus.OK);
			replyDAO.updateCountReply(bno);
		} catch (Exception e) {
			result = new ResponseEntity<String> (HttpStatus.BAD_REQUEST);
		}
		return result;
	}
	
	// 댓글 수정 method
	@RequestMapping(value="/reply/reply_update", method=RequestMethod.PATCH)
	public ResponseEntity<String> reply_update(@RequestBody ReplyVO replyVO) {
		ResponseEntity<String> result = null;
		try {
			replyDAO.updateReply(replyVO);
			result = new ResponseEntity<String> ("success", HttpStatus.OK);
		} catch (Exception e) {
			result = new ResponseEntity<String> (HttpStatus.BAD_REQUEST);
		}
		return result;
	}
	
	
	//댓글 입력 method
	@RequestMapping(value="/reply/reply_write", method=RequestMethod.POST)
	public ResponseEntity<String> reply_write(@RequestBody ReplyVO replyVO) {
		// ResponseEntity<String> responseEntity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		// ResponseEntity는 json text를 반환하는데, text-body:"SUCCESS", 전송상태: HttpStatus.OK(200)
		// error message; 전송내용 text-body:e.getMessage(), 전송상태: HttpStatus.BAD_REQUEST(400)
		ResponseEntity<String> result = null;
		try {
			replyDAO.insertReply(replyVO);
			result = new ResponseEntity<String>("success", HttpStatus.OK);
			replyDAO.updateCountReply(replyVO.getBno());
		} catch (Exception e) {
			result = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}
		return result; // ResponseEntity 클래스형 String 값을 ajax로 호출한 페이지에 반환하는 역할
	}
}
