package com.vclmfi.vcl_mfi.model;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import org.hibernate.transform.Transformers;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.orm.hibernate3.HibernateTemplate;

import com.vclmfi.vcl_mfi.model.join.civilcheck.Civilcheckone;
import com.vclmfi.vcl_mfi.model.join.civilcheck.vcl_credit_check_person;
import com.vclmfi.vcl_mfi.pojo.vcl_employee;
import com.vclmfi.vcl_mfi.pojo.vcl_id_generator;
import com.vclmfi.vcl_mfi.pojo.vcl_organisation_branch;
import com.vclmfi.vcl_mfi.pojo.vcl_users;

public class CivilcheckModel {
	HibernateTemplate hibernateTemplate;
	SessionFactory sessionFactory;
	private static final Logger logger = LoggerFactory.getLogger(CivilcheckModel.class);

	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	/* retrive id from the username */

	public int get_user_id(String username) {
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		SQLQuery sqlQuery = session
				.createSQLQuery("SELECT vu.id FROM vcl_users as vu where vu.username='" + username + "'");

		sqlQuery.setResultTransformer(Transformers.aliasToBean(vcl_users.class));
		vcl_users ss = (vcl_users) sqlQuery.uniqueResult();
		session.getTransaction().commit();
		session.close();
		return ss.getId();
	}

	public int get_primary_key(String id_descrition) {
		logger.info("--------get_primary_key called---");
		Session session = this.sessionFactory.openSession();
		session.beginTransaction().begin();
		Query q = session.createQuery("from vcl_id_generator c " + "where c.id_descrition='" + id_descrition + "'");
		vcl_id_generator s = (vcl_id_generator) q.uniqueResult();
		session.getTransaction().commit();
		session.beginTransaction().begin();
		int sum = s.getId_decription_id() + 1;
		Query q2 = session.createQuery("update vcl_id_generator c set c.id_decription_id=:sum"
				+ " where c.id_decription_id=:id_decription_id and c.id_descrition=:id_descrition");
		q2.setParameter("sum", sum);
		q2.setParameter("id_decription_id", s.getId_decription_id());
		q2.setParameter("id_descrition", id_descrition);
		int i = q2.executeUpdate();

		session.getTransaction().commit();
		session.close();
		return s.getId_decription_id();
	}

	public int insert(vcl_organisation_branch b) {
		logger.info("--------mm.insert called---");
		hibernateTemplate.save(b);
		return 1;
	}

	public List<vcl_organisation_branch> list_of_branch() {
		logger.info("--------mm.list_of_branch called---");

		List<vcl_organisation_branch> list_s = hibernateTemplate.loadAll(vcl_organisation_branch.class);

		return list_s;
	}

	public List<vcl_employee> get_employee_list(int branc_id) {

		logger.info("------enter get_employee_list called -----------");
		Session session = sessionFactory.openSession();
		session.beginTransaction().begin();

		SQLQuery query = session.createSQLQuery(
				"select vm.center_id,vm.emp_first_name,vm.emp_last_name,vm.emp_mid_name,vm.employee_code,vm.employee_id "
						+ "from vcl_employee vm,vcl_organisation_center voc where vm.center_id=voc.org_center_id and voc.org_brnach_id="
						+ branc_id + "");
		query.setResultTransformer(Transformers.aliasToBean(vcl_employee.class));
		List<vcl_employee> list = query.list();
		session.getTransaction().commit();
		session.close();
		return list;

	}

