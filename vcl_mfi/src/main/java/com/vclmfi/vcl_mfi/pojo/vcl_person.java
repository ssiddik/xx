package com.vclmfi.vcl_mfi.pojo;

public class vcl_person {

	private int person_id;
	private String person_first_name;
	private String person_middle_name;
	private String person_last_name;
	private int age;
	private String gender;
	private String dob;
	private int yob;
	private int person_type_id;
	private int household_id;
	
	private String token;

	public vcl_person() {
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

 

	public String getPerson_last_name() {
		return person_last_name;
	}

	public void setPerson_last_name(String person_last_name) {
		this.person_last_name = person_last_name;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
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

	public int getYob() {
		return yob;
	}

	public void setYob(int yob) {
		this.yob = yob;
	}

	public int getPerson_type_id() {
		return person_type_id;
	}

	public void setPerson_type_id(int person_type_id) {
		this.person_type_id = person_type_id;
	}

	public int getHousehold_id() {
		return household_id;
	}

	public void setHousehold_id(int household_id) {
		this.household_id = household_id;
	}

	public String getToken() {
		return token;
	}

	public void setToken(String token) {
		this.token = token;
	}

	public String getPerson_middle_name() {
		return person_middle_name;
	}

	public void setPerson_middle_name(String person_middle_name) {
		this.person_middle_name = person_middle_name;
	}
}
