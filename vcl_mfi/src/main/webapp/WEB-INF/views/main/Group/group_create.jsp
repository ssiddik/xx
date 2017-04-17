<jsp:include page="../part/header.jsp"></jsp:include>
<jsp:include page="../part/nav.jsp"></jsp:include>

    
    <!-- Page content -->
        <div id="content" class="col-md-12" ng-app="myApp" ng-controller="myCtrl">
    
          <!-- page header -->
          <div class="pageheader">
            

            <h2><i class="fa fa-lightbulb-o" style="line-height: 48px;padding-left: 0;"></i> Group Allocation </h2>
            

            <div class="breadcrumbs">
              <ol class="breadcrumb">
                <li>You are here</li>
                <li><a href="index.html">Minimal</a></li>
                <li><a href="tables.html">Tables</a></li>
                <li class="active">DataTables</li>
              </ol>
            </div>


          </div>
          <!-- /page header -->
         <!-- content main container -->
          <div class="main">




            <!-- row -->
            <div class="row">

              
              <!-- col 12 -->
              <div class="col-md-6">
                
                
                <!-- tile -->
                <section class="tile transparent-black">
					 <!-- <input type="text" ng-model="abc"/> --> 
                         <div class="col-sm-6">
                         
                          <select ng-model="obj.branch_id" ng-change="GetRe()" ng-init="obj.branch_id='-1'" class="chosen-select chosen-transparent form-control" >
                            <option value="-1">Select Branch</option>
							<!-- <option value="0">All</option> -->
							<option value="1">Ranchi</option>
                            <option value="2">Kokar</option>
							<option value="3">Hatia</option>
                            <option value="4">Jamshedpur</option>
						  </select>
                           
                        </div>
                        
						<div class="col-sm-6">
                          <select class="chosen-select chosen-transparent form-control" ng-init="re_id='0'"  ng-change="GetMember()" ng-model="re_id">
                            <option value="0">Select RE</option>
                            <option ng-repeat="state in test"
												value="{{state.id}}">{{state.name}}</option>
                          </select>
                        </div>
                     
                </section>
                <!-- /tile -->
				</div>
				<button type="button" class="btn btn-amethyst margin-bottom-20">View</button>
				<button type="button" class="btn btn-info margin-bottom-20">Update</button>
				
				 <div class="col-md-12">
				 <!-- col 12 -->
                 <!-- tile -->
                <section class="tile transparent col-md-6">


                  <!-- tile header -->
                  <div class="tile-header transparent">
                    <h1><strong>Member</strong> List</h1>
                    
                    <div class="controls">
                      <a href="#" class="minimize"><i class="fa fa-chevron-down"></i></a>
                      <a href="#" class="refresh"><i class="fa fa-refresh"></i></a>
                    </div>
                  </div>
                  <!-- /tile header -->

                  <!-- tile body -->
                  <div class="tile-body color transparent-white rounded-corners">
                    
                      
                      
                    <div class="table-responsive">
                      <table  class="table table-custom">
                        <thead>
                          <tr>
							<th class="sort-numeric col-md-1"><input type="checkbox" value="1" id="opt01" ng-model="all"></th>
                            <th class="sort-alpha col-md-4">Member Name</th>
                            <th class="sort-numeric col-md-4">Center name</th>
                            <th class="sort-numeric col-md-2">Date</th>
                            <th class="sort-numeric col-md-1">Head</th>
                          </tr>
                        </thead>
                        <tbody ng-repeat="mb in getmemberDetails">
						 <tr class="odd gradeX">
                            <td class="text-center">
                            <!-- <input type="checkbox" ng-model="member.memberidmb.memberid"  ng-true-value="0" />  -->  
                            <input type="checkbox" name="member"  value="{{mb.memberid}}" ng-checked="all" />                   
 							</td>
                            <td class="">{{mb.membername}}</td>  
                            <td class="">{{mb.centername}}</td>
                            <td class="">{{mb.dates}}</td>
							<td class="actions text-center"><input type="radio" ng-model="head" name="head_mas" id="optionsRadios1" value="option1"></td>
                          </tr>
                       </tbody>
                       <tbody>
                       <tr>
                        	<td></td>
                       		<td></td>
                            <td></td>
                            <td></td>
                    		<td><button type="submit" class="btn btn-primary" ng-disabled="head" ng-click="SubmitForm()">Submit</button></td>
                       </tr>
                        </tbody>
                      </table>
                    </div>

                  </div>
                  <!-- /tile body -->
                


                </section>
                <!-- /tile -->

				
	 
               <section class="tile transparent col-md-6">


                  <!-- tile header -->
                  <div class="tile-header transparent">
                    <h1><strong>Group</strong> List</h1>
                    
                    <div class="controls">
                      <a href="#" class="minimize"><i class="fa fa-chevron-down"></i></a>
                      <a href="#" class="refresh"><i class="fa fa-refresh"></i></a>
                    </div>
                  </div>
                  <!-- /tile header -->

                  <!-- tile body -->
                  <div class="tile-body color transparent-white rounded-corners">
                    
                    <div class="table-responsive">
                        <div class="col-sm-6">
                        <select class="chosen-select chosen-transparent form-control" id="input07" ng-init="center_id='-1'" ng-change="GroupDetails()" ng-model="center_id">
                             <option value="-1">Select Center</option>
							<option ng-repeat="center in getCenterDetails" value="{{center.org_center_id}}">{{center.org_center_name}}</option>
						 </select>
                        </div>

                      <table  class="table table-custom">
                        <thead>
                          <tr>
							<th class="sort-numeric col-md-1">Select Group</th>
                            <th class="sort-alpha col-md-4">Group Name</th>
                            <th class="sort-numeric col-md-4">Date</th>
                              <th class="sort-numeric col-md-1">Member Count</th>
                          </tr>
                        </thead>
                        <tbody ng-repeat="grp in getGroupDetails">
						 <tr class="odd gradeX">
                            <td class="actions text-center"><input type="radio" name="group_name" id="optionsRadios1" value="option1">
                            <input type="hidden" ng-model="group_id"  value="{{grp.group_id}}">
                            </td>
                            <td class="">{{grp.group_name}} {{grp.group_id}}</td>
                              <td class="">{{grp.group_start_dt}}</td>
                            <td class="">
                            <div ng-if="grp.member_count=='1'" ><span class="badge badge-red" href="#myModal" data-toggle="modal" ng-click="getMemberByGrpID(grp.group_id)">{{grp.member_count}}</span></div>
                            <div ng-if="grp.member_count=='2'"><span class="badge badge-red" href="#myModal" data-toggle="modal" ng-click="getMemberByGrpID(grp.group_id)">{{grp.member_count}}</span></div>
                            <div ng-if="grp.member_count=='3'"><span class="badge badge-red" href="#myModal" data-toggle="modal" ng-click="getMemberByGrpID(grp.group_id)">{{grp.member_count}}</span></div>
                            <div ng-if="grp.member_count >='4'" ><span class="badge badge-green" href="#myModal" data-toggle="modal" ng-click="getMemberByGrpID(grp.group_id)">{{grp.member_count}}</span></div>
                           </td>
						 </tr>
                           </tbody>
                             <tr>
                          
                         <td> 
                         	<button class="btn btn-primary">
                         	<i aria-hidden="true">Create New Group</i></button>
                         	<!-- <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">Open Modal</button> -->
                        	<!--  <a type="submit" class="btn btn-primary" href="#modalDialog"></a> -->
                        </td>
                       <td></td>
                                 <td></td>
                                 <td></td>
						
                          </tr>

                       
                      </table>
                     
                    </div>
                    

                  </div>
                  <!-- /tile body -->
               
	


                </section>


