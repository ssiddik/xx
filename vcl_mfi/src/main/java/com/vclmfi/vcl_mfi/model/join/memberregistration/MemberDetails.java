package com.vclmfi.vcl_mfi.model.join.memberregistration;

public class MemberDetails {
	
	private int memberid;
	private String membername;
	private String centername;
	private String dates;
	
	public MemberDetails() {
		
	}

	public int getMemberid() {
		return memberid;
	}
	public void setMemberid(int memberid) {
		this.memberid = memberid;
	}
	
	public String getMembername() {
		return membername;
	}
	public void setMembername(String membername) {
		this.membername = membername;
	}
	public String getCentername() {
		return centername;
	}
	public void setCentername(String centername) {
		this.centername = centername;
	}
	public String getDates() {
		return dates;
	}
	public void setDates(String dates) {
		this.dates = dates;
	}

	
	
}
