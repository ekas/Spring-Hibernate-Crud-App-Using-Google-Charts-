package com.maven.Bean;

public class NoEmp {
	
	private Long noofemp;
	private int deptid;
		
	public NoEmp() {
		super();
	}
	
	public NoEmp(Long noofemp, int deptid) {
		super();
		this.noofemp = noofemp;
		this.deptid = deptid;
	}

	public Long getNoofemp() {
		return noofemp;
	}
	public void setNoofemp(Long noofemp) {
		this.noofemp = noofemp;
	}
	public int getDeptid() {
		return deptid;
	}
	public void setDeptid(int deptid) {
		this.deptid = deptid;
	}		
	
	
}
