package com.vclmfi.vcl_mfi.controller.group;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.vclmfi.vcl_mfi.dao.GroupDao;
import com.vclmfi.vcl_mfi.model.CivilcheckModel;
import com.vclmfi.vcl_mfi.model.join.cgt.GroupLiseCgtGrt;
import com.vclmfi.vcl_mfi.model.join.cgt.GroupStatus;
import com.vclmfi.vcl_mfi.model.join.group.GetGroupDetails;
import com.vclmfi.vcl_mfi.pojo.vcl_organisation_center;

@Controller
public class CGTController {
	
	@Autowired
	private GroupDao groupDao;
	
	@Autowired
	CivilcheckModel mm;
	
	private static final Logger logger = LoggerFactory.getLogger(CGTController.class);
	
	@RequestMapping(value="/cgt_grt_blc_loan_pre_post",method=RequestMethod.GET)
	public ModelAndView cgt(Principal p)
	{
		ModelAndView cl = new ModelAndView();
		cl.setViewName("CGT/cgtf");
		//cl.addObject("branch_list", mm.list_of_branch());
	  cl.addObject("username", p.getName());
		return cl;
	}
	
	@RequestMapping(value="GroupListWithcgtGrt", method= {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody List<GroupLiseCgtGrt> GroupList(@RequestBody vcl_organisation_center obj)
	{  
		//GroupLiseCgtGrt
		logger.info("------ list of re  called 3-----------");
		List<GetGroupDetails> lg=groupDao.GetGroupList(obj.getOrg_center_id());
		logger.info("------ list of re  called 44-----------"+lg);
		
		List<GroupLiseCgtGrt>  lisfinal=new ArrayList<GroupLiseCgtGrt>();
		
		GroupLiseCgtGrt glcg=null;
		for(GetGroupDetails lk: lg)
		{
			
			int id=lk.getGroup_id();
			String name=lk.getGroup_name();
			System.out.println(lk.getGroup_id());
			List<GroupStatus> lg1=groupDao.GetcgtDetails(lk.getGroup_id());
			int cgt=0;
			int grt=0;
			int blc=0;
			int loan_application=0;
			int pre_sanction=0;
			int post_sanction=0;
			 for (GroupStatus gs : lg1) 
			 
			 {
				if(gs.getStatus_id()==4) 
				{
					cgt=1;	
				}
				if(gs.getStatus_id()==5) 
				{
					grt=1;
				}
				if(gs.getStatus_id()==6) 
				{
					blc=1;
				}
				if(gs.getStatus_id()==7) 
				{
					loan_application=1;					
				}
				if(gs.getStatus_id()==8) 
				{
					pre_sanction=1;
				}
				if(gs.getStatus_id()==9) 
				{
					post_sanction=1;
				}
			}
			 glcg=new GroupLiseCgtGrt(id,name,cgt,grt, blc,loan_application,pre_sanction,post_sanction);	
			 lisfinal.add(glcg);
			 glcg=null;
			
		}
		//GroupysLiseCgtGrt
		return lisfinal;
	}
}
