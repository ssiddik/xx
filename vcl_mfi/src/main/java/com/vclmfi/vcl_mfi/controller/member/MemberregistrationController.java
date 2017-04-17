package com.vclmfi.vcl_mfi.controller.member;

 
 
import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
 
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.vclmfi.vcl_mfi.model.MemberregistrationModel;

import com.vclmfi.vcl_mfi.model.join.memberregistration.ViewMemberregistraionFinal;
import com.vclmfi.vcl_mfi.model.join.memberregistration.ViewMemberregistration;
import com.vclmfi.vcl_mfi.model.join.memberregistration.Viewmemberpart2;
import com.vclmfi.vcl_mfi.pojo.vcl_address_type;
import com.vclmfi.vcl_mfi.pojo.vcl_block;
import com.vclmfi.vcl_mfi.pojo.vcl_caste;
import com.vclmfi.vcl_mfi.pojo.vcl_contact_type;
import com.vclmfi.vcl_mfi.pojo.vcl_district;
import com.vclmfi.vcl_mfi.pojo.vcl_document_type;
import com.vclmfi.vcl_mfi.pojo.vcl_loan_purpose;
import com.vclmfi.vcl_mfi.pojo.vcl_relationship_type;
import com.vclmfi.vcl_mfi.pojo.vcl_religion;
import com.vclmfi.vcl_mfi.pojo.vcl_state;
import com.vclmfi.vcl_mfi.pojo.vcl_vill_town_city;

 

@Controller
public class MemberregistrationController {

	private static final Logger logger = LoggerFactory.getLogger(MemberregistrationController.class);
	@Autowired
	MemberregistrationModel mrm;
	
	
	@RequestMapping(value="/memberregistration",method= {RequestMethod.POST,RequestMethod.GET})
	
	public ModelAndView memberprofile(@RequestParam("person_id") int person_id, Principal p)
	{
		logger.info("=======================call memberregistration==============");
		ModelAndView mp = new ModelAndView();
		System.out.println(person_id);
		mp.setViewName("member_registration/member_registraion");
		 
		mp.addObject("person_id", person_id);
		mp.addObject("username", p.getName());
		
		ViewMemberregistration vm11=mrm.get_person_for_member_registration(person_id);
		List<Viewmemberpart2> vm22=mrm.get_idtype_list_per_person(person_id);
		
		List<ViewMemberregistraionFinal> vmFinal=new ArrayList<ViewMemberregistraionFinal>();
		ViewMemberregistraionFinal vs=null;
	 
	
			 int person_id1=vm11.getPerson_id();
			 String name=vm11.getName();
			 String gender=vm11.getGender();
			 String dob=vm11.getDob();
			 String contact_no=vm11.getContact_no();
			 
			 String id_type = null;
			 String id_type2 = null;
			 String id_type3 = null;
			 String relation_type_nm = vm11.getRelation_type_nm();
				
				int c=0;
				for (Viewmemberpart2 viewmemberpart2 : vm22) 
				{     
					c++;
				
					 if (vm11.getPerson_id()==viewmemberpart2.getPerson_id()&& c==1)
					 {
						 id_type=viewmemberpart2.getId_type();
					}
					 if (vm11.getPerson_id()==viewmemberpart2.getPerson_id()&& c==2)
					 {
						 id_type2=viewmemberpart2.getId_type();
					}
					 if (vm11.getPerson_id()==viewmemberpart2.getPerson_id()&& c==3)
					 {
						 id_type3=viewmemberpart2.getId_type();
					}
				}
				
					 
				 vs=new ViewMemberregistraionFinal(name,gender,dob,relation_type_nm,person_id,contact_no,id_type,id_type2,id_type3);
				 
		
			
			
			//vmFinal=new ViewMemberregistraionFinal(name,gender,dob,relation_type_nm,person_id1,id_type);
		 mp.addObject("person_details", vs);
		
		
		return mp;
	}
	
	
	