</div>
              <!-- /col 12 -->


              
            </div>
            <!-- /row -->
          


          </div>
          <!-- /content container -->

 <!--  Modals -->
   <div id="myModal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
         <div ng-repeat="grp1 in getMemberDetailsDes|limitTo:1">
        <!-- <h4 class="modal-title">{{grp1.group_name}}</h4> -->
           <h3 class="modal-title" id="modalDialogLabel">
           <strong><small>{{grp1.group_name}}</small></strong>
           &nbsp; &nbsp; &nbsp; &nbsp;       <small>Center-  {{grp1.center_name}}</small>
           </h3>
         </div> 
        
      </div>
      <div class="modal-body">
        
         <div class="table-responsive">
                      <table  class="table table-custom">
                        <thead>
                          <tr>
							<th class="sort-alpha col-md-1">Sl NO.</th>
                            <th class="sort-alpha col-md-4">Member Name</th>
                            <th class="sort-numeric col-md-3">Group Head</th>
                          </tr>
                        </thead>
                        <tbody ng-repeat="grpD in getMemberDetailsDes">
						<tr class="odd gradeX">
                            <td>{{$index +1}}</td>
                            <td class="">{{grpD.member_name}}  {{grpD.member_id}} {{grpD.group_leader_id}}</td>
                            <td class="">
                             <div ng-if="grpD.member_id==grpD.group_leader_id">Y</div>
                            <div ng-if="grpD.member_id!=grpD.group_leader_id">N</div>
                            </td>
                          </tr>
                       </tbody>
                      </table>
                    </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>

		<!-- modal end -->	
