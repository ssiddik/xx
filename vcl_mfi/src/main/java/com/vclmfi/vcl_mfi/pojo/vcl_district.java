package com.vclmfi.vcl_mfi.pojo;

public class vcl_district {
	private int districtId;
	private String districtShortCode;
	private String districtName;
	private int stateId;

	vcl_district() {

	}

	public int getDistrictId() {
		return districtId;
	}

	public void setDistrictId(int districtId) {
		this.districtId = districtId;
	}

	public String getDistrictShortCode() {
		return districtShortCode;
	}

	public void setDistrictShortCode(String districtShortCode) {
		this.districtShortCode = districtShortCode;
	}

	public String getDistrictName() {
		return districtName;
	}

	public void setDistrictName(String districtName) {
		this.districtName = districtName;
	}

	public int getStateId() {
		return stateId;
	}

	public void setStateId(int stateId) {
		this.stateId = stateId;
	}
}
