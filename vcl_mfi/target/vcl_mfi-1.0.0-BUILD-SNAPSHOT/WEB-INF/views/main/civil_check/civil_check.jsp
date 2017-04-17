
        <jsp:include page="../part/header.jsp"></jsp:include>

<jsp:include page="../part/nav.jsp"></jsp:include>

   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
        <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
        <!-- Page content -->
        <div id="content" class="col-md-12" ng-app="app1" ng-controller="c1">
       

          <!-- page header -->
          <div class="pageheader">
            

            <h2><i class="fa fa-lightbulb-o" style="line-height: 48px;padding-left: 0;"></i> Credit Bureau Dashboard <span class="note">Member validity: <span class="italic">Maximum 15 days</span></span></h2>
            

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
       
   

<script type="text/javascript">

var app=angular.module("app1",[]);


function show_himar_link(a)
{
	var link="re/assets/himark_link/"+a+".html";
	document.getElementById("himark_link").src=link;
 
	
	  
}

function get_status_per_person(person_id)
{
	var status_id="status_type"+person_id;
	if(person_id!=0)
		{
			var r = confirm("are you sure!");
			if (r == true)
			{
				return document.getElementById(status_id).value;
			} 
			else
			{
			    return 0;
			}
		
		}
	
	
	
	}

app.controller("c1",function($scope,$http){
 
 /* change status per person */
		$scope.change_status=function(a)
	{
			var status=get_status_per_person(a);
			var data_for_status={status:status,
					            person_id:a};
			
			if(a!=0)
				{
				  $http.post('change_status', data_for_status)
	    		  .then(function (responsed)
	    				  {
	    			   console.log(responsed.data);
	    			   if(responsed.data)
	    				   {
	    				     $scope.get_brach();
	    					// $scope.get_status($scope.org_brnach_id);
	    				   }
	    			 
	    		
		    		 
		    		  }
	    		  , function (responsed)
	    		  {
	    		 
	    		  });	
				}
			 
			
	};
			
			

	
	$scope.himark_link=function(a)
	{
		show_himar_link(a);
	};
	
 /*this retriving all employee_id per branch */
	$scope.get_brach=function(){
		$scope.org_brnach_id=$scope.org_brnach_id;
	     	 var data = {
		          org_brnach_id:$scope.org_brnach_id
		      };
		    		  //Call the services
		    		  $http.post('get_re_list_per_branch', data)
		    		  .then(function(response)
		    				  {
		    			    $scope.datas=response.data;
		    			    $scope.get_status(0,0);
		    	     	   
			    		 
			    		  }
		    		  , function (response)
		    		  {
		    		 
		    		  });	 
		    		   
		  
	};
	
	/*this retriving all person list per emp and per status */
	$scope.get_status=function(a,b)
	{
	  var dat2= {
		          re_id:a,
		          status_type:b,
				  org_brnach_id:$scope.org_brnach_id
		      } ;
			  
		 
				  //* /Call the services
		    		  $http.post('get_person_list', dat2)
	    		  .then(function(responses)
	    				  {
	    			  $scope.person=responses.data;
	    			  //console.log(responses.data);
		    		 
		    		  }
	    		  , function (responses)
	    		  {
	    		 
	    		  });   
	    		   
		 
  
		    	 
		    		 
	};
	

	
	
 
 
});



</script>


          <!-- content main container -->
          <div class="main" >

   
 
            <!-- row -->
            <div class="row">
 
              
              <!-- col 12 -->
              <div class="col-md-5">
 
			 
                <!-- tile -->
                <section class="tile transparent-black">
					
                        <div class="col-sm-6">
                          <select ng-model="org_brnach_id" ng-init="org_brnach_id=''" class="chosen-select chosen-transparent form-control" id="input07" ng-change="get_brach()" >
                             <option value="">Select Branch</option>
					      <c:forEach var="bl" items="${branch_list}">
					      <option value="${bl.getOrg_brnach_id() }">${bl.getBranch_name() }</option>
							
							 </c:forEach>
                          </select>
                           
                        </div>
                     
                </section>
                <!-- /tile -->
				</div>
				
				
				 <div class="col-md-12">
				
				 <!-- tile -->
                <section class="tile transparent col-md-5">


                  <!-- tile header -->
                  <div class="tile-header transparent">
                    <h1><strong>RE wise</strong> CB Details </h1>
                    
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
                        <thead >
                          <tr>
							<th class="sort-numeric col-md-1"></th>
                            <th class="sort-alpha col-md-5">RE Name</th>
                            <th class="sort-numeric col-md-1">Approved</th>
                            <th class="sort-numeric col-md-1">Pending</th>
                            <th class="sort-numeric col-md-1">Rejected</th>
                          </tr>
                        </thead>
                        <tbody  ng-repeat="x in datas">
						 
					 
						 
			     <td class="actions text-center">
                          <tr class="odd gradeX">
                            <td class="text-center">{{x.e_id}}<%-- ${i.index+1} --%></td>
                            <td class="">{{x.ename}}</td>  
                            <td class="actions text-center"><button ng-click="get_status(x.e_id,1)"><span class="label label-success">{{x.approved}}</span></button></td>
                            <td class="actions text-center"><button ng-click="get_status(x.e_id,2)"><a class="edit" href="#"><span class="label label-warning">{{x.pending}}</span></button> </td>
							<td class="actions text-center"><button ng-click="get_status(x.e_id,3)"><a class="edit" href="#"><span class="label label-danger">{{x.rejected}}</span></button> </td>
                          </tr>
          
                      
                        </tbody>
                      </table>
                    </div>

                  </div>
                  <!-- /tile body -->
                


                </section>
                <!-- /tile -->



				

                <!-- tile -->
                <section class="tile transparent col-md-7">


                  <!-- tile header -->
                  <div class="tile-header transparent">
                    <h1><strong>Pending/Rejected List</strong><span class="italic"> (RE Name)</span></h1>
                   
                    <div class="controls">
                      <a href="#" class="minimize"><i class="fa fa-chevron-down"></i></a>
                      <a href="#" class="refresh"><i class="fa fa-refresh"></i></a>
                    </div>
                  </div>
                  <!-- /tile header -->
 <!-- tile -->
                <section class="tile transparent">
				
				
    <!--  Modals -->
    <div class="modal fade" id="modalDialog" tabindex="-1" role="dialog" aria-labelledby="modalDialogLabel" aria-hidden="true">
      <div class="modal-dialog modal-lg" style="width: 1300px;">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">Close</button>
            <h3 class="modal-title" id="modalDialogLabel"><strong>Modal</strong> title</h3>
          </div>
          <div class="modal-body">
          
           
