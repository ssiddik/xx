package com.vclmfi.vcl_mfi.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.vclmfi.vcl_mfi.pojo.vcl_district;
import com.vclmfi.vcl_mfi.pojo.vcl_education;
import com.vclmfi.vcl_mfi.pojo.vcl_employee;
import com.vclmfi.vcl_mfi.pojo.vcl_employee_role;
import com.vclmfi.vcl_mfi.pojo.vcl_house_type;
import com.vclmfi.vcl_mfi.pojo.vcl_language;
import com.vclmfi.vcl_mfi.pojo.vcl_occupation;
import com.vclmfi.vcl_mfi.pojo.vcl_organisation_branch;
import com.vclmfi.vcl_mfi.pojo.vcl_organisation_cluster;
import com.vclmfi.vcl_mfi.pojo.vcl_relationship_type;
import com.vclmfi.vcl_mfi.pojo.vcl_religion;
import com.vclmfi.vcl_mfi.pojo.vcl_role;
import com.vclmfi.vcl_mfi.pojo.vcl_block;
import com.vclmfi.vcl_mfi.pojo.vcl_cluster;
import com.vclmfi.vcl_mfi.pojo.vcl_contact_type;
import com.vclmfi.vcl_mfi.pojo.vcl_department;
import com.vclmfi.vcl_mfi.pojo.vcl_designation;
import com.vclmfi.vcl_mfi.pojo.vcl_vill_town_city;
import com.vclmfi.vcl_mfi.pojo.vcl_zone;
import com.vclmfi.vcl_mfi.pojo.vcl_state;
import com.vclmfi.vcl_mfi.pojo.vcl_status;
import com.vclmfi.vcl_mfi.pojo.vcl_status_type;

public class MasterDao {

	HibernateTemplate hibernateTemplate;
	SessionFactory sessionFactory;
	private static final Logger logger = LoggerFactory.getLogger(MasterDao.class);

	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	/*====================== State Master Code Starts ===========================*/
	public boolean check_unique_state_code(vcl_state state)
	{
		logger.info("--------state.insert called---");
		
		Session session=sessionFactory.openSession();
		Criteria cr = session.createCriteria(vcl_state.class);
		cr.add(Restrictions.eq("state_short_cd", state.getState_short_cd()));
		int size = cr.list().size();
		session.close();
		if(size > 0)
			return true;
		
		return false;
	}
	public int insert(vcl_state s)
	{
		logger.info("--------state.insert called---");
		hibernateTemplate.save(s);
		return 1;
	}
	public int update(vcl_state s)
	{
		logger.info("--------state.update called---");
		hibernateTemplate.update(s);
		return 1;
	}

	public List<vcl_state> list_of_states() {
		logger.info("--------list_of_state called---");
		List<vcl_state> list_s = hibernateTemplate.loadAll(vcl_state.class);
		return list_s;
	}
	
	public int delete_state_by_id(int id) {
		logger.info("--------delete_state_by_id called---");
		try{
			hibernateTemplate.delete(hibernateTemplate.load(vcl_state.class, id));
			return 1;
		}catch(Exception e){
			e.printStackTrace();
		}
		return 0;
	}
	/*====================== State Master Code Ends ===========================*/
	/*====================== District Master Code Starts ===========================*/
	public boolean checkForUniqueDistrict(vcl_district dis)
	{
		logger.info("--------MasterDao.checkForUniqueDistrict called---");
		
		Session session=sessionFactory.openSession();
		Criteria cr = session.createCriteria(vcl_district.class);
		cr.add(Restrictions.eq("districtShortCode", dis.getDistrictShortCode()));
		int size = cr.list().size();
		session.close();
		if(size > 0)
			return true;
		
		return false;
	}
	public int saveDistrict(vcl_district dis)
	{
		logger.info("--------MasterDao.saveDistrict called---");
		hibernateTemplate.save(dis);
		return 1;
	}
	public int updateDistrict(vcl_district dis)
	{
		logger.info("--------MasterDao.updateDistrict called---");
		hibernateTemplate.update(dis);
		return 1;
	}
	public List<vcl_district> getAllDistrict() {
		logger.info("--------MasterDao.getAllDistrict called---");
		List<vcl_district> districtList = hibernateTemplate.loadAll(vcl_district.class);
		return districtList;
	}
	
