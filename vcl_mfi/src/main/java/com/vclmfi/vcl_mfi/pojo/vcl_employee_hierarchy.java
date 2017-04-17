package com.vclmfi.vcl_mfi.pojo;

public class vcl_employee_hierarchy {
		
		private int emp_hierarchy_id;
		private int emp_id;
		private int emp_role_id;
		private int parent_emp_id;
		private int level_from_parent;
		private String hierarchy_start_date;
		private String hierarchy_end_date;
		
		public vcl_employee_hierarchy() {
			super();
		}

		public int getEmp_hierarchy_id() {
			return emp_hierarchy_id;
		}

		public void setEmp_hierarchy_id(int emp_hierarchy_id) {
			this.emp_hierarchy_id = emp_hierarchy_id;
		}

		public int getEmp_id() {
			return emp_id;
		}

		public void setEmp_id(int emp_id) {
			this.emp_id = emp_id;
		}

		public int getEmp_role_id() {
			return emp_role_id;
		}

		public void setEmp_role_id(int emp_role_id) {
			this.emp_role_id = emp_role_id;
		}

		public int getParent_emp_id() {
			return parent_emp_id;
		}

		public void setParent_emp_id(int parent_emp_id) {
			this.parent_emp_id = parent_emp_id;
		}

		public int getLevel_from_parent() {
			return level_from_parent;
		}

		public void setLevel_from_parent(int level_from_parent) {
			this.level_from_parent = level_from_parent;
		}

		public String getHierarchy_start_date() {
			return hierarchy_start_date;
		}

		public void setHierarchy_start_date(String hierarchy_start_date) {
			this.hierarchy_start_date = hierarchy_start_date;
		}

		public String getHierarchy_end_date() {
			return hierarchy_end_date;
		}

		public void setHierarchy_end_date(String hierarchy_end_date) {
			this.hierarchy_end_date = hierarchy_end_date;
		}
}