	/*
	@RequestMapping(value="/get_persom_details",method= {RequestMethod.GET,RequestMethod.POST})
	public @
	{
		
	}*/
	

	@RequestMapping(value="/get_caste_list",method=RequestMethod.GET)
	public @ResponseBody  List<vcl_caste> get_cast_list()
	{
		
		logger.info("=======================call get_caste_list==============");
	 return  mrm.get_all_caste();
	}
	
	
	@RequestMapping(value="/get_religion_list",method=RequestMethod.GET)
	public @ResponseBody  List<vcl_religion> get_religion_list()
	{
		logger.info("=======================call get_religion_list==============");
	 return  mrm.get_all_religion();
	}
 
	
	
	
	@RequestMapping(value="/get_relation_list",method=RequestMethod.GET)
	public @ResponseBody  List<vcl_relationship_type> get_relation_type()
	{
		logger.info("=======================call get_relation_list==============");
	 return  mrm.get_all_relation_type();
	}
	
	
	
	@RequestMapping(value="/get_document_list",method=RequestMethod.GET)
	public @ResponseBody  List<vcl_document_type> get_document_list()
	{
		logger.info("=======================call get_document_list==============");
	 return  mrm.get_all_document_type();
	}
	
	

	@RequestMapping(value="/get_loan_purpuse",method=RequestMethod.GET)
	public @ResponseBody  List<vcl_loan_purpose> get_loan_purpuse()
	{
		logger.info("=======================call get_loan_purpuse==============");
	 return  mrm.get_all_loan_purpuse();
	}
	
	
	@RequestMapping(value="/get_state_list",method=RequestMethod.GET)
	public @ResponseBody  List<vcl_state> get_list_of_statesss()
	{
		logger.info("=======================call get_state_list==============");
	 return  mrm.get_list_of_states();
	}
	
	
	@RequestMapping(value="/get_all_address_type",method=RequestMethod.GET)
	public @ResponseBody List<vcl_address_type> all_address_type ()
	{
		
		logger.info("=======================call get_all_address_type==============");
		return mrm.get_all_address_types();
	}
	
	
	
	@RequestMapping(value="/get_all_block",method=RequestMethod.GET)
	public @ResponseBody List<vcl_block> get_all_block ()
	{
		logger.info("=======================call get_all_block==============");
		return mrm.get_all_block();
	}
	
 
	@RequestMapping(value="/get_all_district_list",method=RequestMethod.GET)
	public @ResponseBody List<vcl_district> get_all_district_list ()
	{
		logger.info("=======================call get_all_district_list==============");
		return mrm.get_all_district();
	}
	
	
	@RequestMapping(value="/get_all_contact",method=RequestMethod.GET)
	public @ResponseBody List<vcl_contact_type> get_all_contact ()
	{logger.info("=======================call get_all_contact==============");
		
		return mrm.get_all_contact_list();
	}
	
	@RequestMapping(value="/get_all_vtc_lists",method=RequestMethod.GET)
	public @ResponseBody List<vcl_vill_town_city> get_all_vtc_lists ()
	{logger.info("=======================call get_all_contact==============");
		
		return mrm.get_all_vtc_list();
	}
	
	
	
	
	
	/*@RequestMapping(value="/member_registration_post",method= {RequestMethod.POST,RequestMethod.GET})
	public @ResponseBody String member_registration_post(@RequestBody Member_reg mr)
	
	{logger.info("=======================call member_registration_post==============");
		System.out.println(mr.getArea());
		 
		Field[] fields = mr.getClass().getDeclaredFields();
		for (int i=0; i<fields.length; i++) {
		    try {
		        System.out.println(fields[i].getName() + "-" + fields[i].get(mr));
		    } catch (java.lang.IllegalAccessException e) {
		        System.out.println(e); 
		    }
		}
		return "success";
	}*/
	
}
