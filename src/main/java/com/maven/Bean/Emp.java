package com.maven.Bean;

import java.io.UnsupportedEncodingException;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.springframework.security.crypto.codec.Base64;

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
	private byte[] empimg;
	
	@ManyToOne
	@JoinColumn(name="deptid")
	private Dept dept;
	
	private String empimgstr;
	
	public Emp() {
		super();
	}

	public Emp(int empid, String empname, String empdesig, byte[] empimg,
			String empimgstr, Dept dept) {
		super();
		this.empid = empid;
		this.empname = empname;
		this.empdesig = empdesig;
		this.empimg = empimg;
		this.empimgstr = empimgstr;
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

	public byte[] getEmpimg() {
		return empimg;
	}

	public void setEmpimg(byte[] empimg) {
		this.empimg = empimg;
	}

	public String getEmpimgstr() {
		return empimgstr;
	}

	public void setEmpimgstr(String empimgstr) {
		this.empimgstr = empimgstr;
	}

	public Dept getDept() {
		return dept;
	}

	public void setDept(Dept dept) {
		this.dept = dept;
	}
	
	public String convertBytesToString(){
		String base64Encoded = null;		
		byte[] b1 = getEmpimg();
		byte[] encodeBase64 = Base64.encode(b1);
		try {
			base64Encoded = new String(encodeBase64, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}		
	    return base64Encoded;
	}
}
