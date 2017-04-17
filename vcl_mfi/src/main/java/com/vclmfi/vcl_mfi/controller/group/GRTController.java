package com.vclmfi.vcl_mfi.controller.group;


import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
 
import com.vclmfi.vcl_mfi.dao.GroupDao;
import com.vclmfi.vcl_mfi.model.join.group.GetGroupDetails;
import com.vclmfi.vcl_mfi.model.join.grt.Grt_member_center;
import com.vclmfi.vcl_mfi.pojo.vcl_loan_product;
import com.vclmfi.vcl_mfi.pojo.vcl_reason;
@Controller
public class GRTController {
	
	private static final Logger logger = LoggerFactory.getLogger(GRTController.class);
	@Autowired
	private GroupDao groupDao;
	
	@RequestMapping(value = "/grt_get_member_list", method = { RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody List<Grt_member_center> get_grt_member  (@RequestBody GetGroupDetails gs){
		 
		logger.info("=================================grt_get_member_list=============");
		return groupDao.grt_get_member_list_for(gs.getGroup_id(),gs.getFlag());
	}
	
	@RequestMapping(value = "get_all_reason_list", method = { RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody List<vcl_reason> get_reason_list(@RequestBody vcl_reason vr)
	{

	 return groupDao.get_all_reason(vr.getReason_type());
	}
	
	@RequestMapping(value = "get_all_loan_product", method = { RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody List<vcl_loan_product> get_reason_list()
	{

	 return groupDao.get_all_loan_product();
	}

	
	
	
	
	
	
	

	 
	
	 

}
