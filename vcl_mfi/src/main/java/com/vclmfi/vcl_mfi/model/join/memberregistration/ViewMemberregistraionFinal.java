package com.vclmfi.vcl_mfi.model.join.memberregistration;

public class ViewMemberregistraionFinal {

private String name;
private String gender;
private String dob;
private String relation_type_nm;
private int person_id;
private String id_type;
private String id_type2;
private String id_type3="";

private String contact_no;
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
public int getPerson_id() {
	return person_id;
}
public void setPerson_id(int person_id) {
	this.person_id = person_id;
}
public String getId_type() {
	return id_type;
}
public void setId_type(String id_type) {
	this.id_type = id_type;
}
 

public String getId_type2() {
	return id_type2;
}
public void setId_type2(String id_type2) {
	this.id_type2 = id_type2;
}
public String getId_type3() {
	return id_type3;
}
public void setId_type3(String id_type3) {
	this.id_type3 = id_type3;
}
public ViewMemberregistraionFinal(String name, String gender, String dob, String relation_type_nm, int person_id,String contact_no,
		String id_type, String id_type2, String id_type3) {
	super();
	this.name = name;
	this.gender = gender;
	this.dob = dob;
	this.relation_type_nm = relation_type_nm;
	this.person_id = person_id;
	this.id_type = id_type;
	this.id_type2 = id_type2;
	this.id_type3 = id_type3;
	this.contact_no=contact_no;
}
public String getContact_no() {
	return contact_no;
}
public void setContact_no(String contact_no) {
	this.contact_no = contact_no;
}


}
