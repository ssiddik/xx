package com.vclmfi.vcl_mfi.dao;

import java.util.List;

import com.vclmfi.vcl_mfi.pojo.RelationExecutive;
import com.vclmfi.vcl_mfi.pojo.vcl_loan_product;
import com.vclmfi.vcl_mfi.pojo.vcl_organisation_center;
import com.vclmfi.vcl_mfi.pojo.vcl_reason;
import com.vclmfi.vcl_mfi.model.join.cgt.GroupStatus;
import com.vclmfi.vcl_mfi.model.join.group.GetGroupDetails;
import com.vclmfi.vcl_mfi.model.join.group.GetMemberDetailsAsPerGroup;
import com.vclmfi.vcl_mfi.model.join.grt.Grt_member_center;
import com.vclmfi.vcl_mfi.pojo.MemberDetails;

public interface GroupDao 
{
	public List<RelationExecutive> listf(int branch_id);
	public List<MemberDetails> getMemberDetails(int re_id);
	public List<vcl_organisation_center> GetCrenterDetails(int re_id);
	public List<GetGroupDetails> GetGroupList(int center_id);
	public List<GetMemberDetailsAsPerGroup> GetMemberPrGrpId(int group_id);
	
	// for cgt grt 
	public List<GroupStatus> GetcgtDetails(int group_id);
	
	
	//for grt
	public List<Grt_member_center> grt_get_member_list_for(int group_id,int flag);
    public List<vcl_reason> get_all_reason(String r_type);
    
    public List<vcl_loan_product> get_all_loan_product();
    public List<Grt_member_center> get_post_approval(int group ,int flag);
	
}
