package com.vclmfi.vcl_mfi;

import java.security.Principal;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import com.vclmfi.vcl_mfi.model.*;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@Autowired
	CivilcheckModel mm;

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView login(@RequestParam(value = "error", required = false) String error,
			@RequestParam(value = "logout", required = false) String logout) {
		logger.info("------enter login page -----------");

		ModelAndView login = new ModelAndView();
		login.setViewName("login");
		if (error != null) {
			login.addObject("error", "Invalid username and password!");
		}

		if (logout != null) {
			login.addObject("msg", "You've been logged out successfully.");
		}

		return login;

	}

	@RequestMapping(value = "/dashboard", method = { RequestMethod.GET, RequestMethod.POST })

	public ModelAndView home(Principal p, @RequestParam(required = false) String branch_id) {
		logger.info("------enter home page -----------");

		ModelAndView h = new ModelAndView();
		h.setViewName("dashboard");
		h.addObject("username", p.getName());
		h.addObject("active", "dd");
		return h;
	}

	/*
	 * @RequestMapping(value="dashboard",method=RequestMethod.GET) public
	 * ModelAndView dashboard() {
	 * logger.info("------enter dashboard page -----------"); ModelAndView
	 * db=new ModelAndView(); db.setViewName("dashboard"); return db; }
	 */

	/*
	 * @RequestMapping(value="/cibil_check",method=
	 * {RequestMethod.GET,RequestMethod.POST})
	 * 
	 * public ModelAndView cibil_check(@RequestParam(value = "branch_id",
	 * defaultValue = "1",required = false) String branch_id) {
	 * logger.info("------enter cibil_check page -----------"); ModelAndView cl
	 * = new ModelAndView(); cl.setViewName("civil_check");
	 * cl.addObject("branch_list",mm.list_of_branch()); cl.addObject("emp_list",
	 * mm.get_employee_list(Integer.parseInt(branch_id)));
	 * 
	 * 
	 * cl.addObject("id", branch_id);
	 * 
	 * 
	 * cl.addObject("p_list",mm.get_person_list(Integer.parseInt(branch_id),
	 * 3)); System.out.println();
	 * 
	 * 
	 * 
	 * return cl; }
	 * 
	 * @RequestMapping(value="get_branch_list",method=
	 * {RequestMethod.GET,RequestMethod.POST})
	 * 
	 * public @ResponseBody List<vcl_employee> get_datass(@RequestBody test t) {
	 * 
	 * 
	 * List<vcl_employee> list=mm.get_employee_list(t.getCenter_id());
	 * 
	 * 
	 * return list; }
	 */
	// @RequestMapping(value="get_customer_list",method=
	// {RequestMethod.GET,RequestMethod.POST})
	/*
	 * @RequestMapping(value="get_customer_list",method= RequestMethod.GET)
	 * public @ResponseBody List<vcl_credit_check_person> get_customer_list() {
	 * 
	 * 
	 * List<vcl_credit_check_person> list=mm.get_person_list(1, 3);
	 * 
	 * 
	 * return list; }
	 */

}
