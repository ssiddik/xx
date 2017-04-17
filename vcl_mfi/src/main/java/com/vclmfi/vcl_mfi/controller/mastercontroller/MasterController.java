package com.vclmfi.vcl_mfi.controller.mastercontroller;

import java.security.Principal;
import java.util.Iterator;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.vclmfi.vcl_mfi.HomeController;
import com.vclmfi.vcl_mfi.dao.MasterDao;
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


@Controller
public class MasterController {
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	 MasterDao masterDao;

	
	@RequestMapping(value="/master",method=RequestMethod.GET)
	public ModelAndView dashboard(Principal p)
	{
		logger.info("------enter master page -----------");
			ModelAndView db=new ModelAndView();
			db.setViewName("master");
			return db;
	}
	/*@RequestMapping(value="/hierarchy",method=RequestMethod.GET)
	public ModelAndView hierarchy(Principal p)
	{
		logger.info("------enter master page -----------");
			ModelAndView db=new ModelAndView();
			db.setViewName("hierarchy");
			return db;
	}*/
	/*@RequestMapping(value="/state_master",method=RequestMethod.GET)
	public ModelAndView stateMaster(Principal p)
	{
		logger.info("------enter state page -----------");
			ModelAndView db = new ModelAndView();
			db.setViewName("state_master");
			List<vcl_state> listOfStates = masterDao.list_of_states();
			
			Iterator i = listOfStates.iterator();
			while(i.hasNext()){
				vcl_state s = (vcl_state) i.next();
				System.out.println(s.getState_id());
				System.out.println(s.getState_nm());
			}
			
			db.addObject("listOfStates",listOfStates);
			return db;
	}
	@RequestMapping(value="/branch_master",method=RequestMethod.GET)
	public ModelAndView branchMaster(Principal p)
	{
		logger.info("------enter branch page -----------");
			ModelAndView db=new ModelAndView();
			db.setViewName("branch_master");
			return db;
	}*/
	/* ======================== State Controller Starts ========================= */
	@RequestMapping(value="check_unique_state_code",method= {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody boolean check_unique_state_code(@RequestBody vcl_state state)
	{
		logger.info("------ check_unique_state_code called -----------");
		boolean status = masterDao.check_unique_state_code(state);
		return status;
	}
	@RequestMapping(value="save_state",method= {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody int save_state(@RequestBody vcl_state state)
	{
		logger.info("------ save_state called -----------");
		int result = masterDao.insert(state);
		return result;
	}
	@RequestMapping(value="update_state",method= {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody int update_state(@RequestBody vcl_state state)
	{
		logger.info("------ update_state called -----------");
		int result = masterDao.update(state);
		return result;
	}
	@RequestMapping(value="list_of_states",method= {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody List<vcl_state> list_of_states()
	{
		logger.info("------ list_of_states called -----------");
		List<vcl_state> allStates = masterDao.list_of_states();
		return allStates;
	}
	@RequestMapping(value="delete_state",method= {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody int delete_state(@RequestBody int state_id)
	{
		logger.info("------ delete_state called -----------");
		System.out.println("*********111111111111***************"+state_id);
		int result = masterDao.delete_state_by_id(state_id);
		return result;
	}
	/* ======================== State Controller Ends ========================= */
	/* ======================== District Controller Starts ========================= */
	@RequestMapping(value="check_unique_district_code",method= {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody boolean checkUniqueDistrictCode(@RequestBody vcl_district dis)
	{
		logger.info("------ check_unique_state_code called -----------");
		boolean status = masterDao.checkForUniqueDistrict(dis);
		return status;
	}
	@RequestMapping(value="save_district",method= {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody int saveDistrict(@RequestBody vcl_district dis)
	{
		logger.info("------ save_district called -----------");
		int result = masterDao.saveDistrict(dis);
		return result;
	}
	@RequestMapping(value="update_district",method= {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody int updateDistrict(@RequestBody vcl_district dis)
	{
		logger.info("------ update_district called -----------");
		int result = masterDao.updateDistrict(dis);
		return result;
	}
	@RequestMapping(value="delete_district",method= {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody int deleteDistrict(@RequestBody int district_id)
	{
		logger.info("------ delete_district called -----------");
		int result = masterDao.deleteDistrictById(district_id);
		return result;
	}
	@RequestMapping(value="list_of_districts",method= {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody List<vcl_district> listOfDistricts()
	{
		logger.info("------ list_of_districts called -----------");
		List<vcl_district> allDistricts = masterDao.getAllDistrict();
		return allDistricts;
	}
	/* ======================== District Controller Ends ========================= */
	/* ======================== Branch Controller Starts ================= */
	@RequestMapping(value="check_unique_branch_name", method= {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody boolean checkUniqueBranchName(@RequestBody vcl_organisation_branch branch)
	{
		logger.info("------ check_unique_branch_name called -----------");
		boolean status = masterDao.checkForUniqueBranchName(branch);
		return status;
	}
	@RequestMapping(value="save_branch",method= {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody int saveBranch(@RequestBody vcl_organisation_branch branch)
	{
		logger.info("------ save_cluster called -----------");
		int result = masterDao.saveBranch(branch);
		return result;
	}
	@RequestMapping(value="update_branch",method= {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody int updateBranch(@RequestBody vcl_organisation_branch branch)
	{
		logger.info("------ update_branch called -----------");
		int result = masterDao.updateBranch(branch);
		return result;
	}
	@RequestMapping(value="delete_branch",method= {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody int deleteBranch(@RequestBody int clusterId)
	{
		logger.info("------ delete_branch called -----------");
		int result = masterDao.deleteBranchById(clusterId);
		return result;
	}
	@RequestMapping(value="list_of_branches",method= {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody List<vcl_organisation_branch> listOfBranches()
	{
		logger.info("------ list_of_branch called -----------");
		List<vcl_organisation_branch> allBranches = masterDao.getAllBranches();
		return allBranches;
	}
	/* ======================== Branch Controller Ends =================== */
	/* ======================== Block Controller starts ========================= */
	@RequestMapping(value="get_districts_of_state",method= {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody List<vcl_district> getDistrictsOfState(@RequestBody int stateId)
	{
		logger.info("------ get_districts_of_state called -----------");
		List<vcl_district> districtsOfState = masterDao.getDistrictsOfState(stateId);
		return districtsOfState;
	}
	@RequestMapping(value="check_unique_block_name", method= {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody boolean checkUniqueBlockName(@RequestBody vcl_block block)
	{
		logger.info("------ check_unique_block_name called -----------");
		boolean status = masterDao.checkForUniqueBlockName(block);
		return status;
	}
	@RequestMapping(value="save_block",method= {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody int saveBlock(@RequestBody vcl_block block)
	{
		logger.info("------ save_branch called -----------");
		int result = masterDao.saveBlock(block);
		return result;
	}
	@RequestMapping(value="update_block",method= {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody int updateBlock(@RequestBody vcl_block block)
	{
		logger.info("------ update_block called -----------");
		int result = masterDao.updateBlock(block);
		return result;
	}
	@RequestMapping(value="delete_block",method= {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody int deleteBlock(@RequestBody int block_id)
	{
		logger.info("------ delete_block called -----------");
		int result = masterDao.deleteBlockById(block_id);
		return result;
	}
	@RequestMapping(value="list_of_blocks",method= {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody List<vcl_block> listOfBlocks()
	{
		logger.info("------ list_of_blocks called -----------");
		List<vcl_block> allBlocks = masterDao.getAllBlocks();
		return allBlocks;
	}
	/* ======================== Block Controller Ends ========================= */
	/* ======================== Designation Starts ========================= */
	@RequestMapping(value="check_unique_designation_name", method= {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody boolean checkUniqueDesignationName(@RequestBody vcl_designation deg)
	{
		logger.info("------ check_unique_block_name called -----------");
		boolean status = masterDao.checkForUniqueDesignationName(deg);
		return status;
	}
	@RequestMapping(value="save_designation",method= {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody int saveBlock(@RequestBody vcl_designation deg)
	{
		logger.info("------ save_branch called -----------");
		int result = masterDao.saveDesignation(deg);
		return result;
	}
	@RequestMapping(value="update_designation",method= {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody int updateDesignation(@RequestBody vcl_designation deg)
	{
		logger.info("------ update_block called -----------");
		int result = masterDao.updateDesignation(deg);
		return result;
	}
	@RequestMapping(value="delete_designation",method= {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody int deleteDesignation(@RequestBody int designationId)
	{
		logger.info("------ delete_block called -----------");
		int result = masterDao.deleteDesignationById(designationId);
		return result;
	}
	@RequestMapping(value="list_of_designation",method= {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody List<vcl_designation> listOfDesignations()
	{
		logger.info("------ list_of_blocks called -----------");
		List<vcl_designation> allDesignation = masterDao.getAllDesignations();
		return allDesignation;
	}
	/* ======================== State Controller Ends ========================= */
	/* ======================== Village/Town/City Code starts ========================= */
	@RequestMapping(value="get_blocks_of_district",method= {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody List<vcl_block> getBlocksOfDistrict(@RequestBody int districtId)
	{
		logger.info("------ get_blocks_of_district called -----------");
		List<vcl_block> blocksOfDistrict = masterDao.getBlocksOfDistrict(districtId);
		return blocksOfDistrict;
	}
	@RequestMapping(value="check_unique_vtc_name", method= {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody boolean checkUniqueVtcName(@RequestBody vcl_vill_town_city vtc)
	{
		logger.info("------ check_unique_village_name called -----------");
		boolean status = masterDao.checkForUniqueVtcName(vtc);
		return status;
	}
	@RequestMapping(value="save_vtc",method= {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody int saveVillage(@RequestBody vcl_vill_town_city vtc)
	{
		logger.info("------ save_village called -----------");
		int result = masterDao.saveVtc(vtc);
		return result;
	}
	@RequestMapping(value="update_vtc",method= {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody int updateBlock(@RequestBody vcl_vill_town_city vtc)
	{
		logger.info("------ update_village called -----------");
		int result = masterDao.updateVtc(vtc);
		return result;
	}
	@RequestMapping(value="delete_vtc",method= {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody int deleteVillage(@RequestBody int vtcId)
	{
		logger.info("------ delete_block called -----------");
		int result = masterDao.deleteVtcById(vtcId);
		return result;
	}
	@RequestMapping(value="list_of_vtc",method= {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody List<vcl_vill_town_city> listOfVillages()
	{
		logger.info("------ list_of_villages called -----------");
		List<vcl_vill_town_city> allVtc = masterDao.getAllVtc();
		return allVtc;
	}
	/* ======================== Village/Town/City Code Ends ========================= */
	/* ======================== Role Controller Starts ========================= */
	@RequestMapping(value="check_unique_role_name",method= {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody boolean checkUniqueRoleName(@RequestBody vcl_role role)
	{
		logger.info("------ MasterController.checkUniqueRoleName called -----------");
		boolean status = masterDao.checkUniqueRoleName(role);
		return status;
	}
	@RequestMapping(value="save_role",method= {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody int saveRole(@RequestBody vcl_role role)
	{
		logger.info("------ MasterController.saveRole called -----------");
		int result = masterDao.saveRole(role);
		return result;
	}
	@RequestMapping(value="update_role",method= {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody int updateRole(@RequestBody vcl_role role)
	{
		logger.info("------ MasterController.updateRole called -----------");
		int result = masterDao.updateRole(role);
		return result;
	}
	@RequestMapping(value="list_of_roles",method= {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody List<vcl_role> listOfRoles()
	{
		logger.info("------ MasterController.listOfRoles called -----------");
		List<vcl_role> allRoles = masterDao.getListOfRoles();
		return allRoles;
	}
	@RequestMapping(value="delete_role",method= {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody int deleteRole(@RequestBody int roleId)
	{
		logger.info("------ MasterController.deleteRole called -----------");
		int result = masterDao.deleteRoleById(roleId);
		return result;
	}
	/* ======================== Role Controller Ends ========================= */
	/* ======================== Language Controller Starts ========================= */
	@RequestMapping(value="check_unique_language_name",method= {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody boolean checkUniqueLanguageName(@RequestBody vcl_language lang)
	{
		logger.info("------ MasterController.checkUniqueLanguageName called -----------");
		boolean status = masterDao.checkUniqueLanguageName(lang);
		return status;
	}
	@RequestMapping(value="save_language",method= {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody int saveLanguage(@RequestBody vcl_language lang)
	{
		logger.info("------ MasterController.saveLanguage called -----------");
		int result = masterDao.saveLanguage(lang);
		return result;
	}
	@RequestMapping(value="update_language",method= {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody int updateLanguage(@RequestBody vcl_language lang)
	{
		logger.info("------ MasterController.updateRole called -----------");
		int result = masterDao.updateLanguage(lang);
		return result;
	}
	@RequestMapping(value="list_of_languages",method= {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody List<vcl_language> listOfLanguages()
	{
		logger.info("------ MasterController.listOfLanguages called -----------");
		List<vcl_language> allLanguages = masterDao.getListOfLanguages();
		return allLanguages;
	}
	@RequestMapping(value="delete_language",method= {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody int deleteLanguage(@RequestBody int langId)
	{
		logger.info("------ MasterController.deleteRole called -----------");
		int result = masterDao.deleteLanguageById(langId);
		return result;
	}
	/* ======================== Language Controller Ends ========================= */
	/* ======================== Education Controller Starts ========================= */
	@RequestMapping(value="check_unique_education_name",method= {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody boolean checkUniqueEducationName(@RequestBody vcl_education edu)
	{
		logger.info("------ MasterController.checkUniqueEducationName called -----------");
		boolean status = masterDao.checkUniqueEducationName(edu);
		return status;
	}
	@RequestMapping(value="save_education",method= {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody int saveEducation(@RequestBody vcl_education edu)
	{
		logger.info("------ MasterController.saveEducation called -----------");
		int result = masterDao.saveEducation(edu);
		return result;
	}
	@RequestMapping(value="update_education",method= {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody int updateEducation(@RequestBody vcl_education edu)
	{
		logger.info("------ MasterController.updateEducation called -----------");
		int result = masterDao.updateEducation(edu);
		return result;
	}
	@RequestMapping(value="list_of_educations",method= {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody List<vcl_education> listOfEducations()
	{
		logger.info("------ MasterController.listOfLanguages called -----------");
		List<vcl_education> allEducations = masterDao.getListOfEducations();
		return allEducations;
	}
	@RequestMapping(value="delete_education",method= {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody int deleteEducation(@RequestBody int eduId)
	{
		logger.info("------ MasterController.deleteRole called -----------");
		int result = masterDao.deleteEducationById(eduId);
		return result;
	}
	/* ======================== Education Controller Ends ========================= */
	/* ======================== Religion Controller Starts ========================= */
	@RequestMapping(value="check_unique_religion_name",method= {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody boolean checkUniqueReligionName(@RequestBody vcl_religion rel)
	{
		logger.info("------ MasterController.checkUniqueReligionName called -----------");
		boolean status = masterDao.checkUniqueReligionName(rel);
		return status;
	}
	@RequestMapping(value="save_religion",method= {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody int saveReligion(@RequestBody vcl_religion rel)
	{
		logger.info("------ MasterController.saveReligion called -----------");
		int result = masterDao.saveReligion(rel);
		return result;
	}
	@RequestMapping(value="update_religion",method= {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody int updateReligion(@RequestBody vcl_religion rel)
	{
		logger.info("------ MasterController.updateReligion called -----------");
		int result = masterDao.updateReligion(rel);
		return result;
	}
	@RequestMapping(value="list_of_religions",method= {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody List<vcl_religion> listOfReligions()
	{
		logger.info("------ MasterController.listOfReligions called -----------");
		List<vcl_religion> allReligions = masterDao.getListOfReligions();
		return allReligions;
	}
	@RequestMapping(value="delete_religion",method= {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody int deleteReligion(@RequestBody int relId)
	{
		logger.info("------ MasterController.deleteRole called -----------");
		int result = masterDao.deleteReligionById(relId);
		return result;
	}
	/* ======================== Religion Controller Ends ========================= */
	/* ======================== Department Controller Starts ========================= */
	@RequestMapping(value="check_unique_department_name",method= {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody boolean checkUniqueDepartmentName(@RequestBody vcl_department dep)
	{
		logger.info("------ MasterController.checkUniqueDepartmentName called -----------");
		boolean status = masterDao.checkUniqueDepartmentName(dep);
		return status;
	}
	@RequestMapping(value="save_department",method= {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody int saveDepartment(@RequestBody vcl_department dep)
	{
		logger.info("------ MasterController.saveDepartment called -----------");
		int result = masterDao.saveDepartment(dep);
		return result;
	}
	@RequestMapping(value="update_department",method= {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody int updateDepartment(@RequestBody vcl_department dep)
	{
		logger.info("------ MasterController.updateDepartment called -----------");
		int result = masterDao.updateDepartment(dep);
		return result;
	}
	@RequestMapping(value="list_of_departments",method= {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody List<vcl_department> listOfDepartments()
	{
		logger.info("------ MasterController.listOfDepartments called -----------");
		List<vcl_department> allDepartments = masterDao.getListOfDepartments();
		return allDepartments;
	}
	@RequestMapping(value="delete_department",method= {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody int deleteDepartment(@RequestBody int depId)
	{
		logger.info("------ MasterController.deleteDepartment called -----------");
		int result = masterDao.deleteDepartmentById(depId);
		return result;
	}
	/* ======================== Department Type Controller Ends ========================= */
	/* ======================== Department Controller Starts ========================= */
	@RequestMapping(value="check_unique_occupation_name",method= {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody boolean checkUniqueOccupationName(@RequestBody vcl_occupation occu)
	{
		logger.info("------ MasterController.checkUniqueOccupationName called -----------");
		boolean status = masterDao.checkUniqueOccupationName(occu);
		return status;
	}
	@RequestMapping(value="save_occupation",method= {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody int saveOccupation(@RequestBody vcl_occupation occu)
	{
		logger.info("------ MasterController.saveDepartment called -----------");
		int result = masterDao.saveOccupation(occu);
		return result;
	}
	@RequestMapping(value="update_occupation",method= {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody int updateOccupation(@RequestBody vcl_occupation occu)
	{
		logger.info("------ MasterController.updateOccupation called -----------");
		int result = masterDao.updateOccupation(occu);
		return result;
	}
	@RequestMapping(value="list_of_occupations",method= {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody List<vcl_occupation> listOfOccupations()
	{
		logger.info("------ MasterController.listOfOccupations called -----------");
		List<vcl_occupation> allOccupations = masterDao.getListOfOccupations();
		return allOccupations;
	}
	@RequestMapping(value="delete_occupation",method= {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody int deleteOccupation(@RequestBody int occuId)
	{
		logger.info("------ MasterController.deleteOccupation called -----------");
		int result = masterDao.deleteOccupationById(occuId);
		return result;
	}
	/* ======================== Department Type Controller Ends ========================= */
	/* ======================== Status Type Controller Starts ========================= */
	@RequestMapping(value="check_unique_status_type_name",method= {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody boolean checkUniqueStatusTypeName(@RequestBody vcl_status_type vst)
	{
		logger.info("------ MasterController.checkUniqueStatusTypeName called -----------");
		boolean status = masterDao.checkUniqueStatusTypeName(vst);
		return status;
	}
	@RequestMapping(value="save_status_type",method= {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody int saveStatusType(@RequestBody vcl_status_type vst)
	{
		logger.info("------ MasterController.saveStatusType called -----------");
		int result = masterDao.saveStatusType(vst);
		return result;
	}
	@RequestMapping(value="update_status_type",method= {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody int updateStatusType(@RequestBody vcl_status_type vst)
	{
		logger.info("------ MasterController.updateHouseType called -----------");
		int result = masterDao.updateStatusType(vst);
		return result;
	}
	@RequestMapping(value="list_of_status_types",method= {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody List<vcl_status_type> listOfStatusTypes()
	{
		logger.info("------ MasterController.listOfStatusTypes called -----------");
		List<vcl_status_type> allStatusTypes = masterDao.getListOfStatusTypes();
		return allStatusTypes;
	}
	@RequestMapping(value="delete_status_type",method= {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody int deleteStatusType(@RequestBody int vstId)
	{
		logger.info("------ MasterController.deleteHouseType called -----------");
		int result = masterDao.deleteStatusTypeById(vstId);
		return result;
	}
	/* ======================== Status Type Controller Ends ========================= */
	/* ======================== Status Controller Starts ========================= */
	@RequestMapping(value="check_unique_status_name",method= {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody boolean checkUniqueStatusName(@RequestBody vcl_status vs)
	{
		logger.info("------ MasterController.checkUniqueStatusName called -----------");
		boolean status = masterDao.checkUniqueStatusName(vs);
		return status;
	}
	@RequestMapping(value="save_status",method= {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody int saveStatus(@RequestBody vcl_status vs)
	{
		logger.info("------ MasterController.saveStatusType called -----------");
		int result = masterDao.saveStatus(vs);
		return result;
	}
	@RequestMapping(value="update_status",method= {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody int updateStatus(@RequestBody vcl_status vs)
	{
		logger.info("------ MasterController.updateStatus called -----------");
		int result = masterDao.updateStatus(vs);
		return result;
	}
	@RequestMapping(value="list_of_status",method= {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody List<vcl_status> listOfStatus()
	{
		logger.info("------ MasterController.listOfStatusTypes called -----------");
		List<vcl_status> allStatus = masterDao.getListOfStatus();
		return allStatus;
	}
	@RequestMapping(value="delete_status",method= {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody int deleteStatus(@RequestBody int vsId)
	{
		logger.info("------ MasterController.deleteHouse called -----------");
		int result = masterDao.deleteStatusById(vsId);
		return result;
	}
	/* ======================== Status Type Controller Ends ========================= */
	/* ======================== Relationship Controller Starts ================= */
	@RequestMapping(value="check_unique_relationship_type_name", method= {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody boolean checkUniqueRelationshipTypeName(@RequestBody vcl_relationship_type rel)
	{
		logger.info("------ check_unique_relation_type_name called -----------");
		boolean status = masterDao.checkForUniqueRelationhipTypeName(rel);
		return status;
	}
	@RequestMapping(value="save_relationship_type",method= {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody int saveRelationship(@RequestBody vcl_relationship_type rel)
	{
		logger.info("------ save_relationship called -----------");
		int result = masterDao.saveRelationshipType(rel);
		return result;
	}
	@RequestMapping(value="update_relationship_type",method= {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody int updateRelationship(@RequestBody vcl_relationship_type rel)
	{
		logger.info("------ update_relationship called -----------");
		int result = masterDao.updateRelationshipType(rel);
		return result;
	}
	@RequestMapping(value="delete_relationship_type",method= {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody int deleteRelationship(@RequestBody int relation_type_id)
	{
		logger.info("------ delete_relationship called -----------");
		int result = masterDao.deleteRelationTypeById(relation_type_id);
		return result;
	}
	@RequestMapping(value="list_of_relationship_types",method= {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody List<vcl_relationship_type> listOfRelationships()
	{
		logger.info("------ list_of_relationships called -----------");
		List<vcl_relationship_type> allRelationships = masterDao.getAllRelationshipTypes();
		return allRelationships;
	}
	/* ======================== Relationship Controller Ends =================== */
	/* ======================== Contact Type Controller Starts ================= */
	@RequestMapping(value="check_unique_contact_type_name", method= {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody boolean checkUniqueContactTypeName(@RequestBody vcl_contact_type ct)
	{
		logger.info("------ check_unique_contact_type_name called -----------");
		boolean status = masterDao.checkForUniqueContactTypeName(ct);
		return status;
	}
	@RequestMapping(value="save_contact_type",method= {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody int saveContactType(@RequestBody vcl_contact_type ct)
	{
		logger.info("------ save_contact_type called -----------");
		int result = masterDao.saveContactType(ct);
		return result;
	}
	@RequestMapping(value="update_contact_type",method= {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody int updateContactType(@RequestBody vcl_contact_type ct)
	{
		logger.info("------ update_relationship called -----------");
		int result = masterDao.updateContactType(ct);
		return result;
	}
	@RequestMapping(value="delete_contact_type",method= {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody int deleteContactType(@RequestBody int ctId)
	{
		logger.info("------ delete_relationship called -----------");
		int result = masterDao.deleteContactTypeById(ctId);
		return result;
	}
	@RequestMapping(value="list_of_contact_types",method= {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody List<vcl_contact_type> listOfContactTypes()
	{
		logger.info("------ list_of_contact_types called -----------");
		List<vcl_contact_type> allContactTypes = masterDao.getAllContactTypes();
		return allContactTypes;
	}
	/* ======================== Contact Type Controller Ends =================== */
	/* ======================== Cluster Controller Starts ================= */
	@RequestMapping(value="check_unique_cluster_name", method= {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody boolean checkUniqueClusterName(@RequestBody vcl_cluster cluster)
	{
		logger.info("------ check_unique_cluster_type_name called -----------");
		boolean status = masterDao.checkForUniqueClusterName(cluster);
		return status;
	}
	@RequestMapping(value="save_cluster",method= {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody int saveCluster(@RequestBody vcl_cluster cluster)
	{
		logger.info("------ save_cluster called -----------");
		int result = masterDao.saveCluster(cluster);
		return result;
	}
	@RequestMapping(value="update_cluster",method= {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody int updateCluster(@RequestBody vcl_cluster cluster)
	{
		logger.info("------ update_cluster called -----------");
		int result = masterDao.updateCluster(cluster);
		return result;
	}
	@RequestMapping(value="delete_cluster",method= {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody int deleteCluster(@RequestBody int clusterId)
	{
		logger.info("------ delete_cluster called -----------");
		int result = masterDao.deleteClusterById(clusterId);
		return result;
	}
	@RequestMapping(value="list_of_clusters",method= {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody List<vcl_cluster> listOfClusters()
	{
		logger.info("------ list_of_clusters called -----------");
		List<vcl_cluster> allClusters = masterDao.getAllClusters();
		return allClusters;
	}
	/* ======================== Cluster Controller Ends =================== */
	/* ======================== Employee Role Controller Ends =================== */
	@RequestMapping(value="check_unique_employee_role_name",method= {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody boolean checkUniqueEmployeeRoleName(@RequestBody vcl_employee_role employee)
	{
		logger.info("------ MasterController.checkUniqueEmployeeRoleName called -----------");
		boolean status = masterDao.checkUniqueEmployeeRoleName(employee);
		return status;
	}
	@RequestMapping(value="save_employee_role",method= {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody int saveEmployeeRole(@RequestBody vcl_employee_role employee)
	{
		logger.info("------ MasterController.saveEmployeeRole called -----------");
		int result = masterDao.saveEmployeeRole(employee);
		return result;
	}
	@RequestMapping(value="update_employee_role",method= {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody int updateEmployeeRole(@RequestBody vcl_employee_role employee)
	{
		logger.info("------ MasterController.updateEmployeeRole called -----------");
		int result = masterDao.updateEmployeeRole(employee);
		return result;
	}
	@RequestMapping(value="list_of_employee_roles1",method= {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody List<vcl_employee_role> listOfEmployeeRoles()
	{
		logger.info("------ MasterController.listOfEmployeeRoles called -----------");
		List<vcl_employee_role> allEmployeeRoles = masterDao.getListOfEmployeeRoles();
		return allEmployeeRoles;
	}
	@RequestMapping(value="delete_employee_role",method= {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody int deleteEmployeeRole(@RequestBody int employeeId)
	{
		logger.info("------ MasterController.deleteEmplooyeeRole called -----------");
		int result = masterDao.deleteEmployeeRolesById(employeeId);
		return result;
	}
	/* ======================== Employee Role Controller Ends =================== */
	/* ======================== Employee Controller Starts =================== */
	@RequestMapping(value="check_unique_emp_first_name",method= {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody boolean checkUniqueEmpFirstName(@RequestBody vcl_employee employee)
	{
		logger.info("------ MasterController.checkUniqueEmpFirstName called -----------");
		boolean status = masterDao.checkUniqueEmpFirstName(employee);
				
		return status;
	}
	@RequestMapping(value="save_employee",method= {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody int saveEmployee(@RequestBody vcl_employee employee)
	{
		logger.info("------ MasterController.saveEmployee called -----------");
		int result = masterDao.saveEmployee(employee);
		return result;
	}
	@RequestMapping(value="update_employee",method= {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody int updateEmployee(@RequestBody vcl_employee employee)
	{
		logger.info("------ MasterController.updateEmployee called -----------");
		int result = masterDao.updateEmployee(employee);
		return result;
	}
	@RequestMapping(value="list_of_employee1",method= {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody List<vcl_employee> listOfEmployee()
	{
		logger.info("------ MasterController.listOfEmployee called -----------");
		List<vcl_employee> allEmployee = masterDao.getListOfEmployee();
		return allEmployee;
	}
	@RequestMapping(value="delete_employee",method= {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody int deleteEmployee(@RequestBody int employeeId)
	{
		logger.info("------ MasterController.deleteEmplooyee called -----------");
		int result = masterDao.deleteEmployeeById(employeeId);
		return result;
	}
	/* ======================== Employee Controller Ends =================== */
	/* ======================== Organisation Cluster Controller Ends =================== */
	@RequestMapping(value="check_unique_org_cluster_name", method= {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody boolean checkForUniqueOrganisationClusterName(@RequestBody vcl_organisation_cluster cluster)
	{
		logger.info("------ check_unique_org_cluster__name called -----------");
		boolean status = masterDao.checkForUniqueOrganisationClusterName(cluster);
		return status;
	}
	@RequestMapping(value="save_org_cluster",method= {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody int saveOrganisationCluster(@RequestBody vcl_organisation_cluster cluster)
	{
		logger.info("------ save_organisation_cluster called -----------");
		int result = masterDao.saveOrgCluster(cluster);
		return result;
	}
	@RequestMapping(value="update_organisation_cluster",method= {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody int updateOrgCluster(@RequestBody vcl_organisation_cluster cluster)
	{
		logger.info("------ update_organisation_cluster called -----------");
		int result = masterDao.updateOrgCluster(cluster);
		return result;
	}
	@RequestMapping(value="delete_org_cluster",method= {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody int deleteOrgCluster(@RequestBody int clusterId)
	{
		logger.info("------ delete_org_cluster called -----------");
		int result = masterDao.deleteOrgClusterById(clusterId);
		return result;
	}
	@RequestMapping(value="list_of_organisation_clusters",method= {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody List<vcl_organisation_cluster> showListOfOrganisationClusters()
	{
		logger.info("------ list_of_organisation_clusters called -----------");
		List<vcl_organisation_cluster> allClusters = masterDao. getAllOrganisationClusters();
		return  allClusters;
	}
	/* ======================== Organisation Cluster Controller Ends =================== */
	/* ======================== Zone Code Starts ================== */
	@RequestMapping(value="check_unique_zone_name",method= {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody boolean check_unique_zone_name(@RequestBody vcl_zone zone )
	{
		logger.info("------ check_unique_zone_code called -----------");
		boolean status = masterDao.check_unique_zone_name ( zone );
		return status;
	}
	@RequestMapping(value="save_zone",method= {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody int save_zone(@RequestBody vcl_zone zone)
	{
		logger.info("------ save_zone called -----------");
		int result = masterDao.insert(zone);
		return result;
	}
	@RequestMapping(value="update_zone",method= {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody int update_zone(@RequestBody vcl_zone zone)
	{
		logger.info("------ update_zone called -----------");
		int result = masterDao.update(zone);
		return result;
	}
	@RequestMapping(value="list_of_zones",method= {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody List<vcl_zone> list_of_zones()
	{
		logger.info("------ list_of_zones called -----------");
		List<vcl_zone> allZones = masterDao.list_of_zones();
		return allZones;
	}
	@RequestMapping(value="delete_zone",method= {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody int delete_zone(@RequestBody int zone_id)
	{
		logger.info("------ delete_zone called -----------");
		System.out.println("*********111111111111***************"+zone_id);
		int result = masterDao.delete_zone_by_id(zone_id);
		return result;
	}
	/* ======================== Zone Code Ends ================== */
}
