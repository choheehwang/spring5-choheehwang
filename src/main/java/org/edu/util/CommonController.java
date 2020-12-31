package org.edu.util;

import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;

import org.edu.service.IF_MemberService;
import org.edu.vo.MemberVO;
import org.springframework.core.io.FileSystemResource;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

/**
 * Common Controller = Admin, Home에서 공통으로 사용
 * @author 황초희
 *
 */
@Controller
public class CommonController {
	
	@Inject
	IF_MemberService memberService;
	
	/**
	 * 첨부파일의 확장자 비교하여 이미지 파일과 일반 파일 구분하여 확인하는 List 변수
	 * 사용용도1: 게시물 상세보기의 첨부파일이 이미지면 미리보기 가능, 아닐 시 다운로드 링크만 보이도록 하는 용도
	 * 사용용도2: 메인페이지 최근 갤러리 게시물에 첨부파일 있을 시 미리보기 이미지가 나오고 첨부파일이 이미지가 아닐 시 대체 이미지를 사용
	 */
	@SuppressWarnings("serial")
	private ArrayList<String> checkImgArray = new ArrayList<String>() {
		{
			add("gif");
			add("jpg");
			add("jpeg");
			add("png");
			add("bmp");
		}
	};
	// 첨부파일 업로드할 경로를 변수값으로 가져올 servlet-context.xml에 있는 uploadPath 내용
	@Resource(name="uploadPath")
	private String uploadPath; // 위 uploadPath 영역의 값을 변수 uploadPath에 저장
	
	public String getUploadPath() {
		return uploadPath;
	}
	
	public void setUploadPath(String uploadPath) {
		this.uploadPath = uploadPath;
	}
	
	//
	@RequestMapping(value="/download", method=RequestMethod.GET)
	@ResponseBody // 현재 페이지에 구현결과를 전송 받음
	public FileSystemResource download(
			@RequestParam("save_file_name") String save_file_name,
			@RequestParam("real_file_name") String real_file_name,
			HttpServletResponse response // 라이브러리 클래스
			) throws Exception { // FileSystemResource로 현재 페이지에서 반환받음
		File file = new File(uploadPath + "/" + save_file_name); // 다운받을 경로 지정
		response.setContentType("application/download; utf-8"); // 파일 내용 한글 깨지는 상황 방지
		real_file_name = URLEncoder.encode(real_file_name, "UTF-8").replaceAll("\\+", "%20"); // 파일명 한글 깨지는 상황 방지
		response.setHeader("Content-Disposition", "attachment; filename=" + real_file_name);
		return new FileSystemResource(file); // 실제 다운로드 시작
	}
	
	// 파일 업로드-xml에서 지정한 폴더에 실제 파일을 저장하는 method 구현(아래)
	public String[] fileUpload(MultipartFile file) throws IOException {
		String realFileName = file.getOriginalFilename(); // jsp에서 전송한 파일명 -> 확장자를 구하는 용도
		// 폴더에 저장할 PK용 파일명 생성(아래)
		UUID uid = UUID.randomUUID(); // 유니크 아이디 생성 -> 폴더에 저장할 파일명으로 사용
		//String saveFileName = uid.toString() + "." + realFileName.split("\\.")[1];
		String saveFileName = uid.toString() + "." + StringUtils.getFilenameExtension(realFileName);
		// split(regex); => regular expression(정규표현식)
		String[] files = new String[] {saveFileName}; // string으로 형 변환
		byte[] fileData = file.getBytes(); // jsp폼에서 전송된 파일이 fileData변수(메모리)에 저장
		File target = new File(uploadPath, saveFileName); // 파일 저장하기 바로 전 설정 저장
		FileCopyUtils.copy(fileData, target); // 실제로 target폴더에 파일로 저장되는 method = 업로드 종료
		return files;
	}
	
	
	// REST-API controller로 사용(아래 @ResponseBody = json text data 반환)
	@RequestMapping(value="/id_check", method=RequestMethod.GET)
	@ResponseBody
	public String id_check(@RequestParam("user_id") String user_id) {
		String result = "0"; // id 중복값 체크
		try {
			MemberVO memberVO = memberService.readMember(user_id);
			if(memberVO != null) {
				result = "1";
			}
		} catch (Exception e) {
			// 위 readMember method 에러 발생시
			result = e.toString();
		}
		return result;
	}

	public ArrayList<String> getCheckImgArray() {
		return checkImgArray;
	}

	public void setCheckImgArray(ArrayList<String> checkImgArray) {
		this.checkImgArray = checkImgArray;
	}
}
