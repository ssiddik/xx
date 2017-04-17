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
                          <select ng-model="obj.branch_id" ng-change="GetRe()"  ng-init="obj.branch_id='-1'" class="chosen-select chosen-transparent form-control" id="input07">
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
                          <select class="chosen-select chosen-transparent form-control" ng-change="GetMember()" ng-init="re_id='-1'"   ng-model="re_id">
                            <option value="-1">Select RE</option>
                            <option ng-repeat="state in test"
							value="{{state.id}}">{{state.name}}</option>
                          </select>
                        </div>
						
						<div class="col-sm-4">
                          <select class="chosen-select chosen-transparent form-control" ng-change="GroupDetails()" ng-init="center_name='-1'"  ng-model="center_name">
                             <option value="-1">Select Center</option>
							<option ng-repeat="center in getCenterDetails" value="{{center.org_center_id}}">{{center.org_center_name}}</option>
						 </select>
                        </div>
                </section>
				
                <!-- /tile -->
				</div>
				<button type="button" class="btn btn-amethyst margin-bottom-20">View</button>
				<button type="button" class="btn btn-info margin-bottom-20">Update</button>
				<div id="postmodal" class="modal fade" role="dialog">
  <div class="modal-dialog" style="width: 900px;">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">X</button>
         <div >
        <!-- <h4 class="modal-title">{{grp1.group_name}}</h4> -->
           <h3 class="modal-title" id="modalDialogLabel">
           <strong><small>Member Details </small></strong>
           
           </h3>
         </div> 
        
      </div>
      <div class="modal-body">
            <!-- tile -->
                <section style="background-color: #777;" class="tile color transparent-black">



                  <!-- tile header -->
                  <div class="tile-header">
                    <h1>Member Profile of <strong>{{member_viewss.member_name}}</strong></h1>
                    <div class="controls">
                      <a href="#" class="minimize"><i class="fa fa-chevron-down"></i></a>
                      <a href="#" class="refresh"><i class="fa fa-refresh"></i></a>
                    </div>
                  </div>
                  <!-- /tile header -->

                  <!-- tile body -->
                  <div class="tile-body nopadding">
                    
                    <table class="table table-bordered">
                      <thead>
                        <tr>
                         
                          <th><label for="last-name"><font color="#B1E1D0">Gender :</label>
                             <span class="text-success"><font size="3" color="#0CE797"><strong>{{member_viewss.gender}}</strong></font></span>
                         </th>
                          <th><label for="last-name"><font color="#B1E1D0">Date of Birth :</label>
                             <span class="text-success"><font size="3" color="#0CE797">{{member_viewss.d_o_b}}</font></span>
                          </th>
                        </tr>
                      </thead>
                      <tbody>
                        <tr>
                          
                          <td><label for="first-name"><font color="#B1E1D0"> Father Name : </label>
                            <span class="text-success"><font size="3" color="#0CE797">  {{member_viewss.father_name}}</font></span> </td>
                          <td><label for="last-name"><font color="#B1E1D0">Mother Name :</label>
                             <span class="text-success"><font size="3" color="#0CE797">{{member_viewss.mother_name}}</font></span></td>
                        </tr>
                        <tr>
                          
                          <td><label for="last-name"><font color="#B1E1D0">Contact No :</label>
                             <span class="text-success"><font size="3" color="#0CE797">{{member_viewss.mem_mob_no1}}</font></span></td>
                          <td><label for="first-name"><font color="#B1E1D0">  Contact No 1  : </label>
                            <span class="text-success"><font size="3" color="#0CE797"> {{member_viewss.mem_mob_no2}}</font></span> </td>
                        </tr>
                        <tr>
                         
                          <td><label for="last-name"><font color="#B1E1D0">Primary ID :</label>
                             <span class="text-success"><font size="3" color="#0CE797">{{member_viewss.member_name}}</font></span>
                            </td>
                          <td><label for="last-name"><font color="#B1E1D0">Secondary ID :</label>
                             <span class="text-success"><font size="3" color="#0CE797">{{member_viewss.member_name}}</font></span></td>
                        </tr>
						<tr>
                         
                          <td><label for="first-name"><font color="#B1E1D0"> Nominee Name: </label>
                            <span class="text-success"><font size="3" color="#0CE797"> {{member_viewss.nominee_name}}</font></span>
                             </td>
                          <td><label for="last-name"><font color="#B1E1D0">Nominee Gender :</label>
                             <span class="text-success"><font size="3" color="#0CE797">{{member_viewss.nominee_gender}}</span></td>
                        </tr>
						<tr>
                         
                          <td> <label for="last-name"><font color="#B1E1D0">Nominee Relation :</label>
                             <span class="text-success"><font size="3" color="#0CE797">{{member_viewss.nominee_relation}}</font></span>
                              </td>
                          <td> <label for="first-name"><font color="#B1E1D0"> Nominee DOB: </label>
                            <span class="text-success"><font size="3" color="#0CE797"> {{member_viewss.nominee_d_o_b}}</font></span></td>
                        </tr>
						<tr>
                         
                          <td> <label for="last-name"><font color="#B1E1D0">Nominee ID Type :</label>
                             <span class="text-success"><font size="3" color="#0CE797">{{member_viewss.nominee_id_type}}</font></span>
                              </td>
                          <td> <label for="last-name"><font color="#B1E1D0">Nominee ID Number :</label>
                             <span class="text-success"><font size="3" color="#0CE797">{{member_viewss.nominee_id_num}}</font></span></td>
                        </tr>
						
                      </tbody>
                    </table>

                  </div>
                  <!-- /tile body -->
                  
                


                </section>
                <!-- /tile -->
                <section style="background-color: #777;" class="tile color transparent-black">



                  <!-- tile header -->
                  <div class="tile-header">
                    <h1><strong>Finance</strong> Details</h1>
                    <div class="controls">
                      <a href="#" class="minimize"><i class="fa fa-chevron-down"></i></a>
                      <a href="#" class="refresh"><i class="fa fa-refresh"></i></a>
                    </div>
                  </div>
                  <!-- /tile header -->

                  <!-- tile body -->
                  <div class="tile-body nopadding">
                    
                    <table class="table table-bordered">
                      <thead>
                        <tr>
                         
                          <th>

                            <label for="first-name"><font color="#B1E1D0"> Full Name : </label>
                            <span class="text-success"><font size="3" color="#0CE797">  Amit <strong> Kumar</strong></font></span>
                         </th>
                          <th> 

                            <label for="last-name"><font color="#B1E1D0">Gender :</label>
                             <span class="text-success"><font size="3" color="#0CE797"><strong>Male</strong></font></span>
                          </th>
                        </tr>
                      </thead>
                      <tbody>
                        <tr>
                          
                          <td> <label for="last-name"><font color="#B1E1D0">Date of Birth :</label>
                             <span class="text-success"><font size="3" color="#0CE797">11/04/<strong>1985</strong></font></span></td>
                          <td><label for="first-name"><font color="#B1E1D0"> Father Name : </label>
                            <span class="text-success"><font size="3" color="#0CE797">  Sunil <strong> Verma</strong></font></span></td>
                        </tr>
                        <tr>
                          
                          <td><label for="last-name"><font color="#B1E1D0">Mother Name :</label>
                             <span class="text-success"><font size="3" color="#0CE797">Payal<strong> Devi</strong></font></span></td>
                          <td> <label for="last-name"><font color="#B1E1D0">Contact No :</label>
                             <span class="text-success"><font size="3" color="#0CE797">098765<strong>43210</strong></font></span></td>
                        </tr>
                        <tr>
                         
                          <td>
                            <label for="first-name"><font color="#B1E1D0">  Contact No 1  : </label>
                            <span class="text-success"><font size="3" color="#0CE797"> 088979 <strong>12456</strong></font></span></td>
                          <td><label for="last-name"><font color="#B1E1D0">Primary ID :</label>
                             <span class="text-success"><font size="3" color="#0CE797">Aadhar<strong> Card</strong></font></span></td>
                        </tr>
						<tr>
                         
                          <td>
                             <label for="last-name"><font color="#B1E1D0">Secondary ID :</label>
                             <span class="text-success"><font size="3" color="#0CE797">Voter<strong> Card</strong></font></span></td>
                          <td></td>
                        </tr>
                      </tbody>
                    </table>

                  </div>
                  <!-- /tile body -->
                  
                


                </section>
                 <!-- tile -->
				 <section style="background-color: #777;" class="tile color transparent-black">



                  <!-- tile header -->
                  <div class="tile-header">
                    <h1><strong>Bank Account</strong> Details</h1>
                    <div class="controls">
                      <a href="#" class="minimize"><i class="fa fa-chevron-down"></i></a>
                      <a href="#" class="refresh"><i class="fa fa-refresh"></i></a>
                    </div>
                  </div>
                  <!-- /tile header -->

                  <!-- tile body -->
                  <div class="tile-body nopadding">
                    
                    <table class="table table-bordered">
                     <tbody ng-repeat="mls in member_viewss.bank_details">
                      
					&nbsp;&nbsp;&nbsp;&nbsp; Bank {{$index+1}}
                        <tr>
                         
                          <td>
                             <label for="first-name"><font color="#B1E1D0"> Beneficiary Name: </label>
                            <span class="text-success"><font size="3" color="#0CE797"> {{mls.beneficiary_name}}</font></span>
                         </td>
                          <td>
                            <label for="last-name"><font color="#B1E1D0">Account Number :</label>
                             <span class="text-success"><font size="3" color="#0CE797">{{mls.account_no}}</font></span>
                          </td>
                        </tr>
                      
                        <tr>
                          
                          <td> <label for="first-name"><font color="#B1E1D0"> IFSC Code: </label>
                            <span class="text-success"><font size="3" color="#0CE797"> {{mls.ifsc_code}}</font></span></td>
                          <td><label for="last-name"><font color="#B1E1D0">Bank Name :</label>
                             <span class="text-success"><font size="3" color="#0CE797"> {{mls.bank_name}}</font></span></td>
                        </tr>
						
					
                       
                       
                      </tbody>
                    </table>
					  <table class="table table-bordered">
                
					  
		           	  <tr>
                          
                          <td><label for="first-name"><font color="#B1E1D0"> Security Cheque Bank Name: </label>
                            <span class="text-success"><font size="3" color="#0CE797"> {{member_viewss.sequity_cheque_bank_name}}</font></span></td>
                          <td><label for="last-name"><font color="#B1E1D0">Security Cheque Bank Number :</label>
                             <span class="text-success"><font size="3" color="#0CE797">{{member_viewss.sequrity_cheque_number}}</font></span></td>
                        </tr>
						</table>

                  </div>
                  <!-- /tile body -->
                  
                


                </section>
				 <section  style="background-color: #777;" class="tile color transparent-black">



                  <!-- tile header -->
                  <div class="tile-header">
                    <h1><strong>Other</strong> Details</h1>
                    <div class="controls">
                      <a href="#" class="minimize"><i class="fa fa-chevron-down"></i></a>
                      <a href="#" class="refresh"><i class="fa fa-refresh"></i></a>
                    </div>
                  </div>
                  <!-- /tile header -->

                  <!-- tile body -->
                  <div class="tile-body nopadding">
                    
                    <table class="table table-bordered">
                      <thead>
                        <tr>
                         
                          <th>
                              <label for="first-name"><font color="#B1E1D0">Fooding Expense :</label>
                            <span class="text-success"><font size="3" color="#0CE797"> {{member_viewss.fooding_expense}}</font></span>
                         </th>
                          <th><label for="last-name"><font color="#B1E1D0">Rent Expense :</label>
                             <span class="text-success"><font size="3" color="#0CE797">{{member_viewss.rent_expense}}</font></span>
                            
                          </th>
                        </tr>
                      </thead>
                      <tbody>
                        <tr>
                          
                          <td>  <label for="last-name"><font color="#B1E1D0">Education Expense :</label>
                             <span class="text-success"><font size="3" color="#0CE797">{{member_viewss.education_expense}}</font></span></td>
                          <td><label for="first-name"><font color="#B1E1D0"> Medical Expense: </label>
                            <span class="text-success"><font size="3" color="#0CE797"> {{member_viewss.medical_expense}}</font></span></td>
                        </tr>
                        <tr>
                          
                          <td><label for="last-name"><font color="#B1E1D0">Other Expense :</label>
                             <span class="text-success"><font size="3" color="#0CE797">{{member_viewss.other_expense}}</font></span></td>
                          <td><label for="last-name"><font color="#B1E1D0">Loan Repayment Expense :</label>
                             <span class="text-success"><font size="3" color="#0CE797">{{member_viewss.loan_repayment_expense}}</font></span></td>
                        </tr>
                       
                      </tbody>
                    </table>

                  </div>
                  <!-- /tile body -->
                  
                


                </section>
				 
				<section  style="background-color: #777;" class="tile color transparent-black">



                  <!-- tile header -->
                  <div class="tile-header">
                    <h1><strong>Approval</strong> Details</h1>
                    <div class="controls">
                      <a href="#" class="minimize"><i class="fa fa-chevron-down"></i></a>
                      <a href="#" class="refresh"><i class="fa fa-refresh"></i></a>
                    </div>
                  </div>
                  <!-- /tile header -->

                  <!-- tile body -->
                  <div class="tile-body nopadding">
                    
                    <table class="table table-bordered">
                      <thead>
					  <tr>
					 <center> <th><label for="download"><font color="#B1E1D0">Download Aggrement Document:</label></th></center>
					   <center><th><label for="upload" class="col-sm-4 control-label"><font color="#B1E1D0"> Upload Aggrement Document:</label></th></center>
                        <tr>
                         
                          <th>
                              
                             <center><a href="index.html"><i class="fa fa-file-pdf-o fa-2x" style="color:white"></i></center>
                         </th>
                          <th>
                        <center><div class="col-sm-8">
                          <div class="input-group">
                            <span class="input-group-btn">
                              <span class="btn btn-success btn-file">
                                <i class="fa fa-upload"></i><input type="file" multiple="">
                              </span>
                            </span>
                            <input type="text" class="form-control " readonly="">
                          </div>
                        </div></center>
                            
                          </th>
                        </tr>
                      </thead>
                      
                    </table>

                  </div>
                  <!-- /tile body -->
                  
                


                </section>
				 
				 
				 
				 <!-- /tile body -->
       

         </div>
                    
         


      </div>
      
    </div>
    </div>
				
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
                            <td><a ng-click="getMemberByGrpID(grp.group_id,'CGT',)"><i class="fa fa-book fa-2x" style="color:gold"></i><span ng-if="grp.cgt=='1'"><i class="fa fa-check" aria-hidden="true"></i></span></a></td>
                            <td><a ng-click="getMemberByGrpID(grp.group_id,'GRT',grp.grt)"><i class="fa fa-database fa-2x" style="color:orange"></i><span ng-if="grp.grt=='1'"><i class="fa fa-check" aria-hidden="true"></i></span></a></td>
						    <td><i class="fa fa-file-archive-o fa-2x"style="color:Coral"></i><span ng-if="grp.blc=='1'"><i class="fa fa-check" aria-hidden="true"></i></span></td>
						    <td><i class="fa fa-file-text-o fa-2x"style="color:Crimson "></i><span ng-if="grp.loan_application=='1'"><i class="fa fa-check" aria-hidden="true"></i></span></td>
							<td><i class="fa fa-clipboard fa-2x"style="color:greenyellow"></i><span ng-if="grp.pre_sanction=='1'"><i class="fa fa-check" aria-hidden="true"></i></span></td>
							{{grp.post_sanction}}
							<td><a ng-click="getMemberByGrpID(grp.group_id,'POST',grp.post_sanction)"><i class="fa fa-folder-o fa-2x"style="color:lightgreen"></i><span ng-if="grp.post_sanction=='1'"><i class="fa fa-check" aria-hidden="true"></i></span></td>
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

                    
                        <span ng-if="grt_member_status.result=='Y'">
                          <div class="alert alert-warning alert-dismissable fade in">
						    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
						    <strong> GRT Done</strong>
						  </div>
                        
                        </span>
                                            
                        <span ng-if="grt_member_status.result=='N'">
                          <div class="alert alert-warning alert-dismissable fade in">
						    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
						    <strong>Already exist !</strong>
						  </div>
                        
                        </span>
                        
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
                            <td>{{$index+1}}
                      
                            
                            <span ng-if="$index+1==1">
                            
                             <input type="hidden" ng-model="grt_mem.member_id1" ng-init="grt_mem.member_id1=gi.member_id" value="{{gi.member_id}}" />
                             <input type="hidden" ng-model="group_grt.g_status" ng-init="group_grt.g_status=gi.group_stats" value="{{gi.group_stats}}" />
                              <input type="hidden" ng-model="group_grt.g_reason" ng-init="group_grt.g_reason=gi.group_reason" value="{{gi.group_reason}}" /> 
                            </span>
                             <span ng-if="$index+1==2">
                            
                             <input type="hidden" ng-model="grt_mem.member_id2"  ng-init="grt_mem.member_id2=gi.member_id" value="{{gi.member_id}}" />
                            </span>
                             <span ng-if="$index+1==3">
                        
                             <input type="hidden" ng-model="grt_mem.member_id3"  ng-init="grt_mem.member_id3=gi.member_id"value="{{gi.member_id}}" />
                            </span>
                            
                             <span ng-if="$index+1==4">
                
                             <input type="hidden" ng-model="grt_mem.member_id4"  ng-init="grt_mem.member_id4=gi.member_id" value="{{gi.member_id}}" />
                            </span>
                             <span ng-if="$index+1==5">
                             
                             <input type="hidden" ng-model="grt_mem.member_id5"  ng-init="grt_mem.member_id5=gi.member_id" value="{{gi.member_id}}" />
                            </span>
                            </td>
                            <td class="">{{gi.member_name}}
                           
                          
                            </td>
							<td>
							 
							     
							     <span  ng-if="group_grt.g_status==1" class="badge badge-red" href="#myModal" data-toggle="modal" ng-click="get_member_grt(gi.member_id)"><i class="fa fa-file-text-o fa-lg"style="color:aqua"></i></span>
							     <span   ng-if="group_grt.g_status==0" class="badge badge-red" href="#myModal" data-toggle="modal"  ng-click="set_member(gi.member_id)"><i class="fa fa-file-text-o fa-lg"style="color:aqua"></i></span>
							     
							 </td>
                            <td> <div class="onoffswitch labeled greensea">
                                  <input type="checkbox"    ng-true-value="'1'" ng-false-value="'0'" class="onoffswitch-checkbox" id="myonoffswitch{{gi.member_id}}" ng-checked="gi.member_status">
                                  <label class="onoffswitch-label" for="myonoffswitch{{gi.member_id}}">
                                    <span class="onoffswitch-inner"></span>
                                    <span class="onoffswitch-switch"></span>
                                  </label>
                                </div></td>
                            <td  class="col-sm-4">
                        <select ng-init="get_Reason('GRT')" id="reg{{gi.member_id}}" class="chosen-select chosen-transparent form-control" >
                             <option value="0">Select Reason</option>
							 
							<option ng-repeat="ri in get_reason_listss" ng-selected="gi.member_reason==ri.reason_id" value="{{ri.reason_id}}"> {{ri.reason_description}}</option>
                            
						 </select>
                        </td>
							
                          </tr>
                        
						  </tbody>
						 
               
						  <tr class="odd gradeX">
                            <td></td>      <td></td>
                            <td class=""><h4>Status</h4></td>
                           
                            <td> <div class="onoffswitch labeled greensea">
                                  <input ng-checked="group_grt.g_status" type="checkbox" ng-model="checkboxModel.value1"  class="onoffswitch-checkbox" id="myonoffswitchgroup" ng-true-value="'1'" ng-false-value="'0'">
                                  <label class="onoffswitch-label" for="myonoffswitchgroup">
                                    <span class="onoffswitch-inner"></span>
                                    <span class="onoffswitch-switch"></span>
                                  </label>
                                </div></td>
                              
								<td class="col-sm-4" >
							 
                        <select ng-init="get_Reason('GRT')"    id="group_grt_reason_code" class="chosen-select chosen-transparent form-control">
                             <option value="0">Select Reason</option>
							 
						 	<option ng-repeat="ri in get_reason_listss" ng-selected="group_grt.g_reason==ri.reason_id"  value="{{ri.reason_id}}">{{ri.reason_description}}</option>
						 </select>
						  
						  
					 
                         </td>
                          </tr>
						  
						
                          <tr>
						  
						  <td colspan="5">
                           <span ng-if="group_grt.g_status==1">
                               
                            </span>
                            <span ng-if="group_grt.g_status==0">
							  Loan Product 
							 
							     
                          <select  ng-init="get_loan_product_()" class="form-control"  id="input07" ng-model="loan_id">
                             <option value="0">Select </option>
						 <option ng-repeat="lp in loan_product_list" value="{{lp.l_prdct_id}}">{{lp.l_prdct_name}}<option>
							
                          </select>
                           <br/>
                         
                            <button type="submit" class="btn btn-greensea" ng-click="grt_group_member_send()">Submit</button>
                            </span>
                         
                            </td></tr>
						    
						    
                      </table>
                    </div>

                  </div>
                  <!-- /tile body -->
                


                </section>
                <!--  end here  -->

				
			
			
			<!--  POST APPROVAL START -->
                <section  ng-if="parameter=='POST'" class="tile transparent col-md-6">


                  <!-- tile header -->
                   <div class="tile-header transparent">
                    <h1><strong>Member</strong> List Post Approval</h1>
                    
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
							 <th class="sort-alpha col-md-3">Member Name</th>
							 <th class="sort-alpha col-md-1">Post</th>
                            <th class="sort-numeric col-md-1">Status</th>
                            <th class="sort-numeric col-md-1">Reason</th>
                           
                          </tr>
                        </thead>
                        <tbody>
						 
						
						
                          <tr class="odd gradeX" ng-repeat="pai in post_approval_list">
                            <td>{{$index+1}}
							 
							<span ng-if="$index+1==1" ng-init="post_temp.g_status=pai.group_stats;post_temp.g_reason=pai.group_reason;">
							
							  <input type="hidden" ng-model="post_main.member_id1"  ng-init="post_main.member_id1=pai.member_id" value="{{pai.member_id}}" />
							  </span>
						      <span ng-if="$index+1==2">
                            
                             <input type="hidden" ng-model="post_main.member_id2"  ng-init="post_main.member_id2=pai.member_id" value="{{pai.member_id}}" />
                            </span>
                             <span ng-if="$index+1==3">
                        
                             <input type="hidden" ng-model="post_main.member_id3"  ng-init="post_main.member_id3=pai.member_id"value="{{pai.member_id}}" />
                            </span>
                            
                             <span ng-if="$index+1==4">
                
                             <input type="hidden" ng-model="post_main.member_id4"  ng-init="post_main.member_id4=pai.member_id" value="{{pai.member_id}}" />
                            </span>
                             <span ng-if="$index+1==5">
                             
                             <input type="hidden" ng-model="post_main.member_id5"  ng-init="post_main.member_id5=pai.member_id" value="{{pai.member_id}}" />
                            </span>
						
							</td>
                            <td class="">{{pai.member_name}}</td>
							<td>
							 <span class="badge badge-red" href="#postmodal" data-toggle="modal" ng-click="viewmamberdetails(pai.member_id)" ><i class="fa fa-file-text-o fa-lg"style="color:#00EDF4"></i></span>
							
							 </td>
                             <td div class="col-sm-4">
                        <select class="form-control ng-pristine ng-valid ng-touched" id="post_member_result{{pai.member_id}}">
                             <option value="-1" >Select</option>
							<option value="9" ng-selected="pai.member_status==9">Approved</option>
							<!-- <option value="1" ng-selected="pai.member_status==1">Approved</option> -->
                            <option value="0" ng-selected="pai.member_status==0">Reject</option>
							
						 </select>
                        </div></td>
                            <td div class="col-sm-4">
                        <select class="form-control ng-pristine ng-valid ng-touched" id="post_member_reason{{pai.member_id}}"   ng-init="get_Reason('POST')">
                             <option value="0">Select Reason</option>
						 <option ng-repeat="ri in get_reason_listss" ng-selected="pai.member_reason==ri.reason_id"  value="{{ri.reason_id}}">{{ri.reason_description}}</option>
						 </select>
						 
						 
 
                        </div></td>
							
                          </tr>
                       
					 
						 
						  <tr class="odd gradeX">
                            <td></td>
                            <td class=""><h4>Group Status</h4></td>
                           <td></td>
                           <td div class="col-sm-4">
                        <select class="form-control ng-pristine ng-valid ng-touched" id="post_group_staus">
                             <option value="-1" >Select</option>
							<option value="1" ng-selected="post_temp.g_status==1">Approved</option>
                            <option value="0" ng-selected="post_temp.g_status==0">Reject</option>
							
							
						 </select>
                        </div></td>
								<td div class="col-sm-4">
								
								 
                        <select class="form-control ng-pristine ng-valid ng-touched" id="post_group_reason">
                             <option>Select Reason</option>
						  <option ng-repeat="ri in get_reason_listss" ng-selected="post_temp.g_reason==ri.reason_id"  value="{{ri.reason_id}}">{{ri.reason_description}}</option>
						 </select>
                        </div></td>
                          </tr>
						   </tbody>
                      </table>
                    </div>
                  <button type="submit" class="btn btn-greensea" ng-click="post_approval_submit();">Submit</button>
                  </div>
                  <!-- /tile body -->
               
				 
				 


                </section>
		    <!--  POST APPROVAL END -->


				


				

     

               


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
        <button type="button" id="modal_close" class="close" data-dismiss="modal">X</button>
         <div >
        <!-- <h4 class="modal-title">{{grp1.group_name}}</h4> -->
           <h3 class="modal-title" id="modalDialogLabel">
           <strong><small> </small></strong>
           
           </h3>
         </div> 
        
      </div>
      <div class="modal-body">
        
          <section ng-if="fatch_member_result.flag_value==0" class="tile color transparent-white"  style="background:currentColor">



                  <!-- tile header -->
                  <div class="tile-header">
                    <h1><strong>GRT</strong> Details</h1>
                   
                  </div>
                  <!-- /tile header -->

                  
		 
				  				  <!--  grt post start --->
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
                          <input type="text" ng-model="earning_membery.family_mem_name" class="form-control" id="input01" >
                        </div>
                      </div></td>
                          <td><div class="form-group">
                       
                        <div class="col-sm-12">
                          <select  ng-init="earning_membery.occupation='0'" class="chosen-select chosen-transparent form-control" id="input07" ng-model="earning_membery.occupation">
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
                          <select ng-init="earning_membery1.occupation='0'"  class="chosen-select chosen-transparent form-control" id="input07" ng-model="earning_membery1.occupation">
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
                          <select ng-init="earning_membery2.occupation='0'" class="chosen-select chosen-transparent form-control" id="input07" ng-model="earning_membery2.occupation">
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
                          <select ng-model="earning_membery3.occupation='0'" class="chosen-select chosen-transparent form-control" id="input07" ng-model="earning_membery3.occupation">
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
                          <select ng-init="earning_membery4.occupation='0'" class="chosen-select chosen-transparent form-control" id="input07" ng-model="earning_membery4.occupation">
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
                          <input type="number"  ng-model="expanse.fooding_expanse" class="form-control" id="input01">
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
                          <input type="number" ng-model="expanse.education_expanse" class="form-control" id="input01">
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
                          <input type="number"  ng-model="expanse.rent_expanse"  class="form-control"  id="input01">
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
                          <input type="number" ng-model="expanse.medical_expanse" class="form-control" id="input01">
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
                          <input type="number" ng-model="expanse.loan_repayment_expanse" class="form-control"  id="input01">
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
  <input type="number"  ng-model="expanse.other_expanse"  class="form-control" id="input01"  >
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
                         <!--  <input type="text" ng-model="expanse.other_expanse+expanse.loan_repayment_expanse" class="form-control" id="input01"> -->
                         {{expanse.fooding_expanse+expanse.education_expanse+expanse.rent_expanse+expanse.medical_expanse+expanse.loan_repayment_expanse+expanse.other_expanse}} 
							     
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
                            <option value="3" >Below Average</option>
							
                          </select>
                           
                        </div></td>
                          
                        </tr>
						<tr>
							<td>Group Cohesiveness</td>
							<td><div class="col-sm-6">
							 <input type="hidden" ng-model="para.train_pram_id2" ng-value="2" ng-init="para.train_pram_id2='2'" />
                          <select ng-init="para.train_pram_val2='0'" class="chosen-select chosen-transparent form-control" id="input07" ng-model="para.train_pram_val2">
                       <option value="0">Select </option>
							<option value="1"  >Good</option>
							<option value="2"  >Average</option>
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
				  <!--  grt post end --->
				  
				  <div class="tile-body">
				  <button type="submit" class="btn btn-greensea" ng-click="grt_submit()">Submit</button>
				  </div>
                  <!-- /tile body -->
                

