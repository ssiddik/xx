package com.vclmfi.vcl_mfi.model;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.transform.Transformers;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.orm.hibernate3.HibernateTemplate;

import com.vclmfi.vcl_mfi.model.join.memberregistration.MemberDetails;
import com.vclmfi.vcl_mfi.model.join.memberregistration.ViewMemberregistration;
import com.vclmfi.vcl_mfi.model.join.memberregistration.Viewmemberpart2;
import com.vclmfi.vcl_mfi.pojo.vcl_address_type;
import com.vclmfi.vcl_mfi.pojo.vcl_block;
import com.vclmfi.vcl_mfi.pojo.vcl_caste;
import com.vclmfi.vcl_mfi.pojo.vcl_contact_type;
import com.vclmfi.vcl_mfi.pojo.vcl_district;
import com.vclmfi.vcl_mfi.pojo.vcl_document_type;
import com.vclmfi.vcl_mfi.pojo.vcl_employee;
import com.vclmfi.vcl_mfi.pojo.vcl_loan_purpose;
import com.vclmfi.vcl_mfi.pojo.vcl_relationship_type;
import com.vclmfi.vcl_mfi.pojo.vcl_religion;
import com.vclmfi.vcl_mfi.pojo.vcl_state;
import com.vclmfi.vcl_mfi.pojo.vcl_vill_town_city;

public class MemberregistrationModel {

	HibernateTemplate hibernateTemplate;
	SessionFactory sessionFactory;
	private static final Logger logger = LoggerFactory.getLogger(MemberregistrationModel.class);

	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	public List<vcl_caste> get_all_caste()
	
	{
		List<vcl_caste> lCastes=new ArrayList<vcl_caste>();  
		lCastes= hibernateTemplate.loadAll(vcl_caste.class);
		return lCastes;
	}

	
	public List<vcl_religion> get_all_religion()
	
	{
		List<vcl_religion> lReligions=new ArrayList<vcl_religion>();  
		lReligions= hibernateTemplate.loadAll(vcl_religion.class);
		return lReligions;
	}

	
 
	public List<vcl_document_type> get_all_document_type()
	
	{
		List<vcl_document_type> lDocument_types=new ArrayList<vcl_document_type>();  
		lDocument_types= hibernateTemplate.loadAll(vcl_document_type.class);
		return lDocument_types;
	}

	
	public List<vcl_relationship_type> get_all_relation_type()
	
	{
		List<vcl_relationship_type> lRelationship_types=new ArrayList<vcl_relationship_type>();  
		lRelationship_types= hibernateTemplate.loadAll(vcl_relationship_type.class);
		return lRelationship_types;
	}
	
public List<vcl_loan_purpose> get_all_loan_purpuse()
	
	{
		List<vcl_loan_purpose> loan_purposes=new ArrayList<vcl_loan_purpose>();  
		loan_purposes= hibernateTemplate.loadAll(vcl_loan_purpose.class);
		return loan_purposes;
	}
	
public List<vcl_state> get_list_of_states()
{
	logger.info("--------list_of_state called---");
	List<vcl_state> list_s = hibernateTemplate.loadAll(vcl_state.class);
	return list_s;
}
	
	
	
	
	
	
	public ViewMemberregistration get_person_for_member_registration(int person_id)
	{
	Session session=sessionFactory.openSession();
	session.beginTransaction().begin();
	SQLQuery sqlQuery=session.createSQLQuery("select distinct vp.person_id as person_id, concat(vp.person_first_name,' ',vp.person_middle_name,' ',vp.person_last_name) as name ,vp.gender as gender,vp.dob as dob,vrt.relation_type_nm  as relation_type_nm"
			+ ", vc.contact_no as contact_no from vcl_person vp,vcl_person_credit_score vpcs,vcl_household_member vhm,vcl_relationship_type vrt,vcl_identification_document vid,vcl_contact vc "
			+ "where vp.person_id=vpcs.person_id and vpcs.credit_score_approval_status=1 and vpcs.person_id=vhm.person_id and "
			+ "vhm.relationship_type_id=vrt.relation_type_id and vpcs.person_id="+person_id+" and vpcs.person_id=vid.person_id and vp.person_id=vid.person_id "
					+ " and vpcs.person_id=vc.person_id");
	System.out.println(sqlQuery);
	 sqlQuery.setResultTransformer(Transformers.aliasToBean(ViewMemberregistration.class));
	 ViewMemberregistration vm=(ViewMemberregistration) sqlQuery.uniqueResult();
	session.getTransaction().commit();
	session.close();
	
		
	 return vm;
		
	}

	
	
