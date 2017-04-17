package com.vclmfi.vcl_mfi.model.join.civilcheck;

import java.math.BigInteger;

public class Civilcheckfinal {
	private int e_id;
	private String ename;
	private BigInteger approved;
	private BigInteger pending;
	private BigInteger rejected;

	public int getE_id() {
		return e_id;
	}

	public void setE_id(int e_id) {
		this.e_id = e_id;
	}

	public String getEname() {
		return ename;
	}

	public void setEname(String ename) {
		this.ename = ename;
	}

	public BigInteger getApproved() {
		return approved;
	}

	public void setApproved(BigInteger approved) {
		this.approved = approved;
	}

	public BigInteger getPending() {
		return pending;
	}

	public void setPending(BigInteger pending) {
		this.pending = pending;
	}

	public BigInteger getRejected() {
		return rejected;
	}

	public void setRejected(BigInteger rejected) {
		this.rejected = rejected;
	}

	public Civilcheckfinal(int e_id, String ename, BigInteger approved, BigInteger pending, BigInteger rejected) {
		super();
		this.e_id = e_id;
		this.ename = ename;
		this.approved = approved;
		this.pending = pending;
		this.rejected = rejected;
	}

}
