package com.vclmfi.vcl_mfi.controller.group;

import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.io.IOException;
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

@Controller
public class PostApprovalController {
	
	private static final Logger logger = LoggerFactory.getLogger(PostApprovalController.class);
	@Autowired
	private GroupDao groupDao;
	
@RequestMapping(value = "get_post_approval_member", method = { RequestMethod.GET, RequestMethod.POST })
public @ResponseBody List<Grt_member_center> get(@RequestBody GetGroupDetails gs) 

	{
	   
	return groupDao.get_post_approval(gs.getGroup_id(), gs.getFlag());	 
	}

}
