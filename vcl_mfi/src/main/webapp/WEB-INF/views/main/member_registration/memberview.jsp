 

    <jsp:include page="../part/header.jsp"></jsp:include>
  <jsp:include page="../part/nav.jsp"></jsp:include>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
   <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

        <!-- Page content -->
		<script>
		
		
	  	var app=angular.module('member_view',[]);
		app.controller('mv',function($scope,$http){
			
			$scope.org_brnach_id=$scope.org_brnach_id;	
			$scope.employee_id=$scope.employee_id;
			$scope.find_all_re_list=function()
			{
				
			 var  data={org_brnach_id:$scope.org_brnach_id};
			 
			  //Call the services
   		  $http.post('get_re_list', data)
   		  .then(function(response)
   				  {
   			    $scope.re_list=response.data;
   			  // console.log($scope.re_list.);
   			  
   			  if(response.data)
   				  {$scope.employee_id=0;
   				     $scope.get_all_member();
   				     
   				    
   				  }
   			
	    		 
	    		  }
	   		  , function (response)
	   		  {
	   		 
	   		  });	 
   		   
				 
			};
			
			$scope.get_all_member=function()
			{
				
				var data={employee_id:$scope.employee_id}
				  //Call the services
		   		  $http.post('get_member_list', data)
		   		  .then(function(responses)
		   				  {
		   			    $scope.member_list=responses.data;
			    		 
			    		  }
			   		  , function (responses)
			   		  {
			   		 
			   		  });	
	 
			};
			
			$scope.viewMember=function(m_id)
			{
				//var url="http://139.59.34.255:8080/MicroFinance/member_profie/7/22/"+m_id;
				var url='http://139.59.34.255:8080/MicroFinance/member_profie/7/22/11';
				  $http.get(url)
	    		  .then(function(responsesd)
	    				  {
	    			
	    				  var t=JSON.stringify(responsesd.data);
	    			  console.log(t);
	    			  
	    			  $scope.member_viewss=responsesd.data;
		    		 
		    		  }
	    		  , function (responsesd)
	    		  {
	    		 
	    		  }); 
			};
			
		});  
		</script>
         
        <div id="content" class="col-md-12 ng-scope" ng-app="member_view" ng-controller="mv" tabindex="5001" style="overflow: hidden; outline: none; padding-left: 265px;">
	  
	 

          <!-- page header -->

          <div class="pageheader">

            



            <h2><i class="fa fa-user" style="line-height: 46px;padding-left: 0;"></i>Member Profile <span></span></h2>

            



            <div class="breadcrumbs">

              <ol class="breadcrumb">

                <li>You are here</li>

                <li><a href="http://localhost:8089/vcl_mfi/index.html">Minimal</a></li>

                <li><a href="http://localhost:8089/vcl_mfi/memberregistration?person_id=1#">Example Pages</a></li>

                <li class="active">Profile</li>

              </ol>

            </div>





          </div>

          <!-- /page header -->

          

          









          <!-- content main container -->

          <div class="main">        







           <!-- row -->

            <div class="row">









              <!-- col 4 -->

              <div class="col-md-4">

              



                <!-- tile -->

                <section class="tile transparent">









                  <!-- tile header -->

                  <div class="tile-header nopadding">               

                    <div class="controls">

                      <a href="http://localhost:8089/vcl_mfi/memberregistration?person_id=1#" class="minimize"><i class="fa fa-chevron-down"></i></a>

                      <a href="http://localhost:8089/vcl_mfi/memberregistration?person_id=1#" class="refresh"><i class="fa fa-refresh"></i></a>

                      <a href="http://localhost:8089/vcl_mfi/memberregistration?person_id=1#" class="remove"><i class="fa fa-times"></i></a>

                    </div>

                  </div>

                  <!-- /tile header -->



                  <!-- tile widget -->

                
                   

                      <section class="tile transparent-black">
					
                         <div class="col-sm-6">
                          <select ng-change="find_all_re_list()"  ng-model="org_brnach_id" ng-init="org_brnach_id='0'"class="chosen-select chosen-transparent form-control" id="input07"  >
                             <option value="0">Select Branch</option>b
						   <c:forEach var="bl" items="${branch_list}">
					      <option value="${bl.getOrg_brnach_id() }">${bl.getBranch_name() }</option>
							
							 </c:forEach>
							
							
                          </select>
                          
                        </div>
						<div class="col-sm-6">
                          <select ng-init="employee_id='0'"class="chosen-select chosen-transparent form-control" id="input07" ng-model="employee_id"  ng-change="get_all_member()">
                            <option  value="0">Select RE</option>
							<option ng-repeat="r in re_list" value="{{r.employee_id}}">{{r.emp_first_name}}{{' '}}{{r.emp_mid_name}} {{' '}}{{r.emp_last_name}}</option>
							 
							
							
                          </select>
                           
                        </div>
                    </section> 
                  



                </section>
				
				 <section class="tile transparent col-md-12">


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
							 <th class="sort-alpha col-md-1">ID</th>
                            <th class="sort-alpha col-md-3"> Name</th>
                            
                            <th class="sort-alpha col-md-3"> Action</th>
                          </tr>
                        </thead>
                        <tbody  ng-repeat="m in member_list">
						
                          <tr class="odd gradeX">
                            <td>{{m.memberid}}</td>
                            <td class="">{{m.membername}}</td>
                       <td class="actions text-center"><button ng-click="viewMember(m.memberid)" type="button" class="label label-warning">View</button></td>
							
                          </tr>
                       
                      
						 
						 
                      </table>
                    </div>

                  </div>
                  <!-- /tile body -->
                


                </section>
                
                 
                <!-- /tile -->

                





              </div>

              <!-- /col 4 -->





              <!-- col 8 -->

              <div class="col-md-8">

              



                

                <!-- tile -->

                <section class="tile transparent">



                  <!-- tile widget -->

                  <div class="tile-widget nopadding color transparent-black rounded-top-corners">

                    <!-- Nav tabs -->

                    <ul class="nav nav-tabs tabdrop">

                      <li class="active"><a href="http://localhost:8089/vcl_mfi/memberregistration?person_id=1#form" data-toggle="tab">Profile</a></li>

                      <li class=""><a href="http://localhost:8089/vcl_mfi/memberregistration?person_id=1#tasks-tab" data-toggle="tab">Member Log</a></li>

                      <li class=""><a href="http://localhost:8089/vcl_mfi/memberregistration?person_id=1#settings-tab" data-toggle="tab">Documents</a></li>

                    </ul>

                    <!-- / Nav tabs -->

                  </div>

                  <!-- /tile widget -->



                  <!-- tile body -->

                 		<!--  <div class="tile-body tab-content rounded-bottom-corners"  ng-repeat="(key,mm) in member_viewss"> -->

				 <div class="tile-body tab-content rounded-bottom-corners" >
 

                    <!-- Tab panes -->                 

                    <div id="form" class="tab-pane fade active in" "="">

                      

                      <form class="profile-settings ng-pristine ng-valid">

                        

                        <div class="row">

                          <div class="form-group col-md-12 legend">

                            <h4><strong>Member</strong> Profile</h4>

                           

                          </div>

                        </div>




                        <div class="row">

						<!-- ngRepeat: ww in member_reg -->
                   
                  
                

                         <!--  <div class="form-group col-sm-6">

                            <label for="first-name">Member Type</label>

                            <input type="text" class="form-control" id="first-name" value="John">

                          </div> -->
            
                 <input type="hidden" ng-model="member.person_id" ng-init="member.person_id='1'" class="ng-pristine ng-untouched ng-valid">
			 
				 
				
				<input type="hidden" ng-model="member.area" ng-init="member.area='1'" class="ng-pristine ng-untouched ng-valid">
			    
			 
				
                            <div class="form-group col-sm-6">

                            <label for="first-name">Full Name : </label>
                            <span style="color:#0093A5;">  {{member_viewss.member_name}}</span>
                        

                          </div>

 
                          <div class="form-group col-sm-6">

                            <label for="last-name">Gender :</label>
                            <span style="color:#0093A5;" >{{member_viewss.gender}}</span>
                           

                          </div>

                            <div class="form-group col-sm-6">

                            <label for="last-name">Date of Birth : </label>
                             <span style="color:#0093A5;" >{{member_viewss.d_o_b}}</span>
                           

                          </div>

                          <div class="form-group col-sm-6">

                            <label for="first-name">Primary ID :</label>
                            <span style="color:#0093A5;" >{{member_viewss.primary_id_value}}</span>
                           

                          </div>  

                         



                        </div>

                         <div class="row">

						    



                          <div class="form-group col-sm-6">

                            <label for="last-name">Secondary ID :</label>
                            <span style="color:#0093A5;" >{{member_viewss.secondary_id_value}}</span>
                           

                          </div>
  <div class="form-group col-sm-6">

                            <label for="last-name">Father Name :</label>
                             <span style="color:#0093A5;" >{{member_viewss.father_name}}</span>
                           

                          </div>
						 
                              </div>						 

                          <div class="row">



            <!--               <div class="form-group col-sm-3">

                            <label for="first-name">Other ID Type</label>

                            <select class="chosen-select  form-control parsley-validated" >

                            <option value="">Please choose</option>

                            <option value="1">UID</option>

                            <option value="2">Pan</option>

                            <option value="3">Voter ID</option>

                          </select>  

                          </div>
 -->


                        <!--   <div class="form-group col-sm-3">

                            <label for="last-name">Other ID Number </label>

                            <input type="text" class="form-control" id="last-name" value="Douey">

                          </div>
 -->
                              

                          

                            <div class="form-group col-sm-6">

                            <label for="last-name">Mother Name :</label>
                            <span style="color:#0093A5;" > {{member_viewss.mother_name}}</span>
                            

                          </div>
                             
			 
						       <div class="form-group col-sm-6">

                            <label for="dribbble">Contact type :</label>
                             <span style="color:#0093A5;" > {{member_viewss.contact_type2}}</span>
		
							
                           </div>
                            <div class="form-group col-sm-6">

                            <label for="last-name">Member Mobile 1 :</label>
                             <span style="color:#0093A5;"> {{member_viewss.mem_mob_no1}}</span>
                          

                          </div>

                            <div class="form-group col-sm-5">

                            <label for="last-name">Member Mobile 2 :</label>
                              <span style="color:#0093A5;" >{{member_viewss.mem_mob_no2}}</span>
                            

                          </div>

                            



                        </div>

                          

                  
						   
                         <div class="row">

                          <div class="form-group col-md-12 legend">

                            <h4><strong>Nominee</strong> Details</h4>

                           

                          </div>

                        </div>


                          

                               

                               <div class="form-group col-sm-6">

                            <label for="first-name">Nominee Name :</label>
                            <span style="color:#0093A5;">{{member_viewss.nominee_name}}</span>
                        

                          </div>



                          <div class="form-group col-sm-4">

                            <label for="last-name">Nominee Relation :</label>
                            <span style="color:#0093A5;" >{{member_viewss.nominee_relation}}</span>

                              

                              

                          </div>

                              <div class="form-group col-sm-6">

                            <label for="dribbble">Nominee Gender :</label>
                             <span style="color:#0093A5;" >{{member_viewss.nominee_gender}}</span>
		
                          </div> 
						  
                            <div class="form-group col-sm-4">

                            <label for="last-name">Nominee DOB :</label>
                            <span style="color:#0093A5;" >{{member_viewss.nominee_d_o_b}}</span>
                          
 
                          </div>
                            
                              <div class="form-group col-sm-6">

                            <label for="dribbble">Nominee Age :</label>
                            <span style="color:#0093A5;" >{{member_viewss.nominee_age}}</span>
			
					 
                           </div>
 
                            <div class="form-group col-sm-6">

                            <label for="last-name">Nominee ID Type :</label>
                              <span style="color:#0093A5;" >{{member_viewss.nominee_id_type}} </span>
                            

                          

                                

                                

                                

                                

                          </div>

                            <div class="form-group col-sm-6">

                            <label for="last-name">Nominee ID Number :</label>
                             <span style="color:#0093A5;" >{{member_viewss.nominee_id_num}}</span>
                           

                          </div>

                               

                              

                            <div class="form-group col-sm-4">

                            <label for="last-name">Caste :</label>
                             <span style="color:#0093A5;">{{member_viewss.member_cast}} </span>

                          </div>

                              

                            <div class="form-group col-sm-6">

                            <label for="last-name">Religion :</label>
                            <span style="color:#0093A5;" >{{member_viewss.member_religion}} </span>
                           

                          </div>

                            

                     

                            

                              
                         <div class="row">

                          <div class="form-group col-md-12 legend">

                            <h4><strong>House</strong> Type</h4>

                           

                          </div>

                        </div>



                            <div class="form-group col-sm-4">

                            <label for="last-name">House Type :</label>
                            <span style="color:#0093A5;">{{member_viewss.house_type}} </span>
                          

                          </div>

                           <div class="form-group col-sm-8">

                            <label for="address1">Address Line 1 :</label>
                           <span style="color:#0093A5;" >{{member_viewss.pr_add_line_1}} </span>
                          

                          </div>    

                            

                            


                          





                     



                          <div class="form-group col-sm-4">

                            <label for="city">Residence Type :</label>
                            <span style="color:#0093A5;">{{member_viewss.residence_type}} </span>
                             
							

                          </div>

                            

                        <div class="form-group col-sm-4">

                            <label for="city">City :</label>

                          <!--   <input type="text"   ng-model="member.vtc" class="form-control" id="city" value="Bratislava"> -->
                             <span style="color:#0093A5;">{{member_viewss.pr_city}} </span>


                          </div>

                          
						           <div class="form-group col-sm-4">

                            <label for="dribbble">District :</label>
                            <span style="color:#0093A5;">{{member_viewss.pr_district}} </span>
		
                           </div>




                          <div class="form-group col-sm-4">

                            <label for="zip">Pin Code :</label>
                           <span style="color:#0093A5;" >{{member_viewss.pr_pin_code}} </span>
                         

                          </div>

                          
						         <div class="form-group col-sm-4">

                            <label for="dribbble">Address Type :</label>
                             <span style="color:#0093A5;" >{{member_viewss.pr_addess_type}} </span>
		
							
                          </div>
                         <div class="form-group col-sm-4">

                            <label for="dribbble">Block : </label>
                             <span style="color:#0093A5;">{{member_viewss.pr_block}} </span>
		
                           </div>
						   
						   
                          <div class="form-group col-sm-4">

                            <label for="state">State :</label>
							 <span style="color:#0093A5;" >{{member_viewss.pr_state}} </span>
                          </div>
						   
                       



                       <!-- this section for current address type  start -->


                            <div class="form-group col-sm-4">

                            <label for="last-name">House Type current :</label>
                            <span style="color:#0093A5;">{{member_viewss.house_type}} </span>
                          

                          </div>

                           <div class="form-group col-sm-8">

                            <label for="address1">Address Line 1 :</label>
                           <span style="color:#0093A5;" >{{member_viewss.cr_add_line_1}} </span>
                          

                          </div>    

                            

                            


                          





                     



                          <div class="form-group col-sm-4">

                            <label for="city">Residence Type :</label>
                            <span style="color:#0093A5;">{{member_viewss.residence_type}} </span>
                             
							

                          </div>

                            

                        <div class="form-group col-sm-4">

                            <label for="city">City :</label>

                          <!--   <input type="text"   ng-model="member.vtc" class="form-control" id="city" value="Bratislava"> -->
                             <span style="color:#0093A5;">{{member_viewss.cr_city}} </span>


                          </div>

                          
						           <div class="form-group col-sm-4">

                            <label for="dribbble">District :</label>
                            <span style="color:#0093A5;">{{member_viewss.cr_district}} </span>
		
                           </div>




                          <div class="form-group col-sm-4">

                            <label for="zip">Pin Code :</label>
                           <span style="color:#0093A5;" >{{member_viewss.cr_pin_code}} </span>
                         

                          </div>

                          
						         <div class="form-group col-sm-4">

                            <label for="dribbble">Address Type :</label>
                             <span style="color:#0093A5;" >{{member_viewss.cr_addess_type}} </span>
		
							
                          </div>
                         <div class="form-group col-sm-4">

                            <label for="dribbble">Block : </label>
                             <span style="color:#0093A5;">{{member_viewss.cr_block}} </span>
		
                           </div>
						   
						   
                          <div class="form-group col-sm-4">

                            <label for="state">State :</label>
							 <span style="color:#0093A5;" >{{member_viewss.cr_state}} </span>
                          </div>
                        

   <!-- this section for current address type   end -->


                        <div class="row">

                          <div class="form-group col-md-12 legend">

                            <h4><strong>Bank</strong> Details</h4>
                            
                            

                          </div>

                        </div>


                            <div ng-repeat="z in member_viewss.bank_details">
                        
						<span> Bank {{$index+1}}</span>
                             

                          <div class="form-group col-sm-6">

                            <label for="facebook">Beneficiary Name :</label>

                           <span style="color:#0093A5;"> {{z.beneficiary_name}} </span>
 
                          </div>



                          <div class="form-group col-sm-6">

                            <label for="google-plus"> Account Number :</label>
                             <span style="color:#0093A5;"> {{z.account_no}} </span>

                          </div>



                       



                      



                          <div class="form-group col-sm-6">

                            <label for="pinterest">IFSC :</label>
                            <span style="color:#0093A5;"> {{z.ifsc_code}} </span>
                         

                          </div>



                          <div class="form-group col-sm-6">

                            <label for="flickr">Bank Name :</label>
                            <span style="color:#0093A5;"> {{z.bank_name}} </span>
                        
							
							

                          </div>