	public int deleteDistrictById(int id) {
		logger.info("--------delete_state_by_id called---");
		try{
			hibernateTemplate.delete(hibernateTemplate.load(vcl_district.class, id));
			return 1;
		}catch(Exception e){
			e.printStackTrace();
		}
		return 0;
	}
	/*====================== District Master Code Starts ===========================*/
	/* ======================== Branch Code Starts ================== */
	public boolean checkForUniqueBranchName(vcl_organisation_branch vob)
	{
		logger.info("--------MasterDao.checkForUniqueBranchName called---");
		
		Session session=sessionFactory.openSession();
		Criteria cr = session.createCriteria(vcl_organisation_branch.class);
		cr.add(Restrictions.eq("branch_name", vob.getBranch_name()));
		int size = cr.list().size();
		session.close();
		if(size > 0)
			return true;
	
		return false;
	}
	public int saveBranch(vcl_organisation_branch vob)
	{
		logger.info("--------MasterDao.saveBranch called---");
		try{
			hibernateTemplate.save(vob);
			return 1;
		}catch(Exception e){
			e.printStackTrace();
		}
		return 0;
	}
	public int updateBranch(vcl_organisation_branch vob)
	{
		logger.info("--------MasterDao.updateBranch called---");
		try{
			hibernateTemplate.update(vob);
			return 1;
		}catch(Exception e){
			e.printStackTrace();
		}
		return 0;
	}
	public List<vcl_organisation_branch> getAllBranches() {
		logger.info("--------MasterDao.getAllBranches called---");
		List<vcl_organisation_branch> branchesList = hibernateTemplate.loadAll(vcl_organisation_branch.class);
		return branchesList;
	}
	
	public int deleteBranchById(int branchId) {
		logger.info("--------MasterDao.deleteBranchById called---");
		try{
			hibernateTemplate.delete(hibernateTemplate.load(vcl_organisation_branch.class, branchId));
			return 1;
		}catch(Exception e){
			e.printStackTrace();
		}
		return 0;
	}
	/* ======================== Branch Code Ends ================== */
	/* ======================== Block Controller starts ========================= */
	public List<vcl_district> getDistrictsOfState(int stateId) {
		logger.info("--------MasterDao.getDistrictsOfState called---");
		
		Session session=sessionFactory.openSession();
		Criteria cr = session.createCriteria(vcl_district.class);
		cr.add(Restrictions.eq("stateId", stateId));
		List<vcl_district> districtList = cr.list();
		session.close();
		return districtList;
	}
	public boolean checkForUniqueBlockName(vcl_block block)
	{
		logger.info("--------MasterDao.checkForUniqueBlockName called---");
		
		Session session=sessionFactory.openSession();
		Criteria cr = session.createCriteria(vcl_block.class);
		cr.add(Restrictions.eq("block_long_name", block.getBlock_long_name()));
		int size = cr.list().size();
		session.close();
		if(size > 0)
			return true;
		
		return false;
	}
	public int saveBlock(vcl_block block)
	{
		logger.info("--------MasterDao.saveBlock called---");
		try{
			hibernateTemplate.save(block);
			return 1;
		}catch(Exception e){
			e.printStackTrace();
		}
		return 0;
	}
	public int updateBlock(vcl_block block)
	{
		logger.info("--------MasterDao.updateBlock called---");
		hibernateTemplate.update(block);
		return 1;
	}
	public List<vcl_block> getAllBlocks() {
		logger.info("--------MasterDao.getAllBlocks called---");
		List<vcl_block> blocksList = hibernateTemplate.loadAll(vcl_block.class);
		return blocksList;
	}
	
