package com.example.entity;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class User {
	private Integer id;//id
	private String userName;//*用户账号，
	private String password;//*用户密码，
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date createTime;//注册时间，，
	private String phone;//*用户手机号

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}
}
