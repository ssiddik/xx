package com.vclmfi.vcl_mfi.controller.group;

import java.security.Principal;
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
import com.vclmfi.vcl_mfi.model.join.group.GetGroupDetails;
import com.vclmfi.vcl_mfi.model.join.group.GetMemberDetailsAsPerGroup;
import com.vclmfi.vcl_mfi.pojo.MemberDetails;
import com.vclmfi.vcl_mfi.pojo.RelationExecutive;
import com.vclmfi.vcl_mfi.pojo.vcl_employee;
import com.vclmfi.vcl_mfi.pojo.vcl_organisation_branch;
import com.vclmfi.vcl_mfi.pojo.vcl_organisation_center;

@Controller
public class GroupController 
{
	@Autowired
	 private GroupDao groupDao;
	
	private static final Logger logger = LoggerFactory.getLogger(GroupController.class);
	
	@RequestMapping(value="/GroupCreation",method=RequestMethod.GET)
	public ModelAndView dashboard(Principal p)
	{
		logger.info("------enter Group  page -----------",p.getName());
		return new ModelAndView("Group/group_create");
	}
	@RequestMapping(value="GetReListSahh", method= {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody  RelationExecutive  ReList()
	{
		logger.info("------ list of re  called -----------");
		RelationExecutive name = new RelationExecutive();
		name.setId(8);
		name.setName("test");
		return name;
	}
	@RequestMapping(value="GetReList", method= {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody List<RelationExecutive> ReList(@RequestBody vcl_organisation_branch obj )
	{
		logger.info("------ list of re  called 3-----------");
		System.out.println(obj.getOrg_brnach_id());
		return groupDao.listf(obj.getOrg_brnach_id());
	}
	
	@RequestMapping(value="GetMemberDetails", method= {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody List<MemberDetails> Get_member_detailsrDetails(@RequestBody vcl_employee getRe )
	{
		logger.info("------ list of re  GetMemberDetails  id -- -----------"+getRe.getEmployee_id() );
		return groupDao.getMemberDetails(getRe.getEmployee_id());
	}
	
	@RequestMapping(value="GetCrenterDetails", method= {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody List<vcl_organisation_center> Get_Center_details(@RequestBody vcl_organisation_center getRe)
	{
		logger.info("------ list of re  GetCrenterDetails  id -- -----------"+getRe.getEmployee_id() );
		return groupDao.GetCrenterDetails(getRe.getEmployee_id());
	}
	
	@RequestMapping(value="GetGroupDetails", method= {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody List<GetGroupDetails> GetgroupDetails(@RequestBody vcl_organisation_center getcntr)
	{
		logger.info("------ list of re  GetGroupDetails  id -- -----------"+getcntr.getOrg_center_id());
		return groupDao.GetGroupList(getcntr.getOrg_center_id());
	}
	
	
	@RequestMapping(value="GetMemberDetailsAspergroupId", method= {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody List<GetMemberDetailsAsPerGroup> GetMemberDetailsAspergroupId(@RequestBody GetMemberDetailsAsPerGroup getGrpId)
	{
		logger.info("------ list of re  getmemberfor   id -- -----------"+getGrpId.getGroup_id());
		return groupDao.GetMemberPrGrpId(getGrpId.getGroup_id());
	}
	

}
