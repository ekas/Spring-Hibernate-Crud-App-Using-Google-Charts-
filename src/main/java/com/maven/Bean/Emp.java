package com.maven.Bean;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="empEk2")
public class Emp {
	
	@Id
	@Column(name="empid")
	private int empid;
	
	@Column(name="empname")
	private String empname;
	
	@Column(name="empdesig")
	private String empdesig;
	
	@Lob
	@Column(name="empimgstr")
	private String empimgstr;
	
	@Lob
	private byte[] empimg;

	@ManyToOne
	@JoinColumn(name="deptid")
	private Dept dept;

	public Emp() {
		super();
	}

	public Emp(int empid, String empname, String empdesig, byte[] empimg, String empimgstr, Dept dept) {
		super();
		this.empid = empid;
		this.empname = empname;
		this.empdesig = empdesig;
		this.empimgstr = empimgstr;
		this.empimg = empimg;
		this.dept = dept;
	}

	public int getEmpid() {
		return empid;
	}

	public void setEmpid(int empid) {
		this.empid = empid;
	}

	public String getEmpname() {
		return empname;
	}

	public void setEmpname(String empname) {
		this.empname = empname;
	}

	public String getEmpdesig() {
		return empdesig;
	}

	public void setEmpdesig(String empdesig) {
		this.empdesig = empdesig;
	}

	public String getEmpimgstr() {
		return empimgstr;
	}

	public void setEmpimgstr(String empimgstr) {
		this.empimgstr = empimgstr;
	}

	public byte[] getEmpimg() {
		return empimg;
	}

	public void setEmpimg(byte[] empimg) {
		this.empimg = empimg;
	}

	public Dept getDept() {
		return dept;
	}

	public void setDept(Dept dept) {
		this.dept = dept;
	}	
}
