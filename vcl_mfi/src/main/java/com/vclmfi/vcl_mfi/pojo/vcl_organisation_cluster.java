package com.vclmfi.vcl_mfi.pojo;

public class vcl_organisation_cluster {
	private int org_cluster_id;
	private String org_cluster_name;
	private int org_id;
	private int cluster_head_id;
	
	public vcl_organisation_cluster() {
		super();
	}

	public int getOrg_cluster_id() {
		return org_cluster_id;
	}

	public void setOrg_cluster_id(int org_cluster_id) {
		this.org_cluster_id = org_cluster_id;
	}

	public String getOrg_cluster_name() {
		return org_cluster_name;
	}

	public void setOrg_cluster_name(String org_cluster_name) {
		this.org_cluster_name = org_cluster_name;
	}

	public int getOrg_id() {
		return org_id;
	}

	public void setOrg_id(int org_id) {
		this.org_id = org_id;
	}

	public int getCluster_head_id() {
		return cluster_head_id;
	}

	public void setCluster_head_id(int cluster_head_id) {
		this.cluster_head_id = cluster_head_id;
	}
}
