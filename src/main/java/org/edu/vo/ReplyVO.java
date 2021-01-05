package org.edu.vo;

import java.util.Date;

/**
 * 댓글의 data 입출력 담당하는 data 클래스
 * @author 황초희
 *
 */
public class ReplyVO {
	// 멤버 변수 생성
	private Integer rno; // 댓글 고유 번호
	private Integer bno; // 부모 게시글 번호
	private String reply_text; // 댓글 내용
	private String replyer; // 댓글 작성자
	private Date reg_date; // 댓글 등록일
	private Date update_date; // 댓글 수정일
	
	@Override
	public String toString() {
		return "ReplyVO [rno=" + rno + ", bno=" + bno + ", reply_text=" + reply_text + ", replyer=" + replyer
				+ ", reg_date=" + reg_date + ", update_date=" + update_date + "]";
	}
	public Integer getRno() {
		return rno;
	}
	public void setRno(Integer rno) {
		this.rno = rno;
	}
	public Integer getBno() {
		return bno;
	}
	public void setBno(Integer bno) {
		this.bno = bno;
	}
	public String getReply_text() {
		return reply_text;
	}
	public void setReply_text(String reply_text) {
		this.reply_text = reply_text;
	}
	public String getReplyer() {
		return replyer;
	}
	public void setReplyer(String replyer) {
		this.replyer = replyer;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	public Date getUpdate_date() {
		return update_date;
	}
	public void setUpdate_date(Date update_date) {
		this.update_date = update_date;
	}
	
}
