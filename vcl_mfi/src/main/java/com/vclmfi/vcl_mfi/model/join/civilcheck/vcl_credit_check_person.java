package com.vclmfi.vcl_mfi.model.join.civilcheck;

public class vcl_credit_check_person {
	private int person_id;
	private String person_first_name;
	private String person_middle_nm;
	private String person_last_nm;
	private String center_name;
	private int employee_id;
	private int status;
	private String himark_link;

	public vcl_credit_check_person() {
		// TODO Auto-generated constructor stub
	}

	public int getPerson_id() {
		return person_id;
	}

	public void setPerson_id(int person_id) {
		this.person_id = person_id;
	}

	public String getPerson_first_name() {
		return person_first_name;
	}

	public void setPerson_first_name(String person_first_name) {
		this.person_first_name = person_first_name;
	}

	public String getPerson_middle__nm() {
		return person_middle_nm;
	}

	public void setPerson_middle__nm(String person_middle_nm) {
		this.person_middle_nm = person_middle_nm;
	}

	public String getPerson_last_nm() {
		return person_last_nm;
	}

	public void setPerson_last_nm(String person_last_nm) {
		this.person_last_nm = person_last_nm;
	}

	public String getCenter_name() {
		return center_name;
	}

	public void setCenter_name(String center_name) {
		this.center_name = center_name;
	}

	public int getEmployee_id() {
		return employee_id;
	}

	public void setEmployee_id(int employee_id) {
		this.employee_id = employee_id;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getHimark_link() {
		return himark_link;
	}

	public void setHimark_link(String himark_link) {
		this.himark_link = himark_link;
	}

}
