package com.vclmfi.vcl_mfi.model.join.group;

import java.math.BigInteger;

public class GetGroupDetails {
	private BigInteger member_count;
	private String group_name;
	private String group_start_dt;
	private int center_id;
	private int group_id;
	private int flag;
	
	public GetGroupDetails() {
		
	}


	public int getGroup_id() 
	{
		return group_id;
	}
	
	public void setGroup_id(int group_id) 
	{
		this.group_id = group_id;
	}
	public BigInteger getMember_count() 
	{
		return member_count;
	}
	
public void setMember_count(BigInteger member_count) {
	this.member_count = member_count;
}


	public int getCenter_id() {
		return center_id;
	}

	public void setCenter_id(int center_id) {
		this.center_id = center_id;
	}

	public String getGroup_name() {
		return group_name;
	}

	public void setGroup_name(String group_name) {
		this.group_name = group_name;
	}

	public String getGroup_start_dt() {
		return group_start_dt;
	}

	public void setGroup_start_dt(String group_start_dt) {
		this.group_start_dt = group_start_dt;
	}


	public int getFlag() {
		return flag;
	}


	public void setFlag(int flag) {
		this.flag = flag;
	}

}