	public int deleteBlockById(int blockId) {
		logger.info("--------MasterDao.deleteBlockById called---");
		try{
			hibernateTemplate.delete(hibernateTemplate.load(vcl_block.class, blockId));
			return 1;
		}catch(Exception e){
			e.printStackTrace();
		}
		return 0;
	}
	/* ======================== Block Controller Ends ========================= */
	/*====================== Designation Code Starts ===========================*/
	public boolean checkForUniqueDesignationName(vcl_designation deg)
	{
		logger.info("--------MasterDao.checkForUniqueDesignationkName called---");
		
		Session session=sessionFactory.openSession();
		Criteria cr = session.createCriteria(vcl_designation.class);
		cr.add(Restrictions.eq("designationName", deg.getDesignationName()));
		int size = cr.list().size();
		session.close();
		if(size > 0)
			return true;
		
		return false;
	}
	public int saveDesignation(vcl_designation desig)
	{
		logger.info("--------HierarchyDao.saveDesignation called---");
		try{
			hibernateTemplate.save(desig);
			return 1;
		}catch(Exception e){
			e.printStackTrace();
			return 0;
		}
	}
	public int updateDesignation(vcl_designation desig)
	{
		logger.info("--------MasterDao.updateBlock called---");
		try{
			hibernateTemplate.update(desig);
			return 1;
		}catch(Exception e){
			e.printStackTrace();
			return 0;
		}
	}
	public List<vcl_designation> getAllDesignations() {
		logger.info("--------list_of_designations called---");
		List<vcl_designation> allDesignations = hibernateTemplate.loadAll(vcl_designation.class);
		return allDesignations;
	}
	public int deleteDesignationById(int designationId) {
		logger.info("--------MasterDao.deleteBlockById called---");
		try{
			hibernateTemplate.delete(hibernateTemplate.load(vcl_designation.class, designationId));
			return 1;
		}catch(Exception e){
			e.printStackTrace();
		}
		return 0;
	}
	/*====================== Designation Code Ends ===========================*/
	/* ======================== Village/Town/City Code starts ========================= */
	public List<vcl_block> getBlocksOfDistrict(int districtId) {
		logger.info("--------MasterDao.getDistrictsOfState called---");
		
		Session session=sessionFactory.openSession();
		Criteria cr = session.createCriteria(vcl_block.class);
		cr.add(Restrictions.eq("districtId", districtId));
		List<vcl_block> blockList = cr.list();
		session.close();
		return blockList;
	}
	public boolean checkForUniqueVtcName(vcl_vill_town_city vtc)
	{
		logger.info("--------MasterDao.checkForUniqueVillageName called---");
		
		Session session=sessionFactory.openSession();
		Criteria cr = session.createCriteria(vcl_vill_town_city.class);
		cr.add(Restrictions.eq("vtc_long_name", vtc.getVtc_long_name()));
		int size = cr.list().size();
		session.close();
		if(size > 0)
			return true;
		
		return false;
	}
	public int saveVtc(vcl_vill_town_city vtc)
	{
		logger.info("--------MasterDao.saveVillage called---");
		try{
			hibernateTemplate.save(vtc);
			return 1;
		}catch(Exception e){
			e.printStackTrace();
		}
		return 0;
	}
	public int updateVtc(vcl_vill_town_city vtc)
	{
		logger.info("--------MasterDao.updateVtc called---");
		try{
			hibernateTemplate.update(vtc);
			return 1;
		}catch(Exception e){
			e.printStackTrace();
		}
		return 0;
	}
	public List<vcl_vill_town_city> getAllVtc() {
		logger.info("--------MasterDao.getAllVtc called---");
		List<vcl_vill_town_city> vtcList = hibernateTemplate.loadAll(vcl_vill_town_city.class);
		return vtcList;
	}
	
	public int deleteVtcById(int vtcId) {
		logger.info("--------MasterDao.deleteVillageById called---");
		try{
			hibernateTemplate.delete(hibernateTemplate.load(vcl_vill_town_city.class, vtcId));
			return 1;
		}catch(Exception e){
			e.printStackTrace();
		}
		return 0;
	}
	/* ======================== Village/Town/City Code Ends ========================= */
	/*====================== Role Master Code Starts ===========================*/
	public boolean checkUniqueRoleName(vcl_role role)
	{
		logger.info("--------MasterDao.checkUniqueStateCode called---");
		
		Session session=sessionFactory.openSession();
		Criteria cr = session.createCriteria(vcl_role.class);
		cr.add(Restrictions.eq("role_name", role.getRole_name()));
		int size = cr.list().size();
		session.close();
		if(size > 0)
			return true;
		
		return false;
	}
	
	public int saveRole(vcl_role role)
	{
		logger.info("--------MasterDao.saveRole called---");
		try{
			hibernateTemplate.save(role);
			return 1;
		}catch(Exception e){
			e.printStackTrace();
		}
		return 0;
	}
	public int updateRole(vcl_role role)
	{
		logger.info("--------MasterDao.updateRole called---");
		try{
			hibernateTemplate.update(role);
			return 1;
		}catch(Exception e){
			e.printStackTrace();
		}
		return 0;
		
	}

	public List<vcl_role> getListOfRoles() {
		logger.info("--------MasterDao.getListOfRoles called---");
		List<vcl_role> allRoles = hibernateTemplate.loadAll(vcl_role.class);
		return allRoles;
	}
	
	public int deleteRoleById(int roleId) {
		logger.info("--------MasterDao.deleteRoleById called---");
		try{
			hibernateTemplate.delete(hibernateTemplate.load(vcl_role.class, roleId));
			return 1;
		}catch(Exception e){
			e.printStackTrace();
		}
		return 0;
	}
	/*====================== Role Master Code Ends ===========================*/
	/*====================== Language Master Code Starts ===========================*/
	public boolean checkUniqueLanguageName(vcl_language lang)
	{
		logger.info("--------MasterDao.checkUniqueLanguageName called---");
		
		Session session=sessionFactory.openSession();
		Criteria cr = session.createCriteria(vcl_language.class);
		cr.add(Restrictions.eq("lang_nm", lang.getLang_nm()));
		int size = cr.list().size();
		session.close();
		if(size > 0)
			return true;
		
		return false;
	}
	
