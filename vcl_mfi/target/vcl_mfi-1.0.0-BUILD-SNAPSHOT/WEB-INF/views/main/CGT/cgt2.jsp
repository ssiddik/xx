<jsp:include page="../part/header.jsp"></jsp:include>
<jsp:include page="../part/nav.jsp"></jsp:include>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
        <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
        
        <!-- Page content -->
        <div id="content" class="col-md-12" ng-app="myApp" ng-controller="myCtrl">
          

<!-- page header -->
          <div class="pageheader">
            

            <h2><i class="fa fa-lightbulb-o" style="line-height: 48px;padding-left: 0;"></i> CGT Views </h2>
            

            <div class="breadcrumbs">
              <ol class="breadcrumb">
                <li>You are here</li>
                <li><a href="#">Minimal</a></li>
                <li><a href="#">Tables</a></li>
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
					
                         <div class="col-sm-4">
                          <select ng-model="obj.branch_id" ng-click="GetRe()"  ng-init="obj.branch_id='-1'" class="chosen-select chosen-transparent form-control" id="input07">
                             <option value="-1">Select Branch</option>
							 <option value="1">Ranchi</option>
                             <option value="2">Kokar</option>
							 <option value="3" >Hatia</option>
                             <option value="4">Jamshedpur</option>
							<%--  <c:forEach var="bl" items="${branch_list}">
					      <option value="${bl.getOrg_brnach_id() }">${bl.getBranch_name() }</option>
							
							 </c:forEach> --%>
							
							
                          </select>
                           
                        </div>
                        <div class="col-sm-4">
                          <select class="chosen-select chosen-transparent form-control" ng-click="GetMember()" ng-init="re_id='-1'"   ng-model="re_id">
                            <option value="-1">Select RE</option>
                            <option ng-repeat="state in test"
							value="{{state.id}}">{{state.name}}</option>
                          </select>
                        </div>
						
						<div class="col-sm-4">
                          <select class="chosen-select chosen-transparent form-control" ng-click="GroupDetails()" ng-init="center_name='-1'"  ng-model="center_name">
                             <option value="-1">Select Center</option>
							<option ng-repeat="center in getCenterDetails" value="{{center.org_center_id}}">{{center.org_center_name}}</option>
						 </select>
                        </div>
                </section>
				
                <!-- /tile -->
				</div>
				<button type="button" class="btn btn-amethyst margin-bottom-20">View</button>
				<button type="button" class="btn btn-info margin-bottom-20">Update</button>
				
				 <div class="col-md-12">
				 <!-- col 12 -->
				 	
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
                        
                         <table  class="table table-custom">
                        <thead>
                          <tr>
							<th class="sort-numeric col-md-1">Select</th>
                            <th class="sort-alpha col-md-3">Group Name</th>
                            <th class="sort-numeric col-md-1">CGT</th>
                            <th class="sort-numeric col-md-1">GRT</th>
                            <th class="sort-numeric col-md-1">BLC</th>
							<th class="sort-numeric col-md-1">LA</th>
                            <th class="sort-numeric col-md-1">Pre</th>
                            <th class="sort-numeric col-md-1">Post</th>
                          </tr>
                        </thead>
                        <tbody  ng-repeat="grp in getMemberList" >
						 
						<tr class="odd gradeX">
                            <td class="text-center"><input type="radio" value="1" id="opt01" checked=""></td>
                            <td class="">{{grp.group_name}} {{grp.group_id}} {{grp.cgt}} {{grp.cgt}} </td>
                            <td><a ng-click="getMemberByGrpID(grp.group_id,'CGT')"><i class="fa fa-book fa-2x" style="color:gold"></i><span ng-if="grp.cgt=='1'"><i class="fa fa-check" aria-hidden="true"></i></span></a></td>
                            <td><a ng-click="getMemberByGrpID(grp.group_id,'GRT')"><i class="fa fa-database fa-2x" style="color:orange"></i><span ng-if="grp.grt=='1'"><i class="fa fa-check" aria-hidden="true"></i></span></a></td>
						    <td><i class="fa fa-file-archive-o fa-2x"style="color:Coral"></i><span ng-if="grp.blc=='1'"><i class="fa fa-check" aria-hidden="true"></i></span></td>
						    <td><i class="fa fa-file-text-o fa-2x"style="color:Crimson "></i><span ng-if="grp.loan_application=='1'"><i class="fa fa-check" aria-hidden="true"></i></span></td>
							<td><i class="fa fa-clipboard fa-2x"style="color:greenyellow"></i><span ng-if="grp.pre_sanction=='1'"><i class="fa fa-check" aria-hidden="true"></i></span></td>
							<td><i class="fa fa-folder-o fa-2x"style="color:lightgreen"></i><span ng-if="grp.post_sanction=='1'"><i class="fa fa-check" aria-hidden="true"></i></span></td>
                         </tr>
                        </tbody>
                      </table> 
                        
                     
                     
                    </div>
                    

                  </div>
                  <!-- /tile body -->
               


                </section>
                
                <!--  section start here -->
                 <!-- tile -->
                <section ng-if="parameter=='CGT'" class="tile transparent col-md-6">

                
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
							 <th class="sort-alpha col-md-1">SL No.</th>
                            <th class="sort-alpha col-md-4">Member Name</th>
                            <th class="sort-numeric col-md-1">Status</th>
                            <th class="sort-numeric col-md-2">Reason</th>
                           
                          </tr>
                        </thead>
                        <tbody ng-repeat="grpD in getMemberDetailsDes">
						 
						 <tr class="odd gradeX">

                            <td>{{$index +1}}</td>
                            <td class="">{{grpD.member_name}}</td>
                            <td><div class="onoffswitch labeled greensea">
                                  <input type="checkbox" name="yesnoswitch" class="onoffswitch-checkbox" id="myonoffswitch11{{$index +1}}" checked>
                                  <label class="onoffswitch-label" for="myonoffswitch11{{$index +1}}">
                                  <span class="onoffswitch-inner"></span>
                                  <span class="onoffswitch-switch"></span>
                                  </label>
                                </div>
                           </td>
                            <td div class="col-sm-4">
                        <select class="chosen-select chosen-transparent form-control" id="input07">
                             <option>Select Reason</option>
							<option>All</option>
							<option>Reason 1</option>
                            <option>Reason 2</option>
							<option>Reason 3</option>
                            <option>Reason 4</option>
						 </select>
                        </div></td>
							
                          </tr>
                          </tbody>
                            <tr class="odd gradeX">
                            <td></td>
                            <td class=""><h4>Status</h4></td>
                           
                            <td> <div class="onoffswitch labeled greensea">
                                  <input type="checkbox" name="yesnoswitch" class="onoffswitch-checkbox" id="myonoffswitch15" checked>
                                  <label class="onoffswitch-label" for="myonoffswitch15">
                                    <span class="onoffswitch-inner"></span>
                                    <span class="onoffswitch-switch"></span>
                                  </label>
                                </div></td>
								<td div class="col-sm-4">
                        <select class="chosen-select chosen-transparent form-control" id="input07">
                             <option>Select Reason</option>
							<option>All</option>
							<option>Reason 1</option>
                            <option>Reason 2</option>
							<option>Reason 3</option>
                            <option>Reason 4</option>
						 </select>
                        </div></td>
                          </tr>
                     
 					</table>
                    </div>

                  </div>
                  <!-- /tile body -->
                 
                  

                </section>
                <!-- /tile -->
                
                
                
                 <!-- tile -->
                <section ng-if="parameter=='GRT'" class="tile transparent col-md-6">


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
							 <th class="sort-alpha col-md-1">SL No.</th>
							 <th class="sort-alpha col-md-4">Member Name</th>
							 <th class="sort-alpha col-md-1">GRT</th>
                            <th class="sort-numeric col-md-1">Status</th>
                            <th class="sort-numeric col-md-2">Reason</th>
                           
                          </tr>
                        </thead>
                        <tbody ng-repeat="gi in grt_member_list">
						 
						
						
                          <tr class="odd gradeX">
                            <td>{{$index+1}}</td>
                            <td class="">{{gi.member_name}}</td>
							<td>
							
							     <span class="badge badge-red" href="#myModal" data-toggle="modal" ng-click="set_member(gi.member_id)"><i class="fa fa-file-text-o fa-lg"style="color:aqua"></i></span>
							 </td>
                            <td> <div class="onoffswitch labeled greensea">
                                  <input type="checkbox" name="yesnoswitch" class="onoffswitch-checkbox" id="myonoffswitch11" checked>
                                  <label class="onoffswitch-label" for="myonoffswitch11">
                                    <span class="onoffswitch-inner"></span>
                                    <span class="onoffswitch-switch"></span>
                                  </label>
                             
                                </div></td>
                            <td div class="col-sm-4">
                        <select ng-init="get_Reason('GRT')" class="chosen-select chosen-transparent form-control"  id="input07" ng-model="reason">
                             <option value="0">Select Reason</option>
							 
							<option ng-repeat="ri in get_reason_listss" value="{{ri.reason_id}}">{{ri.reason_description}}</option>
                            
						 </select>
                        </div></td>
							
                          </tr>
                        
						  
						   
                      </table>
                    </div>

                  </div>
                  <!-- /tile body -->
                


                </section>
                <!--  end here  -->

				
			




				


				

     

               


              </div>
              <!-- /col 12 -->


              
            </div>
            <!-- /row -->
          


          </div>
          <!-- /content container -->


 <!--  Modals -->
   <div id="myModal" class="modal fade" role="dialog">
  <div class="modal-dialog" style="width: 900px;">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
         <div >
        <!-- <h4 class="modal-title">{{grp1.group_name}}</h4> -->
           <h3 class="modal-title" id="modalDialogLabel">
           <strong><small> </small></strong>
           
           </h3>
         </div> 
        
      </div>
      <div class="modal-body">
        
          <section class="tile color transparent-white"  style="background:currentColor">



                  <!-- tile header -->
                  <div class="tile-header">
                    <h1><strong>GRT</strong> Details</h1>
                   
                  </div>
                  <!-- /tile header -->

                  
                  <!-- tile body -->
				  
                  <div class="tile-body nopadding">
                    
                      <table class="table table-bordered ">

                      <thead>
                        <tr>
                          <th class="sort-alpha col-md-1">Select</th>
                          <th class="sort-alpha col-md-4">Name</th>
                          <th class="sort-alpha col-md-3">Occupation</th>
                          <th class="sort-alpha col-md-4">Gross Income</th>
                         
                        </tr>
                      </thead>
                      <tbody>
					  
                         <tr>
                          <td>
                            A
                          </td>
                          <td>  <div class="form-group">
                       
                        <div class="col-sm-10">
                          <input type="text" ng-model="earning_membery.family_mem_name" class="form-control" id="input01">
                        </div>
                      </div></td>
                          <td><div class="form-group">
                       
                        <div class="col-sm-12">
                          <select class="chosen-select chosen-transparent form-control" id="input07" ng-model="earning_membery.occupation">
						    <option value="0">Select Occupation</option>
                            <option value="1">Service</option>
							<option  value="2">Business</option>
                            
                          </select>
                         
                        </div>
                      </div></td>
                        <td>  <div class="form-group">
                       
                        <div class="col-sm-8">
                          <input type="text" ng-model="earning_membery.gross_income" class="form-control" id="input01">
                        </div>
                      </div></td>
                          
                        </tr>
 <tr>
                          <td>
                            B
                          </td>
                          <td>  <div class="form-group">
                       
                        <div class="col-sm-10">
                          <input type="text" ng-model="earning_membery1.family_mem_name" class="form-control" id="input01">
                        </div>
                      </div></td>
                          <td><div class="form-group">
                       
                        <div class="col-sm-12">
                          <select class="chosen-select chosen-transparent form-control" id="input07" ng-model="earning_membery1.occupation">
                       <option value="0">Select Occupation</option>
                            <option value="1">Service</option>
							<option  value="2">Business</option>
                          </select>
                         
                        </div>
                      </div></td>
					   <td>  <div class="form-group">
                       
                        <div class="col-sm-8">
                         <input type="text" ng-model="earning_membery1.gross_income" class="form-control" id="input01">
                        </div>
                      </div></td>
                        <tr>
                          <td>
                            C
                          </td>
                          <td>  <div class="form-group">
                       
                        <div class="col-sm-10">
                          <input type="text"  ng-model="earning_membery2.family_mem_name" class="form-control" id="input01">
                        </div>
                      </div></td>
                         <td><div class="form-group">
                       
                        <div class="col-sm-12">
                          <select class="chosen-select chosen-transparent form-control" id="input07" ng-model="earning_membery2.occupation">
                      <option value="0">Select Occupation</option>
                            <option value="1">Service</option>
							<option  value="2">Business</option>
                          </select>
                         
                        </div>
                      </div></td>
                        <td>  <div class="form-group">
                       
                        <div class="col-sm-8">
                          <input type="text" ng-model="earning_membery2.gross_income" class="form-control" id="input01">
                        </div>
                      </div></td>
                          
                        </tr>
						<tr>
                          <td>
                            D
                          </td>
                          <td>  <div class="form-group">
                       
                        <div class="col-sm-10">
                          <input type="text"  ng-model="earning_membery3.family_mem_name" class="form-control" id="input01">
                        </div>
                      </div></td>
                        <td><div class="form-group">
                       
                        <div class="col-sm-12">
                          <select class="chosen-select chosen-transparent form-control" id="input07" ng-model="earning_membery3.occupation">
                            <option value="0">Select Occupation</option>
                            <option value="1">Service</option>
							<option  value="2">Business</option>
                          </select>
                         
                        </div>
                      </div></td>
                        <td>  <div class="form-group">
                       
                        <div class="col-sm-8">
                          <input type="text" ng-model="earning_membery3.gross_income" class="form-control" id="input01">
                        </div>
                      </div></td>
                          
                        </tr>
						<tr>
                          <td>
                           E
                          </td>
                          <td>  <div class="form-group">
                       
                        <div class="col-sm-10">
                          <input type="text"  ng-model="earning_membery4.family_mem_name" class="form-control" id="input01">
                        </div>
                      </div></td>
                          <td><div class="form-group">
                       
                        <div class="col-sm-12">
                          <select class="chosen-select chosen-transparent form-control" id="input07" ng-model="earning_membery4.occupation">
                    <option value="0">Select Occupation</option>
                            <option value="1">Service</option>
							<option  value="2">Business</option>
                          </select>
                         
                        </div>
                      </div></td>
                        <td>  <div class="form-group">
                       
                        <div class="col-sm-8">
                         <input type="text" ng-model="earning_membery4.gross_income" class="form-control" id="input01">
                        </div>
                      </div></td>
                          
                        </tr>
                        </tr>
                      </tbody>
					       <div class="tile-header">
                    <h1><strong>Earning </strong> Details</h1>
                   
                  </div>
                  <!-- /tile header -->

                  <!-- tile body -->
                
				
                    
                    <table class="table table-bordered table-sortable">
                      <thead>
                        <tr>
                          <th>Select</th>
                          <th>Expense Type</th>
                          <th>Amount</th>
                        </tr>
						
                      </thead>
                      <tbody>
                        <tr>
                         <td>
                            <div class="checkbox check-transparent">
                              <input type="checkbox" value="1"    id="chck02">
                              <label for="chck02"></label>
                            </div>
                          </td>
                          <td>Fooding</td>
                         
                        <td>  <div class="form-group">
                       
                        <div class="col-sm-8">
                          <input type="text"  ng-model="expanse.fooding_expanse" class="form-control" id="input01">
                        </div>
                      </div></td>
                          
                        </tr>
						<tr>
						<td><div class="checkbox check-transparent">
                              <input type="checkbox" value="1" id="chck02">
                              <label for="chck02"></label>
                            </div></td>
							<td>Education</td>
							<td><div class="form-group">
                       
                        <div class="col-sm-8">
                          <input type="text" ng-model="expanse.education_expanse" class="form-control" id="input01">
                        </div>
                      </div></td>
					  
					  </tr>
					  <tr>
						<td><div class="checkbox check-transparent">
                              <input type="checkbox" value="1" id="chck02">
                              <label for="chck02"></label>
                            </div></td>
							<td>Rent</td>
							<td><div class="form-group">
                       
                        <div class="col-sm-8">
                          <input type="text"  ng-model="expanse.rent_expanse"  class="form-control" id="input01">
                        </div>
                      </div></td>
					  
					  </tr>
					  <tr>
						<td><div class="checkbox check-transparent">
                              <input type="checkbox" value="1" id="chck02">
                              <label for="chck02"></label>
                            </div></td>
							<td>Medical</td>
							<td><div class="form-group">
                       
                        <div class="col-sm-8">
                          <input type="text" ng-model="expanse.medical_expanse" class="form-control" id="input01">
                        </div>
                      </div></td>
					  
					  </tr>
					  <tr>
						<td><div class="checkbox check-transparent">
                              <input type="checkbox" value="1" id="chck02">
                              <label for="chck02"></label>
                            </div></td>
							<td>Loan Repayment</td>
							<td><div class="form-group">
                       
                        <div class="col-sm-8">
                          <input type="text" ng-model="expanse.loan_repayment_expanse" class="form-control" id="input01">
                        </div>
                      </div></td>
					  
					  </tr>
					  <tr>
						<td><div class="checkbox check-transparent">
                              <input type="checkbox" value="1" id="chck02">
                              <label for="chck02"></label>
                            </div></td>
							<td>Other</td>
							<td><div class="form-group">
                       
                        <div class="col-sm-8">
                          <input type="text"  ng-model="expanse.other_expanse" class="form-control" id="input01">
                        </div>
                      </div></td>
					  
					  </tr>
					 <tr>
						<td><div class="checkbox check-transparent">
                              <input type="checkbox" value="1" id="chck02">
                              <label for="chck02"></label>
                            </div></td>
							<td><h4>Total</h4></td>
							<td><div class="form-group">
                       
                        <div class="col-sm-8">
                          <input type="text" class="form-control" ng-model="total" id="input01">
                        </div>
                      </div></td>
					   
					  </tr>
					  
					  </table>
					   <!-- tile body -->
                 
				  <div class="tile-body nopadding">
                    
                    <table class="table table-bordered table-sortable">
                      <thead>
                        <tr>
                          <th>Type</th>
                          <th>Status</th>
                         
                        </tr>
						
                      </thead>
                      <tbody>
                        <tr>
                        
                          <td>Company Policy</td>
                    
                      <td><div class="col-sm-6">
					       <input type="hidden" ng-model="para.train_pram_id1" ng-value="1"  ng-init="para.train_pram_id1='0'"/>
                          <select  ng-init="para.train_pram_val1='0'" class="chosen-select chosen-transparent form-control" id="input07" ng-model="para.train_pram_val1">
                          <option value="0">Select </option>
							<option value="1">Good</option>
							<option value="2">Average</option>
                            <option value="3">Below Average</option>
							
                          </select>
                           
                        </div></td>
                          
                        </tr>
						<tr>
							<td>Group Cohesiveness</td>
							<td><div class="col-sm-6">
							 <input type="hidden" ng-model="para.train_pram_id2" ng-value="2" ng-init="para.train_pram_id2='2'" />
                          <select ng-init="para.train_pram_val2='0'" class="chosen-select chosen-transparent form-control" id="input07" ng-model="para.train_pram_val2">
                       <option value="0">Select </option>
							<option value="1">Good</option>
							<option value="2">Average</option>
                            <option value="3">Below Average</option>
                          </select>
                           
                        </div></td>
					  
					  </tr>
					  <tr>
						
							<td>Discipline</td>
							<td><div class="col-sm-6">
							     <input type="hidden" ng-model="para.train_pram_id3" ng-value="3" ng-init="para.train_pram_id3='0'"/>
                          <select  ng-init="para.train_pram_val3='0'" class="chosen-select chosen-transparent form-control" id="input07" ng-model="para.train_pram_val3">
                             <option value="0">Select </option>
							<option value="1">Good</option>
							<option value="2">Average</option>
                            <option value="3">Below Average</option>
							
                          </select>
                           
                        </div></td>
					  
					  </tr>
                      
                        </tbody>
				
					  </table>
                   </div>
				  </div>
				  <div class="tile-body">
				  <button type="submit" class="btn btn-greensea" ng-click="grt_submit()">Submit</button>
				  </div>
                  <!-- /tile body -->
                

