package org.edu.controller;

import java.util.List;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.edu.dao.IF_ReplyDAO;
import org.edu.vo.ReplyVO;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
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
	@RequestMapping(value="/reply/reply_list/{bno}", method=RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> reply_list(@PathVariable("bno") Integer bno) {
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
			List<ReplyVO> replyList = replyDAO.selectReply(bno);
			if(replyList.isEmpty()) {
				// result = null;
				result = new ResponseEntity<Map<String,Object>>(resultMap, HttpStatus.NO_CONTENT);
			}else {
				resultMap.put("replyList", replyList);
				// resultMap을 JSON data를 반환하려면 jackson-databind 모듈 필수
				result = new ResponseEntity<Map<String,Object>>(resultMap, HttpStatus.OK);
			}
		} catch (Exception e) {
			result = new ResponseEntity<Map<String, Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return result;
	}
	
	//댓글 입력 method
	@RequestMapping(value="/reply/reply_write", method=RequestMethod.POST)
	public ResponseEntity<String> reply_write() {
		ResponseEntity<String> responseEntity = 
				new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		//ResponseEntity는 json text를 반환하는데, text-body:"SUCCESS", 전송상태: HttpStatus.OK(200)
		//error message; 전송내용 text-body:e.getMessage(), 전송상태: HttpStatus.BAD_REQUEST(400)
		return responseEntity;
	}
}
