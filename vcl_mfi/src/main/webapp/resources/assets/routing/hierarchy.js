var app=angular.module("HierarchyApp",[]);
app.controller("HierarchyCtrl",function($scope,$http){
	
	/* ======================== Designation Code Starts ========================= */
	$scope.getAllDropdownData=function()
	{
		console.log();
		if ($scope.hierarchy == 'Designation'){
			console.log("-------------- in getAllDesignation -------------------");
			$http.get('get_all_designation')
			  .then(function(responses)
				{
				  console.log(responses.data);
				  $scope.allDesignation = responses.data;
				  $scope.getAllDesignationHierarchy();
	    		  }
			  , function (responses)
			  {
			 
			  }); 		
		}
		if ($scope.hierarchy == 'Assignment'){
			console.log("-------------- in list_of_employee_roles -------------------");
			  $http.get('list_of_employee_roles')
			  .then(function(responses)
				{
				  console.log(responses.data);
				  $scope.listOfEmployeeRolesForDropdown = responses.data;
				}
			  , function (responses)
			  {
			 
			  }); 
			  $http.get('list_of_employees_for_config')
			  .then(function(responses)
				{
				  console.log(responses.data);
				  $scope.allEmployeeList = responses.data;
				}
			  , function (responses)
			  {
			 
			  });
		}
		
		
	};
	$scope.allDesignationHierarchy = [];
	$scope.getAllDesignationHierarchy=function()
	{
		console.log("-------------- in getAllDesignation -------------------");
		$http.get('get_all_designation_hierarchy')
		  .then(function(responses)
			{
			  console.log(responses.data);

			  angular.forEach(responses.data, function(obj) {
				  console.log(obj);
				  console.log(obj.designationId);
				  
				  var designationObj = {
						  designationId:obj.designationId
				  };
				  console.log(designationObj);
				  
				  $http.post('get_designation_name_by_id', designationObj)
		 		  .then(function(responses1){
		     			var degRow = {
		     					hierarchyId:obj.hierarchyId,
		     					designationId:obj.designationId,
		     					designationName:responses1.data[0],
		     					index:obj.index
		     			};
		     			$scope.allDesignationHierarchy.push(degRow);
		  		  }
		 		  , function (responses1)
		 		  {
		 		  
		 		  }); 
				  
				});
			  
    		  }
		  , function (responses)
		  {
		 
		  }); 
	};
	$scope.designation = [];
	$scope.saveDesignationHierarchy=function()
	{
	  console.log("***** in saveDesignation *******");
	  var hierarchyId = document.getElementsByName("hierarchyId");
	  var designationId = document.getElementsByName("designationId");
	  var index = document.getElementsByName("index");
	  var i = 0;
		for(i=0;i<designationId.length;i++)
		{
			var designationData= {
					hierarchyId:hierarchyId[i].value,
					designationId:designationId[i].value,
					index:index[i].value
				  };
			if(designationId != '' || index != '')
				$scope.designation.push(designationData);
		}
		console.log($scope.designation);
		
		$http.post('save_designation_hierarchy', $scope.designation)
 		  .then(function(responses){
     			  if( responses.data == 1 ){
     				$scope.designationSaveStatus="Designation added Successfully";
     				console.log(responses.data);
     				$scope.getAllDesignationHierarchy();
     				
     				 /* var hierarchyId = document.getElementsByName("hierarchyId");
     				  var designationId = document.getElementsByName("designationId");
     				  var index = document.getElementsByName("index");
     				  var i = 0;
     					for(i=0;i<designationId.length;i++)
     					{
     						
     					}*/
     				
     			  }
     			  else{
     				$scope.designationSaveStatus="Designation not added";
     				console.log(responses.data);
     			  }  
  		  }
 		  , function (responses)
 		  {
 		  
 		  });   
	  
	};
	$scope.ngAddRow=function(hierarchyId,designationId,index)
	{
		console.log("Add row from controller");
		console.log(hierarchyId);
		console.log(designationId);
		console.log(index);
		insertRowForEdit(hierarchyId,designationId,index);
	};
	/* ======================== Assignment Controller Starts ========================= */
	$scope.roles = '';
	$scope.updateEmpRoleTaxtToCompare=function()
	{
		console.log("updateEmpRoleTaxtToCompare from heirarchy.js");
		
		$scope.roleText = $("#empRole option:selected").html();
		
		console.log($scope.roleText);
		
		$scope.roles.empRoleText = $scope.roles.emp_role_id;
		$scope.loadBranchesForBm();
	};
	$scope.loadBranchesForBm=function(){
		
		var empRoleText = $("#empRole option:selected").html();
		  console.log(empRoleText);
		  if( empRoleText == 'BM' || empRoleText == 'RE'){
			  $http.get('list_of_branches_for_config')
			  .then(function(responses)
				{
				  console.log(responses.data);
				  $scope.listOfBranches = responses.data;
				}
			  , function (responses)
			  {
			 
			  });
		  }
		  else if( empRoleText == 'AM' || empRoleText == 'SH'){
			  $http.get('list_of_states_for_config')
			  .then(function(responses)
				{
				  console.log(responses.data);
				  $scope.listOfStates = responses.data;
				}
			  , function (responses)
			  {
			 
			  });
		  }
		  else if( empRoleText == 'CH'){
			  $http.get('list_of_clusters_for_config')
			  .then(function(responses)
				{
				  console.log(responses.data);
				  $scope.listOfClusters = responses.data;
				}
			  , function (responses)
			  {
			 
			  });
		  }
	};
	$scope.assignment = {};
	$scope.loadBranchesOfStates=function(){
		console.log("------ loadBranchesOfStates ------");
		var stateId = $scope.assignment.am_state_id;
		  console.log(stateId);
		  $http.post('get_branches_of_state',stateId)
		  .then(function(responses)
			{
			  console.log(responses.data);
			  $scope.listOfBranchesOfState = responses.data;
			}
		  , function (responses)
		  {
		 
		  });
	};
	$scope.loadCentersOfBranch=function(){
		console.log("------ loadBranchesOfStates ------");
		var branchId = $scope.assignment.re_branch_id;
		  console.log(branchId);
		  $http.post('get_centers_of_branch',branchId)
		  .then(function(responses)
			{
			  console.log(responses.data);
			  $scope.listOfCentersOfBranch = responses.data;
			}
		  , function (responses)
		  {
		 
		  });
	};
	$scope.saveEmployeeRole=function(){
		console.log("------ saveEmployeeRole ------");
		
		var empRoleText = $("#empRole option:selected").html();
		
		if( empRoleText == 'RE'){
			var centerIdElements = document.getElementsByName("centers_center_id");
			
			var centersArray = [];
			var i = 0;
			for(i=0;i<centerIdElements.length;i++)
			{
				 if (centerIdElements[i].checked) {
					 centersArray.push(centerIdElements[i].value);
			     } 
			} 
			
			var roleDetail = {
					employee_hierarchy_id:$scope.assignment.employee_hierarchy_id,
					employee_id:$scope.assignment.employee_id,
					emp_role_id:$scope.assignment.emp_role_id,
					sh_state_id:$scope.assignment.sh_state_id,
					ch_cluster_id:$scope.assignment.ch_cluster_id,
					am_state_id:$scope.assignment.am_state_id,
					bm_branch_id:$scope.assignment.bm_branch_id,
					re_branch_id:$scope.assignment.re_branch_id,
					checked_center_id_array:centersArray
			};
			console.log(roleDetail);
			
			$http.post('update_emp_role_branch_center_for_re',roleDetail)
			  .then(function(responses)
				{
				  $scope.assignmentUpdateStatus = "Updated Successfully.";
				}
			  , function (responses)
			  {
				  $scope.assignmentUpdateStatus = "Not updated.";
			  });
		 }
		else if( empRoleText == 'BM'){
			
			var roleDetail = {
					employee_hierarchy_id:$scope.assignment.employee_hierarchy_id,
					employee_id:$scope.assignment.employee_id,
					emp_role_id:$scope.assignment.emp_role_id,
					sh_state_id:$scope.assignment.sh_state_id,
					ch_cluster_id:$scope.assignment.ch_cluster_id,
					am_state_id:$scope.assignment.am_state_id,
					bm_branch_id:$scope.assignment.bm_branch_id,
					re_branch_id:$scope.assignment.re_branch_id,
					checked_center_id:checkedCenterId
			};
			
			console.log(roleDetail);
			
			$http.post('update_emp_role_branch_for_bm',roleDetail)
			  .then(function(responses)
				{
				  $scope.assignmentUpdateStatus = "Updated Successfully.";
				}
			  , function (responses)
			  {
				  $scope.assignmentUpdateStatus = "Not updated.";
			  });
		 }
		else if( empRoleText == 'AM'){
			
			var branchIdElements = document.getElementsByName("branches_branch_id");
			var branchesArray = [];
			var i = 0;
			for(i=0;i<branchIdElements.length;i++)
			{
				 if (branchIdElements[i].checked) {
					 branchesArray.push(branchIdElements[i].value);
			     } 
			} 
			console.log(branchesArray);
			var roleDetail = {
					employee_hierarchy_id:$scope.assignment.employee_hierarchy_id,
					employee_id:$scope.assignment.employee_id,
					emp_role_id:$scope.assignment.emp_role_id,
					sh_state_id:$scope.assignment.sh_state_id,
					ch_cluster_id:$scope.assignment.ch_cluster_id,
					am_state_id:$scope.assignment.am_state_id,
					bm_branch_id:$scope.assignment.bm_branch_id,
					re_branch_id:$scope.assignment.re_branch_id,
					checked_center_id:checkedCenterId,
					checked_branch_id_array:branchesArray
			};
			
			console.log(roleDetail);
			
			$http.post('update_emp_role_branch_for_am',roleDetail)
			  .then(function(responses)
				{
				  $scope.assignmentUpdateStatus = "Updated Successfully.";
				}
			  , function (responses)
			  {
				  $scope.assignmentUpdateStatus = "Not updated.";
			  });
		 }
		else if( empRoleText == 'CH'){
			
			var roleDetail = {
					employee_hierarchy_id:$scope.assignment.employee_hierarchy_id,
					employee_id:$scope.assignment.employee_id,
					emp_role_id:$scope.assignment.emp_role_id,
					sh_state_id:$scope.assignment.sh_state_id,
					ch_cluster_id:$scope.assignment.ch_cluster_id,
					am_state_id:$scope.assignment.am_state_id,
					bm_branch_id:$scope.assignment.bm_branch_id,
					re_branch_id:$scope.assignment.re_branch_id
			};
			
			console.log(roleDetail);
			
			$http.post('update_emp_role_cluster_for_ch',roleDetail)
			  .then(function(responses)
				{
				  $scope.assignmentUpdateStatus = "Updated Successfully.";
				}
			  , function (responses)
			  {
				  $scope.assignmentUpdateStatus = "Not updated.";
			  });
		 }
		else if( empRoleText == 'SH'){
			
			var roleDetail = {
					employee_hierarchy_id:$scope.assignment.employee_hierarchy_id,
					employee_id:$scope.assignment.employee_id,
					emp_role_id:$scope.assignment.emp_role_id,
					sh_state_id:$scope.assignment.sh_state_id,
					ch_cluster_id:$scope.assignment.ch_cluster_id,
					am_state_id:$scope.assignment.am_state_id,
					bm_branch_id:$scope.assignment.bm_branch_id,
					re_branch_id:$scope.assignment.re_branch_id
			};
			
			console.log(roleDetail);
			
			$http.post('update_emp_role_for_sh',roleDetail)
			  .then(function(responses)
				{
				  $scope.assignmentUpdateStatus = "Updated Successfully.";
				}
			  , function (responses)
			  {
				  $scope.assignmentUpdateStatus = "Not updated.";
			  });
		 }
	};
	/* ======================== Assignment Controller Ends ========================= */
});
