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
	//����
	public String getUserName() {
		return uName;
	}
	public void setUserName(String uName) {
		this.uName = uName;
	}
	//����
	public String getUserPass() {
		return uPass;
	}
	public void setUserPass(String uPass) {
		this.uPass = uPass;
	}
	//����
	public String getMailbox() {
		return mailbox;
	}
	public void setMailbox(String mailbox) {
		this.mailbox = mailbox;
	}
	//�ֻ���
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	//�Ա�
	public int getGender() {
		return gender;
	}
	public void setGender(int gender) {
		this.gender = gender;
	}
	//����
	public String getHobby() {
		return hobby;
	}
	public void setHobby(String hobby) {
		this.hobby = hobby;
	}
	//����
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	//ͷ��
	public String getHead() {
		return head;
	}
	public void setHead(String head) {
		this.head = head;
	}
	//���ҽ���
	public String getSelfI() {
		return selfI;
	}
	public void setSelfI(String selfI) {
		this.selfI = selfI;
	}
	//ע��ʱ��
	public Date getRegTime() {
		return regTime;
	}
	public void setRegTime(Date regTime) {
		this.regTime = regTime;
	}
}
