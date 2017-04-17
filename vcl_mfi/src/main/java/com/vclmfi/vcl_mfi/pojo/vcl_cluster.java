package com.vclmfi.vcl_mfi.pojo;

public class vcl_cluster {
	private int cluster_id;
	private String cluster_short_code;
	private String cluster_long_name;

	vcl_cluster(){
		
	}

	public int getCluster_id() {
		return cluster_id;
	}

	public void setCluster_id(int cluster_id) {
		this.cluster_id = cluster_id;
	}

	public String getCluster_short_code() {
		return cluster_short_code;
	}

	public void setCluster_short_code(String cluster_short_code) {
		this.cluster_short_code = cluster_short_code;
	}

	public String getCluster_long_name() {
		return cluster_long_name;
	}

	public void setCluster_long_name(String cluster_long_name) {
		this.cluster_long_name = cluster_long_name;
	}

}