	public int saveLanguage(vcl_language lang)
	{
		logger.info("--------MasterDao.saveLanguage called---");
		try{
			hibernateTemplate.save(lang);
			return 1;
		}catch(Exception e){
			e.printStackTrace();
		}
		return 0;
	}
	public int updateLanguage(vcl_language lang)
	{
		logger.info("--------MasterDao.updateLanguage called---");
		try{
			hibernateTemplate.update(lang);
			return 1;
		}catch(Exception e){
			e.printStackTrace();
		}
		return 0;
		
	}

	public List<vcl_language> getListOfLanguages() {
		logger.info("--------MasterDao.getListOfLanguages called---");
		List<vcl_language> allLanguage = hibernateTemplate.loadAll(vcl_language.class);
		return allLanguage;
	}
	
	public int deleteLanguageById(int langId) {
		logger.info("--------MasterDao.deleteRoleById called---");
		try{
			hibernateTemplate.delete(hibernateTemplate.load(vcl_language.class, langId));
			return 1;
		}catch(Exception e){
			e.printStackTrace();
		}
		return 0;
	}
	/*====================== Language Master Code Ends ===========================*/
	/*====================== Language Master Code Starts ===========================*/
	public boolean checkUniqueEducationName(vcl_education edu)
	{
		logger.info("--------MasterDao.checkUniqueEducationName called---");
		
		Session session=sessionFactory.openSession();
		Criteria cr = session.createCriteria(vcl_education.class);
		cr.add(Restrictions.eq("education_nm", edu.getEducation_nm()));
		int size = cr.list().size();
		session.close();
		if(size > 0)
			return true;
		
		return false;
	}
	
	public int saveEducation(vcl_education edu)
	{
		logger.info("--------MasterDao.saveEducation called---");
		try{
			hibernateTemplate.save(edu);
			return 1;
		}catch(Exception e){
			e.printStackTrace();
		}
		return 0;
	}
	public int updateEducation(vcl_education edu)
	{
		logger.info("--------MasterDao.updateEducation called---");
		try{
			hibernateTemplate.update(edu);
			return 1;
		}catch(Exception e){
			e.printStackTrace();
		}
		return 0;
		
	}
	public List<vcl_education> getListOfEducations() {
		logger.info("--------MasterDao.getListOfEducations called---");
		List<vcl_education> allEducations = hibernateTemplate.loadAll(vcl_education.class);
		return allEducations;
	}
	
	public int deleteEducationById(int eduId) {
		logger.info("--------MasterDao.deleteRoleById called---");
		try{
			hibernateTemplate.delete(hibernateTemplate.load(vcl_education.class, eduId));
			return 1;
		}catch(Exception e){
			e.printStackTrace();
		}
		return 0;
	}
	/*====================== Language Master Code Ends ===========================*/
	/*====================== Religion Master Code Starts ===========================*/
	public boolean checkUniqueReligionName(vcl_religion rel)
	{
		logger.info("--------MasterDao.checkUniqueReligionName called---");
		
		Session session=sessionFactory.openSession();
		Criteria cr = session.createCriteria(vcl_religion.class);
		cr.add(Restrictions.eq("religion_name", rel.getReligion_name()));
		int size = cr.list().size();
		session.close();
		if(size > 0)
			return true;
		
		return false;
	}
	
	public int saveReligion(vcl_religion rel)
	{
		logger.info("--------MasterDao.saveReligion called---");
		try{
			hibernateTemplate.save(rel);
			return 1;
		}catch(Exception e){
			e.printStackTrace();
		}
		return 0;
	}
	public int updateReligion(vcl_religion rel)
	{
		logger.info("--------MasterDao.updateReligion called---");
		try{
			hibernateTemplate.update(rel);
			return 1;
		}catch(Exception e){
			e.printStackTrace();
		}
		return 0;
		
	}
	public List<vcl_religion> getListOfReligions() {
		logger.info("--------MasterDao.getListOfReligions called---");
		List<vcl_religion> allReligions = hibernateTemplate.loadAll(vcl_religion.class);
		return allReligions;
	}
	
	public int deleteReligionById(int relId) {
		logger.info("--------MasterDao.deleteReligionById called---");
		try{
			hibernateTemplate.delete(hibernateTemplate.load(vcl_religion.class, relId));
			return 1;
		}catch(Exception e){
			e.printStackTrace();
		}
		return 0;
	}
	/*====================== Religion Master Code Ends ===========================*/
	/*====================== Department Master Code Starts ===========================*/
	public boolean checkUniqueDepartmentName(vcl_department dep)
	{
		logger.info("--------MasterDao.checkUniqueDepartmentName called---");
		
		Session session=sessionFactory.openSession();
		Criteria cr = session.createCriteria(vcl_department.class);
		cr.add(Restrictions.eq("department_name", dep.getDepartment_name()));
		int size = cr.list().size();
		session.close();
		if(size > 0)
			return true;
		
		return false;
	}
	
