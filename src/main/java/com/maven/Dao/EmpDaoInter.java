package com.maven.Dao;

import java.sql.Blob;
import java.util.List;

import com.maven.Bean.Emp;
import com.maven.Bean.NoEmp;

public interface EmpDaoInter {
	public List<Emp> getEmployees();
	public List<NoEmp> getEmpPerDept();
	public List<Emp> getSpecEmpPerDept(int deptid);
	public List<Emp> getByEmpName(String empname, int deptid);
	public List<Emp> getByEmpOrder(int deptid, String orderby, String ordertype);
	public String deleteEmp(int empid);
	public List<Emp> updateEmp(int deptid,int empid);
	public String addEmp(int empid, String empname, String empdesig, int deptid, byte[] blob);
	public String updateEmp2(int empid, String empname, String empdesig, int deptid, byte[] blob);
	public byte[] getImage(int empid);
	public List<String> getNames(String chars);
}
