package com.maven.Controller;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.maven.Bean.DeptSaveId;
import com.maven.Bean.Emp;
import com.maven.Bean.NoEmp;
import com.maven.Service.ServiceLayerInter;

@org.springframework.stereotype.Controller
public class Controller {
	
	@Autowired
	private ServiceLayerInter sl;
	
	private String msg = null;
	
	//Welcome PAGE after Successful Login	
	@RequestMapping(value = {"/welcome" }, method = RequestMethod.GET)
	public ModelAndView defaultPage() {

		ModelAndView model = new ModelAndView();
		model.setViewName("mainform");
		return model;

	}
	
	//Login Handler
	@RequestMapping(value = {"/","/login"}, method = RequestMethod.GET)
	public ModelAndView login(@RequestParam(value = "error", required = false) String error,
			@RequestParam(value = "logout", required = false) String logout) {

		ModelAndView model = new ModelAndView();
		if (error != null) {
			model.addObject("error", "Invalid username and password!");
		}
		if (logout != null) {
			model.addObject("msg", "You've been logged out successfully.");
		}
		model.setViewName("login");
		return model;

	}
	
	private DeptSaveId deptSaveId = new DeptSaveId();
	/*	
	//Welcome PAGE after Successful Login	
	@RequestMapping("/mainform")
	public ModelAndView showform(){
		return new ModelAndView("mainform","command",new Emp());
	}*/

	//Handling Toggle from Chart, Chart Table, Complete Table to previous ones
	@RequestMapping(value ="/back" ,method = RequestMethod.GET )
	public ModelAndView showform2(){
		return new ModelAndView("mainform","command",new Emp());
	}
	
	//Handling Toggle through Crud Pages to Previous Ones
	@RequestMapping(value = "/back2", method = RequestMethod.GET )
	public String showform4(Model model){
		List<NoEmp> list=sl.getEmpPerDept();
		model.addAttribute("emplist",list);			
		List<Emp> list2 = sl.getSpecEmpPerDept(deptSaveId.getDeptid ());
		model.addAttribute("empDeptClick",list2);
		return "viewemp2";
	}
	
	//Show complete Table
	@RequestMapping("/showComplete")
	public ModelAndView viewemp(){
		List<Emp> list=sl.getEmployees();
		return new ModelAndView("viewemp","list",list);
	}
	
	//Show Chart Query Table
	@RequestMapping("/showTable")
	public ModelAndView viewemp3(){
		List<NoEmp> list=sl.getEmpPerDept();
		return new ModelAndView("viewemp3","list",list);
	}
	
	//Showing Chart
	@RequestMapping("/showChart")
	public ModelAndView viewemp2(){
		List<NoEmp> emplist=sl.getEmpPerDept();
		/*for(NoEmp i:emplist){
			System.out.println("Controler:" + i.getNoofemp()+":"+i.getDeptid());
		}*/
		return new ModelAndView("viewemp2","emplist",emplist);
	}
	
	//Handles Chart Click Passes Department ID with URL
	@RequestMapping("/{deptid}")
	public String viewemp4(@PathVariable("deptid") int deptid, Model model){
		System.out.println(deptid);		
		deptSaveId.setDeptid(deptid);
		List<NoEmp> list=sl.getEmpPerDept();
		model.addAttribute("emplist",list);
		List<Emp> list2 = sl.getSpecEmpPerDept(deptid);
		model.addAttribute("empDeptClick",list2);
		
		/*for(NoEmp i:list){
			System.out.println("{deptid}" + i.getNoofemp()+":"+i.getDeptid());
		}
		for(Emp i:list2){
			System.out.println("list"+i.getEmpid()+i.getEmpname()+i.getEmpdesig()+i.getDept());
		}*/
		return "viewemp2";
	}
	
	//Handles Search Request from client whether Search by Name or Sort by Id or Name in  AESC or DESC 
	@RequestMapping(value = "/search", method = RequestMethod.GET )
	public String viewemp5(@RequestParam(value="searchfield", required=true) String empname ,@RequestParam(value="btn", required = true) String btnname , 
			@RequestParam(value="orderby", required = false) String orderby,
			@RequestParam(value="ordertype", required = false) String ordertype, Model model){
		
		if(btnname.equals("Search1")){
			//System.out.println("Contoller Search1: "+empname);	
			String name = empname.toLowerCase();
			List<NoEmp> list=sl.getEmpPerDept();
			model.addAttribute("emplist",list);
			List<Emp> list2 = sl.getByEmpName(name,deptSaveId.getDeptid());
			if(list2.isEmpty()){
				msg = "Search UnSuccessful : Record by Employee Name : "+empname+ " not found";
				model.addAttribute("msg",msg);
				model.addAttribute("empDeptClick",list2);
			}
			else{
				msg = "Search Successful : Record by Employee Name : "+empname+ " found";
				model.addAttribute("msg",msg);
				model.addAttribute("empDeptClick",list2);
			}
			return "viewemp2";
		}
		else if(btnname.equals("Search2")){
			//System.out.println("Contoller Search2: " + orderby  +" "+ ordertype);		
			List<NoEmp> list=sl.getEmpPerDept();
			model.addAttribute("emplist",list);
			List<Emp> list2 = sl.getByEmpOrder(deptSaveId.getDeptid(),orderby,ordertype);
			model.addAttribute("empDeptClick",list2);
			msg = "Search Successful : Records Arranged By "+ orderby + " in "+ordertype+" order";
			model.addAttribute("msg",msg);
			return "viewemp2";
		}
		return "viewemp2";		
	}
	
