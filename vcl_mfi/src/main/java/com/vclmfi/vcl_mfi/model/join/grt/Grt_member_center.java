package com.vclmfi.vcl_mfi.model.join.grt;

public class Grt_member_center {

	
	private int center_id;
	private int member_id;
	private String member_name;
	
	private int member_status;
	private int member_reason;
	private int group_reason;
	private int group_stats;
	public int getCenter_id() {
		return center_id;
	}
	public void setCenter_id(int center_id) {
		this.center_id = center_id;
	}
	public int getMember_id() {
		return member_id;
	}
	public void setMember_id(int member_id) {
		this.member_id = member_id;
	}
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	public int getMember_status() {
		return member_status;
	}
	public void setMember_status(int member_status) {
		this.member_status = member_status;
	}
	public int getMember_reason() {
		return member_reason;
	}
	public void setMember_reason(int member_reason) {
		this.member_reason = member_reason;
	}
	public int getGroup_reason() {
		return group_reason;
	}
	public void setGroup_reason(int group_reason) {
		this.group_reason = group_reason;
	}
	public int getGroup_stats() {
		return group_stats;
	}
	public void setGroup_stats(int group_stats) {
		this.group_stats = group_stats;
	}

	 public Grt_member_center() {
		// TODO Auto-generated constructor stub
	}
}