	public int saveDepartment(vcl_department dep)
	{
		logger.info("--------MasterDao.savDepartment called---");
		try{
			hibernateTemplate.save(dep);
			return 1;
		}catch(Exception e){
			e.printStackTrace();
		}
		return 0;
	}
	public int updateDepartment(vcl_department dep)
	{
		logger.info("--------MasterDao.updateDepartment called---");
		try{
			hibernateTemplate.update(dep);
			return 1;
		}catch(Exception e){
			e.printStackTrace();
		}
		return 0;
		
	}
	public List<vcl_department> getListOfDepartments() {
		logger.info("--------MasterDao.getListOfDepartments called---");
		List<vcl_department> allDepartments = hibernateTemplate.loadAll(vcl_department.class);
		return allDepartments;
	}
	
	public int deleteDepartmentById(int depId) {
		logger.info("--------MasterDao.deleteDepartmentById called---");
		try{
			hibernateTemplate.delete(hibernateTemplate.load(vcl_department.class, depId));
			return 1;
		}catch(Exception e){
			e.printStackTrace();
		}
		return 0;
	}
	/*====================== Department Master Code Ends ===========================*/
	/*====================== Occupation Master Code Starts ===========================*/
	public boolean checkUniqueOccupationName(vcl_occupation occu)
	{
		logger.info("--------MasterDao.checkUniqueDepartmentName called---");
		
		Session session=sessionFactory.openSession();
		Criteria cr = session.createCriteria(vcl_occupation.class);
		cr.add(Restrictions.eq("occupation_name", occu.getOccupation_name()));
		int size = cr.list().size();
		session.close();
		if(size > 0)
			return true;
		
		return false;
	}
	
	public int saveOccupation(vcl_occupation occu)
	{
		logger.info("--------MasterDao.saveOccupation called---");
		try{
			hibernateTemplate.save(occu);
			return 1;
		}catch(Exception e){
			e.printStackTrace();
		}
		return 0;
	}
	public int updateOccupation(vcl_occupation occu)
	{
		logger.info("--------MasterDao.updateOccupation called---");
		try{
			hibernateTemplate.update(occu);
			return 1;
		}catch(Exception e){
			e.printStackTrace();
		}
		return 0;
		
	}
	public List<vcl_occupation> getListOfOccupations() {
		logger.info("--------MasterDao.getListOfOccupations called---");
		List<vcl_occupation> allOccupations = hibernateTemplate.loadAll(vcl_occupation.class);
		return allOccupations;
	}
	
	public int deleteOccupationById(int occuId) {
		logger.info("--------MasterDao.deleteOccupationById called---");
		try{
			hibernateTemplate.delete(hibernateTemplate.load(vcl_occupation.class, occuId));
			return 1;
		}catch(Exception e){
			e.printStackTrace();
		}
		return 0;
	}
	/*====================== Occupation Master Code Ends ===========================*/
	/*====================== Status Type Master Code Starts ===========================*/
	public boolean checkUniqueStatusTypeName(vcl_status_type vst)
	{
		logger.info("--------MasterDao.checkUniqueStatusTypeName called---");
		
		Session session=sessionFactory.openSession();
		Criteria cr = session.createCriteria(vcl_status_type.class);
		cr.add(Restrictions.eq("status_type_name", vst.getStatus_type_name()));
		int size = cr.list().size();
		session.close();
		if(size > 0)
			return true;
		
		return false;
	}
	
	public int saveStatusType(vcl_status_type vst)
	{
		logger.info("--------MasterDao.saveStatusType called---");
		try{
			hibernateTemplate.save(vst);
			return 1;
		}catch(Exception e){
			e.printStackTrace();
		}
		return 0;
	}
	public int updateStatusType(vcl_status_type vst)
	{
		logger.info("--------MasterDao.updateStatusType called---");
		try{
			hibernateTemplate.update(vst);
			return 1;
		}catch(Exception e){
			e.printStackTrace();
		}
		return 0;
		
	}
	public List<vcl_status_type> getListOfStatusTypes() {
		logger.info("--------MasterDao.getListOfStatusTypes called---");
		List<vcl_status_type> allStatusTypes = hibernateTemplate.loadAll(vcl_status_type.class);
		return allStatusTypes;
	}
	