	//CRUD OPERATIONS
		@RequestMapping(value = "/crud", method = RequestMethod.GET )
		public String viewemp6(@RequestParam(value="empid", required=true) int empid ,
				@RequestParam(value="empname", required=true) String empname ,
				@RequestParam(value="empdesig", required=true) String empdesig ,
				/*@RequestParam(value="deptid", required=false) int deptid ,*/
				@RequestParam(value="btn", required = true) String btnname ,Model model){
			
			//ADD Handler
			if(btnname.equals("Add")){
				System.out.println("Add: "+empid);
				msg = sl.addEmp(empid,empname,empdesig,deptSaveId.getDeptid());
				model.addAttribute("msg",msg);		
				List<NoEmp> list=sl.getEmpPerDept();
				model.addAttribute("emplist",list);			
				List<Emp> list2 = sl.getSpecEmpPerDept(deptSaveId.getDeptid());
				model.addAttribute("empDeptClick",list2);			
				System.out.println("Data ADDED");
				return "viewemp2";
			}	
			
			//UPDATE Handler
			else if(btnname.equals("Update")){
				System.out.println("Update: " );
				msg=sl.updateEmp2(empid,empname,empdesig,deptSaveId.getDeptid());
				model.addAttribute("msg",msg);		
				List<NoEmp> list=sl.getEmpPerDept();
				model.addAttribute("emplist",list);			
				List<Emp> list2 = sl.getSpecEmpPerDept(deptSaveId.getDeptid());
				model.addAttribute("empDeptClick",list2);			
				System.out.println("Data Updated");
				return "viewemp2";
			}
			return "viewemp2";		
		}
	
		//Delete Handler
		@RequestMapping(value = "/delete/{empid}", method = RequestMethod.GET )
		public String viewemp7(@PathVariable("empid") int empid, Model model){
			
			System.out.println("Delete: " + empid);	
			msg = sl.deleteEmp(empid);
			model.addAttribute("msg",msg);	
			List<NoEmp> list=sl.getEmpPerDept();
			model.addAttribute("emplist",list);
			List<Emp> list2 = sl.getSpecEmpPerDept(deptSaveId.getDeptid());
			model.addAttribute("empDeptClick",list2);
			return "viewemp2";		
		}
	
	//Passing to a JSP to perform Crud Update 
	@RequestMapping(value = "/update/{empid}", method = RequestMethod.GET )
	public String viewemp8(@PathVariable("empid") int empid, Model model){
		
		List<Emp> list = sl.updateEmp(deptSaveId.getDeptid(),empid);
		for(Emp i:list){
			System.out.println("Update Controller" + i.getEmpid()+":"+i.getEmpname());
		}
		model.addAttribute("emplist",list);
		model.addAttribute("deptid",deptSaveId.getDeptid());
		model.addAttribute("updatemsg","update operation");
		return "crudoperation";			
	}
	
	//Passing to a JSP to perform Crud Update 
		@RequestMapping(value = "/update", method = RequestMethod.GET )
		public String viewemp9(@RequestParam(value="optionsRadios", required=true) String empid , Model model){
			
			int empid2 = Integer.parseInt(empid);
			List<Emp> list = sl.updateEmp(deptSaveId.getDeptid(),empid2);
			for(Emp i:list){
				System.out.println("Update Controller" + i.getEmpid()+":"+i.getEmpname());
			}
			model.addAttribute("emplist",list);
			model.addAttribute("deptid",deptSaveId.getDeptid());
			model.addAttribute("updatemsg","update operation");
			return "crudoperation";			
		}
		
		
	//Passing to a JSP to perform Crud Add 
	@RequestMapping(value = "/add", method = RequestMethod.GET )
	public String viewemp9(Model model){
		model.addAttribute("deptid",deptSaveId.getDeptid());
		model.addAttribute("addmsg","add operation");
		return "crudoperation";		
	}	
}