<iframe src="" id="himark_link" width="1200" height="800">
 
</iframe>
          </div>
        </div><!-- /.modal-content -->
      </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->


		<!-- modal end -->		
   
                  <!-- tile body -->
                  <div class="tile-body color transparent-black rounded-corners">
     
                    <div class="table-responsive">
                      <table  class="table table-datatable table-custom">
                        <thead>
                          <tr>
                            
							<th class="col-md-2">Date-Time</th>
                            <th class="col-md-4 sort-alpha">Customer Name</th>
                            <th class="col-md-4 sort-alpha">Center Name</th>
                             <th>Report</th>
                             <th>Member Registration</th>
							<th class="col-md-2">Action</th>
                          </tr>
                        </thead>
                        <tbody  ng-repeat="y in person">
                      
                          <tr class="odd gradeX">
                        
							<td class="text-center">28-08-2017 09:30:30</td>
                            <td class="">{{y.person_first_name}}{{' '}}{{y.person_middle__nm}}{{ ' '}}{{y.person_last_nm}}</td>
                            <td class="actions text-center"> {{y.center_name}}</td>
							<td class="actions text-center"><a href="#modalDialog" role="button" class="label label-greensea" ng-click="himark_link(y.person_id)" data-toggle="modal"><i class="fa fa-file-text-o" aria-hidden="true"></i></a></td>
							 
							<td class="actions text-center">	<p ng-if="y.status==1"><a  href="memberregistration?person_id={{y.person_id}}" role="button" class="label label-greensea"  data-toggle="modal"><i class="fa fa-external-link" aria-hidden="true"></i></a></p></td>
							 
							<td class="actions text-center">
							<p ng-if="y.status==1">
							<select  ng-init="status_type='1'"class="chosen-select chosen-transparent form-control" id="status_type{{y.person_id}}" ng-model="status_type" ng-change="change_status(y.person_id)">
                            <option value="0">Action</option>
							<option  value="1"> Approve</option>
                            <option value="2" >Pending</option>
                            <option value="3" >Reject</option>
                            
                          </select></p>
                          
                          <p ng-if="y.status==2">
							<select  ng-init="status_type='2'"class="chosen-select chosen-transparent form-control" id="status_type{{y.person_id}}" ng-model="status_type" ng-change="change_status(y.person_id)">
                            <option value="0">Action</option>
							<option  value="1"> Approve</option>
                            <option value="2" >Pending</option>
                            <option value="3" >Reject</option>
                            
                          </select></p>
                          <p ng-if="y.status==3">
							<select  ng-init="status_type='3'"class="chosen-select chosen-transparent form-control" id="status_type{{y.person_id}}" ng-model="status_type" ng-change="change_status(y.person_id)">
                            <option value="0">Action</option>
							<option  value="1"> Approve</option>
                            <option value="2" >Pending</option>
                            <option value="3" >Reject</option>
                            
                          </select></p>
						  </td>
                          </tr>
				 
                          
                        </tbody>
                      </table>
                    </div>

                  </div>
                  <!-- /tile body -->
                


                </section>
                <!-- /tile -->
				
				
                </section>
                <!-- /tile -->


               


              </div>
              <!-- /col 12 -->


              
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
                      <img class="media-object" src="assets/images/ici-avatar.jpg" alt="">
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
                      <img class="media-object" src="assets/images/arnold-avatar.jpg" alt="">
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
                      <img class="media-object" src="assets/images/peter-avatar.jpg" alt="">

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
                      <img class="media-object" src="assets/images/george-avatar.jpg" alt="">
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
                      <img class="media-object" src="assets/images/random-avatar1.jpg" alt="">
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
                      <img class="media-object" src="assets/images/random-avatar2.jpg" alt="">
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
                      <img class="media-object" src="assets/images/random-avatar4.jpg" alt="">
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
                      <img class="media-object" src="assets/images/random-avatar5.jpg" alt="">
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
                      <img class="media-object" src="assets/images/random-avatar6.jpg" alt="">

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
                      <img class="media-object" src="assets/images/random-avatar7.jpg" alt="">
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
                      <img class="media-object" src="assets/images/random-avatar8.jpg" alt="">
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
                      <img class="media-object" src="assets/images/ici-avatar.jpg" alt="">
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
                      <img class="media-object" src="assets/images/arnold-avatar.jpg" alt="">
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
                      <img class="media-object" src="assets/images/peter-avatar.jpg" alt="">

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
                      <img class="media-object" src="assets/images/arnold-avatar.jpg" alt="">
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
                      <img class="media-object" src="assets/images/random-avatar8.jpg" alt="">
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
                      <img class="media-object" src="assets/images/random-avatar1.jpg" alt="">
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
                      <img class="media-object" src="assets/images/ici-avatar.jpg" alt="">
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
