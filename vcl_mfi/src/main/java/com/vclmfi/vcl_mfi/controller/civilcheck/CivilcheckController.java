package com.vclmfi.vcl_mfi.controller.civilcheck;

import java.math.BigInteger;
import java.security.Principal;
import java.util.ArrayList;
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

import com.vclmfi.vcl_mfi.model.CivilcheckModel;
import com.vclmfi.vcl_mfi.model.join.civilcheck.Civilcheckfinal;
import com.vclmfi.vcl_mfi.model.join.civilcheck.Civilcheckone;
import com.vclmfi.vcl_mfi.model.join.civilcheck.vcl_credit_check_person;
import com.vclmfi.vcl_mfi.pojo.vcl_employee;
import com.vclmfi.vcl_mfi.pojo.vcl_organisation_branch;

@Controller
public class CivilcheckController {

	private static final Logger logger = LoggerFactory.getLogger(CivilcheckController.class);

	@Autowired
	CivilcheckModel mm;
	@RequestMapping(value = "/cibil_check", method = { RequestMethod.GET, RequestMethod.POST })

	public ModelAndView cibil_check(
			@RequestParam(value = "branch_id", defaultValue = "1", required = false) String branch_id, Principal p) {
		logger.info("------enter cibil_check page -----------");
		ModelAndView cl = new ModelAndView();
		cl.setViewName("civil_check/civil_check");
		cl.addObject("branch_list", mm.list_of_branch());
		cl.addObject("username", p.getName());

		return cl;
	}

	@RequestMapping(value = "get_re_list_per_branch", method = { RequestMethod.GET, RequestMethod.POST })

	public @ResponseBody List<Civilcheckfinal> get_datass(@RequestBody vcl_organisation_branch t) {

		logger.info("------enter cibil_check get_re_list_per_branch page -----------");

		List<vcl_employee> lid = mm.get_total_person_count_id_name(t.getOrg_brnach_id());
		List<Civilcheckone> l1 = mm.get_total_person_count(1, t.getOrg_brnach_id());
		List<Civilcheckone> l2 = mm.get_total_person_count(2, t.getOrg_brnach_id());
		List<Civilcheckone> l3 = mm.get_total_person_count(3, t.getOrg_brnach_id());

		List<Civilcheckfinal> finall = new ArrayList<Civilcheckfinal>();

		for (vcl_employee ve : lid) {
			Civilcheckfinal check_final = null;
			int e_id = ve.getEmployee_id();
			String name = ve.getEmp_first_name();
			name = name + " " + ve.getEmp_mid_name();
			name = name + " " + ve.getEmp_last_name();
			BigInteger approved = null;
			BigInteger pending = null;
			BigInteger rejected = null;
			for (Civilcheckone Civilcheckone : l1) {
				if (ve.getEmployee_id() == Civilcheckone.getEmployee_id()) {
					approved = Civilcheckone.getApproved();
				}
			}
			for (Civilcheckone civil_check_one2 : l2) {
				if (ve.getEmployee_id() == civil_check_one2.getEmployee_id()) {
					pending = civil_check_one2.getApproved();

				}

			}
			for (Civilcheckone civil_check_one3 : l3) {
				if (ve.getEmployee_id() == civil_check_one3.getEmployee_id()) {
					rejected = civil_check_one3.getApproved();

				}

			}

			check_final = new Civilcheckfinal(e_id, name, approved, pending, rejected);

			finall.add(check_final);
		}

		return finall;
	}

	@RequestMapping(value = "get_person_list", method = { RequestMethod.GET, RequestMethod.POST })

	public @ResponseBody List<vcl_credit_check_person> get_customer_list(@RequestBody Person p) {
		//
		logger.info("------enter cibil_check get_customer_list page -----------");
		List<vcl_credit_check_person> list = mm.get_person_list(p.getRe_id(), p.getStatus_type(), p.getOrg_brnach_id());

		return list;
	}

	@RequestMapping(value = "/change_status", method = { RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody int change_statuss(@RequestBody ChangStatus cs, Principal p) {

		int update = 1;
		if (cs.getStatus() != 0) {
			logger.info("------enter cibil_check change_status page -----------");
			update = mm.person_status_change(cs.getStatus(), cs.getPerson_id(), mm.get_user_id(p.getName()));
		}

		return update;
	}

}