</div>

                          <div class="form-group col-sm-6">

                            <label for="dribbble">Security Cheque Bank Name :</label>
                              <span style="color:#0093A5;" >{{member_viewss.sequity_cheque_bank_name}} </span>
              
	
                          </div>



                          <div class="form-group col-sm-6">

                            <label for="github">Security Cheque Number :</label>
                                <span style="color:#0093A5;" > {{member_viewss.sequrity_cheque_number}} </span>
                          

                          </div>



                     



                         
                           <div class="row">
                          <div class="form-group col-md-12 legend">

                            <h4><strong>Family &amp; Other</strong> Details</h4>

                            

                          </div>
                           </div>


                         <div class="form-group col-sm-4">

                            <label for="dribbble">Total Family Member :</label>
                             <span style="color:#0093A5;" > {{member_viewss.total_family_member}} </span>
                          

                          </div>



                          <div class="form-group col-sm-4">

                            <label for="github">Total Earning Member :</label>
                             <span style="color:#0093A5;">{{member_viewss.total_earning_member}}</span>
                           

                          </div>

                        <div class="form-group col-sm-4">

                            <label for="github">Total Dependent Member :</label>
                               <span style="color:#0093A5;" >{{member_viewss.total_dependent_member}} </span>

                          </div>

                         <div class="form-group col-sm-4">

                            <label for="dribbble">Loan Purpose :</label>
                            <span style="color:#0093A5;" > {{member_viewss.lone_purpose}} </span>
                            
		
							
                          </div>



                          <div class="form-group col-sm-4">

                            <label for="github">Income :</label>
                             <span style="color:#0093A5;" >{{member_viewss.income}} </span>
                           

                          </div>



                         <div class="form-group col-sm-4">

                            <label for="github">Qualification :</label>
                            <span style="color:#0093A5;" > {{member_viewss.qualification}}</span>
                         

                          </div>


                        <div class="form-group col-sm-4">

                            <label for="github">Fooding Expense :</label>
                              <span style="color:#0093A5; " >{{member_viewss.fooding_expense}}</span>
                        

                          </div>


                       
						     <div class="form-group col-sm-4">

                            <label for="github">Education Expense :</label>
                             <span style="color:#0093A5;" > {{member_viewss.education_expense}}</span>
                          

                          </div>

 
						     <div class="form-group col-sm-4">

                            <label for="github">Rent Expense :</label>
                             <span style="color:#0093A5;" >{{member_viewss.rent_expense}}</span>
                          

                          </div>

						  
						      <div class="form-group col-sm-4">

                            <label for="github">Medical Expense :</label>
                             <span style="color:#0093A5;">{{member_viewss.medical_expense}}</span>
                           

                          </div>
						  						  
						      <div class="form-group col-sm-6">

                            <label for="github">Loan Repayment Expense :</label>
                             <span style="color:#0093A5;" > {{member_viewss.loan_repayment_expense}}</span>
                          

                          </div>
						  						  
						      <div class="form-group col-sm-5">

                            <label for="github">Other Expense :</label>
                              <span style="color:#0093A5;"> {{member_viewss.other_expense}}</span>
                         

                          </div>
						  
						  
						  
						  
						  
						  
				 
					 
						  
						  
						  
						           
						 
					 
                           
						 
						 
					
						 
                      
                          

                          <div class="row">

                              

             <!--                   <div class="form-group col-sm-12">

                            <button type="button" ng-click="test()" class="btn btn-primary pull-right">Submit</button>

                          </div>
 -->


                       

                        

                           </div>



                      </form>



                    </div>



                    <div id="tasks-tab" class="tab-pane fade">

                      

                      <div class="btn-group btn-group-sm">

                        <button type="button" class="btn btn-default"><i class="fa fa-angle-left"></i></button>

                        <button type="button" class="btn btn-default"><i class="fa fa-angle-right"></i></button>

                      </div>



                      <h4 class="inline"><strong>April 10</strong>, 2014</h4>



                      <button type="button" class="btn btn-primary pull-right"><i class="fa fa-plus"></i> Add Task</button>





                      <ol class="task-list" id="task-list">



                        <!-- today tasks -->

                        <li class="group">

                          <div class="pointer"></div>

                          <h4><strong>Today</strong> April 10, 2014</h4>



                          <!-- tasks -->

                          <div class="task-group" id="accordion">



                            <!-- task -->

                            <div class="task panel">



                              <div class="priority priority-high"></div>



                              <div class="panel-heading">

                                

                                <div class="task-controls">

                                  <div class="checkbox">

                                    <input type="checkbox" id="task01chck">

                                    <label for="task01chck"></label>

                                  </div>



                                  <a href="http://localhost:8089/vcl_mfi/memberregistration?person_id=1#" class="mark marked"><i class="fa fa-star-o"></i></a>

                                </div>



                                <div class="heading">

                                  <h5>Responsive tweaks on another admin template</h5>

                                  <small>Added: April 06, 2014</small>

                                </div>



                                <span class="label label-red">high</span>



                                <a class="task-toggle" data-toggle="collapse" data-target="#task01" data-parent=".task-group" href="http://localhost:8089/vcl_mfi/memberregistration?person_id=1#">

                                  <i class="fa fa-angle-down"></i>

                                </a>



                              </div>



                              <div id="task01" class="collapse">

                                <div class="panel-body task-content">

                                  <div class="row">

                                    <div class="col-lg-10 col-md-8">

                                      <ul class="media-list">

                                        <li class="media">

                                          <i class="pull-left fa fa-thumb-tack"></i>

                                          <div class="media-body">

                                            <h5 class="media-heading"><strong>ID:</strong> #3694</h5>

                                          </div>

                                        </li>

                                        <li class="media">

                                          <i class="pull-left fa fa-clock-o"></i>

                                          <div class="media-body">

                                            <h5 class="media-heading"><strong>Due Date:</strong> April 10, 2014</h5>

                                          </div>

                                        </li>

                                        <li class="media">

                                          <i class="pull-left fa fa-user"></i>

                                          <div class="media-body">

                                            <h5 class="media-heading"><strong>Assigned By:</strong> Ing. Imrich Kamarel</h5>

                                          </div>

                                        </li>

                                        <li class="media">

                                          <i class="pull-left fa fa-clock-o"></i>

                                          <div class="media-body">

                                            <h5 class="media-heading"><strong>Created At:</strong> April 03, 2014</h5>

                                          </div>

                                        </li>

                                        <li class="media">

                                          <i class="pull-left fa fa-info-circle"></i>

                                          <div class="media-body">

                                            <h5 class="media-heading"><strong>Additional Info:</strong></h5>

                                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>

                                          </div>

                                        </li>

                                      </ul>

                                    </div>

                                    <div class="col-lg-2 col-md-4 task-controls">

                                      <button class="btn btn-red btn-sm"><i class="fa fa-trash-o"></i> Delete</button>

                                      <button class="btn btn-blue btn-sm"><i class="fa fa-pencil"></i> Edit</button>

                                      <button class="btn btn-green btn-sm"><i class="fa fa-check"></i> Complete</button>

                                    </div>

                                  </div>

                                </div>

                              </div>



                            </div>

                            <!-- /task -->



                            <!-- task -->

                            <div class="task panel active">



                              <div class="priority priority-low"></div>



                              <div class="panel-heading">

                                

                                <div class="task-controls">

                                  <div class="checkbox">

                                    <input type="checkbox" id="task02chck">

                                    <label for="task02chck"></label>

                                  </div>



                                  <a href="http://localhost:8089/vcl_mfi/memberregistration?person_id=1#" class="mark"><i class="fa fa-star-o"></i></a>

                                </div>



                                <div class="heading">

                                  <h5>Another one task in our task list</h5>

                                  <small>Added: April 03, 2014</small>

                                </div>



                                <span class="label label-green">low</span>



                                <a class="task-toggle" data-toggle="collapse" data-target="#task02" data-parent=".task-group" href="http://localhost:8089/vcl_mfi/memberregistration?person_id=1#">

                                  <i class="fa fa-angle-down"></i>

                                </a>



                              </div>



                              <div id="task02" class="collapse in">

                                <div class="panel-body task-content">

                                  <div class="row">

                                    <div class="col-lg-10 col-md-8">

                                      <ul class="media-list">

                                        <li class="media">

                                          <i class="pull-left fa fa-thumb-tack"></i>

                                          <div class="media-body">

                                            <h5 class="media-heading"><strong>ID:</strong> #3694</h5>

                                          </div>

                                        </li>

                                        <li class="media">

                                          <i class="pull-left fa fa-clock-o"></i>

                                          <div class="media-body">

                                            <h5 class="media-heading"><strong>Due Date:</strong> April 10, 2014</h5>

                                          </div>

                                        </li>

                                        <li class="media">

                                          <i class="pull-left fa fa-user"></i>

                                          <div class="media-body">

                                            <h5 class="media-heading"><strong>Assigned By:</strong> Ing. Imrich Kamarel</h5>

                                          </div>

                                        </li>

                                        <li class="media">

                                          <i class="pull-left fa fa-clock-o"></i>

                                          <div class="media-body">

                                            <h5 class="media-heading"><strong>Created At:</strong> April 03, 2014</h5>

                                          </div>

                                        </li>

                                        <li class="media">

                                          <i class="pull-left fa fa-info-circle"></i>

                                          <div class="media-body">

                                            <h5 class="media-heading"><strong>Additional Info:</strong></h5>

                                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>

                                          </div>

                                        </li>

                                      </ul>

                                    </div>

                                    <div class="col-lg-2 col-md-4 task-controls">

                                      <button class="btn btn-red btn-sm"><i class="fa fa-trash-o"></i> Delete</button>

                                      <button class="btn btn-blue btn-sm"><i class="fa fa-pencil"></i> Edit</button>

                                      <button class="btn btn-green btn-sm"><i class="fa fa-check"></i> Complete</button>

                                    </div>

                                  </div>

                                </div>

                              </div>



                            </div>

                            <!-- /task -->





                            <!-- task -->

                            <div class="task panel">



                              <div class="priority priority-medium"></div>



                              <div class="panel-heading">

                                

                                <div class="task-controls">

                                  <div class="checkbox">

                                    <input type="checkbox" id="task03chck">

                                    <label for="task03chck"></label>

                                  </div>



                                  <a href="http://localhost:8089/vcl_mfi/memberregistration?person_id=1#" class="mark"><i class="fa fa-star-o"></i></a>

                                </div>



                                <div class="heading">

                                  <h5>Another one task in our task list</h5>

                                  <small>Added: April 02, 2014</small>

                                </div>



                                <span class="label label-orange">medium</span>



                                <a class="task-toggle" data-toggle="collapse" data-target="#task03" data-parent=".task-group" href="http://localhost:8089/vcl_mfi/memberregistration?person_id=1#">

                                  <i class="fa fa-angle-down"></i>

                                </a>



                              </div>



                              <div id="task03" class="collapse">

                                <div class="panel-body task-content">

                                  <div class="row">

                                    <div class="col-lg-10 col-md-8">

                                      <ul class="media-list">

                                        <li class="media">

                                          <i class="pull-left fa fa-thumb-tack"></i>

                                          <div class="media-body">

                                            <h5 class="media-heading"><strong>ID:</strong> #3694</h5>

                                          </div>

                                        </li>

                                        <li class="media">

                                          <i class="pull-left fa fa-clock-o"></i>

                                          <div class="media-body">

                                            <h5 class="media-heading"><strong>Due Date:</strong> April 10, 2014</h5>

                                          </div>

                                        </li>

                                        <li class="media">

                                          <i class="pull-left fa fa-user"></i>

                                          <div class="media-body">

                                            <h5 class="media-heading"><strong>Assigned By:</strong> Ing. Imrich Kamarel</h5>

                                          </div>

                                        </li>

                                        <li class="media">

                                          <i class="pull-left fa fa-clock-o"></i>

                                          <div class="media-body">

                                            <h5 class="media-heading"><strong>Created At:</strong> April 03, 2014</h5>

                                          </div>

                                        </li>

                                        <li class="media">

                                          <i class="pull-left fa fa-info-circle"></i>

                                          <div class="media-body">

                                            <h5 class="media-heading"><strong>Additional Info:</strong></h5>

                                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>

                                          </div>

                                        </li>

                                      </ul>

                                    </div>

                                    <div class="col-lg-2 col-md-4 task-controls">

                                      <button class="btn btn-red btn-sm"><i class="fa fa-trash-o"></i> Delete</button>

                                      <button class="btn btn-blue btn-sm"><i class="fa fa-pencil"></i> Edit</button>

                                      <button class="btn btn-green btn-sm"><i class="fa fa-check"></i> Complete</button>

                                    </div>

                                  </div>

                                </div>

                              </div>



                            </div>

                            <!-- /task -->





                          </div>

                          <!-- tasks -->





                        </li>

                        <!-- /today tasks -->







                        <!-- completed tasks -->

                        <li class="group completed">

                          <h5><i class="fa fa-check-circle-o"></i> <strong>Completed</strong> Tasks</h5>



                          <!-- tasks -->

                          <div class="task-group" id="accordion02">



                            <!-- task -->

                            <div class="task panel">



                              <div class="priority priority-normal"></div>



                              <div class="panel-heading">

                                

                                <div class="task-controls">

                                  <div class="checkbox">

                                    <input type="checkbox" id="task04chck" checked="">

                                    <label for="task04chck"></label>

                                  </div>



                                  <a href="http://localhost:8089/vcl_mfi/memberregistration?person_id=1#" class="mark marked"><i class="fa fa-star-o"></i></a>

                                </div>



                                <div class="heading">

                                  <h5>Another one completed task in our task list</h5>

                                  <small>Added: April 06, 2014</small>

                                </div>



                                <span class="label">normal</span>



                                <a class="task-toggle" data-toggle="collapse" data-target="#task04" data-parent=".task-group" href="http://localhost:8089/vcl_mfi/memberregistration?person_id=1#">

                                  <i class="fa fa-angle-down"></i>

                                </a>



                              </div>



                              <div id="task04" class="collapse">

                                <div class="panel-body task-content">

                                  <div class="row">

                                    <div class="col-lg-10 col-md-8">

                                      <ul class="media-list">

                                        <li class="media">

                                          <i class="pull-left fa fa-thumb-tack"></i>

                                          <div class="media-body">

                                            <h5 class="media-heading"><strong>ID:</strong> #3694</h5>

                                          </div>

                                        </li>

                                        <li class="media">

                                          <i class="pull-left fa fa-clock-o"></i>

                                          <div class="media-body">

                                            <h5 class="media-heading"><strong>Due Date:</strong> April 10, 2014</h5>

                                          </div>

                                        </li>

                                        <li class="media">

                                          <i class="pull-left fa fa-user"></i>

                                          <div class="media-body">

                                            <h5 class="media-heading"><strong>Assigned By:</strong> Ing. Imrich Kamarel</h5>

                                          </div>

                                        </li>

                                        <li class="media">

                                          <i class="pull-left fa fa-clock-o"></i>

                                          <div class="media-body">

                                            <h5 class="media-heading"><strong>Created At:</strong> April 03, 2014</h5>

                                          </div>

                                        </li>

                                        <li class="media">

                                          <i class="pull-left fa fa-info-circle"></i>

                                          <div class="media-body">

                                            <h5 class="media-heading"><strong>Additional Info:</strong></h5>

                                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>

                                          </div>

                                        </li>

                                      </ul>

                                    </div>

                                    <div class="col-lg-2 col-md-4 task-controls">

                                      <button class="btn btn-red btn-sm"><i class="fa fa-trash-o"></i> Delete</button>

                                      <button class="btn btn-blue btn-sm"><i class="fa fa-pencil"></i> Edit</button>

                                      <button class="btn btn-green btn-sm"><i class="fa fa-check"></i> Complete</button>

                                    </div>

                                  </div>

                                </div>

                              </div>



                            </div>

                            <!-- /task -->





                          </div>

                          <!-- tasks -->





                        </li>

                        <!-- /completed tasks -->







                        <!-- yesterday tasks -->

                        <li class="group">

                          <div class="pointer"></div>

                          <h4><strong>Yesterday</strong> April 09, 2014</h4>



                          <!-- tasks -->

                          <div class="task-group" id="accordion03">



                            <!-- task -->

                            <div class="task panel">



                              <div class="priority priority-medium"></div>



                              <div class="panel-heading">

                                

                                <div class="task-controls">

                                  <div class="checkbox">

                                    <input type="checkbox" id="task05chck">

                                    <label for="task05chck"></label>

                                  </div>



                                  <a href="http://localhost:8089/vcl_mfi/memberregistration?person_id=1#" class="mark marked"><i class="fa fa-star-o"></i></a>

                                </div>



                                <div class="heading">

                                  <h5>Another one task in our task list</h5>

                                  <small>Added: April 02, 2014</small>

                                </div>



                                <span class="label label-orange">medium</span>



                                <a class="task-toggle" data-toggle="collapse" data-target="#task05" data-parent=".task-group" href="http://localhost:8089/vcl_mfi/memberregistration?person_id=1#">

                                  <i class="fa fa-angle-down"></i>

                                </a>



                              </div>



                              <div id="task05" class="collapse">

                                <div class="panel-body task-content">

                                  <div class="row">

                                    <div class="col-lg-10 col-md-8">

                                      <ul class="media-list">

                                        <li class="media">

                                          <i class="pull-left fa fa-thumb-tack"></i>

                                          <div class="media-body">

                                            <h5 class="media-heading"><strong>ID:</strong> #3694</h5>

                                          </div>

                                        </li>

                                        <li class="media">

                                          <i class="pull-left fa fa-clock-o"></i>

                                          <div class="media-body">

                                            <h5 class="media-heading"><strong>Due Date:</strong> April 10, 2014</h5>

                                          </div>

                                        </li>

                                        <li class="media">

                                          <i class="pull-left fa fa-user"></i>

                                          <div class="media-body">

                                            <h5 class="media-heading"><strong>Assigned By:</strong> Ing. Imrich Kamarel</h5>

                                          </div>

                                        </li>

                                        <li class="media">

                                          <i class="pull-left fa fa-clock-o"></i>

                                          <div class="media-body">

                                            <h5 class="media-heading"><strong>Created At:</strong> April 03, 2014</h5>

                                          </div>

                                        </li>

                                        <li class="media">

                                          <i class="pull-left fa fa-info-circle"></i>

                                          <div class="media-body">

                                            <h5 class="media-heading"><strong>Additional Info:</strong></h5>

                                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>

                                          </div>

                                        </li>

                                      </ul>

                                    </div>

                                    <div class="col-lg-2 col-md-4 task-controls">

                                      <button class="btn btn-red btn-sm"><i class="fa fa-trash-o"></i> Delete</button>

                                      <button class="btn btn-blue btn-sm"><i class="fa fa-pencil"></i> Edit</button>

                                      <button class="btn btn-green btn-sm"><i class="fa fa-check"></i> Complete</button>

                                    </div>

                                  </div>

                                </div>

                              </div>



                            </div>

                            <!-- /task -->





                          </div>

                          <!-- tasks -->





                        </li>

                        <!-- /today tasks -->







                        <!-- completed tasks -->

                        <li class="group completed">

                          <h5><i class="fa fa-check-circle-o"></i> <strong>Completed</strong> Tasks</h5>



                          <!-- tasks -->

                          <div class="task-group" id="accordion04">



                            <!-- task -->

                            <div class="task panel">



                              <div class="priority priority-normal"></div>



                              <div class="panel-heading">

                                

                                <div class="task-controls">

                                  <div class="checkbox">

                                    <input type="checkbox" id="task06chck" checked="">

                                    <label for="task06chck"></label>

                                  </div>



                                  <a href="http://localhost:8089/vcl_mfi/memberregistration?person_id=1#" class="mark marked"><i class="fa fa-star-o"></i></a>

                                </div>



                                <div class="heading">

                                  <h5>Another one completed task in our task list</h5>

                                  <small>Added: April 06, 2014</small>

                                </div>



                                <span class="label label-default">normal</span>



                                <a class="task-toggle" data-toggle="collapse" data-target="#task06" data-parent=".task-group" href="http://localhost:8089/vcl_mfi/memberregistration?person_id=1#">

                                  <i class="fa fa-angle-down"></i>

                                </a>



                              </div>



                              <div id="task06" class="collapse">

                                <div class="panel-body task-content">

                                  <div class="row">

                                    <div class="col-lg-10 col-md-8">

                                      <ul class="media-list">

                                        <li class="media">

                                          <i class="pull-left fa fa-thumb-tack"></i>

                                          <div class="media-body">

                                            <h5 class="media-heading"><strong>ID:</strong> #3694</h5>

                                          </div>

                                        </li>

                                        <li class="media">

                                          <i class="pull-left fa fa-clock-o"></i>

                                          <div class="media-body">

                                            <h5 class="media-heading"><strong>Due Date:</strong> April 10, 2014</h5>

                                          </div>

                                        </li>

                                        <li class="media">

                                          <i class="pull-left fa fa-user"></i>

                                          <div class="media-body">

                                            <h5 class="media-heading"><strong>Assigned By:</strong> Ing. Imrich Kamarel</h5>

                                          </div>

                                        </li>

                                        <li class="media">

                                          <i class="pull-left fa fa-clock-o"></i>

                                          <div class="media-body">

                                            <h5 class="media-heading"><strong>Created At:</strong> April 03, 2014</h5>

                                          </div>

                                        </li>

                                        <li class="media">

                                          <i class="pull-left fa fa-info-circle"></i>

                                          <div class="media-body">

                                            <h5 class="media-heading"><strong>Additional Info:</strong></h5>

                                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>

                                          </div>

                                        </li>

                                      </ul>

                                    </div>

                                    <div class="col-lg-2 col-md-4 task-controls">

                                      <button class="btn btn-red btn-sm"><i class="fa fa-trash-o"></i> Delete</button>

                                      <button class="btn btn-blue btn-sm"><i class="fa fa-pencil"></i> Edit</button>

                                      <button class="btn btn-green btn-sm"><i class="fa fa-check"></i> Complete</button>

                                    </div>

                                  </div>

                                </div>

                              </div>



                            </div>

                            <!-- /task -->







                            <!-- task -->

                            <div class="task panel">



                              <div class="priority priority-high"></div>



                              <div class="panel-heading">

                                

                                <div class="task-controls">

                                  <div class="checkbox">

                                    <input type="checkbox" id="task07chck" checked="">

                                    <label for="task07chck"></label>

                                  </div>



                                  <a href="http://localhost:8089/vcl_mfi/memberregistration?person_id=1#" class="mark marked"><i class="fa fa-star-o"></i></a>

                                </div>



                                <div class="heading">

                                  <h5>Another one completed task in our task list</h5>

                                  <small>Added: April 06, 2014</small>

                                </div>



                                <span class="label label-red">high</span>



                                <a class="task-toggle" data-toggle="collapse" data-target="#task07" data-parent=".task-group" href="http://localhost:8089/vcl_mfi/memberregistration?person_id=1#">

                                  <i class="fa fa-angle-down"></i>

                                </a>



                              </div>



                              <div id="task07" class="collapse">

                                <div class="panel-body task-content">

                                  <div class="row">

                                    <div class="col-lg-10 col-md-8">

                                      <ul class="media-list">

                                        <li class="media">

                                          <i class="pull-left fa fa-thumb-tack"></i>

                                          <div class="media-body">

                                            <h5 class="media-heading"><strong>ID:</strong> #3694</h5>

                                          </div>

                                        </li>

                                        <li class="media">

                                          <i class="pull-left fa fa-clock-o"></i>

                                          <div class="media-body">

                                            <h5 class="media-heading"><strong>Due Date:</strong> April 10, 2014</h5>

                                          </div>

                                        </li>

                                        <li class="media">

                                          <i class="pull-left fa fa-user"></i>

                                          <div class="media-body">

                                            <h5 class="media-heading"><strong>Assigned By:</strong> Ing. Imrich Kamarel</h5>

                                          </div>

                                        </li>

                                        <li class="media">

                                          <i class="pull-left fa fa-clock-o"></i>

                                          <div class="media-body">

                                            <h5 class="media-heading"><strong>Created At:</strong> April 03, 2014</h5>

                                          </div>

                                        </li>

                                        <li class="media">

                                          <i class="pull-left fa fa-info-circle"></i>

                                          <div class="media-body">

                                            <h5 class="media-heading"><strong>Additional Info:</strong></h5>

                                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>

                                          </div>

                                        </li>

                                      </ul>

                                    </div>

                                    <div class="col-lg-2 col-md-4 task-controls">

                                      <button class="btn btn-red btn-sm"><i class="fa fa-trash-o"></i> Delete</button>

                                      <button class="btn btn-blue btn-sm"><i class="fa fa-pencil"></i> Edit</button>

                                      <button class="btn btn-green btn-sm"><i class="fa fa-check"></i> Complete</button>

                                    </div>

                                  </div>

                                </div>

                              </div>



                            </div>

                            <!-- /task -->





                          </div>

                          <!-- tasks -->





                        </li>

                        <!-- /completed tasks -->





                        <li class="more">

                          <div class="pointer"></div>

                          <button class="btn btn-default">Load More</button>

                        </li>

                                  



                      </ol>



                    </div>





                    <div id="settings-tab" class="tab-pane fade">

                      



                      

                        

                        

                        

                        

                        

                        

                        

                        

                        

                        

                        

                        

                        

                        

                        



                    </div>

                    <!-- / Tab panes -->



                  </div>
				 
				 

                    <div id="tasks-tab" class="tab-pane fade">

                      

                      <div class="btn-group btn-group-sm">

                        <button type="button" class="btn btn-default"><i class="fa fa-angle-left"></i></button>

                        <button type="button" class="btn btn-default"><i class="fa fa-angle-right"></i></button>

                      </div>



                      <h4 class="inline"><strong>April 10</strong>, 2014</h4>



                      <button type="button" class="btn btn-primary pull-right"><i class="fa fa-plus"></i> Add Task</button>





                      <ol class="task-list" id="task-list">



                        <!-- today tasks -->

                        <li class="group">

                          <div class="pointer"></div>

                          <h4><strong>Today</strong> April 10, 2014</h4>



                          <!-- tasks -->

                          <div class="task-group" id="accordion">



                            <!-- task -->

                            <div class="task panel">



                              <div class="priority priority-high"></div>



                              <div class="panel-heading">

                                

                                <div class="task-controls">

                                  <div class="checkbox">

                                    <input type="checkbox" id="task01chck">

                                    <label for="task01chck"></label>

                                  </div>



                                  <a href="http://localhost:8089/vcl_mfi/memberregistration?person_id=1#" class="mark marked"><i class="fa fa-star-o"></i></a>

                                </div>



                                <div class="heading">

                                  <h5>Responsive tweaks on another admin template</h5>

                                  <small>Added: April 06, 2014</small>

                                </div>



                                <span class="label label-red">high</span>



                                <a class="task-toggle" data-toggle="collapse" data-target="#task01" data-parent=".task-group" href="http://localhost:8089/vcl_mfi/memberregistration?person_id=1#">

                                  <i class="fa fa-angle-down"></i>

                                </a>



                              </div>



                              <div id="task01" class="collapse">

                                <div class="panel-body task-content">

                                  <div class="row">

                                    <div class="col-lg-10 col-md-8">

                                      <ul class="media-list">

                                        <li class="media">

                                          <i class="pull-left fa fa-thumb-tack"></i>

                                          <div class="media-body">

                                            <h5 class="media-heading"><strong>ID:</strong> #3694</h5>

                                          </div>

                                        </li>

                                        <li class="media">

                                          <i class="pull-left fa fa-clock-o"></i>

                                          <div class="media-body">

                                            <h5 class="media-heading"><strong>Due Date:</strong> April 10, 2014</h5>

                                          </div>

                                        </li>

                                        <li class="media">

                                          <i class="pull-left fa fa-user"></i>

                                          <div class="media-body">

                                            <h5 class="media-heading"><strong>Assigned By:</strong> Ing. Imrich Kamarel</h5>

                                          </div>

                                        </li>

                                        <li class="media">

                                          <i class="pull-left fa fa-clock-o"></i>

                                          <div class="media-body">

                                            <h5 class="media-heading"><strong>Created At:</strong> April 03, 2014</h5>

                                          </div>

                                        </li>

                                        <li class="media">

                                          <i class="pull-left fa fa-info-circle"></i>

                                          <div class="media-body">

                                            <h5 class="media-heading"><strong>Additional Info:</strong></h5>

                                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>

                                          </div>

                                        </li>

                                      </ul>

                                    </div>

                                    <div class="col-lg-2 col-md-4 task-controls">

                                      <button class="btn btn-red btn-sm"><i class="fa fa-trash-o"></i> Delete</button>

                                      <button class="btn btn-blue btn-sm"><i class="fa fa-pencil"></i> Edit</button>

                                      <button class="btn btn-green btn-sm"><i class="fa fa-check"></i> Complete</button>

                                    </div>

                                  </div>

                                </div>

                              </div>



                            </div>

                            <!-- /task -->



                            <!-- task -->

                            <div class="task panel active">



                              <div class="priority priority-low"></div>



                              <div class="panel-heading">

                                

                                <div class="task-controls">

                                  <div class="checkbox">

                                    <input type="checkbox" id="task02chck">

                                    <label for="task02chck"></label>

                                  </div>



                                  <a href="http://localhost:8089/vcl_mfi/memberregistration?person_id=1#" class="mark"><i class="fa fa-star-o"></i></a>

                                </div>



                                <div class="heading">

                                  <h5>Another one task in our task list</h5>

                                  <small>Added: April 03, 2014</small>

                                </div>



                                <span class="label label-green">low</span>



                                <a class="task-toggle" data-toggle="collapse" data-target="#task02" data-parent=".task-group" href="http://localhost:8089/vcl_mfi/memberregistration?person_id=1#">

                                  <i class="fa fa-angle-down"></i>

                                </a>



                              </div>



                              <div id="task02" class="collapse in">

                                <div class="panel-body task-content">

                                  <div class="row">

                                    <div class="col-lg-10 col-md-8">

                                      <ul class="media-list">

                                        <li class="media">

                                          <i class="pull-left fa fa-thumb-tack"></i>

                                          <div class="media-body">

                                            <h5 class="media-heading"><strong>ID:</strong> #3694</h5>

                                          </div>

                                        </li>

                                        <li class="media">

                                          <i class="pull-left fa fa-clock-o"></i>

                                          <div class="media-body">

                                            <h5 class="media-heading"><strong>Due Date:</strong> April 10, 2014</h5>

                                          </div>

                                        </li>

                                        <li class="media">

                                          <i class="pull-left fa fa-user"></i>

                                          <div class="media-body">

                                            <h5 class="media-heading"><strong>Assigned By:</strong> Ing. Imrich Kamarel</h5>

                                          </div>

                                        </li>

                                        <li class="media">

                                          <i class="pull-left fa fa-clock-o"></i>

                                          <div class="media-body">

                                            <h5 class="media-heading"><strong>Created At:</strong> April 03, 2014</h5>

                                          </div>

                                        </li>

                                        <li class="media">

                                          <i class="pull-left fa fa-info-circle"></i>

                                          <div class="media-body">

                                            <h5 class="media-heading"><strong>Additional Info:</strong></h5>

                                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>

                                          </div>

                                        </li>

                                      </ul>

                                    </div>

                                    <div class="col-lg-2 col-md-4 task-controls">

                                      <button class="btn btn-red btn-sm"><i class="fa fa-trash-o"></i> Delete</button>

                                      <button class="btn btn-blue btn-sm"><i class="fa fa-pencil"></i> Edit</button>

                                      <button class="btn btn-green btn-sm"><i class="fa fa-check"></i> Complete</button>

                                    </div>

                                  </div>

                                </div>

                              </div>



                            </div>

                            <!-- /task -->





                            <!-- task -->

                            <div class="task panel">



                              <div class="priority priority-medium"></div>



                              <div class="panel-heading">

                                

                                <div class="task-controls">

                                  <div class="checkbox">

                                    <input type="checkbox" id="task03chck">

                                    <label for="task03chck"></label>

                                  </div>



                                  <a href="http://localhost:8089/vcl_mfi/memberregistration?person_id=1#" class="mark"><i class="fa fa-star-o"></i></a>

                                </div>



                                <div class="heading">

                                  <h5>Another one task in our task list</h5>

                                  <small>Added: April 02, 2014</small>

                                </div>



                                <span class="label label-orange">medium</span>



                                <a class="task-toggle" data-toggle="collapse" data-target="#task03" data-parent=".task-group" href="http://localhost:8089/vcl_mfi/memberregistration?person_id=1#">

                                  <i class="fa fa-angle-down"></i>

                                </a>



                              </div>



                              <div id="task03" class="collapse">

                                <div class="panel-body task-content">

                                  <div class="row">

                                    <div class="col-lg-10 col-md-8">

                                      <ul class="media-list">

                                        <li class="media">

                                          <i class="pull-left fa fa-thumb-tack"></i>

                                          <div class="media-body">

                                            <h5 class="media-heading"><strong>ID:</strong> #3694</h5>

                                          </div>

                                        </li>

                                        <li class="media">

                                          <i class="pull-left fa fa-clock-o"></i>

                                          <div class="media-body">

                                            <h5 class="media-heading"><strong>Due Date:</strong> April 10, 2014</h5>

                                          </div>

                                        </li>

                                        <li class="media">

                                          <i class="pull-left fa fa-user"></i>

                                          <div class="media-body">

                                            <h5 class="media-heading"><strong>Assigned By:</strong> Ing. Imrich Kamarel</h5>

                                          </div>

                                        </li>

                                        <li class="media">

                                          <i class="pull-left fa fa-clock-o"></i>

                                          <div class="media-body">

                                            <h5 class="media-heading"><strong>Created At:</strong> April 03, 2014</h5>

                                          </div>

                                        </li>

                                        <li class="media">

                                          <i class="pull-left fa fa-info-circle"></i>

                                          <div class="media-body">

                                            <h5 class="media-heading"><strong>Additional Info:</strong></h5>

                                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>

                                          </div>

                                        </li>

                                      </ul>

                                    </div>

                                    <div class="col-lg-2 col-md-4 task-controls">

                                      <button class="btn btn-red btn-sm"><i class="fa fa-trash-o"></i> Delete</button>

                                      <button class="btn btn-blue btn-sm"><i class="fa fa-pencil"></i> Edit</button>

                                      <button class="btn btn-green btn-sm"><i class="fa fa-check"></i> Complete</button>

                                    </div>

                                  </div>

                                </div>

                              </div>



                            </div>

                            <!-- /task -->





                          </div>

                          <!-- tasks -->





                        </li>

                        <!-- /today tasks -->







                        <!-- completed tasks -->

                        <li class="group completed">

                          <h5><i class="fa fa-check-circle-o"></i> <strong>Completed</strong> Tasks</h5>



                          <!-- tasks -->

                          <div class="task-group" id="accordion02">



                            <!-- task -->

                            <div class="task panel">



                              <div class="priority priority-normal"></div>



                              <div class="panel-heading">

                                

                                <div class="task-controls">

                                  <div class="checkbox">

                                    <input type="checkbox" id="task04chck" checked="">

                                    <label for="task04chck"></label>

                                  </div>



                                  <a href="http://localhost:8089/vcl_mfi/memberregistration?person_id=1#" class="mark marked"><i class="fa fa-star-o"></i></a>

                                </div>



                                <div class="heading">

                                  <h5>Another one completed task in our task list</h5>

                                  <small>Added: April 06, 2014</small>

                                </div>



                                <span class="label">normal</span>



                                <a class="task-toggle" data-toggle="collapse" data-target="#task04" data-parent=".task-group" href="http://localhost:8089/vcl_mfi/memberregistration?person_id=1#">

                                  <i class="fa fa-angle-down"></i>

                                </a>



                              </div>



                              <div id="task04" class="collapse">

                                <div class="panel-body task-content">

                                  <div class="row">

                                    <div class="col-lg-10 col-md-8">

                                      <ul class="media-list">

                                        <li class="media">

                                          <i class="pull-left fa fa-thumb-tack"></i>

                                          <div class="media-body">

                                            <h5 class="media-heading"><strong>ID:</strong> #3694</h5>

                                          </div>

                                        </li>

                                        <li class="media">

                                          <i class="pull-left fa fa-clock-o"></i>

                                          <div class="media-body">

                                            <h5 class="media-heading"><strong>Due Date:</strong> April 10, 2014</h5>

                                          </div>

                                        </li>

                                        <li class="media">

                                          <i class="pull-left fa fa-user"></i>

                                          <div class="media-body">

                                            <h5 class="media-heading"><strong>Assigned By:</strong> Ing. Imrich Kamarel</h5>

                                          </div>

                                        </li>

                                        <li class="media">

                                          <i class="pull-left fa fa-clock-o"></i>

                                          <div class="media-body">

                                            <h5 class="media-heading"><strong>Created At:</strong> April 03, 2014</h5>

                                          </div>

                                        </li>

                                        <li class="media">

                                          <i class="pull-left fa fa-info-circle"></i>

                                          <div class="media-body">

                                            <h5 class="media-heading"><strong>Additional Info:</strong></h5>

                                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>

                                          </div>

                                        </li>

                                      </ul>

                                    </div>

                                    <div class="col-lg-2 col-md-4 task-controls">

                                      <button class="btn btn-red btn-sm"><i class="fa fa-trash-o"></i> Delete</button>

                                      <button class="btn btn-blue btn-sm"><i class="fa fa-pencil"></i> Edit</button>

                                      <button class="btn btn-green btn-sm"><i class="fa fa-check"></i> Complete</button>

                                    </div>

                                  </div>

                                </div>

                              </div>



                            </div>

                            <!-- /task -->





                          </div>

                          <!-- tasks -->





                        </li>

                        <!-- /completed tasks -->







                        <!-- yesterday tasks -->

                        <li class="group">

                          <div class="pointer"></div>

                          <h4><strong>Yesterday</strong> April 09, 2014</h4>



                          <!-- tasks -->

                          <div class="task-group" id="accordion03">



                            <!-- task -->

                            <div class="task panel">



                              <div class="priority priority-medium"></div>



                              <div class="panel-heading">

                                

                                <div class="task-controls">

                                  <div class="checkbox">

                                    <input type="checkbox" id="task05chck">

                                    <label for="task05chck"></label>

                                  </div>



                                  <a href="http://localhost:8089/vcl_mfi/memberregistration?person_id=1#" class="mark marked"><i class="fa fa-star-o"></i></a>

                                </div>



                                <div class="heading">

                                  <h5>Another one task in our task list</h5>

                                  <small>Added: April 02, 2014</small>

                                </div>



                                <span class="label label-orange">medium</span>



                                <a class="task-toggle" data-toggle="collapse" data-target="#task05" data-parent=".task-group" href="http://localhost:8089/vcl_mfi/memberregistration?person_id=1#">

                                  <i class="fa fa-angle-down"></i>

                                </a>



                              </div>



                              <div id="task05" class="collapse">

                                <div class="panel-body task-content">

                                  <div class="row">

                                    <div class="col-lg-10 col-md-8">

                                      <ul class="media-list">

                                        <li class="media">

                                          <i class="pull-left fa fa-thumb-tack"></i>

                                          <div class="media-body">

                                            <h5 class="media-heading"><strong>ID:</strong> #3694</h5>

                                          </div>

                                        </li>

                                        <li class="media">

                                          <i class="pull-left fa fa-clock-o"></i>

                                          <div class="media-body">

                                            <h5 class="media-heading"><strong>Due Date:</strong> April 10, 2014</h5>

                                          </div>

                                        </li>

                                        <li class="media">

                                          <i class="pull-left fa fa-user"></i>

                                          <div class="media-body">

                                            <h5 class="media-heading"><strong>Assigned By:</strong> Ing. Imrich Kamarel</h5>

                                          </div>

                                        </li>

                                        <li class="media">

                                          <i class="pull-left fa fa-clock-o"></i>

                                          <div class="media-body">

                                            <h5 class="media-heading"><strong>Created At:</strong> April 03, 2014</h5>

                                          </div>

                                        </li>

                                        <li class="media">

                                          <i class="pull-left fa fa-info-circle"></i>

                                          <div class="media-body">

                                            <h5 class="media-heading"><strong>Additional Info:</strong></h5>

                                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>

                                          </div>

                                        </li>

                                      </ul>

                                    </div>

                                    <div class="col-lg-2 col-md-4 task-controls">

                                      <button class="btn btn-red btn-sm"><i class="fa fa-trash-o"></i> Delete</button>

                                      <button class="btn btn-blue btn-sm"><i class="fa fa-pencil"></i> Edit</button>

                                      <button class="btn btn-green btn-sm"><i class="fa fa-check"></i> Complete</button>

                                    </div>

                                  </div>

                                </div>

                              </div>



                            </div>

                            <!-- /task -->





                          </div>

                          <!-- tasks -->





                        </li>

                        <!-- /today tasks -->







                        <!-- completed tasks -->

                        <li class="group completed">

                          <h5><i class="fa fa-check-circle-o"></i> <strong>Completed</strong> Tasks</h5>



                          <!-- tasks -->

                          <div class="task-group" id="accordion04">



                            <!-- task -->

                            <div class="task panel">



                              <div class="priority priority-normal"></div>



                              <div class="panel-heading">

                                

                                <div class="task-controls">

                                  <div class="checkbox">

                                    <input type="checkbox" id="task06chck" checked="">

                                    <label for="task06chck"></label>

                                  </div>



                                  <a href="http://localhost:8089/vcl_mfi/memberregistration?person_id=1#" class="mark marked"><i class="fa fa-star-o"></i></a>

                                </div>



                                <div class="heading">

                                  <h5>Another one completed task in our task list</h5>

                                  <small>Added: April 06, 2014</small>

                                </div>



                                <span class="label label-default">normal</span>



                                <a class="task-toggle" data-toggle="collapse" data-target="#task06" data-parent=".task-group" href="http://localhost:8089/vcl_mfi/memberregistration?person_id=1#">

                                  <i class="fa fa-angle-down"></i>

                                </a>



                              </div>



                              <div id="task06" class="collapse">

                                <div class="panel-body task-content">

                                  <div class="row">

                                    <div class="col-lg-10 col-md-8">

                                      <ul class="media-list">

                                        <li class="media">

                                          <i class="pull-left fa fa-thumb-tack"></i>

                                          <div class="media-body">

                                            <h5 class="media-heading"><strong>ID:</strong> #3694</h5>

                                          </div>

                                        </li>

                                        <li class="media">

                                          <i class="pull-left fa fa-clock-o"></i>

                                          <div class="media-body">

                                            <h5 class="media-heading"><strong>Due Date:</strong> April 10, 2014</h5>

                                          </div>

                                        </li>

                                        <li class="media">

                                          <i class="pull-left fa fa-user"></i>

                                          <div class="media-body">

                                            <h5 class="media-heading"><strong>Assigned By:</strong> Ing. Imrich Kamarel</h5>

                                          </div>

                                        </li>

                                        <li class="media">

                                          <i class="pull-left fa fa-clock-o"></i>

                                          <div class="media-body">

                                            <h5 class="media-heading"><strong>Created At:</strong> April 03, 2014</h5>

                                          </div>

                                        </li>

                                        <li class="media">

                                          <i class="pull-left fa fa-info-circle"></i>

                                          <div class="media-body">

                                            <h5 class="media-heading"><strong>Additional Info:</strong></h5>

                                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>

                                          </div>

                                        </li>

                                      </ul>

                                    </div>

                                    <div class="col-lg-2 col-md-4 task-controls">

                                      <button class="btn btn-red btn-sm"><i class="fa fa-trash-o"></i> Delete</button>

                                      <button class="btn btn-blue btn-sm"><i class="fa fa-pencil"></i> Edit</button>

                                      <button class="btn btn-green btn-sm"><i class="fa fa-check"></i> Complete</button>

                                    </div>

                                  </div>

                                </div>

                              </div>



                            </div>

                            <!-- /task -->







                            <!-- task -->

                            <div class="task panel">



                              <div class="priority priority-high"></div>



                              <div class="panel-heading">

                                

                                <div class="task-controls">

                                  <div class="checkbox">

                                    <input type="checkbox" id="task07chck" checked="">

                                    <label for="task07chck"></label>

                                  </div>



                                  <a href="http://localhost:8089/vcl_mfi/memberregistration?person_id=1#" class="mark marked"><i class="fa fa-star-o"></i></a>

                                </div>



                                <div class="heading">

                                  <h5>Another one completed task in our task list</h5>

                                  <small>Added: April 06, 2014</small>

                                </div>



                                <span class="label label-red">high</span>



                                <a class="task-toggle" data-toggle="collapse" data-target="#task07" data-parent=".task-group" href="http://localhost:8089/vcl_mfi/memberregistration?person_id=1#">

                                  <i class="fa fa-angle-down"></i>

                                </a>



                              </div>



                              <div id="task07" class="collapse">

                                <div class="panel-body task-content">

                                  <div class="row">

                                    <div class="col-lg-10 col-md-8">

                                      <ul class="media-list">

                                        <li class="media">

                                          <i class="pull-left fa fa-thumb-tack"></i>

                                          <div class="media-body">

                                            <h5 class="media-heading"><strong>ID:</strong> #3694</h5>

                                          </div>

                                        </li>

                                        <li class="media">

                                          <i class="pull-left fa fa-clock-o"></i>

                                          <div class="media-body">

                                            <h5 class="media-heading"><strong>Due Date:</strong> April 10, 2014</h5>

                                          </div>

                                        </li>

                                        <li class="media">

                                          <i class="pull-left fa fa-user"></i>

                                          <div class="media-body">

                                            <h5 class="media-heading"><strong>Assigned By:</strong> Ing. Imrich Kamarel</h5>

                                          </div>

                                        </li>

                                        <li class="media">

                                          <i class="pull-left fa fa-clock-o"></i>

                                          <div class="media-body">

                                            <h5 class="media-heading"><strong>Created At:</strong> April 03, 2014</h5>

                                          </div>

                                        </li>

                                        <li class="media">

                                          <i class="pull-left fa fa-info-circle"></i>

                                          <div class="media-body">

                                            <h5 class="media-heading"><strong>Additional Info:</strong></h5>

                                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>

                                          </div>

                                        </li>

                                      </ul>

                                    </div>

                                    <div class="col-lg-2 col-md-4 task-controls">

                                      <button class="btn btn-red btn-sm"><i class="fa fa-trash-o"></i> Delete</button>

                                      <button class="btn btn-blue btn-sm"><i class="fa fa-pencil"></i> Edit</button>

                                      <button class="btn btn-green btn-sm"><i class="fa fa-check"></i> Complete</button>

                                    </div>

                                  </div>

                                </div>

                              </div>



                            </div>

                            <!-- /task -->





                          </div>

                          <!-- tasks -->





                        </li>

                        <!-- /completed tasks -->





                        <li class="more">

                          <div class="pointer"></div>

                          <button class="btn btn-default">Load More</button>

                        </li>

                                  



                      </ol>



                    </div>





                    <div id="settings-tab" class="tab-pane fade">

                      



                      

                        

                        

                        

                        

                        

                        

                        

                        

                        

                        

                        

                        

                        

                        

                        



                    </div>

                    <!-- / Tab panes -->



                  </div>

                  <!-- /tile body -->

                





                </section>

                <!-- /tile -->

                





              </div>

              <!-- /col 8 -->





              

            </div>

            <!-- /row -->









          </div>  

          <!-- /content container -->













        </div>

        <!-- Page content end -->









        













      </div>

      <!-- Make page fluid-->









    </div></div>
    <!--/Preloader -->

    <!-- Wrap all page content here -->
    

    <!-- Wrap all page content end -->







    <section class="videocontent" id="video"></section>



<jsp:include page="../part/footer.jsp"></jsp:include>

 