</div>
                    </table>

                  </div>
				  
                 
                </section>
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
	console.log("function call  sahed "+$scope.obj.branch_id);	

	var data_branch= {
		          org_brnach_id:$scope.obj.branch_id
		      } ;
		
		 console.log("sahed "+data_branch);		//$http.post('GetReList',data_branch)
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
		 {		
		 		 console.log("hellow center id"+$scope.center_name);
		 		 var data_re = 
		 		 {
		 			org_center_id:$scope.center_name
		 		 };
		 		console.log("object here"+data_re);		
		 		$http.post('GroupListWithcgtGrt', data_re)
		     	   .then(function (responsed)
		     		 {
		     			  console.log("success "+responsed.data);
		     		      $scope.getMemberList = responsed.data;
		     		 }
		     		 ,function (responsed)
		     		  {
		     			  console.log("error "+responsed);
		     		  });	
		  }; // get member details
		  
		  $scope.getMemberByGrpID = function(group_id,parameter) 
		  { 
			  $scope.group_id=group_id;
			  $scope.parameter=parameter;
			  if(parameter=='CGT')
				  {
				  
				  console.log("hello"+group_id);
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
				  }
			  
			  if(parameter=='GRT')
				  {
				     
				  console.log("hello"+group_id);

			  	  var data= {
			  			  group_id:group_id
			  	      } ;
				  
				 
			  $http.post('grt_get_member_list', data)
     		  .then(function (responseds)
     				  {
     			 			  
     			  			 $scope.grt_member_list = responseds.data;
							 
							 $scope.len=$scope.grt_member_list.length;
							// alert($scope.grt_member_list.length);
     			  		 
     		          }
     		  , function (responseds)
     		  {
     			  console.log("error siddik "+responseds);
     		  });	
			  
			   }
		  };
			  
			     $scope.grt_main={};// main json
			     $scope.grt_main.grt_Members=[];//main json 
			     $scope.count=0;
			     $scope.grt={};
			     $scope.grt.earning_member_details=[];
			     $scope.grt.expanse={};
				 
				 $scope.grt2={};
			     $scope.grt2.earning_member_details=[];
			     $scope.grt2.expanse={};
				 
				 $scope.grt3={};
			     $scope.grt3.earning_member_details=[];
			     $scope.grt3.expanse={};
				 
				 $scope.grt4={};
			     $scope.grt4.earning_member_details=[];
			     $scope.grt4.expanse={};
				 
				 $scope.grt5={};
			     $scope.grt5.earning_member_details=[];
			     $scope.grt5.expanse={};
				 
				 
				   /*  below code static  for all grt*/
				  $scope.para={};
				  $scope.earning_membery={
			  family_mem_name:null,
			  occupation:null,
			  gross_income:null};
				 
				 $scope.earning_membery1={
			  family_mem_name:null,
			  occupation:null,
			  gross_income:null};
			 
			  $scope.earning_membery2={
			  family_mem_name:null,
			  occupation:null,
			 gross_income:null};
			  $scope.earning_membery3={
			  family_mem_name:null,
			  occupation:null,
			 gross_income:null};
			  $scope.earning_membery4={
			  family_mem_name:null,
			  occupation:null,
			 gross_income:null};
				 
			  /* submit grt start here */
			  $scope.grt_submit=function()
			  {
				
	  /* for submit */ 
	            $scope.count++;
				
	            
	 
			  //$scope.grt={};
			  $scope.grt_main.grp_id=$scope.group_id;
			  $scope.grt_main.grp_grt_result=0;
			  $scope.grt_main.grt_cmpt_date=0;
			  $scope.grt_main.grp_reason_code=0;
			  $scope.grt_main.longi=44444;
	          $scope.grt_main.leti=2222;
			 
         
			 if($scope.count==1)
			 {
			      $scope.len--;
			      $scope.grt.train_pram_id1=$scope.para.train_pram_id1;  $scope.grt.train_pram_val1=$scope.para.train_pram_val1; 
			      $scope.grt.train_pram_id2=$scope.para.train_pram_id2;  $scope.grt.train_pram_val2=$scope.para.train_pram_val2;
		          $scope.grt.train_pram_id3=$scope.para.train_pram_id3;  $scope.grt.train_pram_val3=$scope.para.train_pram_val3; 
			      $scope.grt.member_id=$scope.member_id;
		          $scope.earning_membery00=$scope.earning_membery;
			      $scope.earning_membery11=$scope.earning_membery1;
				  $scope.earning_membery22=$scope.earning_membery2
				  $scope.earning_membery33=$scope.earning_membery3
				  $scope.earning_membery44=$scope.earning_membery4
				  
			 
				 $scope.grt.earning_member_details = $scope.grt.earning_member_details.concat($scope.earning_membery00,$scope.earning_membery11,$scope.earning_membery22,$scope.earning_membery33,$scope.earning_membery44);
				  $scope.expanseg=$scope.expanse;
				 $scope.grt.expanse = $scope.expanseg;
				 
				 if($scope.len==0)
				 {
					  $scope.grt_main.grt_Members=$scope.grt_main.grt_Members.concat($scope.grt);
					  console.log(JSON.stringify($scope.grt_main));
				 }
		 /* second time calling  set angain value null*/
		      $scope.earning_membery={};
		      $scope.earning_membery1={};
			  $scope.earning_membery2={};
			  $scope.earning_membery3={};
			  $scope.earning_membery4={};
			  $scope.expanse={};
			  $scope.member_id=0;
			  $scope.para={};
			
		 //$scope.grt_main.grt_Members=$scope.grt_main.grt_Members.concat($scope.grt);
		 }
		    	 if($scope.count==2)
		        { 
	              $scope.grt2.member_id=$scope.member_id;
				  $scope.earning_membery00=$scope.earning_membery;
				  $scope.earning_membery11=$scope.earning_membery1;
				  $scope.earning_membery22=$scope.earning_membery2
				  $scope.earning_membery33=$scope.earning_membery3
				  $scope.earning_membery44=$scope.earning_membery4
 
					$scope.grt2.train_pram_id1=$scope.para.train_pram_id1;  $scope.grt2.train_pram_val1=$scope.para.train_pram_val1; 
					$scope.grt2.train_pram_id2=$scope.para.train_pram_id2;  $scope.grt2.train_pram_val2=$scope.para.train_pram_val2;
					 $scope.grt2.train_pram_id3=$scope.para.train_pram_id3;  $scope.grt2.train_pram_val3=$scope.para.train_pram_val3; 
					 
					$scope.grt2.earning_member_details = $scope.grt2.earning_member_details.concat($scope.earning_membery00,$scope.earning_membery11,$scope.earning_membery22,$scope.earning_membery33,$scope.earning_membery44);
				   $scope.grt2.expanse = $scope.expanse;
					$scope.len--;
				   if($scope.len==0)
				   {
					  $scope.grt_main.grt_Members=$scope.grt_main.grt_Members.concat($scope.grt,$scope.grt2);
					  console.log(JSON.stringify($scope.grt_main));
				   }
	      /* second time calling  set angain value null*/
		      $scope.earning_membery={};
		      $scope.earning_membery1={};
			  $scope.earning_membery2={};
			  $scope.earning_membery3={};
			  $scope.earning_membery4={};
			  $scope.expanse={};
			  $scope.member_id=0;
			  $scope.para={};
		 
	          }
			  
			   if($scope.count==3)
		        { 
	              $scope.grt3.member_id=$scope.member_id;
				  $scope.earning_membery00=$scope.earning_membery;
				  $scope.earning_membery11=$scope.earning_membery1;
				  $scope.earning_membery22=$scope.earning_membery2
				  $scope.earning_membery33=$scope.earning_membery3
				  $scope.earning_membery44=$scope.earning_membery4
 
					  $scope.grt3.train_pram_id1=$scope.para.train_pram_id1;  $scope.grt3.train_pram_val1=$scope.para.train_pram_val1; 
					 $scope.grt3.train_pram_id2=$scope.para.train_pram_id2;  $scope.grt3.train_pram_val2=$scope.para.train_pram_val2;
					 $scope.grt3.train_pram_id3=$scope.para.train_pram_id3;  $scope.grt3.train_pram_val3=$scope.para.train_pram_val3; 
					 
					$scope.grt3.earning_member_details = $scope.grt3.earning_member_details.concat($scope.earning_membery00,$scope.earning_membery11,$scope.earning_membery22,$scope.earning_membery33,$scope.earning_membery44);
				    $scope.grt3.expanse = $scope.expanse;
				   
					$scope.len--;
				   if($scope.len==0)
				   {
					  $scope.grt_main.grt_Members=$scope.grt_main.grt_Members.concat($scope.grt,$scope.grt2,$scope.grt3);
					  console.log(JSON.stringify($scope.grt_main));
				   }
				   /* second time calling  set angain value null*/
		      $scope.earning_membery={};
		      $scope.earning_membery1={};
			  $scope.earning_membery2={};
			  $scope.earning_membery3={};
			  $scope.earning_membery4={};
			  $scope.expanse={};
			  $scope.member_id=0;
			  $scope.para={};
	 
		 
	          }
			  
			 
			    if($scope.count==4)
		        { 
	              $scope.grt4.member_id=$scope.member_id;
				  $scope.earning_membery00=$scope.earning_membery;
				  $scope.earning_membery11=$scope.earning_membery1;
				  $scope.earning_membery22=$scope.earning_membery2
				  $scope.earning_membery33=$scope.earning_membery3
				  $scope.earning_membery44=$scope.earning_membery4
 
					  $scope.grt4.train_pram_id1=$scope.para.train_pram_id1;  $scope.grt4.train_pram_val1=$scope.para.train_pram_val1; 
					 $scope.grt4.train_pram_id2=$scope.para.train_pram_id2;  $scope.grt4.train_pram_val2=$scope.para.train_pram_val2;
					 $scope.grt4.train_pram_id3=$scope.para.train_pram_id3;  $scope.grt4.train_pram_val3=$scope.para.train_pram_val3; 
					 
					$scope.grt4.earning_member_details = $scope.grt4.earning_member_details.concat($scope.earning_membery00,$scope.earning_membery11,$scope.earning_membery22,$scope.earning_membery33,$scope.earning_membery44);
				    $scope.grt4.expanse = $scope.expanse;
				   
					$scope.len--;
				   if($scope.len==0)
				   {
					  $scope.grt_main.grt_Members=$scope.grt_main.grt_Members.concat($scope.grt,$scope.grt2,$scope.grt3,$scope.grt4);
					  console.log(JSON.stringify($scope.grt_main));
				   }
				   /* second time calling  set angain value null*/
		      $scope.earning_membery={};
		      $scope.earning_membery1={};
			  $scope.earning_membery2={};
			  $scope.earning_membery3={};
			  $scope.earning_membery4={};
			  $scope.expanse={};
			  $scope.member_id=0;
			  $scope.para={};
	 
		 
	          }
			  if($scope.count==5)
		        { 
	              $scope.grt5.member_id=$scope.member_id;
				  $scope.earning_membery00=$scope.earning_membery;
				  $scope.earning_membery11=$scope.earning_membery1;
				  $scope.earning_membery22=$scope.earning_membery2
				  $scope.earning_membery33=$scope.earning_membery3
				  $scope.earning_membery44=$scope.earning_membery4
 
					  $scope.grt5.train_pram_id1=$scope.para.train_pram_id1;  $scope.grt5.train_pram_val1=$scope.para.train_pram_val1; 
					 $scope.grt5.train_pram_id2=$scope.para.train_pram_id2;  $scope.grt5.train_pram_val2=$scope.para.train_pram_val2;
					 $scope.grt5.train_pram_id3=$scope.para.train_pram_id3;  $scope.grt5.train_pram_val3=$scope.para.train_pram_val3; 
					 
					$scope.grt5.earning_member_details = $scope.grt5.earning_member_details.concat($scope.earning_membery00,$scope.earning_membery11,$scope.earning_membery22,$scope.earning_membery33,$scope.earning_membery44);
				    $scope.grt5.expanse = $scope.expanse;
				   
					$scope.len--;
				   if($scope.len==0)
				   {
					  $scope.grt_main.grt_Members=$scope.grt_main.grt_Members.concat($scope.grt,$scope.grt2,$scope.grt3,$scope.grt4,$scope.grt5);
					  console.log(JSON.stringify($scope.grt_main));
				   }
				   /* second time calling  set angain value null*/
		      $scope.earning_membery={};
		      $scope.earning_membery1={};
			  $scope.earning_membery2={};
			  $scope.earning_membery3={};
			  $scope.earning_membery4={};
			  $scope.expanse={};
			  $scope.member_id=0;
			  $scope.para={};
	 
		 
	          }
			  
			   
			  
			 
			  
			 
		  }; 
		  
		  
		  
		  $scope.set_member=function(member_id)
		  {
			  $scope.member_id=member_id;
			  
			  
		  }
		  
		  $scope.get_Reason=function(a)
		  {
			 
			  var data={reason_type:a};
			  
			  $http.post('get_all_reason_list',data)
     		  .then(function (responseds)
     				  {
     			 			  
     			  			 $scope.get_reason_listss = responseds.data;
     			  		 
     		          }
     		  , function (responseds)
     		  {
     			  console.log("error siddik "+responseds);
     		  });
			  
		  };
		  
		  
	 
});	
</script>
      