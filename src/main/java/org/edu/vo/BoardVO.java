package org.edu.vo;
/**
 * 게시판에서 사용되는 데이터 입출력 클래스
 * @author 황초희
 *
 */

import java.util.Date;

public class BoardVO {
	//멤버 변수 선언
	private Integer bno; //Int는 null로 냅두면 에러나서 Integer로 변경
	private String title;
	private String contents;
	private String writer;
	private Date regdate;
	private Date update_date;
	private Integer view_count; //글 조회수
	private Integer reply_count; //댓글 조회수
	
	@Override
	public String toString() {
		return "디버그 BoardVO [bno=" + bno + ", title=" + title + ", contents=" + contents + ", writer=" + writer
				+ ", regdate=" + regdate + ", update_date=" + update_date + ", view_count=" + view_count
				+ ", reply_count=" + reply_count + "]";
	}
	
	public Integer getBno() {
		return bno;
	}
	public void setBno(Integer bno) {
		this.bno = bno;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public Date getUpdate_date() {
		return update_date;
	}
	public void setUpdate_date(Date update_date) {
		this.update_date = update_date;
	}
	public Integer getView_count() {
		return view_count;
	}
	public void setView_count(Integer view_count) {
		this.view_count = view_count;
	}
	public Integer getReply_count() {
		return reply_count;
	}
	public void setReply_count(Integer reply_count) {
		this.reply_count = reply_count;
	}
	
}