</div>
        <!-- Page content end -->
    
<jsp:include page="../part/footer.jsp"></jsp:include>



<script>
var app = angular.module('myApp', []);

app.controller('myCtrl', function($scope,$http) {
$scope.obj={};
$scope.GetRe = function() 
{
	var data_branch= {
		          org_brnach_id:$scope.obj.branch_id
		      } ;
		
		 console.log(data_branch);		//$http.post('GetReList',data_branch)
			  $http.post('GetReList', data_branch)
	    		  .then(function (responsed)
	    				  {
	    			 			  console.log(responsed.data);
	    			  			 $scope.test = responsed.data;
	    		          }
	    		  , function (responsed)
	    		  {
	    		 
	    		  });	
			
		
	 }; // this script for getRE details
$scope.GetMember = function() 
{		
		 console.log("hellow sahed"+$scope.re_id);
		 var data_re= 
		 {
		    employee_id:$scope.re_id
		 };
		console.log("object here"+data_re);		
		$http.post('GetMemberDetails', data_re)
	    .then(function (responsed)
	     { 
	    	console.log("success "+responsed.data);
	    	$scope.getmemberDetails = responsed.data;
	    	
	     }
	     ,function (responsed)
	      { 
	    	 console.log("error "+responsed);
	       });	
		   $http.post('GetCrenterDetails', data_re)
    	   .then(function (responsed)
    		 {
    			  console.log("success "+responsed.data);
    		    	 $scope.getCenterDetails = responsed.data;
    		 }
    		 ,function (responsed)
    		  {
    			  console.log("error "+responsed);
    		  });	
 }; // get member details

 $scope.GroupDetails = function() 
 {  console.log("hellow center id"+$scope.center_id);
	 var data_center_id= {
			 org_center_id:$scope.center_id
	      } ;
	  console.log("object here"+data_center_id);		
		  $http.post('GetGroupDetails', data_center_id)
    		  .then(function (responsed)
    				  {
    			 			 console.log("success group details"+responsed.data);
    			  			 $scope.getGroupDetails = responsed.data;
    		          }
    		  , function (responsed)
    		  {
    			  console.log("error sahed "+responsed);
    		  });	
};  
	 



$scope.getMemberByGrpID = function(group_id) 
{  console.log("hello"+group_id);
	  var data_group_id= {
			  group_id:group_id
	      } ;
	  console.log("object here"+data_group_id);		
		  $http.post('GetMemberDetailsAspergroupId', data_group_id)
   		  .then(function (responseds)
   				  {
   			 			 console.log("success member details"+JSON.stringify(responseds.data) );
   			  			 $scope.getMemberDetailsDes = responseds.data;
   			  		    // $scope.getMemberDetailsDes2 = responseds.data;
   			  		//console.log("success member details"+JSON.stringify($scope.getMemberDetailsDes2) );
   		          }
   		  , function (responseds)
   		  {
   			  console.log("error sahed "+responseds);
   		  });
}; 
	 
$scope.SubmitForm= function()
{
	SubmitForms();
	console.log("Hello its here ");
	  $scope.member ={}; 
	  $scope.member =$scope.member;
	  console.log("hi"+JSON.stringify($scope.member));
	  
	  var selected = $scope.getGroupDetails.filter(function(item) 
			    {return item.member
			    }).map(function(item)
			    { return item.name;
			    })
/* 	  angular.forEach($scope.mb, function(mb){
	   if (!!mb.selected) $scope.member.push(mb.memberid);
	    console.log("Hello "+mb.selected);
	  }) */
};


});	
		
/* $scope.SubmitForm= function()
{
	console.log("Hello its here ");
	  $scope.albumNameArray = [];
	  angular.forEach($scope.mb, function(mb){
	    if (!!mb.selected) $scope.albumNameArray.push(mb.memberid);
	    console.log("Hello "+mb.selected);
	  })
};
 */
	/* // alternatively you can use Array.prototype.filter on newer browsers (IE 9+)
	 $scope.save = function(){
	  $scope.albumNameArray = $scope.mb.filter(function(mb){
		  console.log("Hello "+mb.selected);
	    return mb.selected;
	  });
	} */
</script>