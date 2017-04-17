package com.vclmfi.vcl_mfi.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.transform.Transformers;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
 
import org.springframework.orm.hibernate3.HibernateTemplate;

import com.vclmfi.vcl_mfi.dao.GroupDao;
import com.vclmfi.vcl_mfi.model.join.cgt.GroupStatus;
import com.vclmfi.vcl_mfi.model.join.group.GetGroupDetails;
import com.vclmfi.vcl_mfi.model.join.group.GetMemberDetailsAsPerGroup;
import com.vclmfi.vcl_mfi.model.join.grt.Grt_member_center;
import com.vclmfi.vcl_mfi.pojo.RelationExecutive;
import com.vclmfi.vcl_mfi.pojo.vcl_loan_product;
import com.vclmfi.vcl_mfi.pojo.vcl_organisation_center;
import com.vclmfi.vcl_mfi.pojo.vcl_reason;
import com.vclmfi.vcl_mfi.pojo.MemberDetails;

public class GroupDaoImpl implements GroupDao {

	HibernateTemplate hibernateTemplate;
	SessionFactory sessionFactory;
	private static final Logger logger = LoggerFactory.getLogger(GroupDaoImpl.class);
	
	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) 
	{
		this.hibernateTemplate = hibernateTemplate;
	}
	

	public SessionFactory getSessionFactory() 
	{
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) 
	{
		this.sessionFactory = sessionFactory;
	}

	
	public List<RelationExecutive> listf(int branch_id)
	{
		Session session=sessionFactory.openSession();
		session.beginTransaction().begin();
		
		SQLQuery query=session.createSQLQuery("select a.employee_id as id,concat(a.emp_first_name ,' ', a.emp_mid_name ,' ',a.emp_last_name) as name from vcl_employee a,vcl_organisation_center b where a.center_id = b.org_center_id and b.org_brnach_id ="+branch_id);
		query.setResultTransformer(Transformers.aliasToBean(RelationExecutive.class));
		
 		List<RelationExecutive> list=query.list();
 		
 		session.getTransaction().commit();
 		session.close();
		return list;
	}
	
	public List<MemberDetails> getMemberDetails(int re_id)
	{
		//re_id =1;
		Session session=sessionFactory.openSession();
		session.beginTransaction().begin();
		
		SQLQuery query=session.createSQLQuery("select d.member_id as memberid,concat(a.person_first_name ,' ',a.person_middle_name ,' ',a.person_last_name ) as membername,"
											  + " c.org_center_name as centername,d.member_doc_verif_sts as dates"
											  + " from vcl_person a, vcl_person_credit_score b,vcl_organisation_center c,vcl_member d "
											  + " where a.person_id = b.person_id and b.employee_id = c.employee_id and  b.employee_id = " + re_id + ""
											  + " and d.person_id = a.person_id and d.person_id = b.person_id");
		query.setResultTransformer(Transformers.aliasToBean(MemberDetails.class));
		List<MemberDetails> list=query.list();
 		session.getTransaction().commit();
 		session.close();
		return list;
	}
	
	
	public List<vcl_organisation_center> GetCrenterDetails(int re_id)
	{
		Session session=sessionFactory.openSession();
		session.beginTransaction().begin();
		
		SQLQuery query=session.createSQLQuery("select * from public.vcl_organisation_center where employee_id="+re_id);
		query.setResultTransformer(Transformers.aliasToBean(vcl_organisation_center.class));
		List<vcl_organisation_center> list=query.list();
 		session.getTransaction().commit();
 		session.close();
		return list;
		/* List<vcl_organisation_branch> list_center = (List<vcl_organisation_branch>) hibernateTemplate.load(vcl_organisation_center.class, re_id);
		//vcl_organisation_center list_center = hibernateTemplate.load(vcl_organisation_center.class,1);
		 return list_center;*/
	}
	
	public List<GetGroupDetails> GetGroupList(int center_id)
	{
		Session session=sessionFactory.openSession();
		session.beginTransaction().begin();
		SQLQuery query=session.createSQLQuery("select count(grp.group_id) as member_count,grp.group_name,grp.group_start_date as group_start_dt ,mgrp.org_center_id as center_id,"
				+ "grp.group_id from vcl_group grp,vcl_member_group mgrp  where grp.group_id = mgrp.group_id and mgrp.org_center_id ="+center_id+" "
			    + "group by grp.group_id,mgrp.org_center_id,grp.group_name,grp.group_start_date;");
		query.setResultTransformer(Transformers.aliasToBean(GetGroupDetails.class));
		List<GetGroupDetails> list=query.list();
 		session.getTransaction().commit();
 		session.close();
		return list;
	}
	
	public List<GetMemberDetailsAsPerGroup> GetMemberPrGrpId(int group_id)
	{
		Session session=sessionFactory.openSession();
		session.beginTransaction().begin();
		SQLQuery query=session.createSQLQuery("select concat(per.person_first_name ,' ',per.person_middle_name,' ',per.person_last_name) as member_name, "
				+ " cntr.org_center_name as center_name,grp.group_start_date as group_start_dt ,grp.group_leader as group_leader_id ,mbr.member_id as memebr_id,grp.group_name,grp.group_id"
				+ " from vcl_group grp ,vcl_member_group mgrp,vcl_member mbr , vcl_person per,vcl_organisation_center cntr"
				+ " where grp.group_id = "+group_id+" and cntr.org_center_id = mgrp.org_center_id  and grp.group_id = mgrp.group_id and mgrp.member_id = mbr.member_id "
				+ " and mbr.person_id = per.person_id;");
		query.setResultTransformer(Transformers.aliasToBean(GetMemberDetailsAsPerGroup.class));
		List<GetMemberDetailsAsPerGroup> list=query.list();
 		session.getTransaction().commit();
 		session.close();
		return list;
	}
	
	
	public List<GroupStatus> GetcgtDetails(int group_id)
	{
		Session session=sessionFactory.openSession();
		session.beginTransaction().begin();
		SQLQuery query=session.createSQLQuery("select vgs.group_id,vs.status_code as status_id "
				+ "from vcl_group_status vgs,vcl_status vs where vs.status_id = vgs.status_id "
				+ "and vgs.group_id ="+group_id);
		query.setResultTransformer(Transformers.aliasToBean(GroupStatus.class));
		List<GroupStatus> list=query.list();
 		session.getTransaction().commit();
 		session.close();
		return list;
	}
	
	
	//siddik
	
	public List<Grt_member_center> grt_get_member_list_for(int group_id,int flag)
	{
		// flag =0 that means grt not done //
		
		//flag =1 means that grt done
		
		if(flag==0)
		{
			
			Session session=sessionFactory.openSession();
			session.beginTransaction().begin();

			SQLQuery query =session.createSQLQuery("select concat(vp.person_first_name ,' ',vp.person_middle_name,' ',vp.person_last_name) as member_name,voc.org_center_id as center_id,vm.member_id as member_id from vcl_member_group vmg, vcl_member vm ,vcl_person vp,vcl_organisation_center voc "
					+ "where vmg.group_id="+group_id+" and vmg.member_id=vm.member_id " 
					+ "and vm.person_id=vp.person_id and vmg.org_center_id=voc.org_center_id");
			query.setResultTransformer(Transformers.aliasToBean(Grt_member_center.class));
			List<Grt_member_center> lGrt_member_centers=query.list();
	 		session.getTransaction().commit();
	 		session.close();
			return lGrt_member_centers;
		
		}
	 
		if(flag==1)
		{
			 
			 Session session=sessionFactory.openSession();
			session.beginTransaction().begin(); 

			SQLQuery query =session.createSQLQuery("select concat(vp.person_first_name ,' ',vp.person_middle_name,' ',vp.person_last_name) as member_name,"
					+ "voc.org_center_id as center_id,vm.member_id as member_id,vted.cgt_result as member_status,vted.reason_id as member_reason,"
					+ "vteh.reason_id as group_reason,vteh.cgt_grt_result as group_stats from vcl_member_group vmg,"
					+ "vcl_member vm ,vcl_person vp,vcl_organisation_center voc, vcl_training_event_header vteh, vcl_training_event_detail vted"
					+ " where vmg.group_id="+group_id+" and vmg.member_id=vm.member_id and vm.person_id=vp.person_id "
					+ "and vmg.org_center_id=voc.org_center_id and vmg.group_id=vteh.group_id and vteh.training_event_header_identifier=vted.training_event_header_identifier"
					+ " and vmg.member_id=vted.member_identifier and voc.org_center_id=vteh.organization_center_identifier");
			
			 query.setResultTransformer(Transformers.aliasToBean(Grt_member_center.class));
			List<Grt_member_center> lGrt_member_centers=query.list();
	 		session.getTransaction().commit();
	 		session.close();
			return lGrt_member_centers; 
			
		}
		return null;
		 
		
	}
	
	
	
	public List<vcl_reason> get_all_reason(String reason_type) 
	{
	 
		
		Session session=sessionFactory.openSession();
		session.beginTransaction().begin();

		SQLQuery query =session.createSQLQuery("select * from  vcl_reason where reason_type='"+reason_type+"'");
		query.setResultTransformer(Transformers.aliasToBean(vcl_reason.class));
		List<vcl_reason> lReasons=query.list();
 		session.getTransaction().commit();
 		session.close();
	 
	  return lReasons;
	}

	
	
	 public List<vcl_loan_product> get_all_loan_product()
	 {
		 List<vcl_loan_product> loan_products =new ArrayList<vcl_loan_product>();
		 loan_products=hibernateTemplate.loadAll(vcl_loan_product.class);
		 
		 return loan_products;
	 }
	
	 
	   public List<Grt_member_center> get_post_approval(int group_id ,int flag)
	   {
		   
		   if(flag==0)
			{
				
			Session session=sessionFactory.openSession();
			session.beginTransaction().begin();

			SQLQuery query =session.createSQLQuery("select concat(vp.person_first_name ,' ',vp.person_middle_name,' ',vp.person_last_name) as member_name,voc.org_center_id as center_id,vm.member_id as member_id from vcl_member_group vmg, vcl_member vm ,vcl_person vp,vcl_organisation_center voc "
					+ "where vmg.group_id="+group_id+" and vmg.member_id=vm.member_id " 
					+ "and vm.person_id=vp.person_id and vmg.org_center_id=voc.org_center_id");
			query.setResultTransformer(Transformers.aliasToBean(Grt_member_center.class));
			List<Grt_member_center> post_approval=query.list();
	 		session.getTransaction().commit();
	 		session.close();
		   return post_approval;
			}
		   
		   if(flag==1)
			{
				Session session=sessionFactory.openSession();
				session.beginTransaction().begin();

				SQLQuery query =session.createSQLQuery("select concat(vp.person_first_name ,' ',vp.person_middle_name,' ',vp.person_last_name) as member_name,voc.org_center_id as center_id,vm.member_id as member_id ,vlas.status_id as member_status "
						+ "from vcl_member_group vmg,vcl_member vm ,vcl_person vp,vcl_organisation_center voc,vcl_loan_application_status vlas where vmg.group_id="+group_id+" and vmg.member_id=vm.member_id  "
						+ "and vm.person_id=vp.person_id and vmg.org_center_id=voc.org_center_id and vmg.member_id=vlas.member_identifier and vlas.status_id=9");
				query.setResultTransformer(Transformers.aliasToBean(Grt_member_center.class));
				List<Grt_member_center> post_approval=query.list();
		 		session.getTransaction().commit();
		 		session.close();
		 		  return post_approval;
			}
		   return null;
	   }
	
	   
	   
	
	
	
	
}
