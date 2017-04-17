package com.vclmfi.vcl_mfi.model.join.memberregistration;

public class ViewMemberregistration {
	private int person_id;
private String name;
private String gender;
private String dob;
private String relation_type_nm;

private String contact_no;

public int getPerson_id() {
	return person_id;
}
public void setPerson_id(int person_id) {
	this.person_id = person_id;
}
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
public String getGender() {
	return gender;
}
public void setGender(String gender) {
	this.gender = gender;
}
public String getDob() {
	return dob;
}
public void setDob(String dob) {
	this.dob = dob;
}
public String getRelation_type_nm() {
	return relation_type_nm;
}
public void setRelation_type_nm(String relation_type_nm) {
	this.relation_type_nm = relation_type_nm;
}
public ViewMemberregistration() {
	// TODO Auto-generated constructor stub
}
public String getContact_no() {
	return contact_no;
}
public void setContact_no(String contact_no) {
	this.contact_no = contact_no;
}

}
