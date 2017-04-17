//var shortCodes=document.getElementById("shortCode");

    var app=angular.module("masterApp",[]);
    app.controller("masterCtrl",function($scope,$http){
    	
    	/*$scope.submitStateForm = function()
        {
            // check to make sure the form is completely valid
            if ($scope.userForm.$valid) {
                alert('our form is amazing');
            }

        };*/
    	/* ======================== Multipurpose functions Starts ========================= */
    	$scope.populateStateAndDistrictData=function()
    	{
    			console.log("-------------- in populateStateAndDistrictData -------------------");
    			/*-------------------List of States ------------------*/
	   			$http.get('list_of_states')
	    		  .then(function(responses)
	    			{
	    			  console.log(responses.data);
	    			  $scope.allStatesForDropdown = responses.data;
		    		}
	    		  , function (responses)
	    		  {
	    		 
	    		  }); 
	   			/*-------------------List of Districts ------------------*/
   				$http.get('list_of_districts')
	  		  .then(function(responses)
	  			{
	  			  console.log(responses.data);
	  			  $scope.allDistrictsForDropdown = responses.data;
		    	}
	  		  , function (responses)
	  		  {
	  		 
	  		  });
			/*-------------------List of Roles ------------------*/
 			  $http.get('list_of_roles')
    		  .then(function(responses)
    			{
    			  console.log(responses.data);
    			  $scope.listOfRolesForDropdown = responses.data;
	    		}
    		  , function (responses)
    		  {
    		 
    		  }); 
 			 /*-------------------List of status ------------------*/
   			  $http.get('list_of_status_types')
      		  .then(function(responses)
      			{
      			  console.log(responses.data);
      			  $scope.listOfStatusTypesForDropdown = responses.data;
  	    		}
      		  , function (responses)
      		  {
      		 
      		  }); 
    	};
    	/* ======================== Multipurpose functions Ends ========================= */
    	
    	/* ======================== State Controller Starts ========================= */
    	$scope.state = {};
    	$scope.save_state=function()
    	{
    	  var stateData= {
    		  state_name:$scope.state.state_name.toUpperCase(),
    		  state_short_cd:$scope.state.state_short_cd.toUpperCase()
    	    } ;
    	  
    	  $http.post('check_unique_state_code', stateData)
   		  .then(function(responses){
       			  if( responses.data){
       				$scope.stateUniqueOrNot="State already exists.";
       				console.log(responses.data);
       			  }
       			  else{
       				$scope.stateUniqueOrNot="";
	       				console.log(responses.data);
	       				$http.post('save_state', stateData)
	           		  .then(function(responses){
	    	       			  if( responses.data == 1 ){
	    	       				$scope.stateSaveStatus="State added Successfully";
	    	       				console.log(responses.data);
	    	       				$scope.showListOfStates();
	    	       			  }
	    	       			  else{
	    	       				$scope.stateSaveStatus="State not added";
	    	       				console.log(responses.data);
	    	       			  }  
	            		  }
	           		  , function (responses)
	           		  {
	           		  
	           		  });   
       			  }  
    		  }
   		  , function (responses)
   		  {
   		  
   		  }); 
    	};
    	$scope.showListOfStates=function()
    	{
    		console.log("-------------- in list_of_states -------------------");
   			$http.get('list_of_states')
    		  .then(function(responses)
    			{
    			  console.log(responses.data);
    			  $scope.listOfStates = responses.data;
	    		  }
    		  , function (responses)
    		  {
    		 
    		  }); 
    	};
    	$scope.delete_state=function(state_id,state_name)
    	{
    		console.log("******  Deleting the state  *********");
    		console.log("State_id = "+state_id);
    		if (confirm("Are you sure you want to delete the state "+state_name+"?"))
            {
    			$http.post('delete_state', state_id)
         		  .then(function(responses){
  	       			  if( responses.data == 1 ){
  	       				$scope.stateDeleteStatus="State deleted Successfully";
  	       				console.log(responses.data);
  	       				$scope.showListOfStates();
  	       			  }
  	       			  else{
  	       				$scope.stateDeleteStatus="State not deleted";
  	       				console.log(responses.data);
  	       			  }  
          		  }
         		  , function (responses)
         		  {
         		  
         		  }); 
            }
    	};
    	$scope.reset_state=function(id,code,name)
    	{
    		$scope.stateUniqueOrNot = '';
    		$scope.stateSaveStatus = '';
    		$scope.stateDeleteStatus = '';
    					
    		$scope.state.state_id = '';
    		$scope.state.state_short_cd = '';
    		$scope.state.state_name = '';
    		$scope.isViewStateDetail = 'no';
    		$scope.stateUpdateStatus = "updated";
    	};
    	$scope.view_state=function(id,code,name)
    	{
    		$scope.state.state_id = id;
    		$scope.state.state_short_cd = code;
    		$scope.state.state_name = name;
    		
    		$scope.stateUniqueOrNot = '';
    		$scope.stateSaveStatus = '';
    		$scope.stateDeleteStatus = '';
    		$scope.isViewStateDetail = 'yes';
    		$scope.stateUpdateStatus = "updated";
    	};
    	$scope.edit_state=function(id,code,name)
    	{
    		console.log("-------------- in edit_state -------------------");
    		$scope.state.state_id = id;
    		$scope.state.state_short_cd = code;
    		$scope.state.state_name = name;
    		
    		$scope.stateUniqueOrNot = '';
    		$scope.stateSaveStatus = '';
    		$scope.stateDeleteStatus = '';
    		$scope.isViewStateDetail = 'no';
    		$scope.stateUpdateStatus = "update";
    	};
    	$scope.update_state=function()
    	{
    	  var stateData= {
    		  state_id:$scope.state.state_id,
    		  state_name:$scope.state.state_name.toUpperCase(),
    		  state_short_cd:$scope.state.state_short_cd.toUpperCase()
    	    } ;
    	  
    	  $http.post('update_state', stateData)
   		  .then(function(responses){
       			  if( responses.data == 1 ){
       				$scope.saveStatus="State updated Successfully";
       				console.log(responses.data);
       				$scope.showListOfStates();
       				$scope.stateUpdateStatus = "updated";
       			  }
       			  else{
       				$scope.saveStatus="State not updated";
       				console.log(responses.data);
       			  }  
    		  }
   		  , function (responses)
   		  {
   		  
   		  });   
    	};
    	
    	/* ======================== State Controller End ========================= */
    	/* ======================== District Controller Starts ========================= */
    	$scope.district = {};
    	$scope.saveDistrict=function()
    	{
    		var districtData= {
    				districtName:$scope.district.districtName.toUpperCase(),
    				districtShortCode:$scope.district.districtShortCode.toUpperCase(),
    				stateId:$scope.district.stateId
    	    } ;
    	   $http.post('check_unique_district_code', districtData)
   		  .then(function(responses){
       			  if( responses.data){
       				$scope.districtUniqueOrNot="District already exists.";
       				console.log(responses.data);
       			  }
       			  else{
       				   $scope.districtUniqueOrNot="";
	       				console.log(responses.data);
	       				$http.post('save_district', districtData)
	           		  .then(function(responses){
	    	       			  if( responses.data == 1 ){
	    	       				$scope.districtSaveStatus="District added Successfully"; 
	    	       				$scope.showListOfDistricts();
	    	       				console.log(responses.data);
	    	       				
	    	       				$scope.district.districtId = '';
	    	       	    		$scope.district.districtName = '';
	    	       				$scope.district.districtShortCode = '';
	    	       				$scope.district.stateId = '';
	    	       			  }
	    	       			  else{
	    	       				$scope.saveStatus="District not added";
	    	       				console.log(responses.data);
	    	       			  }  
	            		  }
	           		  , function (responses)
	           		  {
	           		  
	           		  });   
       			  }  
    		  }
   		  , function (responses)
   		  {
   		  
   		  }); 
    	}; 
    	 $scope.showListOfDistricts=function()
    	{
    		console.log("-------------- in showListOfDistricts -------------------");
   			$http.get('list_of_districts')
    		  .then(function(responses)
    			{
    			  console.log(responses.data);
    			  $scope.listOfDistricts = responses.data;
	    		  }
    		  , function (responses)
    		  {
    		 
    		  }); 
    	}; 
    	
    	
    	
    	$scope.deleteDistrict=function(districtId,districtName)
    	{
    		console.log("******  Deleting the District *********");
    		console.log("districtId = "+districtId);
    		if (confirm("Are you sure you want to delete the District "+districtName+"?"))
            {
    			$http.post('delete_district', districtId)
         		  .then(function(responses){
  	       			  if( responses.data == 1 ){
  	       				$scope.districtDeleteStatus="District deleted Successfully";
  	       				console.log(responses.data);
  	       			    $scope.showListOfDistricts();
  	       			  }
  	       			  else{
  	       				$scope.districtDeleteStatus="District not deleted";
  	       				console.log(responses.data);
  	       			  }  
          		  }
         		  , function (responses)
         		  {
         		  
         		  }); 
            }
    	};
    	$scope.resetDistrict=function()
    	{
    		$scope.districtUniqueOrNot = '';
    		$scope.districtSaveStatus = '';
    		$scope.districtDeleteStatus = '';
    					
    		$scope.district.districtId = '';
    		$scope.district.districtName = '';
			$scope.district.districtShortCode = '';
			$scope.district.stateId = '';
    	};
    	$scope.viewDistrict=function(districtId,districtShortCode,districtName,stateId)
    	{
	    	$scope.district.districtId = districtId;
			$scope.district.districtName = districtName;
			$scope.district.districtShortCode = districtShortCode;
			$scope.district.stateId = stateId;
    		
    		$scope.districtUniqueOrNot = '';
    		$scope.districtSaveStatus = '';
    		$scope.districtDeleteStatus = '';
    	};
    	$scope.editDistrict=function(districtId,districtShortCode,districtName,stateId)
    	{
    		console.log("-------------- in editDistrict -------------------");
    		
    		$scope.district.districtId = districtId;
    		$scope.district.districtName = districtName;
			$scope.district.districtShortCode = districtShortCode;
			$scope.district.stateId = stateId;
			$scope.districtUpdateStatus = "update";
    	};
    	$scope.updateDistrict=function()
    	{
    		var districtData= {
    				districtId:$scope.district.districtId,
    				districtName:$scope.district.districtName.toUpperCase(),
    				districtShortCode:$scope.district.districtShortCode.toUpperCase(),
    				stateId:$scope.district.stateId
    	    } ;
    	  
    	  $http.post('update_district', districtData)
   		  .then(function(responses){
       			  if( responses.data == 1 ){
       				$scope.districtSaveStatus="District updated Successfully";
       				console.log(responses.data);
       				$scope.showListOfDistricts();
       				
       				$scope.district.districtId = '';
       	    		$scope.district.districtName = '';
       				$scope.district.districtShortCode = '';
       				$scope.district.stateId = '';
       				
       				$scope.districtUpdateStatus = "updated";
       			  }
       			  else{
       				$scope.districtSaveStatus="District not updated";
       				console.log(responses.data);
       			  }  
    		  }
   		  , function (responses)
   		  {
   		  
   		  });   
    	}; 
    	
    	/* ======================== State Controller End ========================= */
    	/* ======================== Branch Controller Starts ========================= */
    	$scope.branch = {};
    	$scope.saveBranch=function()
    	{
    	  var branchData= {
    			  branch_name:$scope.branch.branch_name,
    			  state_id:$scope.branch.state_id,
    			  district_id:$scope.branch.district_id,
    			  branch_pin:$scope.branch.branch_pin,
    			  branch_type:$scope.branch.branch_type,
    			  branch_mandal_municipal:$scope.branch.branch_mandal_municipal,
    			  branch_address:$scope.branch.branch_address,
    			  branch_phone:$scope.branch.branch_phone,
    			  branch_begin_dt:$scope.branch.branch_begin_dt,
    			  branch_coordinates_x:$scope.branch.branch_coordinates_x,
    			  branch_coordinates_y:$scope.branch.branch_coordinates_y
    	    } ;
    	  console.log(branchData);
    	  $http.post('check_unique_branch_name', branchData)
   		  .then(function(responses){
       			  if( responses.data){
       				$scope.branchUniqueOrNot="Branch already exists.";
       				console.log(responses.data);
       			  }
       			  else{
       				$scope.branchUniqueOrNot="";
	       			console.log(responses.data);
	       				
	       			$http.post('save_branch', branchData)
	           		  .then(function(responses){
	    	       			  if( responses.data == 1 ){
	    	       				$scope.branchSaveStatus="Branch added Successfully";
	    	       				console.log(responses.data);
	    	       				$scope.showListOfBranches();
	    	       			  }
	    	       			  else{
	    	       				$scope.branchSaveStatus="Branch not added";
	    	       				console.log(responses.data);
	    	       			  }  
	            		  }
	           		  , function (responses)
	           		  {
	           		  
	           		  });   
       			  }  
    		  }
   		  , function (responses)
   		  {
   		  
   		  }); 
    	};
    	$scope.showListOfBranches=function()
    	{
    		console.log("-------------- in showListOfClusters -------------------");
   			$http.get('list_of_branches')
    		  .then(function(responses)
    			{
    			  console.log(responses.data);
    			  $scope.listOfBranches = responses.data;
	    		  }
    		  , function (responses)
    		  {
    		 
    		  }); 
    	};
    	$scope.deleteBranch=function(branch_id,branch_name)
    	{
    		console.log("******  Deleting the branch *********");
    		console.log("branch_id = "+branch_id);
    		if (confirm("Are you sure you want to delete the branch "+branch_name+"?"))
            {
    			$http.post('delete_branch', branch_id)
         		  .then(function(responses){
  	       			  if( responses.data == 1 ){
  	       				$scope.branchDeleteStatus="Branch deleted Successfully";
  	       				console.log(responses.data);
  	       				$scope.showListOfBranches();
  	       			  }
  	       			  else{
  	       				$scope.branchDeleteStatus="Branch not deleted";
  	       				console.log(responses.data);
  	       			  }  
          		  }
         		  , function (responses)
         		  {
         		  
         		  }); 
            }
    	};
    	$scope.resetBranch=function(branch_id,branch_name,state_id,district_id,
    			branch_pin,branch_type,branch_mandan_municipal,branch_address,
    			branch_phone,branch_begin_dt,branch_coordinates_x,branch_coordinates_y)
    	{
    		  console.log("-------------- in resetBranch -------------------");
    		  $scope.branch.branch_id = '';
  		  	  $scope.branch.branch_name = '';
			  $scope.branch.state_id = '';
			  $scope.branch.district_id = '';
			  $scope.branch.branch_pin = '';
			  $scope.branch.branch_type = '';
			  $scope.branch.branch_mandal_municipal = '';
			  $scope.branch.branch_address = '';
			  $scope.branch.branch_phone = '';
			  $scope.branch.branch_begin_dt = '';
			  $scope.branch.branch_coordinates_x = '';
			  $scope.branch.branch_coordinates_y = '';
    		
			  $scope.branchSaveStatus='';
			  $scope.branchDeleteStatus='';
			  $scope.branchUpdateStatus="updated";
    	};
    	$scope.viewBranch=function(branch_id,branch_name,state_id,district_id,
    			branch_pin,branch_type,branch_mandan_municipal,branch_address,
    			branch_phone,branch_begin_dt,branch_coordinates_x,branch_coordinates_y)
    	{
    		console.log("-------------- in viewBranch -------------------");
    		  $scope.branch.branch_id = branch_id;
		  	  $scope.branch.branch_name = branch_name;
			  $scope.branch.state_id = state_id;
			  $scope.branch.district_id = district_id;
			  $scope.branch.branch_pin = branch_pin;
			  $scope.branch.branch_type = branch_type;
			  $scope.branch.branch_mandal_municipal = branch_mandal_municipal;
			  $scope.branch.branch_address = branch_address;
			  $scope.branch.branch_phone = branch_phone;
			  $scope.branch.branch_begin_dt = branch_begin_dt;
			  $scope.branch.branch_coordinates_x = branch_coordinates_x;
			  $scope.branch.branch_coordinates_y = branch_coordinates_y;
    		
    		  $scope.clusterSaveStatus='';
    		  $scope.clusterDeleteStatus='';
    		  $scope.clusterUpdateStatus="updated";
    	};
    	$scope.editBranch=function(branch_id,branch_name,state_id,district_id,
    			branch_pin,branch_type,branch_mandan_municipal,branch_address,
    			branch_phone,branch_begin_dt,branch_coordinates_x,branch_coordinates_y)
    	{
    		console.log("-------------- in editBranch -------------------");
    		  $scope.branch.branch_id = branch_id;
		  	  $scope.branch.branch_name = branch_name;
			  $scope.branch.state_id = state_id;
			  $scope.branch.district_id = district_id;
			  $scope.branch.branch_pin = branch_pin;
			  $scope.branch.branch_type = branch_type;
			  $scope.branch.branch_mandal_municipal = branch_mandal_municipal;
			  $scope.branch.branch_address = branch_address;
			  $scope.branch.branch_phone = branch_phone;
			  $scope.branch.branch_begin_dt = branch_begin_dt;
			  $scope.branch.branch_coordinates_x = branch_coordinates_x;
			  $scope.branch.branch_coordinates_y = branch_coordinates_y;
    		
    		$scope.branchSaveStatus='';
    		$scope.branchDeleteStatus='';
    		$scope.branchUpdateStatus="update";
    	};
    	$scope.updateBranch=function()
    	{
    		var branchData= {
      			  branch_id:$scope.branch.branch_id,
	    		  branch_name:$scope.branch.branch_name,
				  state_id:$scope.branch.state_id,
				  district_id:$scope.branch.district_id,
				  branch_pin:$scope.branch.branch_pin,
				  branch_type:$scope.branch.branch_type,
				  branch_mandal_municipal:$scope.branch.branch_mandal_municipal,
				  branch_address:$scope.branch.branch_address,
				  branch_phone:$scope.branch.branch_phone,
				  branch_begin_dt:$scope.branch.branch_begin_dt,
				  branch_coordinates_x:$scope.branch.branch_coordinates_x,
				  branch_coordinates_y:$scope.branch.branch_coordinates_y
      	    };
    	  
    	  $http.post('update_branch', branchData)
   		  .then(function(responses){
       			  if( responses.data == 1 ){
       				$scope.branchSaveStatus="Branch Type updated Successfully";
       				console.log(responses.data);
       				$scope.showListOfClusters();
       			  }
       			  else{
       				$scope.branchSaveStatus="Branch not updated";
       				console.log(responses.data);
       			  }  
    		  }
   		  , function (responses)
   		  {
   		  
   		  });   
    	};
    	/* ======================== Branch Controller End ========================= */
    	/* ======================== Block Controller start ========================= */
    	$scope.block = {};
    	$scope.loadDistrictsOfState=function(state_id)
    	{
    		console.log("-------------- in loadDistrictsOfState -------------------");
    		/*var stateId = $scope.block.stateId;*/
    		console.log("state_id "+state_id);
   			$http.post('get_districts_of_state',state_id)
    		  .then(function(responses)
    			{
    			  console.log(responses.data);
    			  $scope.districtsOfState = responses.data;
	    		  }
    		  , function (responses)
    		  {
    		 
    		  }); 
    	};
    	$scope.block = {};
    	$scope.saveBlock=function()
    	{
    		var blockData= {
    				block_short_cd:$scope.block.block_short_code.toUpperCase(),
    				block_long_name:$scope.block.block_long_name.toUpperCase(),
    				district_id:$scope.block.district_id,
    				state_id:$scope.block.state_id
    	    };
    		console.log(blockData);
    	   $http.post('check_unique_block_name', blockData)
   		  .then(function(responses){
       			  if( responses.data){
       				$scope.blockUniqueOrNot="Block already exists.";
       				console.log(responses.data);
       			  }
       			  else{
       				   $scope.blockUniqueOrNot="";
	       				console.log(responses.data);
	       				$http.post('save_block', blockData)
	           		  .then(function(responses){
	    	       			  if( responses.data == 1 ){
	    	       				$scope.blockSaveStatus="Block added Successfully"; 
	    	       				$scope.showListOfBlocks();
	    	       				console.log(responses.data);
	    	       			  }
	    	       			  else{
	    	       				$scope.blockSaveStatus="Block not added";
	    	       				console.log(responses.data);
	    	       			  }
	            		  }
	           		  , function (responses)
	           		  {
	           		  
	           		  });   
       			  }  
    		  }
   		  , function (responses)
   		  {
   		  
   		  }); 
    	}; 
    	 $scope.showListOfBlocks=function()
    	{
    		console.log("-------------- in showListOfDistricts -------------------");
   			$http.get('list_of_blocks')
    		  .then(function(responses)
    			{
    			  console.log(responses.data);
    			  $scope.listOfBlocks = responses.data;
	    		  }
    		  , function (responses)
    		  {
    		 
    		  }); 
    	}; 
    	$scope.deleteBlock=function(blockId,blockLongName)
    	{
    		console.log("******  Deleting the Block *********");
    		console.log("blockId = "+blockId);
    		if (confirm("Are you sure you want to delete the Block "+blockLongName+"?"))
            {
    			$http.post('delete_block', blockId)
         		  .then(function(responses){
  	       			  if( responses.data == 1 ){
  	       				$scope.blockDeleteStatus="Block deleted Successfully";
  	       				console.log(responses.data);
  	       			    $scope.showListOfBlocks();
  	       			  }
  	       			  else{
  	       				$scope.blockDeleteStatus="Block not deleted";
  	       				console.log(responses.data);
  	       			  }  
          		  }
         		  , function (responses)
         		  {
         		  
         		  }); 
            }
    	};
    	$scope.resetBlock=function()
    	{
    		$scope.block.block_id = '';
    		$scope.block.block_short_code = '';
			$scope.block.block_long_name = '';
			$scope.block.district_id = '';
			$scope.block.state_id = '';
    					
			$scope.blockUniqueOrNot = '';
    		$scope.blockSaveStatus = '';
    		$scope.blockDeleteStatus = '';
    		$scope.blockUpdateStatus = "updated";
    	};
    	$scope.viewBlock=function(block_id,block_short_code,block_long_name,district_id,state_id)
    	{
    		$scope.block.block_id = block_id;
    		$scope.block.block_short_code = block_short_code;
			$scope.block.block_long_name = block_long_name;
			$scope.block.district_id = district_id;
			$scope.block.state_id = state_id;
    		
    		$scope.blockUniqueOrNot = '';
    		$scope.blockSaveStatus = '';
    		$scope.blockDeleteStatus = '';
    		$scope.blockUpdateStatus = "updated";
    	};
    	$scope.editBlock=function(block_id,block_short_code,block_long_name,district_id,state_id)
    	{
    		console.log("-------------- in editBlock -------------------");
    		
    		$scope.block.block_id = block_id;
    		$scope.block.block_short_code = block_short_code;
			$scope.block.block_long_name = block_long_name;
			$scope.block.district_id = district_id;
			$scope.block.state_id = state_id;
			$scope.blockUpdateStatus = "update";
    	};
    	$scope.updateBlock=function()
    	{
    		var blockData= {
    				block_id:$scope.block.block_id,
    				block_short_cd:$scope.block.block_short_code.toUpperCase(),
    				block_long_name:$scope.block.block_long_name.toUpperCase(),
    				district_id:$scope.block.district_id,
    				state_id:$scope.block.state_id
    	    };
    	  
    	  $http.post('update_block', blockData)
   		  .then(function(responses){
       			  if( responses.data == 1 ){
       				$scope.blockSaveStatus="Block updated Successfully";
       				console.log(responses.data);
       				$scope.showListOfBlocks();
       				$scope.blockUpdateStatus = "updated";
       			  }
       			  else{
       				$scope.blockSaveStatus="Block not updated";
       				console.log(responses.data);
       			  }  
    		  }
   		  , function (responses)
   		  {
   		  
   		  });   
    	}; 
    	/* ======================== Block Controller End ========================= */
    	/* ======================== Designation Controller start ========================= */
    	$scope.designation = {};
    	$scope.saveDesignation=function()
    	{
    		console.log("******* in saveDesignation ******");
    		var designationData= {
    				designationName:$scope.designation.designationName.toUpperCase(),
    				departmentId:$scope.designation.departmentId,
    				roleId:$scope.designation.roleId
    	    };
    	   console.log(designationData);
    	   $http.post('check_unique_designation_name', designationData)
   		  .then(function(responses){
       			  if( responses.data){
       				$scope.designationUniqueOrNot="Designation already exists.";
       				console.log(responses.data);
       			  }
       			  else{
       				   $scope.designationUniqueOrNot="";
	       				console.log(responses.data);
	       				$http.post('save_designation', designationData)
	           		  .then(function(responses){
	    	       			  if( responses.data == 1 ){
	    	       				$scope.designationSaveStatus="Designation added Successfully"; 
	    	       				$scope.showListOfDesignation();
	    	       				console.log(responses.data);
	    	       			  }
	    	       			  else{
	    	       				$scope.designationSaveStatus="Designation not added";
	    	       				console.log(responses.data);
	    	       			  }
	            		  }
	           		  , function (responses)
	           		  {
	           		  
	           		  });   
       			  }  
    		  }
   		  , function (responses)
   		  {
   		  
   		  }); 
    	}; 
    	 $scope.showListOfDesignation=function()
    	{
    		console.log("-------------- in showListOfDesignation -------------------");
   			$http.get('list_of_designation')
    		  .then(function(responses)
    			{
    			  console.log(responses.data);
    			  $scope.listOfDesignation = responses.data;
	    		  }
    		  , function (responses)
    		  {
    		 
    		  }); 
    	}; 
    	$scope.deleteDesignation=function(designationId, designationName)
    	{
    		console.log("******  Deleting the designation *********");
    		console.log("designationId = "+designationId);
    		if (confirm("Are you sure you want to delete the Designation "+designationName+"?"))
            {
    			$http.post('delete_designation', designationId)
         		  .then(function(responses){
  	       			  if( responses.data == 1 ){
  	       				$scope.designationDeleteStatus="Designation deleted Successfully";
  	       				console.log(responses.data);
  	       			    $scope.showListOfDesignation();
  	       			  }
  	       			  else{
  	       				$scope.designationDeleteStatus="Designation not deleted";
  	       				console.log(responses.data);
  	       			  }  
          		  }
         		  , function (responses)
         		  {
         		  
         		  }); 
            }
    	};
    	$scope.resetDesignation=function()
    	{
    		$scope.designation.designationId = '';
    		$scope.designation.designationName = '';
			$scope.designation.departmentId = '';
			$scope.designation.roleId = '';
    					
			$scope.designationUniqueOrNot = '';
    		$scope.designationSaveStatus = '';
    		$scope.designationDeleteStatus = '';
    		$scope.designationUpdateStatus = "updated";
    	};
    	$scope.viewDesignation=function(designationId,designationName,departmentId,roleId)
    	{
    		$scope.designation.designationId = designationId;
    		$scope.designation.designationName = designationName.toUpperCase();
			$scope.designation.departmentId = departmentId;
			$scope.designation.roleId = roleId;
    		
			$scope.designationUniqueOrNot = '';
    		$scope.designationSaveStatus = '';
    		$scope.designationDeleteStatus = '';
    		$scope.designationUpdateStatus = "updated";
    	};
    	$scope.editDesignation=function(designationId,designationName,departmentId,roleId)
    	{
    		console.log("-------------- in editDesignation -------------------");
    		
    		$scope.designation.designationId = designationId;
    		$scope.designation.designationName = designationName.toUpperCase();
			$scope.designation.departmentId = departmentId;
			$scope.designation.roleId = roleId;
			
			$scope.designationUniqueOrNot = '';
    		$scope.designationSaveStatus = '';
    		$scope.designationDeleteStatus = '';
    		$scope.designationUpdateStatus = "update";
    	};
    	$scope.updateDesignation=function()
    	{
    		var designationData= {
    				designationId:$scope.designation.designationId,
    				designationName:$scope.designation.designationName.toUpperCase(),
    				departmentId:$scope.designation.departmentId,
    				roleId:$scope.designation.roleId
    	    };
    	  
    	  $http.post('update_designation', designationData)
   		  .then(function(responses){
       			  if( responses.data == 1 ){
       				$scope.designationSaveStatus="Designation updated Successfully";
       				console.log(responses.data);
       				$scope.showListOfDesignation();
       			  }
       			  else{
       				$scope.designationSaveStatus="Designation not updated";
       				console.log(responses.data);
       			  }  
    		  }
   		  , function (responses)
   		  {
   		  
   		  });   
    	}; 
    	/* ======================== Designation Controller End ========================= */
    	/* ======================== Village/Town/City Controller start ========================= */
    	$scope.vtc = {};
    	$scope.loadDistrictsOfStateForVtc=function()
    	{
    		console.log("-------------- in loadDistrictsOfStateForVtc -------------------");
    		var state_id = $scope.vtc.state_id;
    		console.log("state_id "+state_id);
   			$http.post('get_districts_of_state',state_id)
    		  .then(function(responses)
    			{
    			  console.log(responses.data);
    			  $scope.districtsOfStateForVtc = responses.data;
	    		  }
    		  , function (responses)
    		  {
    		 
    		  }); 
    	};
    	$scope.loadBlocksOfDistrictForVtc=function()
    	{
    		console.log("-------------- in loadBlocksOfDistrictForVtc -------------------");
    		var district_id = $scope.vtc.district_id;
    		console.log("district_id "+district_id);
   			$http.post('get_blocks_of_district',district_id)
    		  .then(function(responses)
    			{
    			  console.log(responses.data);
    			  $scope.blocksOfDistrictForVtc = responses.data;
	    		  }
    		  , function (responses)
    		  {
    		 
    		  }); 
    	};
    	$scope.saveVtc=function()
    	{
    		var vtcData= {
    				vtc_short_cd:$scope.vtc.vtc_short_cd.toUpperCase(),
    				vtc_long_name:$scope.vtc.vtc_long_name.toUpperCase(),
    				block_id:$scope.vtc.block_id,
    				district_id:$scope.vtc.district_id,
    				state_id:$scope.vtc.state_id
    		}
    	   console.log(vtcData);
    	   $http.post('check_unique_vtc_name', vtcData)
   		  .then(function(responses){
       			  if( responses.data){
       				$scope.vtcUniqueOrNot="Village/Town/City already exists.";
       				console.log(responses.data);
       			  }
       			  else{
       				   $scope.vtcUniqueOrNot="";
	       				console.log(responses.data);
	       				$http.post('save_vtc', vtcData)
	           		  .then(function(responses){
	    	       			  if( responses.data == 1 ){
	    	       				$scope.vtcSaveStatus="Village/Town/City added Successfully"; 
	    	       				$scope.showListOfVtc();
	    	       				console.log(responses.data);
	    	       			  }
	    	       			  else{
	    	       				$scope.vtcSaveStatus="Village/Town/City not added";
	    	       				console.log(responses.data);
	    	       			  }
	            		  }
	           		  , function (responses)
	           		  {
	           		  
	           		  });   
       			  }  
    		  }
   		  , function (responses)
   		  {
   		  
   		  }); 
    	}; 
    	 $scope.showListOfVtc=function()
    	{
    		console.log("-------------- in showListOfVtc -------------------");
   			$http.get('list_of_vtc')
    		  .then(function(responses)
    			{
    			  console.log(responses.data);
    			  $scope.listOfVtc = responses.data;
	    		  }
    		  , function (responses)
    		  {
    		 
    		  }); 
    	}; 
    	$scope.deleteVtc=function(vtc_id,vtc_long_name)
    	{
    		console.log("******  Deleting the vtc *********");
    		console.log("vtc_id = "+vtc_id);
    		if (confirm("Are you sure you want to delete the Village/Town/City "+vtc_long_name+"?"))
            {
    			$http.post('delete_vtc', vtc_id)
         		  .then(function(responses){
  	       			  if( responses.data == 1 ){
  	       				$scope.vtcDeleteStatus="Village/Town/City deleted Successfully";
  	       				console.log(responses.data);
  	       			    $scope.showListOfVtc();
  	       			  }
  	       			  else{
  	       				$scope.vtcDeleteStatus="Village/Town/City not deleted";
  	       				console.log(responses.data);
  	       			  }  
          		  }
         		  , function (responses)
         		  {
         		  
         		  }); 
            }
    	};
    	$scope.resetVtc=function()
    	{
    		$scope.vtc.vtc_id = '';
    		$scope.vtc.vtc_short_cd = '';
			$scope.vtc.vtc_long_name = '';
			$scope.vtc.block_id = '';
			$scope.vtc.district_id = '';
			$scope.vtc.state_id = '';
			
			$scope.vtcUniqueOrNot = '';
    		$scope.vtcSaveStatus = '';
    		$scope.vtcDeleteStatus = '';
			$scope.vtcUpdateStatus = "updated";
    	};
    	$scope.viewVtc=function(vtc_id,vtc_short_cd,vtc_long_name,block_id,district_id,state_id)
    	{
    		$scope.vtc.vtc_id = vtc_id;
    		$scope.vtc.vtc_short_cd = vtc_short_cd.toUpperCase();
			$scope.vtc.vtc_long_name = vtc_long_name.toUpperCase();
			$scope.vtc.block_id = block_id;
			$scope.vtc.district_id = district_id;
			$scope.vtc.state_id = state_id;
			
			$scope.vtcUniqueOrNot = '';
    		$scope.vtcSaveStatus = '';
    		$scope.vtcDeleteStatus = '';
			$scope.vtcUpdateStatus = "updated";
    	};
    	$scope.editVtc=function(vtc_id,vtc_short_cd,vtc_long_name,block_id,district_id,state_id)
    	{
    		console.log("-------------- in editVtc -------------------");
    		
    		$scope.vtc.vtc_id = vtc_id;
    		$scope.vtc.vtc_short_cd = vtc_short_cd.toUpperCase();
			$scope.vtc.vtc_long_name = vtc_long_name.toUpperCase();
			$scope.vtc.block_id = block_id;
			$scope.vtc.district_id = district_id;
			$scope.vtc.state_id = state_id;
			
			$scope.vtcUniqueOrNot = '';
    		$scope.vtcSaveStatus = '';
    		$scope.vtcDeleteStatus = '';
			$scope.vtcUpdateStatus = "update";
    	};
    	$scope.updateVtc=function()
    	{
    		var vtcData= {
    				vtc_id:$scope.vtc.vtc_id,
    				vtc_short_cd:$scope.vtc.vtc_short_cd.toUpperCase(),
    				vtc_long_name:$scope.vtc.vtc_long_name.toUpperCase(),
    				block_id:$scope.vtc.block_id,
    				district_id:$scope.vtc.district_id,
    				state_id:$scope.vtc.state_id
    		}
    	  console.log(vtcData);
    	  $http.post('update_vtc', vtcData)
   		  .then(function(responses){
       			  if( responses.data == 1 ){
       				$scope.vtcSaveStatus="Village/Town/City updated Successfully";
       				console.log(responses.data);
       				$scope.showListOfVtc();
       				$scope.vtcUpdateStatus = "updated";
       			  }
       			  else{
       				$scope.vtcSaveStatus="Village/Town/City not updated";
       				console.log(responses.data);
       			  }  
    		  }
   		  , function (responses)
   		  {
   		  
   		  });   
    	}; 
    	/* ======================== Village/Town/City Controller End ========================= */
    	/* ======================== Role Code Starts ========================= */
    	$scope.role = {};
    	$scope.saveRole=function()
    	{
    	  var roleData= {
    		  role_name:$scope.role.role_name.toUpperCase(),
    		  parent_role_id:$scope.role.parent_role_id
    	    } ;
    	  
    	  $http.post('check_unique_role_name', roleData)
   		  .then(function(responses){
       			  if( responses.data){
       				$scope.roleUniqueOrNot="Role already exists.";
       				console.log(responses.data);
       			  }
       			  else{
       				$scope.roleUniqueOrNot="";
	       				console.log(responses.data);
	       				$http.post('save_role', roleData)
	           		  .then(function(responses){
	    	       			  if( responses.data == 1 ){
	    	       				$scope.roleSaveStatus="Role added Successfully";
	    	       				console.log(responses.data);
	    	       				$scope.showListOfRoles();
	    	       			  }
	    	       			  else{
	    	       				$scope.roleSaveStatus="Role not added";
	    	       				console.log(responses.data);
	    	       			  }  
	            		  }
	           		  , function (responses)
	           		  {
	           		  
	           		  });   
       			  }  
    		  }
   		  , function (responses)
   		  {
   		  
   		  }); 
    	};
    	$scope.showListOfRoles=function()
    	{
    		console.log("-------------- in showListOfRoles -------------------");
   			$http.get('list_of_roles')
    		  .then(function(responses)
    			{
    			  console.log(responses.data);
    			  $scope.listOfRoles = responses.data;
	    		  }
    		  , function (responses)
    		  {
    		 
    		  }); 
    	};
    	$scope.deleteRole=function(role_id,role_name)
    	{
    		console.log("******  Deleting the role  *********");
    		console.log("role_id = "+role_id);
    		if (confirm("Are you sure you want to delete the role "+role_name+"?"))
            {
    			$http.post('delete_role', role_id)
         		  .then(function(responses){
  	       			  if( responses.data == 1 ){
  	       				$scope.roleDeleteStatus="Role deleted Successfully";
  	       				console.log(responses.data);
  	       				$scope.showListOfRoles();
  	       				
	  	       			$scope.roleUniqueOrNot = '';
		  	      		$scope.roleSaveStatus = '';
		  	      		$scope.roleDeleteStatus = '';
		  	      		$scope.roleUpdateStatus = "updated";
  	       			  }
  	       			  else{
  	       				$scope.roleDeleteStatus="Role not deleted";
  	       				console.log(responses.data);
  	       			  }  
          		  }
         		  , function (responses)
         		  {
         		  
         		  }); 
            }
    	};
    	$scope.resetRole=function(role_id,role_name,role_parent_id)
    	{
    		$scope.roleUniqueOrNot = '';
    		$scope.roleSaveStatus = '';
    		$scope.roleDeleteStatus = '';
    					
    		$scope.role.role_id = '';
    		$scope.role.role_name = '';
    		$scope.role.parent_role_id = '';
    		$scope.roleUpdateStatus = "updated";
    	};
    	$scope.viewRole=function(role_id,role_name,parent_role_id)
    	{
    		$scope.role.role_id = role_id;
    		$scope.role.role_name = role_name;
    		$scope.role.parent_role_id = parent_role_id;
    		
    		$scope.roleUniqueOrNot = '';
    		$scope.roleSaveStatus = '';
    		$scope.roleDeleteStatus = '';
    		$scope.roleUpdateStatus = "updated";
    	};
    	$scope.editRole=function(role_id,role_name,role_parent_id)
    	{
    		console.log("-------------- in editRole -------------------");
    		$scope.role.role_id = role_id;
    		$scope.role.role_name = role_name;
    		$scope.role.parent_role_id = role_parent_id;
    		$scope.roleUpdateStatus = "update";
    		
    		$scope.roleUniqueOrNot = '';
    		$scope.roleSaveStatus = '';
    		$scope.roleDeleteStatus = '';
    	};
    	$scope.updateRole=function()
    	{
    		 var roleData= {
    	    		  role_id:$scope.role.role_id,
    				  role_name:$scope.role.role_name.toUpperCase(),
    	    		  parent_role_id:$scope.role.parent_role_id
    	     } ;
    	  
    	  $http.post('update_role', roleData)
   		  .then(function(responses){
       			  if( responses.data == 1 ){
       				$scope.roleSaveStatus="Role updated Successfully";
       				console.log(responses.data);
       				$scope.showListOfRoles();
       				$scope.roleUpdateStatus = "updated";
       			  }
       			  else{
       				$scope.roleSaveStatus="Role not updated";
       				console.log(responses.data);
       			  }  
    		  }
   		  , function (responses)
   		  {
   		  
   		  });   
    	};
    	
    	/* ======================== Role Code End ========================= */
    	/* ======================== Language Code Starts ========================= */
    	$scope.language = {};
    	$scope.saveLanguage=function()
    	{
    	  var languageData= {
    		  lang_nm:$scope.language.lang_nm.toUpperCase()
    	    } ;
    	  
    	  $http.post('check_unique_language_name', languageData)
   		  .then(function(responses){
       			  if( responses.data){
       				$scope.languageUniqueOrNot="Language already exists.";
       				console.log(responses.data);
       			  }
       			  else{
       				$scope.languageUniqueOrNot="";
	       				console.log(responses.data);
	       				$http.post('save_language', languageData)
	           		  .then(function(responses){
	    	       			  if( responses.data == 1 ){
	    	       				$scope.languageSaveStatus="Language added Successfully";
	    	       				console.log(responses.data);
	    	       				$scope.showListOfLanguages();
	    	       			  }
	    	       			  else{
	    	       				$scope.roleSaveStatus="Language not added";
	    	       				console.log(responses.data);
	    	       			  }  
	            		  }
	           		  , function (responses)
	           		  {
	           		  
	           		  });   
       			  }  
    		  }
   		  , function (responses)
   		  {
   		  
   		  }); 
    	};
    	$scope.showListOfLanguages=function()
    	{
    		console.log("-------------- in showListOfLanguages -------------------");
   			$http.get('list_of_languages')
    		  .then(function(responses)
    			{
    			  console.log(responses.data);
    			  $scope.listOfLanguages = responses.data;
	    		  }
    		  , function (responses)
    		  {
    		 
    		  }); 
    	};
    	$scope.deleteLanguage=function(lang_id,lang_nm)
    	{
    		console.log("******  Deleting the Language  *********");
    		console.log("lang_id = "+lang_id);
    		if (confirm("Are you sure you want to delete the Language "+lang_id+"?"))
            {
    			$http.post('delete_language', lang_id)
         		  .then(function(responses){
  	       			  if( responses.data == 1 ){
  	       				$scope.languageDeleteStatus="Language deleted Successfully";
  	       				console.log(responses.data);
  	       				$scope.showListOfLanguage();
  	       				
	  	       			$scope.languageUniqueOrNot = '';
		  	      		$scope.languageSaveStatus = '';
		  	      		$scope.languageDeleteStatus = '';
		  	      		$scope.languageUpdateStatus = "updated";
  	       			  }
  	       			  else{
  	       				$scope.languageDeleteStatus="Language not deleted";
  	       				console.log(responses.data);
  	       			  }  
          		  }
         		  , function (responses)
         		  {
         		  
         		  }); 
            }
    	};
    	$scope.resetLanguage=function()
    	{
    		$scope.languageUniqueOrNot = '';
    		$scope.languageSaveStatus = '';
    		$scope.languageDeleteStatus = '';
    					
    		$scope.language.lang_id = '';
    		$scope.language.lang_nm = '';
    		$scope.languageUpdateStatus = "updated";
    	};
    	$scope.viewLanguage=function(lang_id,lang_nm)
    	{
    		$scope.language.lang_id = lang_id;
    		$scope.language.lang_nm = lang_nm;
    		
    		$scope.languageUniqueOrNot = '';
    		$scope.languageSaveStatus = '';
    		$scope.languageDeleteStatus = '';
    		$scope.languageUpdateStatus = "updated";
    	};
    	$scope.editLanguage=function(lang_id,lang_nm)
    	{
    		console.log("-------------- in editLanguage -------------------");
    		$scope.language.lang_id = lang_id;
    		$scope.language.lang_nm = lang_nm;
    		
    		$scope.languageUniqueOrNot = '';
    		$scope.languageSaveStatus = '';
    		$scope.languageDeleteStatus = '';
    		$scope.languageUpdateStatus = "update";
    	};
    	$scope.updateLanguage=function()
    	{
    		var languageData= {
    				  lang_id:$scope.language.lang_id,
    	    		  lang_nm:$scope.language.lang_nm.toUpperCase()
    	    	    } ;
    	  
    	  $http.post('update_language', languageData)
   		  .then(function(responses){
       			  if( responses.data == 1 ){
       				$scope.languageSaveStatus="Language updated Successfully";
       				console.log(responses.data);
       				$scope.showListOfLanguages();
       				$scope.languageUpdateStatus = "updated";
       			  }
       			  else{
       				$scope.languageSaveStatus="Language not updated";
       				console.log(responses.data);
       			  }  
    		  }
   		  , function (responses)
   		  {
   		  
   		  });   
    	};
    	
    	/* ======================== Language Code End ========================= */
    	/* ======================== Education Code Starts ========================= */
    	$scope.education = {};
    	$scope.saveEducation=function()
    	{
    	  var educationData= {
    			  education_nm:$scope.education.education_nm.toUpperCase()
    	    } ;
    	  
    	  $http.post('check_unique_education_name', educationData)
   		  .then(function(responses){
       			  if( responses.data){
       				$scope.educationUniqueOrNot="Education already exists.";
       				console.log(responses.data);
       			  }
       			  else{
       				$scope.educationUniqueOrNot="";
	       				console.log(responses.data);
	       				$http.post('save_education', educationData)
	           		  .then(function(responses){
	    	       			  if( responses.data == 1 ){
	    	       				$scope.educationSaveStatus="Education added Successfully";
	    	       				console.log(responses.data);
	    	       				$scope.showListOfEducations();
	    	       			  }
	    	       			  else{
	    	       				$scope.educationSaveStatus="Education not added";
	    	       				console.log(responses.data);
	    	       			  }  
	            		  }
	           		  , function (responses)
	           		  {
	           		  
	           		  });   
       			  }  
    		  }
   		  , function (responses)
   		  {
   		  
   		  }); 
    	};
    	$scope.showListOfEducations=function()
    	{
    		console.log("-------------- in showListOfEducations -------------------");
   			$http.get('list_of_educations')
    		  .then(function(responses)
    			{
    			  console.log(responses.data);
    			  $scope.listOfEducations = responses.data;
	    		  }
    		  , function (responses)
    		  {
    		 
    		  }); 
    	};
    	$scope.deleteEducation=function(education_id,education_nm)
    	{
    		console.log("******  Deleting the education  *********");
    		console.log("education_id = "+education_id);
    		if (confirm("Are you sure you want to delete the Education "+education_nm+"?"))
            {
    			$http.post('delete_education', education_id)
         		  .then(function(responses){
  	       			  if( responses.data == 1 ){
  	       				$scope.educationDeleteStatus="Education deleted Successfully";
  	       				console.log(responses.data);
  	       				$scope.showListOfEducations();
  	       				
	  	       			$scope.educationUniqueOrNot = '';
		  	      		$scope.educationSaveStatus = '';
		  	      		$scope.educationDeleteStatus = '';
		  	      		$scope.educationUpdateStatus = "updated";
  	       			  }
  	       			  else{
  	       				$scope.educationDeleteStatus="Education not deleted";
  	       				console.log(responses.data);
  	       			  }  
          		  }
         		  , function (responses)
         		  {
         		  
         		  }); 
            }
    	};
    	$scope.resetEducation=function()
    	{
    		$scope.educationUniqueOrNot = '';
    		$scope.educationSaveStatus = '';
    		$scope.educationDeleteStatus = '';
    					
    		$scope.education.education_id = '';
    		$scope.education.education_nm = '';
    		$scope.educationUpdateStatus = "updated";
    	};
    	$scope.viewEducation=function(education_id,education_nm)
    	{
    		$scope.education.education_id = education_id;
    		$scope.education.education_nm = education_nm;
    		
    		$scope.educationUniqueOrNot = '';
    		$scope.educationSaveStatus = '';
    		$scope.educationDeleteStatus = '';
    		$scope.educationUpdateStatus = "updated";
    	};
    	$scope.editEducation=function(education_id,education_nm)
    	{
    		console.log("-------------- in editEducation -------------------");
    		$scope.education.education_id = education_id;
    		$scope.education.education_nm = education_nm;
    		
    		$scope.educationUniqueOrNot = '';
    		$scope.educationSaveStatus = '';
    		$scope.educationDeleteStatus = '';
    		$scope.educationUpdateStatus = "update";
    	};
    	$scope.updateEducation=function()
    	{
    		var educationData= {
    				education_id:$scope.education.education_id,
    				education_nm:$scope.education.education_nm.toUpperCase()
    	    	    } ;
    	  
    	  $http.post('update_education', educationData)
   		  .then(function(responses){
       			  if( responses.data == 1 ){
       				$scope.educationSaveStatus="Education updated Successfully";
       				console.log(responses.data);
       				$scope.showListOfEducations();
       				$scope.educationUpdateStatus = "updated";
       			  }
       			  else{
       				$scope.educationSaveStatus="Education not updated";
       				console.log(responses.data);
       			  }  
    		  }
   		  , function (responses)
   		  {
   		  
   		  });   
    	};
    	
    	/* ======================== Education Code End ========================= */
    	/* ======================== Religion Code Starts ========================= */
    	$scope.religion = {};
    	$scope.saveReligion=function()
    	{
    	  var religionData= {
    			  religion_name:$scope.religion.religion_name.toUpperCase()
    	    } ;
    	  
    	  $http.post('check_unique_religion_name', religionData)
   		  .then(function(responses){
       			  if( responses.data){
       				$scope.religionUniqueOrNot="Religion already exists.";
       				console.log(responses.data);
       			  }
       			  else{
       				$scope.religionUniqueOrNot="";
	       				console.log(responses.data);
	       				$http.post('save_religion', religionData)
	           		  .then(function(responses){
	    	       			  if( responses.data == 1 ){
	    	       				$scope.religionSaveStatus="Religion added Successfully";
	    	       				console.log(responses.data);
	    	       				$scope.showListOfReligions();
	    	       			  }
	    	       			  else{
	    	       				$scope.religionSaveStatus="Religion not added";
	    	       				console.log(responses.data);
	    	       			  }  
	            		  }
	           		  , function (responses)
	           		  {
	           		  
	           		  });   
       			  }  
    		  }
   		  , function (responses)
   		  {
   		  
   		  }); 
    	};
    	$scope.showListOfReligions=function()
    	{
    		console.log("-------------- in showListOfReligions -------------------");
   			$http.get('list_of_religions')
    		  .then(function(responses)
    			{
    			  console.log(responses.data);
    			  $scope.listOfReligions = responses.data;
	    		  }
    		  , function (responses)
    		  {
    		 
    		  }); 
    	};
    	$scope.deleteReligion=function(rel_id,religion_name)
    	{
    		console.log("******  Deleting the religion  *********");
    		console.log("religion_id = "+rel_id);
    		if (confirm("Are you sure you want to delete the religion "+religion_name+"?"))
            {
    			$http.post('delete_religion', rel_id)
         		  .then(function(responses){
  	       			  if( responses.data == 1 ){
  	       				$scope.religionDeleteStatus="Religion deleted Successfully";
  	       				console.log(responses.data);
  	       				$scope.showListOfReligions();
  	       				
	  	       			$scope.religionUniqueOrNot = '';
		  	      		$scope.religionSaveStatus = '';
		  	      		$scope.religionUpdateStatus = "updated";
  	       			  }
  	       			  else{
  	       				$scope.religionDeleteStatus="Education not deleted";
  	       				console.log(responses.data);
  	       			  }  
          		  }
         		  , function (responses)
         		  {
         		  
         		  }); 
            }
    	};
    	$scope.resetReligion=function()
    	{
    		$scope.religionUniqueOrNot = '';
    		$scope.religionSaveStatus = '';
    		$scope.religionDeleteStatus = '';
    					
    		$scope.religion.rel_id = '';
    		$scope.religion.religion_name = '';
    		$scope.religionUpdateStatus = "updated";
    	};
    	$scope.viewReligion=function(rel_id,religion_name)
    	{
    		$scope.religion.rel_id = rel_id;
    		$scope.religion.religion_name = religion_name;
    		
    		$scope.religionUniqueOrNot = '';
    		$scope.religionSaveStatus = '';
    		$scope.religionDeleteStatus = '';
    		$scope.religionUpdateStatus = "updated";
    	};
    	$scope.editReligion=function(rel_id,religion_name)
    	{
    		console.log("-------------- in editEducation -------------------");
    		$scope.religion.rel_id = rel_id;
    		$scope.religion.religion_name = religion_name;
    		
    		$scope.religionUniqueOrNot = '';
    		$scope.religionSaveStatus = '';
    		$scope.religionDeleteStatus = '';
    		$scope.religionUpdateStatus = "update";
    	};
    	$scope.updateReligion=function()
    	{
    		var religionData= {
    				rel_id:$scope.religion.rel_id,
    				religion_name:$scope.religion.religion_name.toUpperCase()
    	    	    } ;
    	  
    	  $http.post('update_religion', religionData)
   		  .then(function(responses){
       			  if( responses.data == 1 ){
       				$scope.religionSaveStatus="Religion updated Successfully";
       				console.log(responses.data);
       				$scope.showListOfReligions();
       				$scope.religionUpdateStatus = "updated";
       			  }
       			  else{
       				$scope.religionSaveStatus="Education not updated";
       				console.log(responses.data);
       			  }  
    		  }
   		  , function (responses)
   		  {
   		  
   		  });   
    	};
    	
    	/* ======================== Religion Code End ========================= */
    	/* ======================== Department Code Starts ========================= */
    	$scope.department = {};
    	$scope.saveDepartment=function()
    	{
    	  var departmentData= {
    			  department_name:$scope.department.department_name.toUpperCase()
    	    } ;
    	  
    	  $http.post('check_unique_department_name', departmentData)
   		  .then(function(responses){
       			  if( responses.data){
       				$scope.religionUniqueOrNot="Department already exists.";
       				console.log(responses.data);
       			  }
       			  else{
       				$scope.departmentUniqueOrNot="";
	       				console.log(responses.data);
	       				$http.post('save_department', departmentData)
	           		  .then(function(responses){
	    	       			  if( responses.data == 1 ){
	    	       				$scope.departmentSaveStatus="Department added Successfully";
	    	       				console.log(responses.data);
	    	       				$scope.showListOfDepartments();
	    	       			  }
	    	       			  else{
	    	       				$scope.departmentSaveStatus="Department not added";
	    	       				console.log(responses.data);
	    	       			  }  
	            		  }
	           		  , function (responses)
	           		  {
	           		  
	           		  });   
       			  }  
    		  }
   		  , function (responses)
   		  {
   		  
   		  }); 
    	};
    	$scope.showListOfDepartments=function()
    	{
    		console.log("-------------- in showListOfDepartments -------------------");
   			$http.get('list_of_departments')
    		  .then(function(responses)
    			{
    			  console.log(responses.data);
    			  $scope.listOfDepartments = responses.data;
	    		  }
    		  , function (responses)
    		  {
    		 
    		  }); 
    	};
    	$scope.deleteDepartment=function(department_id,department_name)
    	{
    		console.log("******  Deleting the department  *********");
    		console.log("department_id = "+department_id);
    		if (confirm("Are you sure you want to delete the department "+department_name+"?"))
            {
    			$http.post('delete_department', department_id)
         		  .then(function(responses){
  	       			  if( responses.data == 1 ){
  	       				$scope.departmentDeleteStatus="Department deleted Successfully";
  	       				console.log(responses.data);
  	       				$scope.showListOfDepartments();
  	       				
	  	       			$scope.departmentUniqueOrNot = '';
		  	      		$scope.departmentSaveStatus = '';
		  	      		$scope.departmentUpdateStatus = "updated";
  	       			  }
  	       			  else{
  	       				$scope.departmentDeleteStatus="Department not deleted";
  	       				console.log(responses.data);
  	       			  }  
          		  }
         		  , function (responses)
         		  {
         		  
         		  }); 
            }
    	};
    	$scope.resetDepartment=function()
    	{
    		$scope.departmentUniqueOrNot = '';
    		$scope.departmentSaveStatus = '';
    		$scope.departmentDeleteStatus = '';
    					
    		$scope.department.department_id = '';
    		$scope.department.department_name = '';
    		$scope.departmentUpdateStatus = "updated";
    	};
    	$scope.viewDepartment=function(department_id,department_name)
    	{
    		$scope.department.department_id = department_id;
    		$scope.department.department_name = department_name;
    		
    		$scope.departmentUniqueOrNot = '';
    		$scope.departmentSaveStatus = '';
    		$scope.departmentDeleteStatus = '';
    		$scope.departmentUpdateStatus = "updated";
    	};
    	$scope.editDepartment=function(department_id,department_name)
    	{
    		console.log("-------------- in editEducation -------------------");
    		$scope.department.department_id = department_id;
    		$scope.department.department_name = department_name;
    		
    		$scope.departmentUniqueOrNot = '';
    		$scope.departmentSaveStatus = '';
    		$scope.departmentDeleteStatus = '';
    		$scope.departmentUpdateStatus = "update";
    	};
    	$scope.updateDepartment=function()
    	{
    		var departmentData= {
    				department_id:$scope.department.department_id,
    				department_name:$scope.department.department_name.toUpperCase()
    	    	    } ;
    	  
    	  $http.post('update_department', departmentData)
   		  .then(function(responses){
       			  if( responses.data == 1 ){
       				$scope.departmentSaveStatus="Department updated Successfully";
       				console.log(responses.data);
       				$scope.showListOfDepartments();
       				$scope.departmentUpdateStatus = "updated";
       			  }
       			  else{
       				$scope.departmentSaveStatus="Department not updated";
       				console.log(responses.data);
       			  }  
    		  }
   		  , function (responses)
   		  {
   		  
   		  });   
    	};
    	
    	/* ======================== Department Code End ========================= */
    	/* ======================== Occupation Code Starts ========================= */
    	$scope.occupation = {};
    	$scope.saveOccupation=function()
    	{
    	  var occupationData= {
    			  occupation_name:$scope.occupation.occupation_name.toUpperCase()
    	    } ;
    	  
    	  $http.post('check_unique_occupation_name', occupationData)
   		  .then(function(responses){
       			  if( responses.data){
       				$scope.occupationUniqueOrNot="Occupation already exists.";
       				console.log(responses.data);
       			  }
       			  else{
       				$scope.occupationUniqueOrNot="";
	       				console.log(responses.data);
	       				$http.post('save_occupation', occupationData)
	           		  .then(function(responses){
	    	       			  if( responses.data == 1 ){
	    	       				$scope.occupationSaveStatus="Occupation added Successfully";
	    	       				console.log(responses.data);
	    	       				$scope.showListOfOccupations();
	    	       			  }
	    	       			  else{
	    	       				$scope.occupationSaveStatus="Occupation not added";
	    	       				console.log(responses.data);
	    	       			  }  
	            		  }
	           		  , function (responses)
	           		  {
	           		  
	           		  });   
       			  }  
    		  }
   		  , function (responses)
   		  {
   		  
   		  }); 
    	};
    	$scope.showListOfOccupations=function()
    	{
    		console.log("-------------- in showListOfDepartments -------------------");
   			$http.get('list_of_occupations')
    		  .then(function(responses)
    			{
    			  console.log(responses.data);
    			  $scope.listOfOccupations = responses.data;
	    		  }
    		  , function (responses)
    		  {
    		 
    		  }); 
    	};
    	$scope.deleteOccupation=function(occupation_id,occupation_name)
    	{
    		console.log("******  Deleting the occupation  *********");
    		console.log("occupation_id = "+occupation_id);
    		if (confirm("Are you sure you want to delete the occupation "+occupation_name+"?"))
            {
    			$http.post('delete_occupation', occupation_id)
         		  .then(function(responses){
  	       			  if( responses.data == 1 ){
  	       				$scope.occupationDeleteStatus="Occupation deleted Successfully";
  	       				console.log(responses.data);
  	       				$scope.showListOfOccupations();
  	       				
	  	       			$scope.occupationUniqueOrNot = '';
		  	      		$scope.occupationSaveStatus = '';
		  	      		$scope.occupationUpdateStatus = "updated";
  	       			  }
  	       			  else{
  	       				$scope.occupationDeleteStatus="Department not deleted";
  	       				console.log(responses.data);
  	       			  }  
          		  }
         		  , function (responses)
         		  {
         		  
         		  }); 
            }
    	};
    	$scope.resetOccupation=function()
    	{
    		$scope.occupationUniqueOrNot = '';
    		$scope.occupationSaveStatus = '';
    		$scope.occupationDeleteStatus = '';
    					
    		$scope.occupation.occupation_id = '';
    		$scope.occupation.occupation_name = '';
    		$scope.occupationUpdateStatus = "updated";
    	};
    	$scope.viewOccupation=function(occupation_id,occupation_name)
    	{
    		$scope.occupation.occupation_id = occupation_id;
    		$scope.occupation.occupation_name = occupation_name;
    		
    		$scope.occupationUniqueOrNot = '';
    		$scope.occupationSaveStatus = '';
    		$scope.occupationDeleteStatus = '';
    		$scope.occupationUpdateStatus = "updated";
    	};
    	$scope.editOccupation=function(occupation_id,occupation_name)
    	{
    		console.log("-------------- in editEducation -------------------");
    		$scope.occupation.occupation_id = occupation_id;
    		$scope.occupation.occupation_name = occupation_name;
    		
    		$scope.occupationUniqueOrNot = '';
    		$scope.occupationSaveStatus = '';
    		$scope.occupationDeleteStatus = '';
    		$scope.occupationUpdateStatus = "update";
    	};
    	$scope.updateOccupation=function()
    	{
    		var occupationData= {
    				occupation_id:$scope.occupation.occupation_id,
    				occupation_name:$scope.occupation.occupation_name.toUpperCase()
    	    	    } ;
    	  
    	  $http.post('update_occupation', occupationData)
   		  .then(function(responses){
       			  if( responses.data == 1 ){
       				$scope.occupationSaveStatus="Occupation updated Successfully";
       				console.log(responses.data);
       				$scope.showListOfOccupations();
       				$scope.occupationUpdateStatus = "updated";
       			  }
       			  else{
       				$scope.occupationSaveStatus="Occupation not updated";
       				console.log(responses.data);
       			  }  
    		  }
   		  , function (responses)
   		  {
   		  
   		  });   
    	};
    	
    	/* ======================== Occupation Code End ========================= */
    	/* ======================== Status Type Code Starts ========================= */
    	$scope.statusType = {};
    	$scope.saveStatusType=function()
    	{
    	  var statusTypeData= {
    			  status_type_code:$scope.statusType.status_type_code.toUpperCase(),
    			  status_type_name:$scope.statusType.status_type_name.toUpperCase(),
    			  status_type_description:$scope.statusType.status_type_description.toUpperCase()
    	    } ;
    	  
    	  $http.post('check_unique_status_type_name', statusTypeData)
   		  .then(function(responses){
       			  if( responses.data){
       				$scope.statusTypeUniqueOrNot="Status Type already exists.";
       				console.log(responses.data);
       			  }
       			  else{
       				$scope.statusTypeUniqueOrNot="";
	       				console.log(responses.data);
	       				$http.post('save_status_type', statusTypeData)
	           		  .then(function(responses){
	    	       			  if( responses.data == 1 ){
	    	       				$scope.statusTypeSaveStatus="Status Type added Successfully";
	    	       				console.log(responses.data);
	    	       				$scope.showListOfStatusTypes();
	    	       			  }
	    	       			  else{
	    	       				$scope.statusTypeSaveStatus="Status Type not added";
	    	       				console.log(responses.data);
	    	       			  }  
	            		  }
	           		  , function (responses)
	           		  {
	           		  
	           		  });   
       			  }  
    		  }
   		  , function (responses)
   		  {
   		  
   		  }); 
    	};
    	$scope.showListOfStatusTypes=function()
    	{
    		console.log("-------------- in showListOfReligions -------------------");
   			$http.get('list_of_status_types')
    		  .then(function(responses)
    			{
    			  console.log(responses.data);
    			  $scope.listOfStatusTypes = responses.data;
	    		}
    		  , function (responses)
    		  {
    		 
    		  }); 
    	};
    	$scope.deleteStatusType=function(status_type_id,status_type_nm)
    	{
    		console.log("******  Deleting the status_type  *********");
    		console.log("status_type_id = "+status_type_id);
    		if (confirm("Are you sure you want to delete the Status Type "+status_type_nm+"?"))
            {
    			$http.post('delete_status_type', status_type_id)
         		  .then(function(responses){
  	       			  if( responses.data == 1 ){
  	       				$scope.statusTypeDeleteStatus="Status Type deleted Successfully";
  	       				console.log(responses.data);
  	       				$scope.showListOfStatusType();
  	       				
	  	       			$scope.statusTypeUniqueOrNot = '';
		  	      		$scope.statusTypeSaveStatus = '';
		  	      		$scope.statusTypeUpdateStatus = "updated";
  	       			  }
  	       			  else{
  	       				$scope.statusTypeDeleteStatus="Status Type not deleted";
  	       				console.log(responses.data);
  	       			  }  
          		  }
         		  , function (responses)
         		  {
         		  
         		  }); 
            }
    	};
    	$scope.resetStatusType=function()
    	{
    		$scope.statusTypeUniqueOrNot = '';
    		$scope.statusTypeSaveStatus = '';
    		$scope.statusTypeDeleteStatus = '';
    					
    		$scope.statusType.status_type_id = '';
    		$scope.statusType.status_type_code = '';
    		$scope.statusType.status_type_name = '';
    		$scope.statusType.status_type_description = '';
    		$scope.statusTypeUpdateStatus = "updated";
    	};
    	$scope.viewStatusType=function(status_type_id,status_type_code,status_type_name,status_type_description)
    	{
    		$scope.statusType.status_type_id = status_type_id;
    		$scope.statusType.status_type_code = status_type_code;
    		$scope.statusType.status_type_name = status_type_name;
    		$scope.statusType.status_type_description = status_type_description;
    		
    		$scope.statusTypeUniqueOrNot = '';
    		$scope.statusTypeSaveStatus = '';
    		$scope.statusTypeDeleteStatus = '';
    		$scope.statusTypeUpdateStatus = "updated";
    	};
    	$scope.editStatusType=function(status_type_id,status_type_code,status_type_name,status_type_description)
    	{
    		console.log("-------------- in editEducation -------------------");
    		$scope.statusType.status_type_id = status_type_id;
    		$scope.statusType.status_type_code = status_type_code;
    		$scope.statusType.status_type_name = status_type_name;
    		$scope.statusType.status_type_description = status_type_description;
    		
    		$scope.statusTypeUniqueOrNot = '';
    		$scope.statusTypeSaveStatus = '';
    		$scope.statusTypeDeleteStatus = '';
    		$scope.statusTypeUpdateStatus = "update";
    	};
    	$scope.updateStatusType=function()
    	{
	    		var statusTypeData= {
	    			status_type_id:$scope.statusType.status_type_id,
	    			status_type_code:$scope.statusType.status_type_code.toUpperCase(),
	      			status_type_name:$scope.statusType.status_type_name.toUpperCase(),
	      			status_type_description:$scope.statusType.status_type_description.toUpperCase()
	      	    } ;
    	  $http.post('update_status_type', statusTypeData)
   		  .then(function(responses){
       			  if( responses.data == 1 ){
       				$scope.statusTypeSaveStatus="Status Type updated Successfully";
       				console.log(responses.data);
       				$scope.showListOfStatusTypes();
       				$scope.statusTypeUpdateStatus = "updated";
       			  }
       			  else{
       				$scope.statusTypeSaveStatus="Status Type not updated";
       				console.log(responses.data);
       			  }  
    		  }
   		  , function (responses)
   		  {
   		  
   		  });   
    	};
    	
    	/* ======================== Status Type Code End ========================= */
    	/* ======================== Status Code Starts ========================= */
    	$scope.status = {};
    	$scope.saveStatus=function()
    	{
    	  var statusData= {
    			  status_type_id:$scope.status.status_type_id,
    			  status_code:$scope.status.status_code.toUpperCase(),
    			  status_name:$scope.status.status_name.toUpperCase(),
    			  status_description:$scope.status.status_description.toUpperCase()
    	    } ;
    	  
    	  $http.post('check_unique_status_name', statusData)
   		  .then(function(responses){
       			  if( responses.data){
       				$scope.statusUniqueOrNot="Status already exists.";
       				console.log(responses.data);
       			  }
       			  else{
       				$scope.statusUniqueOrNot="";
	       				console.log(responses.data);
	       				$http.post('save_status', statusData)
	           		  .then(function(responses){
	    	       			  if( responses.data == 1 ){
	    	       				$scope.statusSaveStatus="Status added Successfully";
	    	       				console.log(responses.data);
	    	       				$scope.showListOfStatus();
	    	       			  }
	    	       			  else{
	    	       				$scope.statusSaveStatus="Status not added";
	    	       				console.log(responses.data);
	    	       			  }  
	            		  }
	           		  , function (responses)
	           		  {
	           		  
	           		  });   
       			  }  
    		  }
   		  , function (responses)
   		  {
   		  
   		  }); 
    	};
    	$scope.showListOfStatus=function()
    	{
    		console.log("-------------- in showListOfStatus -------------------");
   			$http.get('list_of_status')
    		  .then(function(responses)
    			{
    			  console.log(responses.data);
    			  $scope.listOfStatus = responses.data;
	    		  }
    		  , function (responses)
    		  {
    		 
    		  }); 
    	};
    	$scope.deleteStatus=function(status_id,status_name)
    	{
    		console.log("******  Deleting the status  *********");
    		console.log("status_id = "+status_id);
    		if (confirm("Are you sure you want to delete the Status "+status_name+"?"))
            {
    			$http.post('delete_status', status_id)
         		  .then(function(responses){
  	       			  if( responses.data == 1 ){
  	       				$scope.statusDeleteStatus="Status deleted Successfully";
  	       				console.log(responses.data);
  	       				$scope.showListOfStatus();
  	       				
	  	       			$scope.statusUniqueOrNot = '';
		  	      		$scope.statusSaveStatus = '';
		  	      		$scope.statusUpdateStatus = "updated";
  	       			  }
  	       			  else{
  	       				$scope.statusDeleteStatus="Status not deleted";
  	       				console.log(responses.data);
  	       			  }  
          		  }
         		  , function (responses)
         		  {
         		  
         		  }); 
            }
    	};
    	$scope.resetStatus=function()
    	{
    		$scope.statusUniqueOrNot = '';
    		$scope.statusSaveStatus = '';
    		$scope.statusDeleteStatus = '';
    					
    		$scope.status.status_id = '';
    		$scope.status.status_type_id = '';
    		$scope.status.status_code = '';
    		$scope.status.status_name = '';
    		$scope.status.status_description = '';
    		$scope.statusUpdateStatus = "updated";
    	};
    	$scope.viewStatus=function(status_id,status_type_id,status_code,status_name,status_description)
    	{
    		$scope.status.status_id = status_id;
    		$scope.status.status_type_id = status_type_id;
    		$scope.status.status_code = status_code;
    		$scope.status.status_name = status_name;
    		$scope.status.status_description = status_description;
    		
    		$scope.statusUniqueOrNot = '';
    		$scope.statusSaveStatus = '';
    		$scope.statusDeleteStatus = '';
    		$scope.statusUpdateStatus = "updated";
    	};
    	$scope.editStatus=function(status_id,status_type_id,status_code,status_name,status_description)
    	{
    		console.log("-------------- in editStatus -------------------");
    		$scope.status.status_id = status_id;
    		$scope.status.status_type_id = status_type_id;
    		$scope.status.status_code = status_code;
    		$scope.status.status_name = status_name;
    		$scope.status.status_description = status_description;
    		
    		$scope.statusUniqueOrNot = '';
    		$scope.statusSaveStatus = '';
    		$scope.statusDeleteStatus = '';
    		$scope.statusUpdateStatus = "update";
    	};
    	$scope.updateStatus=function()
    	{
	    		var statusData= {
	    			status_id:$scope.status.status_id,
	    			status_type_id:$scope.status.status_type_id,
	    			status_code:$scope.status.status_code.toUpperCase(),
	    			status_name:$scope.status.status_name.toUpperCase(),
	    			status_description:$scope.status.status_description.toUpperCase()
	      	    } ;
    	  $http.post('update_status', statusData)
   		  .then(function(responses){
       			  if( responses.data == 1 ){
       				$scope.statusSaveStatus="Status updated Successfully";
       				console.log(responses.data);
       				$scope.showListOfStatus();
       				$scope.statusUpdateStatus = "updated";
       			  }
       			  else{
       				$scope.statusSaveStatus="Status not updated";
       				console.log(responses.data);
       			  }  
    		  }
   		  , function (responses)
   		  {
   		  
   		  });   
    	};
    	/* ======================== Status Type Code End ========================= */
    	/* ======================== Relationship Controller Starts ================= */
    	$scope.relationshipType = {};
    	$scope.saveRelationshipType=function()
    	{
    	  var relationshipTypeData= {
    			  relation_type_nm:$scope.relationshipType.relation_type_nm.toUpperCase()
    	    } ;
    	  console.log(relationshipTypeData);
    	  $http.post('check_unique_relationship_type_name', relationshipTypeData)
   		  .then(function(responses){
       			  if( responses.data){
       				$scope.relationshipTypeUniqueOrNot="Relationship Type already exists.";
       				console.log(responses.data);
       			  }
       			  else{
       				$scope.relationshipuniqueOrNot="";
	       				console.log(responses.data);
	       				$http.post('save_relationship_type', relationshipTypeData)
	           		  .then(function(responses){
	    	       			  if( responses.data == 1 ){
	    	       				$scope.relationshipTypeSaveStatus="Relationship Type added Successfully";
	    	       				console.log(responses.data);
	    	       				$scope.showListOfRelationshipTypes();
	    	       			  }
	    	       			  else{
	    	       				$scope.relationshipTypeSaveStatus="Relationship Type not added";
	    	       				console.log(responses.data);
	    	       			  }  
	            		  }
	           		  , function (responses)
	           		  {
	           		  
	           		  });   
       			  }  
    		  }
   		  , function (responses)
   		  {
   		  
   		  }); 
    	};
    	$scope.showListOfRelationshipTypes=function()
    	{
    		console.log("-------------- in showListOfRelationshipTypes -------------------");
   			$http.get('list_of_relationship_types')
    		  .then(function(responses)
    			{
    			  console.log(responses.data);
    			  $scope.listOfRelationshipTypes = responses.data;
	    		  }
    		  , function (responses)
    		  {
    		 
    		  }); 
    	};
    	$scope.deleteRelationshipType=function(relation_type_id,relation_type_nm)
    	{
    		console.log("******  Deleting the relationship  *********");
    		console.log("relation_type_id = "+relation_type_id);
    		if (confirm("Are you sure you want to delete the relationship type "+relation_type_nm+"?"))
            {
    			$http.post('delete_relationship_type', relation_type_id)
         		  .then(function(responses){
  	       			  if( responses.data == 1 ){
  	       				$scope.relationshipTypeDeleteStatus="Relationship Type deleted Successfully";
  	       				console.log(responses.data);
  	       				$scope.showListOfRelationshipTypes();
  	       			  }
  	       			  else{
  	       				$scope.deleteStatus="Relationship Type not deleted";
  	       				console.log(responses.data);
  	       			  }  
          		  }
         		  , function (responses)
         		  {
         		  
         		  }); 
            }
    	};
    	$scope.resetRelationshipType=function(relation_type_id,relation_type_nm)
    	{
    		console.log("-------------- in viewRelationshipType -------------------");
    		$scope.relationshipType.relation_type_id = '';
    		$scope.relationshipType.relation_type_nm = '';
    		
    		$scope.relationshipTypeSaveStatus='';
    		$scope.relationshipTypeDeleteStatus="''";
    		$scope.relationshipTypeUpdateStatus="updated";
    	};
    	$scope.viewRelationshipType=function(relation_type_id,relation_type_nm)
    	{
    		console.log("-------------- in viewRelationshipType -------------------");
    		$scope.relationshipType.relation_type_id = relation_type_id;
    		$scope.relationshipType.relation_type_nm = relation_type_nm;
    		
    		$scope.relationshipTypeSaveStatus='';
    		$scope.relationshipTypeDeleteStatus="''";
    		$scope.relationshipTypeUpdateStatus="updated";
    	};
    	$scope.editRelationshipType=function(relation_type_id,relation_type_nm)
    	{
    		console.log("-------------- in edit_relationship -------------------");
    		$scope.relationshipType.relation_type_id = relation_type_id;
    		$scope.relationshipType.relation_type_nm = relation_type_nm;
    		
    		$scope.relationshipTypeSaveStatus='';
    		$scope.relationshipTypeDeleteStatus='';
    		$scope.relationshipTypeUpdateStatus="update";
    	};
    	$scope.updateRelationshipType=function()
    	{
    		  var relationshipTypeData= {
    				  relation_type_id:$scope.relationshipType.relation_type_id,
    				  relation_type_nm:$scope.relationshipType.relation_type_nm.toUpperCase()
        	    } ;
    	  
    	  $http.post('update_relationship_type', relationshipTypeData)
   		  .then(function(responses){
       			  if( responses.data == 1 ){
       				$scope.relationshipTypeSaveStatus="Relationship Type updated Successfully";
       				console.log(responses.data);
       				$scope.showListOfRelationshipTypes();
       			  }
       			  else{
       				$scope.relationshipTypeSaveStatus="Relationship not updated";
       				console.log(responses.data);
       			  }  
    		  }
   		  , function (responses)
   		  {
   		  
   		  });   
    	};
    	/* ======================== Relationship Controller Ends =================== */
    	/* ======================== Contact Type Controller Starts ================= */
    	$scope.contactType = {};
    	$scope.saveContactType=function()
    	{
    	  var contactTypeData= {
    			  contact_type_name:$scope.contactType.contact_type_name.toUpperCase(),
    			  contact_type_desc:$scope.contactType.contact_type_desc.toUpperCase()
    	    } ;
    	  console.log(contactTypeData);
    	  $http.post('check_unique_contact_type_name', contactTypeData)
   		  .then(function(responses){
       			  if( responses.data){
       				$scope.contactTypeUniqueOrNot="Contact Type already exists.";
       				console.log(responses.data);
       			  }
       			  else{
       				$scope.contactTypeUniqueOrNot="";
	       				console.log(responses.data);
	       				$http.post('save_contact_type', contactTypeData)
	           		  .then(function(responses){
	    	       			  if( responses.data == 1 ){
	    	       				$scope.contactTypeSaveStatus="Contact Type Type added Successfully";
	    	       				console.log(responses.data);
	    	       				$scope.showListOfContactTypes();
	    	       			  }
	    	       			  else{
	    	       				$scope.contactTypeSaveStatus="Contact Type Type not added";
	    	       				console.log(responses.data);
	    	       			  }  
	            		  }
	           		  , function (responses)
	           		  {
	           		  
	           		  });   
       			  }  
    		  }
   		  , function (responses)
   		  {
   		  
   		  }); 
    	};
    	$scope.showListOfContactTypes=function()
    	{
    		console.log("-------------- in showListOfContactTypes -------------------");
   			$http.get('list_of_contact_types')
    		  .then(function(responses)
    			{
    			  console.log(responses.data);
    			  $scope.listOfContactTypes = responses.data;
	    		  }
    		  , function (responses)
    		  {
    		 
    		  }); 
    	};
    	$scope.deleteContactType=function(contact_type_id,contact_type_name)
    	{
    		console.log("******  Deleting the contact type  *********");
    		console.log("contact_type_id = "+contact_type_id);
    		if (confirm("Are you sure you want to delete the contact type "+contact_type_name+"?"))
            {
    			$http.post('delete_contact_type', contact_type_id)
         		  .then(function(responses){
  	       			  if( responses.data == 1 ){
  	       				$scope.contactTypeDeleteStatus="Contact Type deleted Successfully";
  	       				console.log(responses.data);
  	       				$scope.showListOfContactTypes();
  	       			  }
  	       			  else{
  	       				$scope.contactTypeDeleteStatus="Contact Type Type not deleted";
  	       				console.log(responses.data);
  	       			  }  
          		  }
         		  , function (responses)
         		  {
         		  
         		  }); 
            }
    	};
    	$scope.resetContactType=function(contact_type_id,contact_type_name,contact_type_desc)
    	{
    		console.log("-------------- in resetContactType -------------------");
    		$scope.contactType.contact_type_id = '';
    		$scope.contactType.contact_type_name = '';
    		$scope.contactType.contact_type_desc = '';
    		
    		$scope.contactTypeSaveStatus='';
    		$scope.contactTypeDeleteStatus='';
    		$scope.contactTypeUpdateStatus="updated";
    	};
    	$scope.viewContactType=function(contact_type_id,contact_type_name,contact_type_desc)
    	{
    		console.log("-------------- in viewRelationshipType -------------------");
    		$scope.contactType.contact_type_id = contact_type_id;
    		$scope.contactType.contact_type_name = contact_type_name;
    		$scope.contactType.contact_type_desc = contact_type_desc;
    		
    		$scope.contactTypeSaveStatus='';
    		$scope.contactTypeDeleteStatus='';
    		$scope.contactTypeUpdateStatus="updated";
    	};
    	$scope.editContactType=function(contact_type_id,contact_type_name,contact_type_desc)
    	{
    		console.log("-------------- in edit_relationship -------------------");
    		$scope.contactType.contact_type_id = contact_type_id;
    		$scope.contactType.contact_type_name = contact_type_name;
    		$scope.contactType.contact_type_desc = contact_type_desc;
    		
    		$scope.contactTypeSaveStatus='';
    		$scope.contactTypeDeleteStatus='';
    		$scope.contactTypeUpdateStatus="update";
    	};
    	$scope.updateContactType=function()
    	{
    		var contactTypeData= {
    				contact_type_id:$scope.contactType.contact_type_id,
    				contact_type_name:$scope.contactType.contact_type_name.toUpperCase(),
      			  	contact_type_desc:$scope.contactType.contact_type_desc.toUpperCase()
      	    } ;
    	  
    	  $http.post('update_contact_type', contactTypeData)
   		  .then(function(responses){
       			  if( responses.data == 1 ){
       				$scope.contactTypeSaveStatus="Contact Type updated Successfully";
       				console.log(responses.data);
       				$scope.showListOfContactTypes();
       			  }
       			  else{
       				$scope.contactTypeSaveStatus="Contact Type not updated";
       				console.log(responses.data);
       			  }  
    		  }
   		  , function (responses)
   		  {
   		  
   		  });   
    	};
    	/* ======================== Contact Type Controller Ends =================== */
    	/* ======================== Cluster Controller Starts ================= */
    	$scope.cluster = {};
    	$scope.saveCluster=function()
    	{
    	  var clusterData= {
    			  cluster_short_code:$scope.cluster.cluster_short_code.toUpperCase(),
    			  cluster_long_name:$scope.cluster.cluster_long_name.toUpperCase()
    	    } ;
    	  console.log(clusterData);
    	  $http.post('check_unique_cluster_name', clusterData)
   		  .then(function(responses){
       			  if( responses.data){
       				$scope.clusterUniqueOrNot="Cluster already exists.";
       				console.log(responses.data);
       			  }
       			  else{
       				$scope.clusterUniqueOrNot="";
	       			console.log(responses.data);
	       				
	       			$http.post('save_cluster', clusterData)
	           		  .then(function(responses){
	    	       			  if( responses.data == 1 ){
	    	       				$scope.clusterSaveStatus="Cluster added Successfully";
	    	       				console.log(responses.data);
	    	       				$scope.showListOfClusters();
	    	       			  }
	    	       			  else{
	    	       				$scope.clusterSaveStatus="Cluster not added";
	    	       				console.log(responses.data);
	    	       			  }  
	            		  }
	           		  , function (responses)
	           		  {
	           		  
	           		  });   
       			  }  
    		  }
   		  , function (responses)
   		  {
   		  
   		  }); 
    	};
    	$scope.showListOfClusters=function()
    	{
    		console.log("-------------- in showListOfClusters -------------------");
   			$http.get('list_of_clusters')
    		  .then(function(responses)
    			{
    			  console.log(responses.data);
    			  $scope.listOfClusters = responses.data;
	    		  }
    		  , function (responses)
    		  {
    		 
    		  }); 
    	};
    	$scope.deleteCluster=function(cluster_id,cluster_long_name)
    	{
    		console.log("******  Deleting the cluster *********");
    		console.log("cluster_id = "+cluster_id);
    		if (confirm("Are you sure you want to delete the cluster "+cluster_long_name+"?"))
            {
    			$http.post('delete_cluster', cluster_id)
         		  .then(function(responses){
  	       			  if( responses.data == 1 ){
  	       				$scope.clusterDeleteStatus="Cluster deleted Successfully";
  	       				console.log(responses.data);
  	       				$scope.showListOfClusters();
  	       			  }
  	       			  else{
  	       				$scope.clusterDeleteStatus="Cluster not deleted";
  	       				console.log(responses.data);
  	       			  }  
          		  }
         		  , function (responses)
         		  {
         		  
         		  }); 
            }
    	};
    	$scope.resetCluster=function(cluster_id,cluster_short_code,cluster_long_name)
    	{
    		console.log("-------------- in resetCluster -------------------");
    		$scope.cluster.cluster_id = '';
    		$scope.cluster.cluster_short_code = '';
    		$scope.cluster.cluster_long_name = '';
    		
    		$scope.clusterSaveStatus='';
    		$scope.clusterDeleteStatus='';
    		$scope.clusterUpdateStatus="updated";
    	};
    	$scope.viewCluster=function(cluster_id,cluster_short_code,cluster_long_name)
    	{
    		console.log("-------------- in viewCluster -------------------");
    		$scope.cluster.cluster_id = cluster_id;
    		$scope.cluster.cluster_short_code = cluster_short_code;
    		$scope.cluster.cluster_long_name = cluster_long_name;
    		
    		$scope.clusterSaveStatus='';
    		$scope.clusterDeleteStatus='';
    		$scope.clusterUpdateStatus="updated";
    	};
    	$scope.editCluster=function(cluster_id,cluster_short_code,cluster_long_name)
    	{
    		console.log("-------------- in edit_relationship -------------------");
    		$scope.cluster.cluster_id = cluster_id;
    		$scope.cluster.cluster_short_code = cluster_short_code;
    		$scope.cluster.cluster_long_name = cluster_long_name;
    		
    		$scope.clusterSaveStatus='';
    		$scope.clusterDeleteStatus='';
    		$scope.clusterUpdateStatus="update";
    	};
    	$scope.updateCluster=function()
    	{
    		var clusterData= {
    				cluster_id:$scope.cluster.cluster_id,
    				cluster_short_code:$scope.cluster.cluster_short_code.toUpperCase(),
      			  	cluster_long_name:$scope.cluster.cluster_long_name.toUpperCase()
      	    } ;
    	  
    	  $http.post('update_cluster', clusterData)
   		  .then(function(responses){
       			  if( responses.data == 1 ){
       				$scope.clusterSaveStatus="Cluster Type updated Successfully";
       				console.log(responses.data);
       				$scope.showListOfClusters();
       			  }
       			  else{
       				$scope.clusterTypeSaveStatus="Cluster not updated";
       				console.log(responses.data);
       			  }  
    		  }
   		  , function (responses)
   		  {
   		  
   		  });   
    	};
    	/* ======================== Cluster Controller Ends =================== */
    	/* ======================== Employee Role Controller Starts =================== */
    	$scope.employeeRole = {};
    	$scope.saveEmployeeRole=function()
    	{
    	  var employeeRoleData= {
    			  emp_role_code:$scope.employeeRole.emp_role_code.toUpperCase(),
    			  emp_role_name:$scope.employeeRole.emp_role_name.toUpperCase(),
    			  emp_role_desc:$scope.employeeRole.emp_role_desc.toUpperCase()
    	    } ;
    	  
    	  $http.post('check_unique_employee_role_name', employeeRoleData)
   		  .then(function(responses){
       			  if( responses.data){
       				$scope.employeeRoleUniqueOrNot="Employee role already exists.";
       				console.log(responses.data);
       			  }
       			  else{
       				$scope.employeeRoleUniqueOrNot="";
	       				console.log(responses.data);
	       				$http.post('save_employee_role', employeeRoleData)
	           		  .then(function(responses){
	    	       			  if( responses.data == 1 ){
	    	       				$scope.employeeRoleSaveStatus="Employee role added Successfully";
	    	       				console.log(responses.data);
	    	       				$scope.showListOfEmployeeRoles();
	    	       			  }
	    	       			  else{
	    	       				$scope.employeeRoleSaveStatus="Employee role not added";
	    	       				console.log(responses.data);
	    	       			  }  
	            		  }
	           		  , function (responses)
	           		  {
	           		  
	           		  });   
       			  }  
    		  }
   		  , function (responses)
   		  {
   		  
   		  }); 
    	};
    	$scope.showListOfEmployeeRoles=function()
    	{
    		console.log("-------------- in showListOfEmployeeRoles -------------------");
   			$http.get('list_of_employee_roles1')
    		  .then(function(responses)
    			{
    			  console.log(responses.data);
    			  $scope.listOfEmployeeRoles = responses.data;
	    		}
    		  , function (responses)
    		  {
    		 
    		  }); 
    	};
    	$scope.deleteEmployeeRole=function(emp_role_id,emp_role_name)
    	{
    		console.log("******  Deleting the status_type  *********");
    		console.log("employee_role_id = "+emp_role_id);
    		if (confirm("Are you sure you want to delete the Employee Role "+emp_role_name+"?"))
            {
    			$http.post('delete_employee_role', emp_role_id)
         		  .then(function(responses){
  	       			  if( responses.data == 1 ){
  	       				$scope.employeeRoleDeleteStatus="Employee Role deleted Successfully";
  	       				console.log(responses.data);
  	       				$scope.showListOfEmployeeRoles();
  	       				
	  	       			$scope.EmployeeRoleUniqueOrNot = '';
		  	      		$scope.EmployeeRoleSaveStatus = '';
		  	      		$scope.EmployeeRoleUpdateStatus = "updated";
  	       			  }
  	       			  else{
  	       				$scope.employeeRoleDeleteStatus="Employee Role not deleted";
  	       				console.log(responses.data);
  	       			  }  
          		  }
         		  , function (responses)
         		  {
         		  
         		  }); 
            }
    	};
    	$scope.resetEmployeeRole=function()
    	{
    		$scope.employeeRoleUniqueOrNot = '';
    		$scope.employeeRoleSaveStatus = '';
    		$scope.employeeRoleDeleteStatus = '';
    					
    		$scope.employeeRole.emp_role_id = '';
    		$scope.employeeRole.emp_role_code = '';
    		$scope.employeeRole.emp_role_name = '';
    		$scope.employeeRole.emp_role_description = '';
    		$scope.employeeRoleUpdateStatus = "updated";
    	};
    	$scope.viewEmployeeRole=function(emp_role_id,emp_role_code,emp_role_name,emp_role_desc)
    	{
    		$scope.employeeRole.emp_role_id = emp_role_id;
    		$scope.employeeRole.emp_role_code = emp_role_code;
    		$scope.employeeRole.emp_role_name = emp_role_name;
    		$scope.employeeRole.emp_role_desc = emp_role_desc;
    		
    		$scope.employeeRoleUniqueOrNot = '';
    		$scope.employeeRoleSaveStatus = '';
    		$scope.employeeRoleDeleteStatus = '';
    		$scope.employeeRoleUpdateStatus = "updated";
    	};
    	$scope.editEmployeeRole=function(emp_role_id,emp_role_code,emp_role_name,emp_role_desc)
    	{
    		console.log("-------------- in editEmployee Role -------------------");
    		$scope.employeeRole.emp_role_id = emp_role_id;
    		$scope.employeeRole.emp_role_code = emp_role_code;
    		$scope.employeeRole.emp_role_name = emp_role_name;
    		$scope.employeeRole.emp_role_desc = emp_role_desc;
    		
    		$scope.employeeRoleUniqueOrNot = '';
    		$scope.employeeRoleSaveStatus = '';
    		$scope.employeeRoleDeleteStatus = '';
    		$scope.employeeRoleUpdateStatus = "update";
    	};
    	$scope.updateEmployeeRole=function()
    	{
	    		var employeeRoleData= {
	    			emp_role_id:$scope.employeeRole.emp_role_id,
	    			emp_role_code:$scope.employeeRole.emp_role_code.toUpperCase(),
	      			emp_role_name:$scope.employeeRole.emp_role_name.toUpperCase(),
	      			emp_role_desc:$scope.employeeRole.emp_role_desc.toUpperCase()
	      	    } ;
    	  $http.post('update_employee_role', employeeRoleData)
   		  .then(function(responses){
       			  if( responses.data == 1 ){
       				$scope.employeeRoleSaveStatus="Employee  Role updated Successfully";
       				console.log(responses.data);
       				$scope.showListOfEmployeeRoles();
       				$scope.employeeRoleUpdateStatus = "updated";
       			  }
       			  else{
       				$scope.employeeRoleSaveStatus="Employee  Role not updated";
       				console.log(responses.data);
       			  }  
    		  }
   		  , function (responses)
   		  {
   		  
   		  });   
    	};
    	/* ======================== Employee Role Controller Ends =================== */
    	/* ======================== Employee Controller Starts =================== */
    	$scope.employee = {};
    	$scope.saveEmployee=function()
    	{
    	  var employeeData= {
    			  employee_code:$scope.employee.employee_code.toUpperCase(),
    			  emp_first_name:$scope.employee.emp_first_name.toUpperCase(),
				  emp_mid_name:$scope.employee.emp_mid_name.toUpperCase(),
				  emp_last_name:$scope.employee.emp_last_name.toUpperCase()
    			  
    	    } ;
    	  
    	  $http.post('check_unique_emp_first_name', employeeData)
   		  .then(function(responses){
       			  if( responses.data){
       				$scope.employeeUniqueOrNot="Employee already exists.";
       				console.log(responses.data);
       			  }
       			  else{
       				$scope.employeeUniqueOrNot="";
	       				console.log(responses.data);
	       				$http.post('save_employee', employeeData)
	           		  .then(function(responses){
	    	       			  if( responses.data == 1 ){
	    	       				$scope.employeeSaveStatus="Employee added Successfully";
	    	       				console.log(responses.data);
	    	       				$scope.showListOfEmployee();
	    	       			  }
	    	       			  else{
	    	       				$scope.employeeSaveStatus="Employee not added";
	    	       				console.log(responses.data);
	    	       			  }  
	            		  }
	           		  , function (responses)
	           		  {
	           		  
	           		  });   
       			  }  
    		  }
   		  , function (responses)
   		  {
   		  
   		  }); 
    	};
    	$scope.showListOfEmployee=function()
    	{
    		console.log("-------------- in showListOfEmployee -------------------");
   			$http.get('list_of_employee1')
    		  .then(function(responses)
    			{
    			  console.log(responses.data);
    			  $scope.listOfEmployee = responses.data;
	    		  }
    		  , function (responses)
    		  {
    		 
    		  }); 
    	};
    	$scope.deleteEmployee=function(employee_id,emp_first_name)
    	{
    		console.log("******  Deleting the status_type  *********");
    		console.log("employee_id = "+employee_id);
    		if (confirm("Are you sure you want to delete the Employee  "+emp_first_name+"?"))
            {
    			$http.post('delete_employee', employee_id)
         		  .then(function(responses){
  	       			  if( responses.data == 1 ){
  	       				$scope.employeeDeleteStatus="Employee  deleted Successfully";
  	       				console.log(responses.data);
  	       				$scope.showListOfEmployee();
  	       				
	  	       			$scope.EmployeeUniqueOrNot = '';
		  	      		$scope.EmployeeSaveStatus = '';
		  	      		$scope.EmployeeUpdateStatus = "updated";
  	       			  }
  	       			  else{
  	       				$scope.employeeDeleteStatus="Employee not deleted";
  	       				console.log(responses.data);
  	       			  }  
          		  }
         		  , function (responses)
         		  {
         		  
         		  }); 
            }
    	};
    	$scope.resetEmployee=function()
    	{
    		$scope.employeeUniqueOrNot = '';
    		$scope.employeeSaveStatus = '';
    		$scope.employeeDeleteStatus = '';
    					
    		$scope.employee.employee_id = '';
    		$scope.employee.employee_code = '';
    		$scope.employee.emp_first_name = '';
			$scope.employee.emp_mid_name = '';
			$scope.employee.emp_last_name = '';
    		$scope.employeeUpdateStatus = "updated";
    	};
    	$scope.viewEmployee=function(employee_id,employee_code,emp_first_name,emp_mid_name,emp_last_name)
    	{
    		$scope.employee.employee_id = employee_id;
    		$scope.employee.employee_code = employee_code;
    		$scope.employee.emp_first_name = emp_first_name;
			$scope.employee.emp_mid_name = emp_mid_name;
			$scope.employee.emp_last_name = emp_last_name;
    		
    		
    		$scope.employeeUniqueOrNot = '';
    		$scope.employeeSaveStatus = '';
    		$scope.employeeDeleteStatus = '';
    		$scope.employeeUpdateStatus = "updated";
    	};
    	$scope.editEmployee=function(employee_id,employee_code,emp_first_name,emp_mid_name,emp_last_name)
    	{
    		console.log("-------------- in editEmployee  -------------------");
    		$scope.employee.employee_id = employee_id;
    		$scope.employee.employee_code = employee_code;
    		$scope.employee.emp_first_name = emp_first_name;
			$scope.employee.emp_mid_name = emp_mid_name;
			$scope.employee.emp_last_name = emp_last_name;
    		
    		
    		$scope.employeeUniqueOrNot = '';
    		$scope.employeeSaveStatus = '';
    		$scope.employeeDeleteStatus = '';
    		$scope.employeeUpdateStatus = "update";
    	};
    	$scope.updateEmployee=function()
    	{
	    		var employeeData= {
	    			employee_id:$scope.employee.employee_id,
	    			employee_code:$scope.employee.employee_code.toUpperCase(),
	      			emp_first_name:$scope.employee.emp_first_name.toUpperCase(),
					emp_mid_name:$scope.employee.emp_mid_name.toUpperCase(),
					emp_last_name:$scope.employee.emp_last_name.toUpperCase()
	      			
	      	    } ;
    	  $http.post('update_employee', employeeData)
   		  .then(function(responses){
       			  if( responses.data == 1 ){
       				$scope.employeeSaveStatus="Employee updated Successfully";
       				console.log(responses.data);
       				$scope.showListOfEmployee();
       				$scope.employeeUpdateStatus = "updated";
       			  }
       			  else{
       				$scope.employeeSaveStatus="Employee  not updated";
       				console.log(responses.data);
       			  }  
    		  }
   		  , function (responses)
   		  {
   		  
   		  });   
    	};
    	/* ======================== Employee Controller Ends =================== */
    	/* ======================== Organisation Cluster Controller Ends =================== */
    	$scope.organisationCluster = {};
    	$scope.saveOrganisationCluster=function()
    	{
    	  var organisationClusterData= {
    			  org_cluster_name:$scope.organisationCluster.org_cluster_name.toUpperCase(),
    			  
    	    } ;
    	  console.log(organisationClusterData);
    	  $http.post('check_unique_org_cluster_name', organisationClusterData)
   		  .then(function(responses){
       			  if( responses.data){
       				$scope.organisationClusterUniqueOrNot=" Organisation Cluster already exists.";
       				console.log(responses.data);
       			  }
       			  else{
       				$scope.organisationClusterUniqueOrNot="";
	       			console.log(responses.data);
	       				
	       			$http.post('save_org_cluster', organisationClusterData)
	           		  .then(function(responses){
	    	       			  if( responses.data == 1 ){
	    	       				$scope.organisationClusterSaveStatus="Organisation Cluster added Successfully";
	    	       				console.log(responses.data);
	    	       				$scope.showlistOfOrganisationClusters();
	    	       			  }
	    	       			  else{
	    	       				$scope.organisationClusterSaveStatus="Organisation Cluster not added";
	    	       				console.log(responses.data);
	    	       			  }  
	            		  }
	           		  , function (responses)
	           		  {
	           		  
	           		  });   
       			  }  
    		  }
   		  , function (responses)
   		  {
   		  
   		  }); 
    	};
    	$scope.showlistOfOrganisationClusters=function()
    	{
    		console.log("-------------- in showListOfOrganisationClusters -------------------");
   			$http.get('list_of_organisation_clusters')
    		  .then(function(responses)
    			{
    			  console.log(responses.data);
    			  $scope.listOfOrganisationClusters = responses.data;
	    		  }
    		  , function (responses)
    		  {
    		 
    		  }); 
    	};
    	$scope.deleteOrganisationCluster=function(org_cluster_id,org_cluster_name)
    	{
    		console.log("******  Deleting the organisation cluster *********");
    		console.log("org_cluster_id = "+org_cluster_id);
    		if (confirm("Are you sure you want to delete the cluster "+org_cluster_name+"?"))
            {
    			$http.post('delete_org_cluster', org_cluster_id)
         		  .then(function(responses){
  	       			  if( responses.data == 1 ){
  	       				$scope.organisationClusterDeleteStatus="Cluster deleted Successfully";
  	       				console.log(responses.data);
  	       				$scope.showlistOfOrganisationClusters();
  	       			  }
  	       			  else{
  	       				$scope.organisationClusterDeleteStatus=" Organisation Cluster not deleted";
  	       				console.log(responses.data);
  	       			  }  
          		  }
         		  , function (responses)
         		  {
         		  
         		  }); 
            }
    	};
    	$scope.resetCluster=function(org_cluster_id,org_cluster_name)
    	{
    		console.log("-------------- in resetCluster -------------------");
    		$scope.organisationCluster.org_cluster_id = '';
    		$scope.organisationCluster.org_cluster_name = '';
    		
    		$scope.organisationClusterSaveStatus='';
    		$scope.organisationClusterDeleteStatus='';
    		$scope.organisationClusterUpdateStatus="updated";
    	};
    	$scope.viewOrganisationCluster=function(org_cluster_id,org_cluster_name)
    	{
    		console.log("-------------- in viewCluster -------------------");
    		$scope.organisationCluster.org_cluster_id = org_cluster_id;
    		$scope.organisationCluster.org_cluster_name = org_cluster_name;
    		
    		$scope.organisationClusterSaveStatus='';
    		$scope.organisationClusterDeleteStatus='';
    		$scope.organisationClusterUpdateStatus="updated";
    	};
    	$scope.editOrganisationCluster=function(org_cluster_id,org_cluster_name)
    	{
    		console.log("-------------- in edit_relationship -------------------");
    		$scope.organisationCluster.org_cluster_id = org_cluster_id;
    		$scope.organisationCluster.org_cluster_name = org_cluster_name;
			
    		$scope.organisationClusterSaveStatus='';
    		$scope.organisationClusterDeleteStatus='';
    		$scope.organisationClusterUpdateStatus="update";
    	};
    	$scope.updateOrganisationCluster=function()
    	{
    		var organisationClusterData= {
    				org_cluster_id:$scope.organisationCluster.org_cluster_id,
    				org_cluster_name:$scope.organisationCluster.org_cluster_name.toUpperCase()
      	    } ;
    	  
    	  $http.post('update_organisation_cluster', organisationClusterData)
   		  .then(function(responses){
       			  if( responses.data == 1 ){
       				$scope.organisationClusterSaveStatus="Organisation Cluster updated Successfully";
       				console.log(responses.data);
       				$scope.organisationClusterUpdateStatus="updated";
       				$scope.showlistOfOrganisationClusters();
       			  }
       			  else{
       				$scope.organisationClusterSaveStatus=" Organisation Cluster not updated";
       				console.log(responses.data);
       			  }  
    		  }
   		  , function (responses)
   		  {
   		  
   		  });   
    	};
    	/* ======================== Organisation Cluster Controller Ends =================== */
    	/* ======================== Zone Code Starts ================== */
    	$scope.zone = {};
    	$scope.save_zone=function()
    	{
    		
    	  var zoneData= {
    			  zone_short_code:$scope.zone.zone_short_code.toUpperCase(),
    			  zone_long_name:$scope.zone.zone_long_name.toUpperCase()
    	    } ;
    	  console.log($scope.zone.zone_short_code);
    	  console.log($scope.zone.zone_long_name);
    	  console.log(zoneData);
    	  
    	  $http.post('check_unique_zone_name', zoneData)
   		  .then(function(responses){
       			  if( responses.data){
       				$scope.zoneUniqueOrNot="Zone already exists.";
       				console.log(responses.data);
       			  }
       			  else{
       				$scope.zoneUniqueOrNot="";
	       				console.log(responses.data);
	       				$http.post('save_zone', zoneData)
	           		  .then(function(responses){
	    	       			  if( responses.data == 1 ){
	    	       				$scope.zoneSaveStatus="Zone added Successfully";
	    	       				console.log(responses.data);
	    	       				$scope.showListOfZones();
	    	       			  }
	    	       			  else{
	    	       				$scope.zoneSaveStatus="Zone not added";
	    	       				console.log(responses.data);
	    	       			  }  
	            		  }
	           		  , function (responses)
	           		  {
	           		  
	           		  });   
       			  }  
    		  }
   		  , function (responses)
   		  {
   		  
   		  }); 
    	};
    	$scope.showListOfZones=function()
    	{
    		console.log("-------------- in list_of_zones -------------------");
   			$http.get('list_of_zones')
    		  .then(function(responses)
    			{
    			  console.log(responses.data);
    			  $scope.listOfZones = responses.data;
	    		  }
    		  , function (responses)
    		  {
    		 
    		  }); 
    	};
    	$scope.delete_zone=function(zone_id,zone_long_name)
    	{
    		console.log("******  Deleting the zone  *********");
    		console.log("Zone_id = "+zone_id);
    		if (confirm("Are you sure you want to delete the zone "+zone_long_name+"?"))
            {
    			$http.post('delete_zone', zone_id)
         		  .then(function(responses){
  	       			  if( responses.data == 1 ){
  	       				$scope.zoneDeleteStatus="Zone deleted Successfully";
  	       				console.log(responses.data);
  	       				$scope.showListOfZones();
  	       			  }
  	       			  else{
  	       				$scope.zoneDeleteStatus="Zone not deleted";
  	       				console.log(responses.data);
  	       			  }  
          		  }
         		  , function (responses)
         		  {
         		  
         		  }); 
            }
    	};
    	$scope.reset_zone=function(id,code,name)
    	{
    		$scope.zoneUniqueOrNot = '';
    		$scope.zoneSaveStatus = '';
    		$scope.zoneDeleteStatus = '';
    					
    		$scope.zone.zone_id = '';
    		$scope.zone.zone_short_code = '';
    		$scope.zone.zone_long_name = '';
    	};
    	$scope.view_zone=function(id,code,name)
    	{
    		$scope.zone.zone_id = id;
    		$scope.zone.zone_short_code = code;
    		$scope.zone.zone_long_name = name;
    		
    		$scope.zoneUniqueOrNot = '';
    		$scope.zoneSaveStatus = '';
    		$scope.zoneDeleteStatus = '';
    	};
    	$scope.edit_zone=function(id,code,name)
    	{
    		console.log("-------------- in edit_zone -------------------");
    		console.log(id);
    		console.log(code);
    		console.log(name);
    		$scope.zone.zone_id = id;
    		$scope.zone.zone_short_code = code;
    		$scope.zone.zone_long_name = name;
    		$scope.zoneUpdateStatus = "update";
    		
    		$scope.zoneUniqueOrNot = '';
    		$scope.zoneSaveStatus = '';
    		$scope.zoneDeleteStatus = '';
    	};
    	$scope.update_zone=function()
    	{
    	  var zoneData= {
    		  zone_id:$scope.zone.zone_id,
    		  zone_long_name:$scope.zone.zone_long_name.toUpperCase(),
    		  zone_short_code:$scope.zone.zone_short_code.toUpperCase()
    	    } ;
    	  
    	  $http.post('update_zone', zoneData)
   		  .then(function(responses){
       			  if( responses.data == 1 ){
       				$scope.saveStatus="Zone updated Successfully";
       				console.log(responses.data);
       				$scope.showListOfZones();
       				$scope.zoneUpdateZones = "update";
       			  }
       			  else{
       				$scope.saveZones="Zone not updated";
       				console.log(responses.data);
       			  }  
    		  }
   		  , function (responses)
   		  {
   		  
   		  });   
    	};
    	/* ======================== Zone Code Ends ================== */
    });
