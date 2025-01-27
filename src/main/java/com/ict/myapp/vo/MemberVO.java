package com.ict.myapp.vo;

public class MemberVO {
    private String userid;
    private String userpwd;
    private String username;
    private String email;
    private String tel;
    private String tel1;
    private String tel2;
    private String tel3;

    private String zipcode;
    private String addr;
    private String addrDetail;
    private String hobby;
    private String writedate;


    public String getUserid() {
		return userid;
	}


	public void setUserid(String userid) {
		this.userid = userid;
	}


	public String getUserpwd() {
		return userpwd;
	}


	public void setUserpwd(String userpwd) {
		this.userpwd = userpwd;
	}


	public String getUsername() {
		return username;
	}


	public void setUsername(String username) {
		this.username = username;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getTel() {
		return tel1 + "-" + tel2 + "-" + tel3;
	}
	public void setTel(String tel) {
		String arr[] = tel.split("-");
		this.tel1=arr[0];
		this.tel2=arr[1];
		this.tel3=arr[2];
	}
	@Override
	public String toString() {
		return "MemberVO [userid=" + userid + ", userpwd=" + userpwd + ", username=" + username + ", email=" + email
				+ ", tel=" + tel + ", tel1=" + tel1 + ", tel2=" + tel2 + ", tel3=" + tel3 + ", zipcode=" + zipcode
				+ ", addr=" + addr + ", addrDetail=" + addrDetail + ", hobby=" + hobby + ", writedate=" + writedate
				+ "]";
	}


	public String getTel1() {
		return tel1;
	}


	public void setTel1(String tel1) {
		this.tel1 = tel1;
	}


	public String getTel2() {
		return tel2;
	}


	public void setTel2(String tel2) {
		this.tel2 = tel2;
	}


	public String getTel3() {
		return tel3;
	}


	public void setTel3(String tel3) {
		this.tel3 = tel3;
	}


	public String getZipcode() {
		return zipcode;
	}


	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}


	public String getAddr() {
		return addr;
	}


	public void setAddr(String addr) {
		this.addr = addr;
	}


	public String getAddrDetail() {
		return addrDetail;
	}


	public void setAddrDetail(String addrDetail) {
		this.addrDetail = addrDetail;
	}


	public String getHobby() {
		return hobby;
	}


	public void setHobby(String hobby) {
		this.hobby = hobby;
	}


	public String getWritedate() {
		return writedate;
	}


	public void setWritedate(String writedate) {
		this.writedate = writedate;
	}


	public MemberVO(){}

}
