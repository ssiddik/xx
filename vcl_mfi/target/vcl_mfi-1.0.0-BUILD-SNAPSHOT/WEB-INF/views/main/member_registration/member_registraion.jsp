
    <jsp:include page="../part/header.jsp"></jsp:include>
  <jsp:include page="../part/nav.jsp"></jsp:include>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
   <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>


        <!-- Page content -->
		<script>
		
		
	  	var app=angular.module('memberprofile',[]);
		app.controller('mp',function($scope,$http){
			
			
			
			/* for caste*/
		   $scope.caste_list=function()
		   {
			   $http.get('get_caste_list')
	    		  .then(function (responsed)
	    				  {
	    			    
	    			   $scope.cast_listss=responsed.data;
	    			   console.log( $scope.cast_listss);
		    		 
		    		  }
	    		  , function (responsed)
	    		  {
	    		 
	    		  });	
			 
			   
		   };
			 

			/* for religion*/
		   $scope.religion_list=function()
		   {
			   $http.get('get_religion_list')
	    		  .then(function (responsed)
	    				  {
	    			    
	    			   $scope.religion_listss=responsed.data;
		    		 
		    		  }
	    		  , function (responsed)
	    		  {
	    		 
	    		  });	
			   
		   };
		   

			/* for relation */
		   
		   $scope.relation_list=function()
		   {
			   $http.get('get_relation_list')
	    		  .then(function (responsed)
	    				  {
	    			    
	    			   $scope.relaton_listss=responsed.data;
		    		 
		    		  }
	    		  , function (responsed)
	    		  {
	    		 
	    		  });	
			   
		   };
		   
		   
	/* for document list */
		   
		   $scope.document_list=function()
		   {
			   $http.get('get_document_list')
	    		  .then(function (responsed)
	    				  {
	    			    
	    			   $scope.document_listss=responsed.data;
		    		 
		    		  }
	    		  , function (responsed)
	    		  {
	    		 
	    		  });	
			   
		   };
		   
		   
		   
		   $scope.loan_purpose=function()
		   {
			   $http.get('get_loan_purpuse')
	    		  .then(function (responsed)
	    				  {
	    			    
	    			   $scope.loan_purposess=responsed.data;
		    		 
		    		  }
	    		  , function (responsed)
	    		  {
	    		 
	    		  });	
		   };
		   
		   
		      $scope.state_list=function()
		   {
			   $http.get('get_state_list')
	    		  .then(function (responsed)
	    				  {
	    			    
	    			   $scope.state_listss=responsed.data;
		    		 
		    		  }
	    		  , function (responsed)
	    		  {
	    		 
	    		  });	
		   };
		   
		   
		   
		   
		   $scope.addres_type=function()
		   {
			   $http.get('get_all_address_type')
	    		  .then(function (responsed)
	    				  {
	    			    
	    			   $scope.addres_typess=responsed.data;
		    		 
		    		  }
	    		  , function (responsed)
	    		  {
	    		 
	    		  });	
		   };
		   
		   
		   	   $scope.block_s=function()
		   {
			   $http.get('get_all_block')
	    		  .then(function (responsed)
	    				  {
	    			    
	    			   $scope.block_sss=responsed.data;
		    		 
		    		  }
	    		  , function (responsed)
	    		  {
	    		 
	    		  });	
		   };
		   
		   
		   
		   
		   	   $scope.district=function()
		   {
			   $http.get('get_all_district_list')
	    		  .then(function (responsed)
	    				  {
	    			    
	    			   $scope.districtss=responsed.data;
		    		 
		    		  }
	    		  , function (responsed)
	    		  {
	    		 
	    		  });	
		   };
		   
		   
		   
		    	   $scope.contact_type=function()
		   {
			   $http.get('get_all_contact')
	    		  .then(function (responsed)
	    				  {
	    			    
	    			   $scope.contact_typess=responsed.data;
		    		 
		    		  }
	    		  , function (responsed)
	    		  {
	    		 
	    		  });	
		   };
		   
	 	   $scope.vtc_list=function()
		   {
			   $http.get('get_all_vtc_lists')
	    		  .then(function (responsed)
	    				  {
	    			    
	    			   $scope.vtc_listss=responsed.data;
		    		 
		    		  }
	    		  , function (responsed)
	    		  {
	    		 
	    		  });	
		   };
		   
		   
		   
		   
		   
		  /* for submit */ 
		     $scope.member={};// this is for member
           //  $scope.bank_details={};//this is for object
			$scope.member.bank_details=[];
		   $scope.test=function()
		   {
			 
			   $scope.member.nominee_dob=document.getElementById("nominee_dob").value;
		 
		         $scope.member.bank_details = $scope.member.bank_details.concat($scope.bank_details);
			      //console.log($scope.member);
			      console.log("["+JSON.stringify($scope.member)+"]");
			      
			      var t="["+JSON.stringify($scope.member)+"]";
			    
			    //  console.log($scope.member.push({'bank_details0':json2}));
			    
				  $http.post('http://139.59.34.255:8080/MicroFinance/member_reg/7/12345678',t)
	    		  .then(function (responsed)
	    				  {
	    			   console.log(responsed.data);
		    	 alert("okkk");
		    	 $scope.member_reg=responsed.data;
		    		  }
	    		  , function (responsed)
	    		  {
	    			 // alert("ok");
	    		 
	    		  });
			    
			    
		   }
		   
		   /* for inti*/
		   $scope.ss=function(a)
		   {
			   $scope.member.name=a;
			   alert($scope.member.name);
		   }
		   
			
		});  
		</script>
         
        <div id="content" class="col-md-12" ng-app="memberprofile" ng-controller="mp" >
	  
	 

          <!-- page header -->

          <div class="pageheader">

            



            <h2><i class="fa fa-user" style="line-height: 46px;padding-left: 0;"></i>Member Profile <span></span></h2>

            



            <div class="breadcrumbs">

              <ol class="breadcrumb">

                <li>You are here</li>

                <li><a href="index.html">Minimal</a></li>

                <li><a href="#">Example Pages</a></li>

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

                  <div class="tile-widget color transparent-white rounded-top-corners">

                   

                      <div class="content">

                        <span class="time"><i class="fa fa-clock-o"></i> Yesterday, 22:12pm</span>

                        <h1><strong>Bottom</strong> Image</h1>

                       

                        <img src="./Welcome to official page of MFI Dashboard_files/carousel3.jpg" width="100%" alt="">

                      </div>

                      

                  </div>



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

                  <div class="tile-body tab-content rounded-bottom-corners">



                    <!-- Tab panes -->                 

                    <div id="form" class="tab-pane fade active in" >

                      

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

                            <label for="first-name">Full Name</label>

                            <input type="text" class="form-control ng-pristine ng-valid ng-touched ng-untouched" id="first-name" ng-init="member.member_name='cool s dfsd'" ng-model="member.member_name">

                          </div>

 
                          <div class="form-group col-sm-3">

                            <label for="last-name">Gender </label>

                            <select ng-init="gender='Female'" class="chosen-select  form-control parsley-validated ng-pristine ng-untouched ng-valid" ng-model="gender">

                            <option value="">Please choose</option>
                              
                            <option value="Female"> Female</option>

                            <option value="Male">&gt;Male</option>

                            

                          </select>  

                          </div>

                            <div class="form-group col-sm-3">

                            <label for="last-name">Date of Birth </label>

                            <input type="text" class="form-control ng-pristine ng-untouched ng-valid" ng-init="dob='25/03/2017'" ng-model="dob" id="last-name">

                          </div>

                            

                         



                        </div>

                         <div class="row">

						    <div class="form-group col-sm-3">

                            <label for="first-name">Primary ID</label>

                            <input type="text" class="form-control ng-pristine ng-untouched ng-valid" ng-init="uid='124566789a-Adher'" ng-model="uid" id="first-name" value="124566789a-Adher">

                          </div>



                          <div class="form-group col-sm-3">

                            <label for="last-name">Secondary ID </label>

                            <input type="text" class="form-control ng-pristine ng-untouched ng-valid" ng-init="voter_id='sdsdfs-v-Voter ID'" ng-model="voter_id" id="last-name" value="sdsdfs-v-Voter ID">

                          </div>
  <div class="form-group col-sm-6">

                            <label for="last-name">Father Name </label>

                            <input type="text" class="form-control ng-pristine ng-untouched ng-valid" id="last-name" ng-init="fathername='Applicant'" ng-model="fathername">

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

                            <label for="last-name">Mother Name </label>

                            <input type="text" class="form-control ng-pristine ng-untouched ng-valid" ng-model="member.mother_name" id="last-name" value="Douey">

                          </div>
                             
			 
						       <div class="form-group col-sm-3">

                            <label for="dribbble">Contact type</label>

		
							 <select ng-model="member.contact_type" class="chosen-select  form-control parsley-validated ng-pristine ng-untouched ng-valid" ng-init="contact_type()">

                            <option value="">Please choose</option>
   <option ng-repeat="nn in contact_typess" value="{{nn.contact_type_id}}">{{nn.contact_type_name}}</option>

                            

                          </select> 
                           </div>
                            <div class="form-group col-sm-3">

                            <label for="last-name">Member Mobile 1 </label>

                            <input type="text" class="form-control" value="987654321" id="last-name">

                          </div>

                            <div class="form-group col-sm-3">

                            <label for="last-name">Member Mobile 2 </label>

                            <input type="text" class="form-control ng-pristine ng-untouched ng-valid" ng-model="member.mobile2" id="last-name">

                          </div>

                            



                        </div>

                          

                  
						   
                         <div class="row">

                          <div class="form-group col-md-12 legend">

                            <h4><strong>Nominee</strong> Details</h4>

                           

                          </div>

                        </div>


                          

                               

                               <div class="form-group col-sm-6">

                            <label for="first-name">Nominee Name</label>

                            <input type="text" class="form-control ng-pristine ng-untouched ng-valid" ng-model="member.nominee_name" id="first-name" value="John">

                          </div>



                          <div class="form-group col-sm-3">

                            <label for="last-name">Nominee Relation </label>

                            <select ng-model="member.nominee_relation" class="chosen-select form-control parsley-validated ng-pristine ng-untouched ng-valid" ng-init="relation_list()">

                            <option value="">Please choose</option>
 
                      
                            <option ng-repeat="z in relaton_listss" value="{{z.relation_type_id}}">{{z.relation_type_nm+'-'+z.relation_type_desc}}</option>
                            
                            
                        
                          </select>  

                              

                              

                          </div>

                              <div class="form-group col-sm-3">

                            <label for="dribbble">Nominee gender</label>

		
							 <select ng-model="member.nominee_gender" class="chosen-select  form-control parsley-validated ng-pristine ng-untouched ng-valid" ng-init="member.nominee_gender=''">

                            <option value="">Please choose</option>
                              
                            <option value="Female"> Female</option>

                            <option value="Male">Male</option>
 

                            

                          </select> 
                          </div> 
						  
                            <div class="form-group col-sm-3">

                            <label for="last-name">Nominee DOB</label>

                            <input type="date" class="form-control ng-pristine ng-untouched ng-valid"  id="nominee_dob" >
 
                          </div>
                            
                              <div class="form-group col-sm-3">

                            <label for="dribbble">Nominee Age</label>

			 <input type="number" ng-model="member.nominee_age" class="form-control ng-pristine ng-untouched ng-valid" id="github">
					 
                           </div>
 
                            <div class="form-group col-sm-3">

                            <label for="last-name">Nominee ID Type</label>

                            

                             <select ng-model="member.nominee_id_type" class="chosen-select  form-control parsley-validated ng-pristine ng-untouched ng-valid" ng-init="document_list()">

                            <option value="">Please choose</option>
             
                            <option ng-repeat="i in document_listss"value="{{i.doc_type_id}}">{{i.doc_type_nm}}</option>
                
                            
                             
                          </select>   

                                

                                

                                

                                

                          </div>

                            <div class="form-group col-sm-3">

                            <label for="last-name">Nominee ID Number</label>

                            <input type="text" class="form-control ng-pristine ng-untouched ng-valid" ng-model="member.nominee_id_value" id="last-name"  >

                          </div>

                               

                              

                            <div class="form-group col-sm-3">

                            <label for="last-name">Caste </label>

                            <select ng-model="member.cast" class="chosen-select  form-control parsley-validated ng-pristine ng-untouched ng-valid" ng-init="caste_list()">

                            <option value="">Please choose</option>
               
                       
                          <option ng-repeat="x in cast_listss" value="{{x.id}}" >{{x.caste_name}} </option>
                  
                          </select>  

                          </div>

                              

                            <div class="form-group col-sm-3">

                            <label for="last-name">Religion</label>

                            <select ng-model="member.religion" class="chosen-select  form-control parsley-validated ng-pristine ng-untouched ng-valid" ng-init="religion_list()">

                            <option value="">Please choose</option>
                           <option ng-repeat="y in religion_listss" value="{{y.rel_id}}">{{y.religion_name}}</option>
 

                          </select> 

                          </div>

                            

                     

                            

                              
                         <div class="row">

                          <div class="form-group col-md-12 legend">

                            <h4><strong>House</strong> Type</h4>

                           

                          </div>

                        </div>



                            <div class="form-group col-sm-3">

                            <label for="last-name">House Type</label>

                            <select ng-model="member.house_type" class="chosen-select  form-control parsley-validated ng-pristine ng-untouched ng-valid">

                            <option value="">Please choose</option>

                            <option value="Kutcha">Kutcha</option>

                            <option value="Pacca">Pacca</option>

                            

                          </select> 

                          </div>

                           <div class="form-group col-sm-9">

                            <label for="address1">Address Line 1</label>

                            <input type="text" ng-model="member.address" class="form-control ng-pristine ng-untouched ng-valid" id="address1" value="Vajnorska 215">

                          </div>    

                            

                            


                          





                     



                          <div class="form-group col-sm-3">

                            <label for="city">Residence Type</label>

                             
							
							 <select ng-model="member.residence_type" class="chosen-select  form-control parsley-validated ng-pristine ng-untouched ng-valid">

                            <option value="">Please choose</option>

                            <option value="Rented">Rented</option>

                            <option value="Own">Own</option>
							<option value="Quarkr">Quarkr</option>

                            

                          </select> 

                          </div>

                            

                        <div class="form-group col-sm-3">

                            <label for="city">VTC</label>

                          <!--   <input type="text"   ng-model="member.vtc" class="form-control" id="city" value="Bratislava"> -->
