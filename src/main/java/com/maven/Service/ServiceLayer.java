package com.maven.Service;

import java.io.UnsupportedEncodingException;
import java.sql.Blob;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.codec.Base64;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.maven.Bean.Emp;
import com.maven.Bean.NoEmp;
import com.maven.Dao.EmpDaoInter;


@Service
@Transactional
public class ServiceLayer implements ServiceLayerInter{
	@Autowired
	private EmpDaoInter dao;

	private String msg = null;
	
	@Override
	public List<Emp> getEmployees() {
		List<Emp> list=dao.getEmployees();
		return list;
	}

	@Override
	public List<NoEmp> getEmpPerDept() {
		List<NoEmp> list=dao.getEmpPerDept();
		/*for(NoEmp i:list){
			System.out.println("Service:"+i.getNoofemp()+":"+i.getDeptid());
		}*/
		return list;
	}
	
	@Override
	public List<Emp> getSpecEmpPerDept(int deptid) {		
		List<Emp> list=dao.getSpecEmpPerDept(deptid);
		return list;
	}

	@Override
	public List<Emp> getByEmpName(String empname, int deptid) {
		System.out.println("service layer id Search:"+deptid);
		List<Emp> list=dao.getByEmpName(empname,deptid);
		return list;
	}

	@Override
	public List<Emp> getByEmpOrder(int deptid, String orderby, String ordertype) {
		System.out.println("service layer id Order:"+deptid);
		List<Emp> list=dao.getByEmpOrder(deptid,orderby,ordertype);
		return list;
	}

	@Override
	public String deleteEmp(int empid) {
		msg = dao.deleteEmp(empid);
	return msg;
	}

	@Override
	public List<Emp> updateEmp(int deptid,int empid) {
		List<Emp> list = dao.updateEmp(deptid,empid);
	return list;
	}

	@Override
	public String updateEmp2(int empid, String empname, String empdesig,int deptid) {
		msg = dao.updateEmp2(empid,empname,empdesig,deptid);
	return msg;
	}
	
	@Override
	public String addEmp(int empid, String empname, String empdesig, int deptid,byte[] blob) {
		
		byte[] encodedBytes = Base64.encode(blob);
		String encoded = null;
		try {
			encoded = new String(encodedBytes, "UTF-8");
			//System.out.println("Controller encodedBytes:"+encoded);
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		msg = dao.addEmp(empid,empname,empdesig,deptid,blob,encoded);
	return msg;
	}

	@Override
	public byte[] getImage(int empid) {
		byte[] list = dao.getImage(empid);
	return list;
	}

	
}