</div>
                    </table>

                  </div>
				  
                 
                </section>
				
				<!---post grt member view start here --->
				     <section ng-if="fatch_member_result.flag_value==1" class="tile color transparent-white"  style="background:currentColor">



                  <!-- tile header -->
                  <div class="tile-header">
                    <h1><strong>GRT</strong> Details</h1>
                   
                  </div>
                  <!-- /tile header -->

                  
		 
				  				 
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
					  
                         <tr ng-repeat="ffm in fatch_member_result.earning_member_details">
						 
                          <td>
						  {{$index+1}}
                          </td>
                          <td>  <div class="form-group">
                       
                        <div class="col-sm-10">
                          <input type="text"  class="form-control" id="input01" value="{{ffm.family_mem_name}}">
                        </div>
                      </div></td>
                          <td><div class="form-group">
                       
                        <div class="col-sm-12">
                          <select  ng-init="earning_membery.occupation='0'" class="chosen-select chosen-transparent form-control" id="input07"  >
						    <option value="0">Select Occupation</option>
                            <option value="1" ng-selected="ffm.occupation==1">Service</option>
							<option  value="2"  ng-selected="ffm.occupation==2">Business</option>
                            
                          </select>
                         
                        </div>
                      </div></td>
                        <td>  <div class="form-group">
                       
                        <div class="col-sm-8">
                          <input type="text"  value="{{ffm.gross_income}}" class="form-control" id="input01">
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
                          <input type="number"   class="form-control" value="{{fatch_member_result.expanse.fooding_expanse}}" id="input01">
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
                          <input type="number"  class="form-control" value="{{fatch_member_result.expanse.education_expanse}}" id="input01">
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
                          <input type="number"    class="form-control"  value="{{fatch_member_result.expanse.rent_expanse}}"id="input01">
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
                          <input type="number"  class="form-control" value="{{fatch_member_result.expanse.medical_expanse}}" id="input01">
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
                          <input type="number"   class="form-control" value="{{fatch_member_result.expanse.loan_repayment_expanse}}" id="input01">
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
  <input type="number"   class="form-control" id="input01"  value="{{fatch_member_result.expanse.other_expanse}}">
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
                         <!--  <input type="text" ng-model="expanse.other_expanse+expanse.loan_repayment_expanse" class="form-control" id="input01"> -->
                          {{fatch_member_result.expanse.fooding_expanse+fatch_member_result.expanse.education_expanse+fatch_member_result.expanse.rent_expanse+fatch_member_result.expanse.medical_expanse+fatch_member_result.expanse.loan_repayment_expanse+fatch_member_result.expanse.other_expanse}} 
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
							<option value="1" ng-selected="fatch_member_result.train_pram_val1==1">Good</option>
							<option value="2" ng-selected="fatch_member_result.train_pram_val1==2">Average</option>
                            <option value="3" ng-selected="fatch_member_result.train_pram_val1==3">Below Average</option>
							
                          </select>
                           
                        </div></td>
                          
                        </tr>
						<tr>
							<td>Group Cohesiveness</td>
							<td><div class="col-sm-6">
							 <input type="hidden" ng-model="para.train_pram_id2" ng-value="2" ng-init="para.train_pram_id2='2'" />
                          <select ng-init="para.train_pram_val2='0'" class="chosen-select chosen-transparent form-control" id="input07" ng-model="para.train_pram_val2">
                       <option value="0">Select </option>
							<option value="1"  ng-selected="fatch_member_result.train_pram_val2==1">Good</option>
							<option value="2"  ng-selected="fatch_member_result.train_pram_val2==2">Average</option>
                            <option value="3"  ng-selected="fatch_member_result.train_pram_val2==3">Below Average</option>
                          </select>
                           
                        </div></td>
					  
					  </tr>
					  <tr>
						
							<td>Discipline</td>
							<td><div class="col-sm-6">
							     <input type="hidden" ng-model="para.train_pram_id3" ng-value="3" ng-init="para.train_pram_id3='0'"/>
                          <select  ng-init="para.train_pram_val3='0'" class="chosen-select chosen-transparent form-control" id="input07" ng-model="para.train_pram_val3">
                             <option value="0">Select </option>
							<option value="1"  ng-selected="fatch_member_result.train_pram_val2==1">Good</option>
							<option value="2" ng-selected="fatch_member_result.train_pram_val2==2">Average</option>
                            <option value="3" ng-selected="fatch_member_result.train_pram_val2==3">Below Average</option>
							
                          </select>
                           
                        </div></td>
					  
					  </tr>
					  
					
                      
                        </tbody>
				
					  </table>
                   </div>
				  </div>
				  <!--  grt post end --->
				
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

