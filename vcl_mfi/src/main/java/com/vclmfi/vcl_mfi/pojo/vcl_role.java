package com.vclmfi.vcl_mfi.pojo;

public class vcl_role {
	private int role_id;
	private String role_name;
	private int parent_role_id;
	
	public vcl_role() {
		super();
	}

	public int getRole_id() {
		return role_id;
	}

	public void setRole_id(int role_id) {
		this.role_id = role_id;
	}

	public String getRole_name() {
		return role_name;
	}

	public void setRole_name(String role_name) {
		this.role_name = role_name;
	}

	public int getParent_role_id() {
		return parent_role_id;
	}

	public void setParent_role_id(int parent_role_id) {
		this.parent_role_id = parent_role_id;
	}

}
