package com.vclmfi.vcl_mfi.pojo;

public class vcl_organisation_branch {
	private int org_brnach_id;
	private int org_custer_id;
	private String branch_name;
	private int branch_head_id;

	public int getOrg_brnach_id() {
		return org_brnach_id;
	}

	public void setOrg_brnach_id(int org_brnach_id) {
		this.org_brnach_id = org_brnach_id;
	}

	public int getOrg_custer_id() {
		return org_custer_id;
	}

	public void setOrg_custer_id(int org_custer_id) {
		this.org_custer_id = org_custer_id;
	}

	public String getBranch_name() {
		return branch_name;
	}

	public void setBranch_name(String branch_name) {
		this.branch_name = branch_name;
	}

	public vcl_organisation_branch() {
		// TODO Auto-generated constructor stub
	}

	public int getBranch_head_id() {
		return branch_head_id;
	}

	public void setBranch_head_id(int branch_head_id) {
		this.branch_head_id = branch_head_id;
	}

}
