package com.vclmfi.vcl_mfi.pojo;

public class vcl_state {
	private int state_id;
	private String state_short_cd;
	private String state_name;
	private String state_head_id;
	

	public int getState_id() {
		return state_id;
	}

	public void setState_id(int state_id) {
		this.state_id = state_id;
	}

	public String getState_short_cd() {
		return state_short_cd;
	}

	public void setState_short_cd(String state_short_cd) {
		this.state_short_cd = state_short_cd;
	}

	 

	vcl_state() {

	}

	public String getState_name() {
		return state_name;
	}

	public void setState_name(String state_name) {
		this.state_name = state_name;
	}

	public String getState_head_id() {
		return state_head_id;
	}

	public void setState_head_id(String state_head_id) {
		this.state_head_id = state_head_id;
	}
}
