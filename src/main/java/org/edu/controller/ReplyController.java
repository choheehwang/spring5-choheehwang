package org.edu.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
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
