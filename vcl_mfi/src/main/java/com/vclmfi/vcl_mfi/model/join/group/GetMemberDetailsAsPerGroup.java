package com.vclmfi.vcl_mfi.model.join.group;

public class GetMemberDetailsAsPerGroup {
	
	private String group_name;
	private String member_name;
	private String center_name;
	private String group_start_dt;
	private int group_leader_id;
	private int memebr_id;
	private int group_id;
	
	
	public int getGroup_id() {
		return group_id;
	}
	public void setGroup_id(int group_id) {
		this.group_id = group_id;
	}
	public GetMemberDetailsAsPerGroup() {
		
	}
	public String getGroup_name() {
		return group_name;
	}
	public void setGroup_name(String group_name) {
		this.group_name = group_name;
	}
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	public String getCenter_name() {
		return center_name;
	}
	public void setCenter_name(String center_name) {
		this.center_name = center_name;
	}
	public String getGroup_start_dt() {
		return group_start_dt;
	}
	public void setGroup_start_dt(String group_start_dt) {
		this.group_start_dt = group_start_dt;
	}
	public int getGroup_leader_id() {
		return group_leader_id;
	}
	public void setGroup_leader_id(int group_leader_id) {
		this.group_leader_id = group_leader_id;
	}
	public int getMemebr_id() {
		return memebr_id;
	}
	public void setMemebr_id(int memebr_id) {
		this.memebr_id = memebr_id;
	}
	

}
