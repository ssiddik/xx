package com.vclmfi.vcl_mfi.pojo;

public class vcl_status {
	private int status_id;
	private String status_code;
	private String status_name;
	private String status_description;
	private int status_type_id;
	
	public vcl_status() {
		super();
	}

	public int getStatus_id() {
		return status_id;
	}

	public void setStatus_id(int status_id) {
		this.status_id = status_id;
	}

	public String getStatus_code() {
		return status_code;
	}

	public void setStatus_code(String status_code) {
		this.status_code = status_code;
	}

	public String getStatus_name() {
		return status_name;
	}

	public void setStatus_name(String status_name) {
		this.status_name = status_name;
	}

	public String getStatus_description() {
		return status_description;
	}

	public void setStatus_description(String status_description) {
		this.status_description = status_description;
	}

	public int getStatus_type_id() {
		return status_type_id;
	}

	public void setStatus_type_id(int status_type_id) {
		this.status_type_id = status_type_id;
	}

}
