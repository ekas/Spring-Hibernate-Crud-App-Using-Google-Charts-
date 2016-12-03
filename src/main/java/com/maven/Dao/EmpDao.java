package com.maven.Dao;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.imageio.ImageIO;
import javax.persistence.Query;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.maven.Bean.Dept;
import com.maven.Bean.Emp;
import com.maven.Bean.NoEmp;

@Repository
public class EmpDao implements EmpDaoInter{

	@Autowired
	private SessionFactory sessionFactory; 
	
	String msg = null;
	Emp emp = new Emp();
	
	//Complete Employee Table
	@Override
	public List<Emp> getEmployees(){
		String sql_getAll = "from Emp order by(empid)";
		return this.sessionFactory.getCurrentSession().createQuery(sql_getAll).list();	
		
	}
	
	//Chart DATA
	@Override
	public List<NoEmp> getEmpPerDept(){
		List<NoEmp> list = new ArrayList<NoEmp>();
		//String sql_query = "Select count(e.empid), d.deptid from Emp e right join e.dept d on e.deptid = d.deptid group by d.deptid";
		String sql_query = "Select count(e.empid), d.deptid from Emp e inner join e.dept d group by d.deptid";
		org.hibernate.Query query = this.sessionFactory.getCurrentSession().createQuery(sql_query);
		for(Iterator it = query.iterate();it.hasNext();){
			Object[] row = (Object[]) it.next();
			NoEmp noemp = new NoEmp();
			noemp.setNoofemp((Long)row[0]);
			noemp.setDeptid((int)row[1]);
			//System.out.println(noemp.getNoofemp());
			//System.out.println(noemp.getDeptid());
			list.add(noemp);
		}
		/*for(NoEmp i:list){
			System.out.println("Dao:" + i.getNoofemp()+":"+i.getDeptid());
		}*/
	return list;
	}	
	
	public byte[] getImage(int deptid) {
		List<Emp> list = new ArrayList<Emp>();
		byte[] row1 = null;
		String sql_query = "Select empimg from Emp where deptid="+deptid+" and empid = 17";
		org.hibernate.Query query = this.sessionFactory.getCurrentSession().createQuery(sql_query);
		for(Iterator it = query.iterate();it.hasNext();){
			byte[] row = (byte[]) it.next();
			Emp emp = new Emp();
			System.out.println("Dao Row code:"+ row);
			//emp.setEmpimg(row);
			 row1 = row;
			//System.out.println(noemp.getNoofemp());
			//System.out.println(noemp.getDeptid());
			//list.add(emp);
		}
		//System.out.println("Dao img code:"+ emp.getEmpimg());
	return row1;
	}
	
	//Chart onclick Department Specific DATA
	@Override
	public List<Emp> getSpecEmpPerDept(int deptid){
		String sql_getSpec = "from Emp where deptid = "+deptid +" order by(empid)";
		return this.sessionFactory.getCurrentSession().createQuery(sql_getSpec).list();		
	}

	//Search By Name
	@Override
	public List<Emp> getByEmpName(String empname,int deptid) {
		//String sql_getName = "from Emp where deptid = "+deptid+" and empname = '"+empname+"'";
		String sql_getName = "from Emp where deptid = "+deptid+" and lower(empname) like('%"+empname+"%')";
		return this.sessionFactory.getCurrentSession().createQuery(sql_getName).list();		
	}

	//Order by Employee ID or Order by Employee Name
	@Override
	public List<Emp> getByEmpOrder(int deptid, String orderby, String ordertype) {
		String sql_getOrder = "from Emp where deptid = "+deptid+" order by("+orderby+") "+ordertype;
		return this.sessionFactory.getCurrentSession().createQuery(sql_getOrder).list();	
		
	}
	
	//Crud Operations	
	//Delete
	@Override
	public String deleteEmp(int empid){
		Emp emp = (Emp) sessionFactory.getCurrentSession().get(Emp.class, empid);
		this.sessionFactory.getCurrentSession().delete(emp);
		msg = "Record with Employee ID: "+ empid +"Successfully Deleted";
	return msg;
	}