	public int deleteStatusTypeById(int vstId) {
		logger.info("--------MasterDao.deleteStatusTypeById called---");
		try{
			hibernateTemplate.delete(hibernateTemplate.load(vcl_status_type.class, vstId));
			return 1;
		}catch(Exception e){
			e.printStackTrace();
		}
		return 0;
	}
	/*====================== Status Type Master Code Ends ===========================*/
	/*====================== Status Master Code Starts ===========================*/
	public boolean checkUniqueStatusName(vcl_status vs)
	{
		logger.info("--------MasterDao.checkUniqueStatusName called---");
		
		Session session=sessionFactory.openSession();
		Criteria cr = session.createCriteria(vcl_status.class);
		cr.add(Restrictions.eq("status_name", vs.getStatus_name()));
		int size = cr.list().size();
		session.close();
		if(size > 0)
			return true;
		
		return false;
	}
	
	public int saveStatus(vcl_status vs)
	{
		logger.info("--------MasterDao.saveStatus called---");
		try{
			hibernateTemplate.save(vs);
			return 1;
		}catch(Exception e){
			e.printStackTrace();
		}
		return 0;
	}
	public int updateStatus(vcl_status vs)
	{
		logger.info("--------MasterDao.updateStatus called---");
		try{
			hibernateTemplate.update(vs);
			return 1;
		}catch(Exception e){
			e.printStackTrace();
		}
		return 0;
		
	}
	public List<vcl_status> getListOfStatus() {
		logger.info("--------MasterDao.getListOfStatus called---");
		List<vcl_status> allStatus = hibernateTemplate.loadAll(vcl_status.class);
		return allStatus;
	}
	
	public int deleteStatusById(int vsId) {
		logger.info("--------MasterDao.deleteStatusById called---");
		try{
			hibernateTemplate.delete(hibernateTemplate.load(vcl_status.class, vsId));
			return 1;
		}catch(Exception e){
			e.printStackTrace();
		}
		return 0;
	}
	/*====================== Status Master Code Ends ===========================*/
	/* ======================== Relationship Code Starts ================== */
	public boolean checkForUniqueRelationhipTypeName(vcl_relationship_type rel)
	{
		logger.info("--------MasterDao.checkForUniqueRelationhipTypeName called---");
		
		Session session=sessionFactory.openSession();
		Criteria cr = session.createCriteria(vcl_relationship_type.class);
		cr.add(Restrictions.eq("relation_type_nm", rel.getRelation_type_nm()));
		int size = cr.list().size();
		session.close();
		if(size > 0)
			return true;
	
		return false;
	}
	public int saveRelationshipType(vcl_relationship_type rel)
	{
		logger.info("--------MasterDao.saveRelationshipType called---");
		try{
			hibernateTemplate.save(rel);
			return 1;
		}catch(Exception e){
			e.printStackTrace();
		}
		return 0;
	}
	public int updateRelationshipType(vcl_relationship_type rel)
	{
		logger.info("--------MasterDao.updateRelationshipType called---");
		try{
			hibernateTemplate.update(rel);
			return 1;
		}catch(Exception e){
			e.printStackTrace();
		}
		return 0;
	}
	public List<vcl_relationship_type> getAllRelationshipTypes() {
		logger.info("--------MasterDao.getAllRelationshipTypes called---");
		List<vcl_relationship_type> relationshipTypesList = hibernateTemplate.loadAll(vcl_relationship_type.class);
		return relationshipTypesList;
	}
	
	public int deleteRelationTypeById(int relation_type_id) {
		logger.info("--------MasterDao.deleteRelationTypeById called---");
		try{
			hibernateTemplate.delete(hibernateTemplate.load(vcl_relationship_type.class, relation_type_id));
			return 1;
		}catch(Exception e){
			e.printStackTrace();
		}
		return 0;
	}
	/* ======================== Relationship Code Ends ================== */
	/* ======================== Contact Type Code Starts ================== */
	public boolean checkForUniqueContactTypeName(vcl_contact_type ct)
	{
		logger.info("--------MasterDao.checkForUniqueContactTypeName called---");
		
		Session session=sessionFactory.openSession();
		Criteria cr = session.createCriteria(vcl_contact_type.class);
		cr.add(Restrictions.eq("contact_type_name", ct.getContact_type_name()));
		int size = cr.list().size();
		session.close();
		if(size > 0)
			return true;
	
		return false;
	}
	public int saveContactType(vcl_contact_type ct)
	{
		logger.info("--------MasterDao.saveContactType called---");
		try{
			hibernateTemplate.save(ct);
			return 1;
		}catch(Exception e){
			e.printStackTrace();
		}
		return 0;
	}
	public int updateContactType(vcl_contact_type ct)
	{
		logger.info("--------MasterDao.updateContactType called---");
		try{
			hibernateTemplate.update(ct);
			return 1;
		}catch(Exception e){
			e.printStackTrace();
		}
		return 0;
	}
	public List<vcl_contact_type> getAllContactTypes() {
		logger.info("--------MasterDao.getAllContactTypes called---");
		List<vcl_contact_type> contactTypesList = hibernateTemplate.loadAll(vcl_contact_type.class);
		return contactTypesList;
	}
	
