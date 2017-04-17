package com.vclmfi.vcl_mfi.pojo;

public class vcl_update_role_assignment_bean {
	private int employee_hierarchy_id;
	private int employee_id;
	private int emp_role_id;
	private int sh_state_id;
	private int ch_cluster_id;
	private int am_state_id;
	private int bm_branch_id;
	private int re_branch_id;
	private int[] checked_center_id_array;
	private int[] checked_branch_id_array;
	
	public vcl_update_role_assignment_bean() {
		super();
	}

	public int getEmployee_hierarchy_id() {
		return employee_hierarchy_id;
	}

	public void setEmployee_hierarchy_id(int employee_hierarchy_id) {
		this.employee_hierarchy_id = employee_hierarchy_id;
	}

	public int getEmployee_id() {
		return employee_id;
	}

	public void setEmployee_id(int employee_id) {
		this.employee_id = employee_id;
	}

	public int getEmp_role_id() {
		return emp_role_id;
	}

	public void setEmp_role_id(int emp_role_id) {
		this.emp_role_id = emp_role_id;
	}

	public int getSh_state_id() {
		return sh_state_id;
	}

	public void setSh_state_id(int sh_state_id) {
		this.sh_state_id = sh_state_id;
	}

	public int getCh_cluster_id() {
		return ch_cluster_id;
	}

	public void setCh_cluster_id(int ch_cluster_id) {
		this.ch_cluster_id = ch_cluster_id;
	}

	public int getAm_state_id() {
		return am_state_id;
	}

	public void setAm_state_id(int am_state_id) {
		this.am_state_id = am_state_id;
	}

	public int getBm_branch_id() {
		return bm_branch_id;
	}

	public void setBm_branch_id(int bm_branch_id) {
		this.bm_branch_id = bm_branch_id;
	}

	public int getRe_branch_id() {
		return re_branch_id;
	}

	public void setRe_branch_id(int re_branch_id) {
		this.re_branch_id = re_branch_id;
	}

	public int[] getChecked_center_id_array() {
		return checked_center_id_array;
	}

	public void setChecked_center_id_array(int[] checked_center_id_array) {
		this.checked_center_id_array = checked_center_id_array;
	}

	public int[] getChecked_branch_id_array() {
		return checked_branch_id_array;
	}

	public void setChecked_branch_id_array(int[] checked_branch_id_array) {
		this.checked_branch_id_array = checked_branch_id_array;
	}

}