	public List<Viewmemberpart2>  get_idtype_list_per_person(int person_id)
	{
	Session session=sessionFactory.openSession();
	session.beginTransaction().begin();
	SQLQuery  sqlQuery=session.createSQLQuery("select vp.person_id as person_id ,concat(vid.identification_doc_value,'-',vdt.doc_type_nm) as id_type from vcl_person vp,vcl_person_credit_score vpcs,vcl_identification_document vid,vcl_document_type vdt,vcl_household_member vhm, vcl_relationship_type vrt"
			+ " where vp.person_id=vpcs.person_id and vpcs.credit_score_approval_status=1 and vpcs.person_credit_score_id=vid.person_credit_score_id and vid.doc_type_id=vdt.doc_type_id and vp.person_id=vid.person_id"
			+ " and vpcs.person_id=vhm.person_id and vhm.relationship_type_id=vrt.relation_type_id and vpcs.person_id="+person_id+""
			+ " and vid.doc_type_id=vdt.doc_type_id  order by vid.doc_flag");
	
	sqlQuery.setResultTransformer(Transformers.aliasToBean(Viewmemberpart2.class));
	List<Viewmemberpart2> vm2= sqlQuery.list();
	session.getTransaction().commit();
	session.close();
	
		
	 return vm2;
		
	}
	
	
	
	public List<vcl_address_type> get_all_address_types()
	{
		
		List<vcl_address_type> lAddress_types=new ArrayList<vcl_address_type>();
		
		lAddress_types=hibernateTemplate.loadAll(vcl_address_type.class);
	   return lAddress_types;	
	}
	
	
	
	
	public List<vcl_block> get_all_block()
	{
		
		List<vcl_block> lBlocks=new ArrayList<vcl_block>();
		
		lBlocks=hibernateTemplate.loadAll(vcl_block.class);
	   return lBlocks;	
	}
	
	
	
public List<vcl_district> get_all_district() 
{
	List<vcl_district> lDistricts=new ArrayList<vcl_district>();
	
	lDistricts=hibernateTemplate.loadAll(vcl_district.class);
   return lDistricts;	
}


public List<vcl_contact_type> get_all_contact_list() 
{
	List<vcl_contact_type> lContact_types=new ArrayList<vcl_contact_type>();
	
	lContact_types=hibernateTemplate.loadAll(vcl_contact_type.class);
   return lContact_types;	
}
	

public List<vcl_vill_town_city> get_all_vtc_list() 
{
	List<vcl_vill_town_city> lVcl_vill_town_cities=new ArrayList<vcl_vill_town_city>();
	
	lVcl_vill_town_cities=hibernateTemplate.loadAll(vcl_vill_town_city.class);
   return lVcl_vill_town_cities;	
}
	
	/* MERBER  VIEW START HERE */

public List<vcl_employee> get_Re_list_all(int branch_id) {
	
	Session session=sessionFactory.openSession();
	session.beginTransaction().begin();

	
	SQLQuery query=session.createSQLQuery("select a.employee_id as employee_id,a.emp_first_name as emp_first_name , a.emp_mid_name as emp_mid_name ,a.emp_last_name as emp_last_name from vcl_employee a,vcl_organisation_center b where a.center_id = b.org_center_id and b.org_brnach_id ="+branch_id);
	query.setResultTransformer(Transformers.aliasToBean(vcl_employee.class));
	 List<vcl_employee> lEmployees=query.list();
	
	session.getTransaction().commit();
	session.close();
	
	return lEmployees;
}



public List<MemberDetails> getMemberDetails(int re_id)
{
	//re_id =1;
	Session session=sessionFactory.openSession();
	session.beginTransaction().begin();
	
	SQLQuery query=session.createSQLQuery("select d.member_id as memberid,concat(a.person_first_name ,' ',a.person_middle_name ,' ',a.person_last_name ) as membername,"
										  + " c.org_center_name as centername"
										  + " from vcl_person a, vcl_person_credit_score b,vcl_organisation_center c,vcl_member d "
										  + " where a.person_id = b.person_id and b.employee_id = c.employee_id and  b.employee_id = " + re_id + ""
										  + " and d.person_id = a.person_id and d.person_id = b.person_id");
	query.setResultTransformer(Transformers.aliasToBean(MemberDetails.class));
	List<MemberDetails> list=query.list();
		session.getTransaction().commit();
		session.close();
	return list;
}
	
}