app.controller('myCtrl', function($scope,$http,$log) {
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
		  
		  $scope.getMemberByGrpID = function(group_id,parameter,flag) 
		  { 
			  $scope.group_id=group_id;
			  $scope.parameter=parameter;
			  $scope.flag=flag;
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
			  
			  
			  /* grt start here */
			  if(parameter=='GRT')
				  {
				   
				  $log.info("grt called");
				   
			  	  var data= {
			  			  group_id:group_id,
			  			 flag:flag
			  	      } ;
				  
				 
			  $http.post('grt_get_member_list', data)
     		  .then(function (responseds)
     				  {  
     			  			 $scope.grt_member_list = responseds.data;
     			  			  
     			  			 $log.info("grt called");
							 $scope.len=$scope.grt_member_list.length;
							// alert($scope.grt_member_list.length);
     			  		 
     		          }
		     		  , function (responseds)
		     		  {
		     			  console.log("error siddik "+responseds);
		     		  });	
			  
			
			   };
			  
			  
			  
			  /* post appruval*/
			  if(parameter=='POST')
				  {
				  $log.info("call Post approvale");
				  
				  
				   
				   
			  	     var data={
			  			  group_id:group_id,
			  			  flag:flag
			  	              };
			  	     
					          $http.post('get_post_approval_member', data)
		     		           .then(function(responseds)
		     				  {	  
		     			  			 $scope.post_approval_list = responseds.data;
		     			  			 $log.info("post approval member list called");
		     		          }
				     		  , function (responseds)
				     		  {
				     			  console.log(" post approval error "+responseds);
				     		  });
				  
				}
		  };
			  
			    /*  $scope.grt_main={};// main json
			     $scope.grt_main.grt_Members=[];//main json 
			     $scope.count=0;
			     $scope.grt={};
			     $scope.grt.earning_member_details=[];
			     $scope.grt.expanse={}; */
				 
			/* 	 $scope.grt2={};
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
				  */
				 
				   /*  below code static  for all grt*/
				 
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
			  
			  $scope.grt_mem={};
			  $scope.para={};
		 
			 //$scope.group_value.grp_reason_code="";
			// $scope.group_value.grp_grt_result="";
			  //$scope.expanse.fooding_expanse=null;
			 // $scope.tatol=$scope.expanse.fooding_expanse+$scope.expanse.education_expanse+$scope.expanse.medical_expanse+$scope.expanse.loan_repayment_expanse+$scope.expanse.other_expanse;
				 
			  /* submit grt start here */
			  
			  $scope.loan_id=0;
			  $scope.grt_submit=function()
			  {
				
	  /* for submit */ 
	  
			   
  			  $scope.grt={};
			  $scope.grt.earning_member_details=[];
			  $scope.grt.expanse={};
	          $scope.grt.grp_id=$scope.group_id;
	          $scope.grt.member_id=$scope.member_id;
	          $scope.grt.expanse = $scope.expanse;
		      $scope.grt.train_pram_id1=$scope.para.train_pram_id1;  $scope.grt.train_pram_val1=$scope.para.train_pram_val1; 
		      $scope.grt.train_pram_id2=$scope.para.train_pram_id2;  $scope.grt.train_pram_val2=$scope.para.train_pram_val2;
	          $scope.grt.train_pram_id3=$scope.para.train_pram_id3;  $scope.grt.train_pram_val3=$scope.para.train_pram_val3;
	          $scope.earning_membery00=$scope.earning_membery;
		      $scope.earning_membery11=$scope.earning_membery1;
			  $scope.earning_membery22=$scope.earning_membery2
			  $scope.earning_membery33=$scope.earning_membery3
			  $scope.earning_membery44=$scope.earning_membery4
			  
			
	          $scope.grt.earning_member_details = $scope.grt.earning_member_details.concat($scope.earning_membery00,$scope.earning_membery11,$scope.earning_membery22,$scope.earning_membery33,$scope.earning_membery44);
			    
			  
			  $log.info(JSON.stringify($scope.grt));
			 
				 /* this json send for grt creation per member */
			   $http.post('http://139.59.34.255:8080/MicroFinance/member_grt/222/5555',$scope.grt)
    		  .then(function (responseds)
    				  {
    			 			  
    			  
    			  $log.info(responseds.data);
    			  
    			  $scope.grt_member_status=responseds.data;
    			  document.getElementById('modal_close').click();
    			  
    			  
    			 
    			  		 
    		          }
    		  , function (responseds)
    		  {
    			  console.log("error grt_creation from web "+responseds);
    		  }); 
			 
			  
			  
			  
			  $scope.earning_membery={};
		      $scope.earning_membery1={};
			  $scope.earning_membery2={};
			  $scope.earning_membery3={};
			  $scope.earning_membery4={};
			  $scope.expanse={};
			  $scope.member_id=0;
			  $scope.para={};
			 
		  }; 
		  
		  
		  
		  $scope.set_member=function(member_id)
		  {
			  $scope.member_id=member_id;
			  
			  
		  }
		  $scope.fatch_member_result={};
		  $scope.fatch_member_result.flag_value=0;
		  
		  $scope.get_member_grt=function(mem_id)
		  {
			 
			//  var url='http://139.59.34.255:8080//MicroFinance/getMember_Details/'+mem_id+'/'+$scope.group_id+'/525234232';
			  
			var url='http://139.59.34.255:8080//MicroFinance/getMember_Details/3/1/44';
			  $http.get(url)
     		  .then(function (responseds)
     				  {
     			 			  
     			  			$scope.fatch_member_result = responseds.data;
							$scope.fatch_member_result.flag_value=1;
     			  			$log.info($scope.fatch_member_result);
     			  		 
     		          }
     		  , function (responseds)
     		  {
     			  console.log("error get_grt details "+responseds);
     		  });
			  
		  };
		  
		  
		  
		  $scope.get_loan_product_=function()
		  {
			  
			  $http.get('get_all_loan_product')
     		  .then(function (responseds)
     				  {
     			 			  
     			  			 $scope.loan_product_list = responseds.data;
     			  		 
     		          }
     		  , function (responseds)
     		  {
     			  console.log("error siddik "+responseds);
     		  });
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
		   $scope.checkboxModel = {
			       value1 : 1
			     };
		  
		  $scope.grt_group_member_send=function()
		  {
			  var c=0;
			   var st=0;
			// alert($scope.grt_mem.member_id1);
			 $scope.grt_grp={};
			 $scope.grt_grp.grt_group=[];
			 $scope.temp1={};
			 $scope.temp2={};
			 $scope.temp3={};
			 $scope.temp4={};
			 $scope.temp5={};
		 
		
		
			 $scope.temp3.member_id=$scope.grt_mem.member_id4;
			 $scope.temp4.member_id=$scope.grt_mem.member_id5;
			 if($scope.grt_mem.member_id1!=null)
				 {
				   c++;
				 
			     var reg_on='reg'+$scope.grt_mem.member_id1;
			     var status='myonoffswitch'+$scope.grt_mem.member_id1; 
			     if(document.getElementById(status).checked==true)
			     {
			    
			    	 st="1";
			     }
			     else
			     {
			    	 st="0";
			     }
			
				 $scope.temp1.member_id=$scope.grt_mem.member_id1;
				 $scope.temp1.member_grt_result=st;
			     $scope.temp1.member_reason_code=document.getElementById(reg_on).value;
				 
				 }
			 if($scope.grt_mem.member_id2!=null)
			 {
				 c++;
				 var reg_on2='reg'+$scope.grt_mem.member_id2;
			     var status2='myonoffswitch'+$scope.grt_mem.member_id2; 
			     if(document.getElementById(status2).checked==true)
			     {
			    
			    	 st="1";
			     }
			     else
			     {
			    	 st="0";
			     }
				 $scope.temp2.member_id=$scope.grt_mem.member_id2;
				 $scope.temp2.member_grt_result=st;
				 $scope.temp2.member_reason_code=document.getElementById(reg_on2).value;
			 }
			 if($scope.grt_mem.member_id3!=null)
			 {
				 c++;
				 var reg_on3='reg'+$scope.grt_mem.member_id3;
			     var status3='myonoffswitch'+$scope.grt_mem.member_id3; 
			     if(document.getElementById(status3).checked==true)
			     {
			    
			    	 st="1";
			     }
			     else
			     {
			    	 st="0";
			     }
				 $scope.temp3.member_id=$scope.grt_mem.member_id3;
				 $scope.temp3.member_grt_result=st;
				 $scope.temp3.member_reason_code=document.getElementById(reg_on3).value;
			 }
			 
			 if($scope.grt_mem.member_id4!=null)
			 {
				 c++;
				 var reg_on4='reg'+$scope.grt_mem.member_id4;
			     var status4='myonoffswitch'+$scope.grt_mem.member_id4; 
			     if(document.getElementById(status4).checked==true)
			     {
			    
			    	 st="1";
			     }
			     else
			     {
			    	 st="0";
			     }
				 $scope.temp4.member_id=$scope.grt_mem.member_id4;
				 $scope.temp4.member_grt_result=st;
				 $scope.temp4.member_reason_code=document.getElementById(reg_on4).value;
			 }
			 if($scope.grt_mem.member_id5!=null)
			 {
				 c++;
				 var reg_on5='reg'+$scope.grt_mem.member_id5;
			     var status5='myonoffswitch'+$scope.grt_mem.member_id5; 
			     if(document.getElementById(status5).checked==true)
			     {
			    
			    	 st="1";
			     }
			     else
			     {
			    	 st="0";
			     }
				 $scope.temp5.member_id=$scope.grt_mem.member_id5;
				 $scope.temp5.member_grt_result=st;
				 $scope.temp5.member_reason_code=document.getElementById(reg_on5).value;
			 }
			 
		 
		
			 
			 if(c==1)
				 {
				 $scope.grt_grp.grt_group= $scope.grt_grp.grt_group.concat($scope.temp1);
				 }
			 if(c==2)
			 {
				 $scope.grt_grp.grt_group= $scope.grt_grp.grt_group.concat($scope.temp1, $scope.temp2);
			 }
			 if(c==3)
			 {
				 $scope.grt_grp.grt_group= $scope.grt_grp.grt_group.concat($scope.temp1, $scope.temp2, $scope.temp3);
			 }
			 if(c==4)
			 {
				 $scope.grt_grp.grt_group= $scope.grt_grp.grt_group.concat($scope.temp1, $scope.temp2, $scope.temp3, $scope.temp4);
			 }
			 if(c==5)
			 {
				 $scope.grt_grp.grt_group= $scope.grt_grp.grt_group.concat($scope.temp1, $scope.temp2, $scope.temp3, $scope.temp4, $scope.temp5);
			 }
			 
			 $scope.grt_grp.results=$scope.checkboxModel.value1;
			 $scope.grt_grp.group=1;
			
			 //document.getElementById("myonoffswitchgroup").value;//$scope.group.grp_grt_result;
		     $scope.grt_grp.reason_code=document.getElementById("group_grt_reason_code").value;//$scope.group.grp_reason_code;
			 
			   $scope.grt_grp.product_id=$scope.loan_id;
			 //$log.info($scope.grt_grp);
			 $log.info(JSON.stringify($scope.grt_grp));
			 
			  $http.post('http://139.59.34.255:8080/MicroFinance/groupM_grt/222/5555',$scope.grt_grp)
    		  .then(function (responseds)
    				  {
    			 			  
    			  
    			  $log.info(responseds.data);
    			  
    			  $scope.grt_member_status=responseds.data;
    			  			// $scope.get_reason_listss = responseds.data;
    			  		 
    		          }
    		  , function (responseds)
    		  {
    			  console.log("error siddik "+responseds);
    		  });
			 
			 
		  } ;
		  
		 $scope.group_grt={};
		 
		 /* grt end here */
		 /* post approval start here  */
		 
		 
		 $scope.post_temp={};
		 $scope.post_main={};
		 $scope.post_main_json={};
		 $scope.post_approval_submit=function()
		 {
			 var cc=0;
			 $scope.temp1={};
			 $scope.temp2={};
			 $scope.temp3={};
			 $scope.temp4={};
			 $scope.temp5={};
 
		//  $log.info(JSON.stringify($scope.grt_grp));
	
			 if($scope.post_main.member_id1!=null)
				 {
				   cc++;
				 
                 var reg_on='post_member_reason'+$scope.post_main.member_id1;
			     var status='post_member_result'+$scope.post_main.member_id1; 
			     
			      
			    
				 $scope.temp1.member_id=$scope.post_main.member_id1;
				 $scope.temp1.member_post_result=document.getElementById(status).value;
			     $scope.temp1.member_reason_code=document.getElementById(reg_on).value;
				  $log.info($scope.temp1);
				 }
			 if($scope.post_main.member_id2!=null)
			 {
				 cc++;
			     var reg_on2='post_member_reason'+$scope.post_main.member_id2;
			     var status2='post_member_result'+$scope.post_main.member_id2; 
			    
				 $scope.temp2.member_id=$scope.post_main.member_id2;
		         $scope.temp2.member_post_result=document.getElementById(status2).value;
		         $scope.temp2.member_reason_code=document.getElementById(reg_on2).value;
				 $log.info( $scope.temp2);
			 }
			 if($scope.post_main.member_id3!=null)
			 {
				 cc++;
			    var reg_on3='post_member_reason'+$scope.post_main.member_id3;
			    var status3='post_member_result'+$scope.post_main.member_id3; 
			  
				 $scope.temp3.member_id=$scope.post_main.member_id3;
			     $scope.temp3.member_post_result=document.getElementById(status3).value;
				 $scope.temp3.member_reason_code=document.getElementById(reg_on3).value;
				   $log.info( $scope.temp3);
			 }
			 
			 if($scope.post_main.member_id4!=null)
			 {
				 cc++;
				  var reg_on4='post_member_reason'+$scope.post_main.member_id4;
			      var status4='post_member_result'+$scope.post_main.member_id4; 
			
				 $scope.temp4.member_id=$scope.post_main.member_id4;
		        $scope.temp4.member_post_result=document.getElementById(status4).value;
				 $scope.temp4.member_reason_code=document.getElementById(reg_on4).value;
					$log.info( $scope.temp4);
			 }
			 if($scope.post_main.member_id5!=null)
			 {
				 cc++;
			    var reg_on5='post_member_reason'+$scope.post_main.member_id5;
		        var status5='post_member_result'+$scope.post_main.member_id5; 
				 $scope.temp5.member_id=$scope.post_main.member_id5;
			     $scope.temp5.member_post_result=document.getElementById(status5).value;
			     $scope.temp5.member_reason_code=document.getElementById(reg_on5).value;
			  					$log.info($scope.temp5);
			 }
			 
			 $scope.post_main_json.post_group_staus=document.getElementById('post_group_staus').value;
			 $scope.post_main_json.post_group_reason=document.getElementById('post_group_reason').value;
			 $log.info($scope.post_main_json);
		 
		 };
			 
			$scope.viewmamberdetails=function(m_id)
			{
				//var url="http://139.59.34.255:8080/MicroFinance/member_profie/7/22/"+m_id;
				var url='http://139.59.34.255:8080/MicroFinance/member_profie/7/22/1';
				  $http.get(url)
	    		  .then(function(responsesd)
	    				  {
	    			
	    				 // var t=;
	    	 $log.info(JSON.stringify(responsesd.data));
	    			  
	    			 $scope.member_viewss=responsesd.data;
		    		 
		    		  }
	    		  , function (responsesd)
	    		  {
	    			  $log.info(" error in post approval member view section "+responsesd.data);
	    		 
	    		  }); 
			};
		 
		 
	 
});	

 
 




</script>
      