package com.vclmfi.vcl_mfi.model.join.cgt;

public class GroupLiseCgtGrt 
{
	public String getGroup_name() {
		return group_name;
	}
	public void setGroup_name(String group_name) {
		this.group_name = group_name;
	}
	public int getGroup_id() {
		return group_id;
	}
	public GroupLiseCgtGrt(int group_id,String group_name, int cgt, int grt, int blc, int loan_application,
			int pre_sanction, int post_sanction) {
		super();
		this.group_name = group_name;
		this.group_id = group_id;
		this.cgt = cgt;
		this.grt = grt;
		this.blc = blc;
		this.loan_application = loan_application;
		this.pre_sanction = pre_sanction;
		this.post_sanction = post_sanction;
	}
	public void setGroup_id(int group_id) {
		this.group_id = group_id;
	}
	public int getCgt() {
		return cgt;
	}
	public void setCgt(int cgt) {
		this.cgt = cgt;
	}
	public int getGrt() {
		return grt;
	}
	public void setGrt(int grt) {
		this.grt = grt;
	}
	public int getBlc() {
		return blc;
	}
	public void setBlc(int blc) {
		this.blc = blc;
	}
	public int getLoan_application() {
		return loan_application;
	}
	public void setLoan_application(int loan_application) {
		this.loan_application = loan_application;
	}
	public int getPre_sanction() {
		return pre_sanction;
	}
	public void setPre_sanction(int pre_sanction) {
		this.pre_sanction = pre_sanction;
	}
	public int getPost_sanction() {
		return post_sanction;
	}
	public void setPost_sanction(int post_sanction) {
		this.post_sanction = post_sanction;
	}
	private String group_name;
	private int group_id;
/*	private int status_count;
*/	
	private int cgt;
	private int grt;
	private int blc;
	private int loan_application;
	private int pre_sanction;
	private int post_sanction;
	
	
}
