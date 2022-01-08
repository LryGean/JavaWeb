package entity;

import java.sql.Date;
import java.util.List;

public class User {
	private int uId;
	private String uName;
	private String uPass;
	private String mailbox;
	private String tel;
	private int gender;
	private String hobby;
	private String city;
	private String head; 
	private String selfI;
	private Date regTime;
	//ID
	public int getUserId() {
		return uId;
	}
	public void setUserId(int uId) {
		this.uId = uId;
	}
	//姓名
	public String getUserName() {
		return uName;
	}
	public void setUserName(String uName) {
		this.uName = uName;
	}
	//密码
	public String getUserPass() {
		return uPass;
	}
	public void setUserPass(String uPass) {
		this.uPass = uPass;
	}
	//邮箱
	public String getMailbox() {
		return mailbox;
	}
	public void setMailbox(String mailbox) {
		this.mailbox = mailbox;
	}
	//手机号
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	//性别
	public int getGender() {
		return gender;
	}
	public void setGender(int gender) {
		this.gender = gender;
	}
	//爱好
	public String getHobby() {
		return hobby;
	}
	public void setHobby(String hobby) {
		this.hobby = hobby;
	}
	//城市
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	//头像
	public String getHead() {
		return head;
	}
	public void setHead(String head) {
		this.head = head;
	}
	//自我介绍
	public String getSelfI() {
		return selfI;
	}
	public void setSelfI(String selfI) {
		this.selfI = selfI;
	}
	//注册时间
	public Date getRegTime() {
		return regTime;
	}
	public void setRegTime(Date regTime) {
		this.regTime = regTime;
	}
}