	//Update Set
	@Override
	public List<Emp> updateEmp(int deptid, int empid) {
		String sql_getValue = "from Emp where deptid = "+deptid+" and empid = "+empid;
		System.out.println("fetching data" );
	return this.sessionFactory.getCurrentSession().createQuery(sql_getValue).list();
	
	}
	
	//Update Fill Back to DB
	@Override
	public String updateEmp2(int empid, String empname, String empdesig,int deptid, byte[] blob) {
	
		emp.setEmpid(empid);		
		Dept dept = (Dept) sessionFactory.getCurrentSession().get(Dept.class,deptid);
		emp.setDept(dept);
		emp.setEmpname(empname);
		emp.setEmpdesig(empdesig);
		emp.setEmpimg(blob);
		sessionFactory.getCurrentSession().update(emp);	
		
	/*String sql_getValue = "UPDATE Emp set empname = :empname, empdesig = :empdesig  WHERE id = :empid";
		Query query = (Query) sessionFactory.getCurrentSession().createQuery(sql_getValue);
		//query.setParameter("empname", empname);
		query.setParameter("empdesig", empdesig);
		query.setParameter("empid", empid);
		int result = query.executeUpdate();
		System.out.println("updating data" );*/
		msg = "Record with Employee ID: "+ empid +" Successfully Added : 1 ROW Affected";
	return msg;
	
	}
	
		

	//Add
	@Override
	public String addEmp(int empid, String empname, String empdesig, int deptid,byte[] blob) {		
		String sql_getSpec = "from Emp where empid = "+empid;
		List<Emp> list1= this.sessionFactory.getCurrentSession().createQuery(sql_getSpec).list();
		if(list1.isEmpty()){
			emp.setEmpid(empid);
			emp.setEmpname(empname);
			emp.setEmpdesig(empdesig);
			emp.setEmpimg(blob);
			Dept dept = (Dept) sessionFactory.getCurrentSession().get(Dept.class,deptid);
			emp.setDept(dept);		
			sessionFactory.getCurrentSession().persist(emp);
			msg = "Record with Employee ID: "+ empid +" Successfully Added : 1 ROW Affected";
			
			/*byte[] blob2 = emp.getEmpimg();
			try {
				byte bar[] = blob2.getBytes(1, (int)blob2.length());
				FileOutputStream fout = new FileOutputStream("C:\\Documents and Settings\\ekas.singh\\Desktop\\"+empid+".jpg");
				fout.write(bar);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}*/
			/*		

			try {
				InputStream in = new ByteArrayInputStream(bFile);
				BufferedImage bImageFromConvert = ImageIO.read(in);
				ImageIO.write(bImageFromConvert, "jpg", new File("C:\\Documents and Settings\\ekas.singh\\Desktop\\Data\\Sunset2.jpg"));
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}  catch (FileNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}*/
		}
		else{
			msg = "Record with Employee ID: "+ empid +" Already exists";
		}
		
		
		/*String sql_query = "insert into Emp(empid,empname,empdesig,deptid)" + 
					"Select empid,empname,empdesig,"+deptid+" from Emp";
		Query query = (Query) this.sessionFactory.getCurrentSession().createQuery(sql_query);
		int result = query.executeUpdate();
		System.out.println("Rows affected: " + result);*/		
		
			
	return msg;
	}

	@Override
	public List<String> getNames(String chars) {
		String sql_query = "Select empname from Emp where lower(empname) like('%"+chars+"%') order by(empname)";
		List<String> list= this.sessionFactory.getCurrentSession().createQuery(sql_query).list();		
	return list;
	}

	@Override
	public List<String> getNamesPerDept(String chars, int deptid) {
		String sql_getName = "Select empname from Emp where deptid = "+deptid+" and lower(empname) like('%"+chars+"%')order by(empname)";
		
		List<String> list= this.sessionFactory.getCurrentSession().createQuery(sql_getName).list();		
	return list;
	}

	
	
	
	
	
}
