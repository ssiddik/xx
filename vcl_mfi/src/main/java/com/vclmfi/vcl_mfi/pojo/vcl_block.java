package com.vclmfi.vcl_mfi.pojo;

public class vcl_block {

private int block_id;
private int district_id;
private int state_id;
private String block_short_cd;
private String block_long_name;


public vcl_block() 
{
	// TODO Auto-generated constructor stub
}

public int getBlock_id() {
	return block_id;
}

public void setBlock_id(int block_id) {
	this.block_id = block_id;
}

public int getDistrict_id() {
	return district_id;
}

public void setDistrict_id(int district_id) {
	this.district_id = district_id;
}

public String getBlock_short_cd() {
	return block_short_cd;
}

public void setBlock_short_cd(String block_short_cd) {
	this.block_short_cd = block_short_cd;
}

public String getBlock_long_name() {
	return block_long_name;
}

public void setBlock_long_name(String block_long_name) {
	this.block_long_name = block_long_name;
}

public int getState_id() {
	return state_id;
}

public void setState_id(int state_id) {
	this.state_id = state_id;
}
}
