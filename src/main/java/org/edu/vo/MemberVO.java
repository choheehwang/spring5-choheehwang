package org.edu.vo;

import java.util.Date;

import org.springframework.stereotype.Component;
/**
 * 회원 정보 관리용 클래스
 * @author 황초희 2020-12-04
 */
@Component
public class MemberVO {
	//member 변수 선언(클래스 전역 변수)
	private String user_id;//private: class 내부에서만 사용 가능(보안)
	private String user_pw;
	private String user_name;
	private String email;
	private Integer point;//int 기본형 not null, integer 참조형 enable null
	private Boolean enabled;//boolean: 논리형
	private String levels;
	private Date reg_date;//해결책 사용 시 java.util 패키지를 최우선으로 import하는 것이 좋다
	private Date update_date;
	//getters and setters method: jsp<->controller<->DB 중간에 정보를 전달하는 역할
	
	public String getUser_id() {
		return user_id;
	}
	
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_pw() {
		return user_pw;
	}
	public void setUser_pw(String user_pw) {
		this.user_pw = user_pw;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Integer getPoint() {
		return point;
	}
	public void setPoint(Integer point) {
		this.point = point;
	}
	public Boolean getEnabled() {
		return enabled;
	}
	public void setEnabled(Boolean enabled) {
		this.enabled = enabled;
	}
	public String getLevels() {
		return levels;
	}
	public void setLevels(String levels) {
		this.levels = levels;
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
	
	@Override
	public String toString() {
		return "디버그 MemberVO [user_id=" + user_id + ", user_pw=" + user_pw + ", user_name=" + user_name + ", email="
				+ email + ", point=" + point + ", enabled=" + enabled + ", levels=" + levels + ", reg_date="
				+ reg_date + ", update_date=" + update_date + "]";
	}
	
}