	public int deleteContactTypeById(int ctId) {
		logger.info("--------MasterDao.deleteContactTypeById called---");
		try{
			hibernateTemplate.delete(hibernateTemplate.load(vcl_contact_type.class, ctId));
			return 1;
		}catch(Exception e){
			e.printStackTrace();
		}
		return 0;
	}
	/* ======================== Contact Type Code Ends ================== */
	/* ======================== Cluster Code Starts ================== */
	public boolean checkForUniqueClusterName(vcl_cluster cluster)
	{
		logger.info("--------MasterDao.checkForUniqueClusterName called---");
		
		Session session=sessionFactory.openSession();
		Criteria cr = session.createCriteria(vcl_cluster.class);
		cr.add(Restrictions.eq("cluster_long_name", cluster.getCluster_long_name()));
		int size = cr.list().size();
		session.close();
		if(size > 0)
			return true;
	
		return false;
	}
	public int saveCluster(vcl_cluster cluster)
	{
		logger.info("--------MasterDao.saveCluster called---");
		try{
			hibernateTemplate.save(cluster);
			return 1;
		}catch(Exception e){
			e.printStackTrace();
		}
		return 0;
	}
	public int updateCluster(vcl_cluster cluster)
	{
		logger.info("--------MasterDao.updateCluster called---");
		try{
			hibernateTemplate.update(cluster);
			return 1;
		}catch(Exception e){
			e.printStackTrace();
		}
		return 0;
	}
	public List<vcl_cluster> getAllClusters() {
		logger.info("--------MasterDao.getAllClusters called---");
		List<vcl_cluster> clusterList = hibernateTemplate.loadAll(vcl_cluster.class);
		return clusterList;
	}
	
	public int deleteClusterById(int clusterId) {
		logger.info("--------MasterDao.deleteClusterById called---");
		try{
			hibernateTemplate.delete(hibernateTemplate.load(vcl_cluster.class, clusterId));
			return 1;
		}catch(Exception e){
			e.printStackTrace();
		}
		return 0;
	}
	/* ======================== Cluster Code Ends ================== */
	/* ======================== Employee Role Code Starts ================== */
	public boolean checkUniqueEmployeeRoleName(vcl_employee_role employee)
	{
		logger.info("--------MasterDao.checkUniqueEmployeeRoleName called---");
		
		Session session=sessionFactory.openSession();
		Criteria cr = session.createCriteria(vcl_employee_role.class);
		cr.add(Restrictions.eq("emp_role_name", employee.getEmp_role_name()));
		int size = cr.list().size();
		session.close();
		if(size > 0)
			return true;
		
		return false;
	}
	
	public int saveEmployeeRole(vcl_employee_role employee)
	{
		logger.info("--------MasterDao.saveEmployeeRole called---");
		try{
			hibernateTemplate.save(employee);
			return 1;
		}catch(Exception e){
			e.printStackTrace();
		}
		return 0;
	}
	public int updateEmployeeRole(vcl_employee_role employee)
	{
		logger.info("--------MasterDao.updateEmployeeRole called---");
		try{
			hibernateTemplate.update(employee);
			return 1;
		}catch(Exception e){
			e.printStackTrace();
		}
		return 0;
		
	}
	public List<vcl_employee_role> getListOfEmployeeRoles() {
		logger.info("--------MasterDao.getListOfEmployeeRoles called---");
		List<vcl_employee_role> allEmployeeRoles = hibernateTemplate.loadAll(vcl_employee_role.class);
		return allEmployeeRoles;
	}
	
	public int deleteEmployeeRolesById(int employeeId) {
		logger.info("--------MasterDao.deleteEmployeeRoleById called---");
		try{
			hibernateTemplate.delete(hibernateTemplate.load(vcl_employee_role.class, employeeId));
			return 1;
		}catch(Exception e){
			e.printStackTrace();
		}
		return 0;
	}
	/* ======================== Employee Role Code Ends ================== */
	/* ======================== Employee Code Starts ================== */
	public boolean checkUniqueEmpFirstName(vcl_employee employee)
	{
		logger.info("--------MasterDao.checkUniqueEmpFirstName called---");
		
		Session session=sessionFactory.openSession();
		Criteria cr = session.createCriteria(vcl_employee.class);
		cr.add(Restrictions.eq("emp_first_name", employee.getEmp_first_name()));
		int size = cr.list().size();
		session.close();
		if(size > 0)
			return true;
		
		return false;
	}
	
