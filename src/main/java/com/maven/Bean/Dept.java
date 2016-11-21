package com.maven.Bean;

import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "deptEk2")
public class Dept {
	
	@Id
	@Column(name="deptid")
	private int deptid;
	
	@Column(name="deptname")
	private String deptname;
	
	@OneToMany(mappedBy="dept")
	Set<Emp> emp;

	public Dept() {
		super();
	}

	public Dept(int deptid, String deptname, Set<Emp> emp) {
		super();
		this.deptid = deptid;
		this.deptname = deptname;
		this.emp = emp;
	}

	public int getDeptid() {
		return deptid;
	}

	public void setDeptid(int deptid) {
		this.deptid = deptid;
	}

	public String getDeptname() {
		return deptname;
	}

	public void setDeptname(String deptname) {
		this.deptname = deptname;
	}

	public Set<Emp> getEmp() {
		return emp;
	}

	public void setEmp(Set<Emp> emp) {
		this.emp = emp;
	}	
}