	public List<vcl_credit_check_person> get_person_list(int emp_id, int status_id, int branch_id) {
		logger.info("------enter get_person_list called -----------");
		Session session = sessionFactory.openSession();
		session.beginTransaction().begin();

		SQLQuery query = session.createSQLQuery(
				"SELECT vp.person_id as person_id,vpcs.himark_link as himark_link, vp.person_first_name as person_first_name,vp.person_middle_name as person_middle_nm,vp.person_last_name as person_last_nm,vpcs.employee_id as employee_id,vpcs.credit_score_approval_status as status,voc.org_center_name as center_name "
						+ "FROM vcl_person_credit_score vpcs, vcl_person vp,vcl_employee ve,vcl_organisation_center voc"
						+ " where vpcs.credit_score_approval_status=" + status_id + " "
						+ "and vpcs.person_id=vp.person_id" + " and vpcs.employee_id=ve.employee_id"
						+ " and vpcs.employee_id=voc.employee_id " + "and vpcs.employee_id=" + emp_id + " "
						+ "and ve.employee_id=voc.employee_id " + "and voc.org_brnach_id=" + branch_id + "");

		query.setResultTransformer(Transformers.aliasToBean(vcl_credit_check_person.class));

		List<vcl_credit_check_person> lPersons = query.list();

		session.getTransaction().commit();
		session.close();
		return lPersons;
	}

	/*
	 * public String civil_statu_updata(int emp_id,int person_id,int status) {
	 * 
	 * hibernateTemplate.update();
	 * 
	 * Session session=sessionFactory.openSession();
	 * session.beginTransaction().begin();
	 * 
	 * Query query=session.createSQLQuery("update ")
	 * session.getTransaction().commit(); session.close(); return "Data Update";
	 * 
	 * 
	 * }
	 */

	public List<vcl_employee> get_total_person_count_id_name(int branch_id)

	{
		logger.info("------enter get_total_person_count_id_name called -----------");
		Session session = sessionFactory.openSession();
		session.beginTransaction().begin();

		SQLQuery query = session.createSQLQuery(
				"SELECT ve.employee_id as employee_id,ve.emp_first_name as emp_first_name,ve.emp_mid_name as emp_mid_name,ve.emp_last_name as emp_last_name"
						+ " FROM vcl_person_credit_score vpcs, vcl_person vp,vcl_employee ve,vcl_organisation_center voc "
						+ "where vpcs.person_id=vp.person_id and vpcs.employee_id=ve.employee_id and vpcs.employee_id=voc.employee_id and ve.employee_id=voc.employee_id and voc.org_brnach_id="
						+ branch_id + ""
						+ "group by ve.employee_id,ve.emp_first_name,ve.emp_mid_name,ve.emp_last_name");

		query.setResultTransformer(Transformers.aliasToBean(vcl_employee.class));
		List<vcl_employee> l1 = query.list();

		session.getTransaction().commit();

		session.close();
		return l1;

	}

	public List<Civilcheckone> get_total_person_count(int status, int branch_id)

	{
		logger.info("------enter get_total_person_count called -----------");
		Session session = sessionFactory.openSession();
		session.beginTransaction().begin();

		SQLQuery query = session.createSQLQuery("SELECT count(*) as approved,ve.employee_id as employee_id"
				+ " FROM vcl_person_credit_score vpcs, vcl_person vp,vcl_employee ve,vcl_organisation_center voc "
				+ "where vpcs.person_id=vp.person_id and vpcs.employee_id=ve.employee_id and vpcs.employee_id=voc.employee_id and ve.employee_id=voc.employee_id and voc.org_brnach_id="
				+ branch_id + "" + "and vpcs.credit_score_approval_status=" + status
				+ " group by vpcs.employee_id, ve.employee_id");

		query.setResultTransformer(Transformers.aliasToBean(Civilcheckone.class));
		List<Civilcheckone> l1 = query.list();

		session.getTransaction().commit();

		session.close();
		return l1;

	}

	public int person_status_change(int status_id, int person_id, int approver_id) {
		logger.info("------enter person_status_change called -----------");
		Session session = sessionFactory.openSession();
		session.beginTransaction().begin();

		SQLQuery query = session.createSQLQuery("update vcl_person_credit_score SET credit_score_approval_status="
				+ status_id + ",approver_id=" + approver_id + " where person_id=" + person_id + "");

		int s = query.executeUpdate();
		// System.out.println(s);
		session.getTransaction().commit();
		session.close();
		return s;

	}

}