	public int saveEmployee(vcl_employee employee)
	{
		logger.info("--------MasterDao.saveEmployee called---");
		try{
			hibernateTemplate.save(employee);
			return 1;
		}catch(Exception e){
			e.printStackTrace();
		}
		return 0;
	}
	public int updateEmployee(vcl_employee employee)
	{
		logger.info("--------MasterDao.updateEmployee called---");
		try{
			hibernateTemplate.update(employee);
			return 1;
		}catch(Exception e){
			e.printStackTrace();
		}
		return 0;
		
	}
	public List<vcl_employee> getListOfEmployee() {
		logger.info("--------MasterDao.getListOfEmployee called---");
		List<vcl_employee> allEmployee = hibernateTemplate.loadAll(vcl_employee.class);
		return allEmployee;
	}
	
	public int deleteEmployeeById(int employeeId) {
		logger.info("--------MasterDao.deleteEmployeeById called---");
		try{
			hibernateTemplate.delete(hibernateTemplate.load(vcl_employee.class, employeeId));
			return 1;
		}catch(Exception e){
			e.printStackTrace();
		}
		return 0;
	}
	/* ======================== Employee Code Ends ================== */
	/* ======================== Organisation Cluster Code Ends ================== */
	public boolean checkForUniqueOrganisationClusterName(vcl_organisation_cluster cluster)
	{
		logger.info("--------MasterDao.checkForUniqueOrganisationClusterName called---");
		
		Session session=sessionFactory.openSession();
		Criteria cr = session.createCriteria(vcl_organisation_cluster.class);
		cr.add(Restrictions.eq("org_cluster_name", cluster.getOrg_cluster_name()));
		int size = cr.list().size();
		session.close();
		if(size > 0)
			return true;
	
		return false;
	}
	public int saveOrgCluster(vcl_organisation_cluster cluster)
	{
		logger.info("--------MasterDao.saveOrganisationCluster called---");
		try{
			hibernateTemplate.save(cluster);
			return 1;
		}catch(Exception e){
			e.printStackTrace();
		}
		return 0;
	}
	public int updateOrgCluster(vcl_organisation_cluster cluster)
	{
		logger.info("--------MasterDao.updateOrganisationCluster called---");
		try{
			hibernateTemplate.update(cluster);
			return 1;
		}catch(Exception e){
			e.printStackTrace();
		}
		return 0;
	}
	public List<vcl_organisation_cluster> getAllOrganisationClusters() {
		logger.info("--------MasterDao.getAllOrganisationClusters called---");
		List<vcl_organisation_cluster> OrganisationclusterList = hibernateTemplate.loadAll(vcl_organisation_cluster.class);
		return OrganisationclusterList;
	}
	
	public int deleteOrgClusterById(int clusterId) {
		logger.info("--------MasterDao.deleteOrganisationClusterById called---");
		try{
			hibernateTemplate.delete(hibernateTemplate.load(vcl_organisation_cluster.class, clusterId));
			return 1;
		}catch(Exception e){
			e.printStackTrace();
		}
		return 0;
	}
	/* ======================== Organisation Cluster Code Ends ================== */
	/* ======================== Zone Code Starts ================== */
	public boolean check_unique_zone_name(vcl_zone zone)
	{
		logger.info("--------zone.insert called---");
		
		Session session=sessionFactory.openSession();
		Criteria cr = session.createCriteria(vcl_zone.class);
		cr.add(Restrictions.eq("zone_long_name", zone.getZone_long_name()));
		int size = cr.list().size();
		session.close();
		if(size > 0)
			return true;
		
		return false;
	}
	public int insert(vcl_zone zone)
	{
		logger.info("--------zone.insert called---");
		try{
			hibernateTemplate.save(zone);
			return 1;
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return 0;
	}
	public int update(vcl_zone zone)
	{
		logger.info("--------zone.update called---");
		hibernateTemplate.update(zone);
		return 1;
	}

	public List<vcl_zone> list_of_zones() {
		logger.info("--------list_of_zones called---");
		List<vcl_zone> list_zone = hibernateTemplate.loadAll(vcl_zone.class);
		return list_zone;
	}
	
	public int delete_zone_by_id(int id) {
		logger.info("--------delete_zone_by_id called---");
		try{
			hibernateTemplate.delete(hibernateTemplate.load(vcl_zone.class, id));
			return 1;
		}catch(Exception e){
			e.printStackTrace();
		}
		return 0;
	}
	/* ======================== Zone Code Ends ================== */
}
