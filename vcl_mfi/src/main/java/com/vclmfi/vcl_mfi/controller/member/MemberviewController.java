package com.vclmfi.vcl_mfi.controller.member;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.vclmfi.vcl_mfi.model.CivilcheckModel;
import com.vclmfi.vcl_mfi.model.MemberregistrationModel;
import com.vclmfi.vcl_mfi.model.join.memberregistration.MemberDetails;
import com.vclmfi.vcl_mfi.pojo.vcl_employee;
import com.vclmfi.vcl_mfi.pojo.vcl_organisation_branch;

@Controller
public class MemberviewController {

	@Autowired
	CivilcheckModel mm;
	@Autowired
	MemberregistrationModel mrm;
	
	@RequestMapping(value="/member_view",method=RequestMethod.GET)
	public ModelAndView member_view()
	{
		
		ModelAndView mv = new ModelAndView();
     	mv.addObject("branch_list", mm.list_of_branch());
		mv.setViewName("member_registration/memberview");
		return mv;
	}
	
	@RequestMapping(value="/get_re_list",method= {RequestMethod.GET,RequestMethod.POST})
	
	public @ResponseBody List<vcl_employee>  get_re_list(@RequestBody vcl_organisation_branch bra)
	{
		System.out.println(bra.getOrg_brnach_id());
	
		return mrm.get_Re_list_all(bra.getOrg_brnach_id());
	}
@RequestMapping(value="/get_member_list",method= {RequestMethod.GET,RequestMethod.POST})
	
	public @ResponseBody  List<MemberDetails>   get_member_list(@RequestBody vcl_employee re)
	{
		System.out.println(re.getEmployee_id());
	
		return mrm.getMemberDetails(re.getEmployee_id());
	}
	
	
	
	
}