<select ng-model="member.vtc" class="chosen-select  form-control parsley-validated ng-pristine ng-untouched ng-valid" ng-init="vtc_list()">

                            <option value="">Please choose</option>
                     <option ng-repeat="vf in vtc_listss" value="{{vf.vtc_id}}">{{vf.vtc_long_name}}</option>
                             
</select>


                          </div>



                          <div class="form-group col-sm-3">

                            <label for="state">State</label>
							 <select ng-model="member.state" class="chosen-select  form-control parsley-validated ng-pristine ng-untouched ng-valid" ng-init="state_list()">

                            <option value="">Please choose</option>
                 <option ng-repeat="v in state_listss" value="{{v.state_id}}">{{v.state_name}}</option>
                             
</select>
                          </div>



                          <div class="form-group col-sm-3">

                            <label for="zip">Pin Code</label>

                            <input type="text" ng-model="member.pincode" class="form-control ng-pristine ng-untouched ng-valid" id="zip" value="215 62">

                          </div>

                          
						         <div class="form-group col-sm-3">

                            <label for="dribbble">Address Type</label>

		
							 <select ng-model="member.address_type" class="chosen-select  form-control parsley-validated ng-pristine ng-untouched ng-valid" ng-init="addres_type()">

                            <option value="">Please choose</option>

                           
                            <option ng-repeat="q in addres_typess" value="{{q.address_type_identifier}}">{{q.address_type_nm}}</option>

                          </select> 
                          </div>
                         <div class="form-group col-sm-3">

                            <label for="dribbble">Block</label>

		
							 <select ng-model="member.block" class="chosen-select  form-control parsley-validated ng-pristine ng-untouched ng-valid" ng-init="block_s()">

                            <option value="">Please choose</option>

                           
                            
  <option ng-repeat="ppp in block_sss" value="{{ppp.block_id}}">{{ppp.block_long_name}}</option>
                          </select> 
                           </div>
						   
						   
						   
						           <div class="form-group col-sm-3">

                            <label for="dribbble">District</label>

		
							 <select ng-model="member.dist" class="chosen-select  form-control parsley-validated ng-pristine ng-untouched ng-valid" ng-init="district()">

                            <option value="">Please choose</option>

                              <option ng-repeat="k in districtss" value="{{k.districtId}}">{{k.districtName}}</option>

                          </select> 
                           </div>
                       



                       

                       



                        



                        <div class="row">

                          <div class="form-group col-md-12 legend">

                            <h4><strong>Bank</strong> Details</h4>

                            

                          </div>

                        </div>



                        



                          <div class="form-group col-sm-6">

                            <label for="facebook">Beneficiary Name</label>

                            <input type="text" ng-model="bank_details.beneficiary_name" class="form-control ng-pristine ng-untouched ng-valid" id="facebook">

                          </div>



                          <div class="form-group col-sm-6">

                            <label for="google-plus">Account Number</label>

                            <input type="text" ng-model="bank_details.accnt_account" class="form-control ng-pristine ng-untouched ng-valid" id="google-plus">

                          </div>



                       



                      



                          <div class="form-group col-sm-6">

                            <label for="pinterest">IFSC</label>

                            <input type="text" ng-model="bank_details.ifsc" class="form-control ng-pristine ng-untouched ng-valid" id="pinterest">

                          </div>



                          <div class="form-group col-sm-6">

                            <label for="flickr">Bank Name</label>

                        
							
							 <select ng-model="bank_details.bank_name" class="chosen-select  form-control parsley-validated ng-pristine ng-untouched ng-valid">

                            <option value="">Please choose</option>

                            <option value="1">SBI</option>
 

                            

                          </select> 

                          </div>



                          <div class="form-group col-sm-6">

                            <label for="dribbble">Security Cheque Bank Name</label>

              
	 <select ng-model="member.security_cheque.bank_name" class="chosen-select  form-control parsley-validated ng-pristine ng-untouched ng-valid">

                            <option value="">Please choose</option>

                            <option value="1">SBI</option>
 

                            

                          </select> 
                          </div>



                          <div class="form-group col-sm-6">

                            <label for="github">Security Cheque Number</label>

                            <input type="text" ng-model="member.security_cheque.cheque_number" class="form-control ng-pristine ng-untouched ng-valid" id="github">

                          </div>



                     



                         
                           <div class="row">
                          <div class="form-group col-md-12 legend">

                            <h4><strong>Family &amp; Other</strong> Details</h4>

                            

                          </div>
                           </div>


                         <div class="form-group col-sm-4">

                            <label for="dribbble">Total Family Member</label>

                            <input type="number" ng-model="member.total_family_member" class="form-control ng-pristine ng-untouched ng-valid" id="dribbble">

                          </div>



                          <div class="form-group col-sm-4">

                            <label for="github">Total Earning Member</label>

                            <input type="number" class="form-control ng-pristine ng-untouched ng-valid" ng-model="member.total_earning_member" id="github">

                          </div>

                        <div class="form-group col-sm-4">

                            <label for="github">Total Dependent Member</label>

                            <input type="number" ng-model="member.total_dependent_member" class="form-control ng-pristine ng-untouched ng-valid" id="github">

                          </div>

                         <div class="form-group col-sm-3">

                            <label for="dribbble">Loan Purpose</label>

                            
		
							 <select ng-model="member.loan_purpose" class="chosen-select  form-control parsley-validated ng-pristine ng-untouched ng-valid" ng-init="loan_purpose()">

                            <option value="">Please choose</option>

                             <option ng-repeat="a in loan_purposess" value="{{a.loan_purpose_id}}">{{a.loan_purpose_nm}}</option>
                            

                          </select> 
                          </div>



                          <div class="form-group col-sm-3">

                            <label for="github">Income</label>

                            <input type="number" ng-model="member.income" class="form-control ng-pristine ng-untouched ng-valid" id="github">

                          </div>



                         <div class="form-group col-sm-3">

                            <label for="github">Qualification</label>

                            <input type="text" ng-model="member.qualification" class="form-control ng-pristine ng-untouched ng-valid" id="github">

                          </div>


                        <div class="form-group col-sm-3">

                            <label for="github">Fooding Expense</label>

                            <input type="text" ng-model="member.expanses.fooding_expanse" class="form-control ng-pristine ng-untouched ng-valid" id="github">

                          </div>


                       
						     <div class="form-group col-sm-4">

                            <label for="github">Education Expense</label>

                            <input type="text" ng-model="member.expanses.education_expanse" class="form-control ng-pristine ng-untouched ng-valid" id="github">

                          </div>

 
						     <div class="form-group col-sm-4">

                            <label for="github">Rent Expense</label>

                            <input type="text" ng-model="member.expanses.rent_expanse" class="form-control ng-pristine ng-untouched ng-valid" id="github">

                          </div>

						  
						      <div class="form-group col-sm-4">

                            <label for="github">Medical Expense</label>

                            <input type="text" ng-model="member.expanses.medical_expanse" class="form-control ng-pristine ng-untouched ng-valid" id="github">

                          </div>
						  						  
						      <div class="form-group col-sm-4">

                            <label for="github">Loan Repayment Expense</label>

                            <input type="text" ng-model="member.expanses.loan_repayment_expanse" class="form-control ng-pristine ng-untouched ng-valid" id="github">

                          </div>
						  						  
						      <div class="form-group col-sm-3">

                            <label for="github">Other Expense</label>

                            <input type="text" ng-model="member.expanses.other_expanse" class="form-control ng-pristine ng-untouched ng-valid" id="github">

                          </div>
						  
						  
						  
						  
						  
						  
				 
					 
						  
						  
						  
						           
						 
					 
                           
						 
						 
					
						 
                      
                          

                          <div class="row">

                              

                               <div class="form-group col-sm-12">

                            <button type="button" ng-click="test()" class="btn btn-primary pull-right">Submit</button>

                          </div>



                       

                        

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

                  <!-- /tile body -->

                





                </section>

                <!-- /tile -->

                





              </div>

              <!-- /col 8 -->





              

            </div>

            <!-- /row -->









          </div>

              <!-- /col 8 -->





              

            </div>

            <!-- /row -->









          </div>  

          <!-- /content container -->













        </div>

        <!-- Page content end -->









        <div id="mmenu" class="right-panel">

          <!-- Nav tabs -->

          <ul class="nav nav-tabs nav-justified">

            <li class="active"><a href="#mmenu-users" data-toggle="tab"><i class="fa fa-users"></i></a></li>

            <li class=""><a href="#mmenu-history" data-toggle="tab"><i class="fa fa-clock-o"></i></a></li>

            <li class=""><a href="#mmenu-friends" data-toggle="tab"><i class="fa fa-heart"></i></a></li>

            <li class=""><a href="#mmenu-settings" data-toggle="tab"><i class="fa fa-gear"></i></a></li>

          </ul>

              

          <!-- Tab panes -->

          <div class="tab-content">

            <div class="tab-pane active" id="mmenu-users">

              <h5><strong>Online</strong> Users</h5>



              <ul class="users-list">

                

                <li class="online">

                  <div class="media">

                    <a class="pull-left profile-photo" href="#">

                      <img class="media-object" src="assets/images/ici-avatar.jpg" alt>

                    </a>

                    <div class="media-body">

                      <h6 class="media-heading">Ing. Imrich <strong>Kamarel</strong></h6>

                      <small><i class="fa fa-map-marker"></i> Ulaanbaatar, Mongolia</small>

                      <span class="badge badge-outline status"></span>

                    </div>

                  </div>

                </li>



                <li class="online">

                  <div class="media">

                    

                    <a class="pull-left profile-photo" href="#">

                      <img class="media-object" src="assets/images/arnold-avatar.jpg" alt>

                    </a>

                    <span class="badge badge-red unread">3</span>



                    <div class="media-body">

                      <h6 class="media-heading">Arnold <strong>Karlsberg</strong></h6>

                      <small><i class="fa fa-map-marker"></i> Bratislava, Slovakia</small>

                      <span class="badge badge-outline status"></span>

                    </div>



                  </div>

                </li>



                <li class="online">

                  <div class="media">

                    <a class="pull-left profile-photo" href="#">

                      <img class="media-object" src="assets/images/peter-avatar.jpg" alt>



                    </a>

                    <div class="media-body">

                      <h6 class="media-heading">Peter <strong>Kay</strong></h6>

                      <small><i class="fa fa-map-marker"></i> Kosice, Slovakia</small>

                      <span class="badge badge-outline status"></span>

                    </div>

                  </div>

                </li>



                <li class="online">

                  <div class="media">

                    <a class="pull-left profile-photo" href="#">

                      <img class="media-object" src="assets/images/george-avatar.jpg" alt>

                    </a>

                    <div class="media-body">

                      <h6 class="media-heading">George <strong>McCain</strong></h6>

                      <small><i class="fa fa-map-marker"></i> Prague, Czech Republic</small>

                      <span class="badge badge-outline status"></span>

                    </div>

                  </div>

                </li>



                <li class="busy">

                  <div class="media">

                    <a class="pull-left profile-photo" href="#">

                      <img class="media-object" src="assets/images/random-avatar1.jpg" alt>

                    </a>

                    <div class="media-body">

                      <h6 class="media-heading">Lucius <strong>Cashmere</strong></h6>

                      <small><i class="fa fa-map-marker"></i> Wien, Austria</small>

                      <span class="badge badge-outline status"></span>

                    </div>

                  </div>

                </li>



                <li class="busy">

                  <div class="media">

                    <a class="pull-left profile-photo" href="#">

                      <img class="media-object" src="assets/images/random-avatar2.jpg" alt>

                    </a>

                    <div class="media-body">

                      <h6 class="media-heading">Jesse <strong>Phoenix</strong></h6>

                      <small><i class="fa fa-map-marker"></i> Berlin, Germany</small>

                      <span class="badge badge-outline status"></span>

                    </div>

                  </div>

                </li>



              </ul>



              <h5><strong>Offline</strong> Users</h5>



              <ul class="users-list">

                

                <li class="offline">

                  <div class="media">

                    <a class="pull-left profile-photo" href="#">

                      <img class="media-object" src="assets/images/random-avatar4.jpg" alt>

                    </a>

                    <div class="media-body">

                      <h6 class="media-heading">Dell <strong>MacApple</strong></h6>

                      <small><i class="fa fa-map-marker"></i> Paris, France</small>

                      <span class="badge badge-outline status"></span>

                    </div>

                  </div>

                </li>



                <li class="offline">

                  <div class="media">

                    

                    <a class="pull-left profile-photo" href="#">

                      <img class="media-object" src="assets/images/random-avatar5.jpg" alt>

                    </a>



                    <div class="media-body">

                      <h6 class="media-heading">Roger <strong>Flopple</strong></h6>

                      <small><i class="fa fa-map-marker"></i> Rome, Italia</small>

                      <span class="badge badge-outline status"></span>

                    </div>

                    

                  </div>

                </li>



                <li class="offline">

                  <div class="media">

                    <a class="pull-left profile-photo" href="#">

                      <img class="media-object" src="assets/images/random-avatar6.jpg" alt>



                    </a>

                    <div class="media-body">

                      <h6 class="media-heading">Nico <strong>Vulture</strong></h6>

                      <small><i class="fa fa-map-marker"></i> Kyjev, Ukraine</small>

                      <span class="badge badge-outline status"></span>

                    </div>

                  </div>

                </li>



                <li class="offline">

                  <div class="media">

                    <a class="pull-left profile-photo" href="#">

                      <img class="media-object" src="assets/images/random-avatar7.jpg" alt>

                    </a>

                    <div class="media-body">

                      <h6 class="media-heading">Bobby <strong>Socks</strong></h6>

                      <small><i class="fa fa-map-marker"></i> Moscow, Russia</small>

                      <span class="badge badge-outline status"></span>

                    </div>

                  </div>

                </li>



                <li class="offline">

                  <div class="media">

                    <a class="pull-left profile-photo" href="#">

                      <img class="media-object" src="assets/images/random-avatar8.jpg" alt>

                    </a>

                    <div class="media-body">

                      <h6 class="media-heading">Anna <strong>Opichia</strong></h6>

                      <small><i class="fa fa-map-marker"></i> Budapest, Hungary</small>

                      <span class="badge badge-outline status"></span>

                    </div>

                  </div>

                </li>



              </ul>



            </div>



            <div class="tab-pane" id="mmenu-history">

              <h5><strong>Chat</strong> History</h5>



              <ul class="history-list">

                

                <li class="online">

                  <div class="media">

                    <a class="pull-left profile-photo" href="#">

                      <img class="media-object" src="assets/images/ici-avatar.jpg" alt>

                    </a>

                    <div class="media-body">

                      <h6 class="media-heading">Ing. Imrich <strong>Kamarel</strong></h6>

                      <small>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor</small>

                      <span class="badge badge-outline status"></span>

                    </div>

                  </div>

                </li>



                <li class="busy">

                  <div class="media">

                    

                    <a class="pull-left profile-photo" href="#">

                      <img class="media-object" src="assets/images/arnold-avatar.jpg" alt>

                    </a>

                    <span class="badge badge-red unread">3</span>



                    <div class="media-body">

                      <h6 class="media-heading">Arnold <strong>Karlsberg</strong></h6>

                      <small>Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur</small>

                      <span class="badge badge-outline status"></span>

                    </div>



                  </div>

                </li>



                <li class="offline">

                  <div class="media">

                    <a class="pull-left profile-photo" href="#">

                      <img class="media-object" src="assets/images/peter-avatar.jpg" alt>



                    </a>

                    <div class="media-body">

                      <h6 class="media-heading">Peter <strong>Kay</strong></h6>

                      <small>Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit </small>

                      <span class="badge badge-outline status"></span>

                    </div>

                  </div>

                </li>



              </ul>

                

            </div>



            <div class="tab-pane" id="mmenu-friends">

              <h5><strong>Friends</strong> List</h5>

                <ul class="favourite-list">

                

                <li class="online">

                  <div class="media">

                    

                    <a class="pull-left profile-photo" href="#">

                      <img class="media-object" src="assets/images/arnold-avatar.jpg" alt>

                    </a>

                    <span class="badge badge-red unread">3</span>



                    <div class="media-body">

                      <h6 class="media-heading">Arnold <strong>Karlsberg</strong></h6>

                      <small><i class="fa fa-map-marker"></i> Bratislava, Slovakia</small>

                      <span class="badge badge-outline status"></span>

                    </div>



                  </div>

                </li>



                <li class="offline">

                  <div class="media">

                    <a class="pull-left profile-photo" href="#">

                      <img class="media-object" src="assets/images/random-avatar8.jpg" alt>

                    </a>

                    <div class="media-body">

                      <h6 class="media-heading">Anna <strong>Opichia</strong></h6>

                      <small><i class="fa fa-map-marker"></i> Budapest, Hungary</small>

                      <span class="badge badge-outline status"></span>

                    </div>

                  </div>

                </li>



                <li class="busy">

                  <div class="media">

                    <a class="pull-left profile-photo" href="#">

                      <img class="media-object" src="assets/images/random-avatar1.jpg" alt>

                    </a>

                    <div class="media-body">

                      <h6 class="media-heading">Lucius <strong>Cashmere</strong></h6>

                      <small><i class="fa fa-map-marker"></i> Wien, Austria</small>

                      <span class="badge badge-outline status"></span>

                    </div>

                  </div>

                </li>



                <li class="online">

                  <div class="media">

                    <a class="pull-left profile-photo" href="#">

                      <img class="media-object" src="assets/images/ici-avatar.jpg" alt>

                    </a>

                    <div class="media-body">

                      <h6 class="media-heading">Ing. Imrich <strong>Kamarel</strong></h6>

                      <small><i class="fa fa-map-marker"></i> Ulaanbaatar, Mongolia</small>

                      <span class="badge badge-outline status"></span>

                    </div>

                  </div>

                </li>



              </ul>

            </div>



            <div class="tab-pane pane-settings" id="mmenu-settings">

              <h5><strong>Chat</strong> Settings</h5>



              <ul class="settings">

               

                <li>

                  <div class="form-group">

                    <label class="col-xs-8 control-label">Show Offline Users</label>

                    <div class="col-xs-4 control-label">

                      <div class="onoffswitch greensea">

                        <input type="checkbox" name="onoffswitch" class="onoffswitch-checkbox" id="show-offline" checked="">

                        <label class="onoffswitch-label" for="show-offline">

                          <span class="onoffswitch-inner"></span>

                          <span class="onoffswitch-switch"></span>

                        </label>

                      </div>

                    </div>

                  </div>

                </li>



                <li>

                  <div class="form-group">

                    <label class="col-xs-8 control-label">Show Fullname</label>

                    <div class="col-xs-4 control-label">

                      <div class="onoffswitch greensea">

                        <input type="checkbox" name="onoffswitch" class="onoffswitch-checkbox" id="show-fullname">

                        <label class="onoffswitch-label" for="show-fullname">

                          <span class="onoffswitch-inner"></span>

                          <span class="onoffswitch-switch"></span>

                        </label>

                      </div>

                    </div>

                  </div>

                </li>



                <li>

                  <div class="form-group">

                    <label class="col-xs-8 control-label">History Enable</label>

                    <div class="col-xs-4 control-label">

                      <div class="onoffswitch greensea">

                        <input type="checkbox" name="onoffswitch" class="onoffswitch-checkbox" id="show-history" checked="">

                        <label class="onoffswitch-label" for="show-history">

                          <span class="onoffswitch-inner"></span>

                          <span class="onoffswitch-switch"></span>

                        </label>

                      </div>

                    </div>

                  </div>

                </li>



                <li>

                  <div class="form-group">

                    <label class="col-xs-8 control-label">Show Locations</label>

                    <div class="col-xs-4 control-label">

                      <div class="onoffswitch greensea">

                        <input type="checkbox" name="onoffswitch" class="onoffswitch-checkbox" id="show-location" checked="">

                        <label class="onoffswitch-label" for="show-location">

                          <span class="onoffswitch-inner"></span>

                          <span class="onoffswitch-switch"></span>

                        </label>

                      </div>

                    </div>

                  </div>

                </li>



                <li>

                  <div class="form-group">

                    <label class="col-xs-8 control-label">Notifications</label>

                    <div class="col-xs-4 control-label">

                      <div class="onoffswitch greensea">

                        <input type="checkbox" name="onoffswitch" class="onoffswitch-checkbox" id="show-notifications">

                        <label class="onoffswitch-label" for="show-notifications">

                          <span class="onoffswitch-inner"></span>

                          <span class="onoffswitch-switch"></span>

                        </label>

                      </div>

                    </div>

                  </div>

                </li>



                <li>

                  <div class="form-group">

                    <label class="col-xs-8 control-label">Show Undread Count</label>

                    <div class="col-xs-4 control-label">

                      <div class="onoffswitch greensea">

                        <input type="checkbox" name="onoffswitch" class="onoffswitch-checkbox" id="show-unread" checked="">

                        <label class="onoffswitch-label" for="show-unread">

                          <span class="onoffswitch-inner"></span>

                          <span class="onoffswitch-switch"></span>

                        </label>

                      </div>

                    </div>

                  </div>

                </li>



              </ul>

                

            </div><!-- tab-pane -->

              

          </div><!-- tab-content -->

        </div>













      </div>

      <!-- Make page fluid-->









    </div>

    <!-- Wrap all page content end -->







    <section class="videocontent" id="video"></section>



<jsp:include page="../part/footer.jsp"></jsp:include>

 