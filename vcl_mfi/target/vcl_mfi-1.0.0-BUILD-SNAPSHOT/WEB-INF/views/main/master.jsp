<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<jsp:include page="part/header.jsp"></jsp:include>
<jsp:include page="part/nav.jsp"></jsp:include>

<script type="text/javascript" src="re/assets/routing/master.js"></script>

 <!-- Page content -->
        <div id="content" class="col-md-12" ng-app="masterApp" ng-controller="masterCtrl">
          
          <!-- page header -->
          <div class="pageheader">

            <h2><i class="fa fa-lightbulb-o" style="line-height: 48px;padding-left: 0;"></i> Master </h2>

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
					
                        <div class="col-sm-7">
                          <select ng-model="master"  ng-change="populateStateAndDistrictData()" class="chosen-select chosen-transparent form-control" id="input07">
                            <option value="">Select Master</option>
                            <option value="Status">Status</option>
                            <option value="Status Type">Status Type</option>
                            <option value="Contact Type">Contact Type</option>
							<option value="Company">Company</option>
                            <option value="Branch">Branch</option>
							<option value="Language">Language</option>
                            <option value="Department">Department</option>
                            <option value="Designation">Designation</option>
							<option value="">Loan Type</option>
                            <option value="">Loan Product</option>
                            <option value="">Hierarchy</option>
                            <option value="Zone">Zone</option>
							<option value="State">State</option>
                            <option value="Cluster">Cluster</option>
                            <option value="District">District</option>
                            <option value="Block">Block</option>
							<option value="Village/Town/City">Village/Town/City</option>
                            <option value="">Moholla</option>
                            <option value="">User</option>
                            <option value="User Role">User Role</option>
							<option value="">Session</option>
                            <option value="">Chart of Accounts</option>
                            <option value="">Operation Hierarchy</option>
                            <option value="">Agreements/Documents</option>
							<option value="Education">Education</option>
                            <option value="Relationship Type">Relationship Type</option>
                            <option value="Religion">Religion</option>
                            <option value="Occupation">Occupation</option>
                            <option value="">Loan Purpose</option>
                            <option value="Employee Role">Employee Role</option>
                            <option value="Employee">Employee</option>
                            <option value="Organisation Cluster">Organisation Cluster</option>
                          </select>
                        </div>
                </section>
				
                <!-- /tile -->
				</div>
				<!-- <button type="button" class="btn btn-amethyst margin-bottom-20" ng-click="list_of_states()">View</button> -->
				<!-- Master Content Start -->
			<div class="col-md-12">

				<!-- State-Master Content Start -->
				<!-- tile -->
				<div ng-if="master=='Company'">Company</div>
				<!-- ====================== State Code starts ======================= -->
				<div ng-if="master=='State'">
					<section class="tile transparent col-md-6">

						<!-- tile header -->
						<div class="tile-header transparent">
							<h1>
								<strong>State</strong>
							</h1>
							<button type="button"
								class="btn btn-amethyst margin-bottom-20 pull-right"
								ng-click="showListOfStates()">View</button>
						</div>

						<!-- tile body -->
						<form name="stateForm">
						<div class="tile-body  color transparent-white rounded-corners">
							<div class="form-horizontal">
								<div ng-if="stateSaveStatus || stateUniqueOrNot">
									<div class="alert alert-success alert-dismissable" ng-if="stateSaveStatus != '' || stateUniqueOrNot != ''">
										<a href="#" class="close" data-dismiss="alert" aria-label="close">×</a>
										{{stateSaveStatus}}{{stateUniqueOrNot}}
									</div>
								</div>
								<div class="alert alert-danger alert-dismissable" ng-if="stateSaveError">
									{{stateSaveError}}
								</div>
								<div class="form-group"  ng-class="{ 'has-error' : stateForm.stateShortCode.$invalid && !stateForm.stateShortCode.$pristine }">
									<label for="input01" class="col-sm-4 control-label">State
										Short Code</label>
									<div class="col-sm-8">
										<input type="hidden" name="stateStateId" ng-model="state.state_id"
											ng-value="state.state_id"> 
										<input type="text" name="stateShortCode" 
											class="form-control" id="shortCode"
											ng-disabled="isViewStateDetail == 'yes'"
											ng-model="state.state_short_cd"
											ng-value="state.state_short_cd" required>
											<p ng-show="stateForm.stateShortCode.$invalid && !stateForm.stateShortCode.$pristine">State Short Code is required.</p>
									</div>
								</div>
								<div class="form-group" ng-class="{ 'has-error' : stateForm.stateName.$invalid && !stateForm.stateName.$pristine }">
									<label for="input01" class="col-sm-4 control-label">State Name</label>
									<div class="col-sm-8">
										<input type="text" class="form-control" name="stateName"
											ng-disabled="isViewStateDetail == 'yes'"
											ng-model="state.state_name" ng-value="state.state_name" required/>
										<p ng-show="stateForm.stateName.$invalid && !stateForm.stateName.$pristine">State Name is required.</p>
									</div>
								</div>
								<!--  || isViewStateDetail != 'yes'"  -->
								<div class="form-group form-footer">
									<div class="col-sm-offset-4 col-sm-8">
										<button type="button" class="btn btn-primary" ng-click="save_state()" 
											ng-if="stateUpdateStatus != 'update'"
											ng-disabled="stateForm.$invalid">Create</button>
										<button type="button" class="btn btn-primary" ng-click="update_state()" 
											ng-if="stateUpdateStatus == 'update'" ng-disabled="stateForm.$invalid">Update</button>
										<button ng-click="reset_state()" type="reset" class="btn btn-default">Reset</button>
									</div>
								</div>
							</div>
						</div>
						</form>
						<!-- /tile body -->
						
					</section>
					<!-- /tile -->

					<!-- tile -->
					<section class="tile transparent col-md-6" ng-if="listOfStates">


						<!-- tile header -->
						<div class="tile-header transparent">
							<h1>
								<strong>State</strong> List
							</h1>
						</div>
						<!-- /tile header -->

						<!-- tile body -->
						<div class="tile-body color transparent-white rounded-corners">
							<div ng-if="stateDeleteStatus">
								<div class="alert alert-success alert-dismissable" ng-if="stateDeleteStatus != ''">
									<a href="#" class="close" data-dismiss="alert" aria-label="close">×</a>
									{{stateDeleteStatus}}
								</div>
							</div>

							<div class="table-responsive">
								<table class="table table-custom">
									<thead>
										<tr>
											<th class="sort-numeric col-md-1"></th>
											<th class="sort-alpha col-md-5">State Name</th>
											<th class="sort-numeric col-md-1">View</th>
											<th class="sort-numeric col-md-1">Edit</th>
											<th class="sort-numeric col-md-1">Delete</th>
										</tr>
									</thead>
									<tbody>

										<tr class="odd gradeX" ng-repeat="state in listOfStates">
											<td class="text-center">{{state.state_id}}</td>
											<td class="">{{state.state_name}}</td>
											<td class="actions text-center"><a class="edit" href="#"><span
													ng-click="view_state(state.state_id,state.state_short_cd,state.state_name)" class="label label-success">View</span></a></td>
											<td class="actions text-center"><button
													ng-click="edit_state(state.state_id,state.state_short_cd,state.state_name)"
													type="button" class="label label-warning">Edit</button></td>
											<td class="actions text-center"><button
													ng-click="delete_state(state.state_id,state.state_name)"
													type="button" class="label label-danger">Delete</button></td>

											<!-- <td class="actions text-center"><a class="edit" href="#"><span class="label label-danger">Delete</span></a></td> -->
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
				<!-- ====================== State Code Ends ======================= -->
				<!-- State-Master Content End -->
				<!-- ====================== District Code starts ======================= -->
				<div ng-if="master=='District'">
					<section class="tile transparent col-md-6">

						<!-- tile header -->
						<div class="tile-header transparent">
							<h1>
								<strong>District</strong>
							</h1>
							<button type="button"
								class="btn btn-amethyst margin-bottom-20 pull-right"
								ng-click="showListOfDistricts()">View</button>
							<div class="controls">
								<a href="#" class="minimize"><i class="fa fa-chevron-down"></i></a>
								<a href="#" class="refresh"><i class="fa fa-refresh"></i></a>
							</div>
						</div>

						<!-- tile body -->
						<form name="districtForm">
						<div class="tile-body  color transparent-white rounded-corners">
							<div class="form-horizontal">
								<div ng-if="districtSaveStatus || districtUniqueOrNot">
									<div class="alert alert-success alert-dismissable" ng-if="districtSaveStatus != '' || districtUniqueOrNot != ''">
										<a href="#" class="close" data-dismiss="alert" aria-label="close">×</a>
										{{districtSaveStatus}} {{districtUniqueOrNot}}
									</div>
								</div>
								
							   <div class="form-group"  ng-class="{ 'has-error' : districtForm.districtStateId.$invalid && !districtForm.districtStateId.$pristine }">
									<label for="input01" class="col-sm-4 control-label">State</label>
									<div class="col-sm-8">
										<select ng-model="district.stateId" ng-value="{{district.stateId}}" name="districtStateId" 
											class="chosen-select chosen-transparent form-control" required>
											<option value="">Select State</option>
											<option ng-repeat="state in allStatesForDropdown"
											 value="{{state.state_id}}"  ng-selected="state.state_id == district.stateId" >{{state.state_name}}</option>
										</select>
										<p ng-show="districtForm.districtStateId.$invalid && !districtForm.districtStateId.$pristine">State selection is required.</p>
									</div>
								</div>
								<div class="form-group"  ng-class="{ 'has-error' : districtForm.districtDistrictShortCode.$invalid && !districtForm.districtDistrictShortCode.$pristine }">
									<label for="input01" class="col-sm-4 control-label">District Short Code</label>
									<div class="col-sm-8">
										<input type="hidden" ng-model="district.districtId" ng-value="district.districtId"/> 
										<input type="text" class="form-control" id="shortCode"  name="districtDistrictShortCode" 
											ng-model="district.districtShortCode" ng-value="district.districtShortCode" required/>
										<p ng-show="districtForm.districtDistrictShortCode.$invalid && !districtForm.districtDistrictShortCode.$pristine">District Short Code is required.</p>
									</div>
								</div>
								<div class="form-group"  ng-class="{ 'has-error' : districtForm.districtDistrictName.$invalid && !districtForm.districtDistrictName.$pristine }">
									<label for="input01" class="col-sm-4 control-label">District Name</label>
									<div class="col-sm-8">
										<input type="text" class="form-control" id="stateName"  name="districtDistrictName" 
											ng-model="district.districtName" ng-value="district.districtName" required/>
										<p ng-show="districtForm.districtDistrictName.$invalid && !districtForm.districtDistrictName.$pristine">District Name is required.</p>
									</div>
								</div>
								<div class="form-group form-footer">
									<div class="col-sm-offset-4 col-sm-8">
										<button type="button" class="btn btn-primary" ng-click="saveDistrict()"  ng-disabled="districtForm.$invalid"  ng-if="districtUpdateStatus != 'update'">Create</button>
										<button type="button" class="btn btn-primary" ng-click="updateDistrict()" ng-if="districtUpdateStatus == 'update'">Update</button>
										<button type="reset"  ng-click="resetDistrict()"  class="btn btn-default">Reset</button>
									</div>
								</div>
							</div>

						</div>
						</form>
						<!-- /tile body -->

					</section>
					<!-- /tile -->

					<!-- tile -->
					<section class="tile transparent col-md-6" ng-if="listOfDistricts">

						<!-- tile header -->
						<div class="tile-header transparent">
							<h1>
								<strong>District</strong> List
							</h1>
						</div>
						<!-- /tile header -->

						<!-- tile body -->
						<div class="tile-body color transparent-white rounded-corners">
							<div ng-if="districtDeleteStatus">
								<div class="alert alert-success alert-dismissable" ng-if="districtDeleteStatus != ''">
									<a href="#" class="close" data-dismiss="alert" aria-label="close">×</a>
									{{districtDeleteStatus}}
								</div>
							</div>
							
							<div class="table-responsive">
								<table class="table table-custom">
									<thead>
										<tr>
											<th class="sort-numeric col-md-1"></th>
											<th class="sort-alpha col-md-5">District Name</th>
											<th class="sort-numeric col-md-1">View</th>
											<th class="sort-numeric col-md-1">Edit</th>
											<th class="sort-numeric col-md-1">Delete</th>
										</tr>
									</thead>
									<tbody>

										<tr class="odd gradeX" ng-repeat="district in listOfDistricts">
											<td class="text-center">{{district.districtId}}</td>
											<td class="">{{district.districtName}}</td>
											<td class="actions text-center"><a class="edit" href="#"><span
													ng-click="viewDistrict(district.districtId,district.districtShortCode,district.districtName,district.stateId)" 
													class="label label-success">View</span></a></td>
											<td class="actions text-center"><button
													ng-click="editDistrict(district.districtId,district.districtShortCode,district.districtName,district.stateId)"
													type="button" class="label label-warning">Edit</button></td>
											<td class="actions text-center"><button
													ng-click="deleteDistrict(district.districtId,district.districtName)"
													type="button" class="label label-danger">Delete</button></td>
											<!-- <td class="actions text-center"><a class="edit" href="#"><span class="label label-danger">Delete</span></a></td> -->
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
				<!-- ====================== District Code Ends ======================= -->
				<!-- ====================== Branch Code starts ======================= -->
				<div ng-if="master=='Branch'">
					<section class="tile transparent col-md-6">

						<!-- tile header -->
						<div class="tile-header transparent">
							<h1>
								<strong>Branch</strong>
							</h1>
							<button type="button"
								class="btn btn-amethyst margin-bottom-20 pull-right"
								ng-click="showListOfBranches()">View</button>
						</div>

						<!-- tile body -->
						<form name="branchForm">
						<div class="tile-body  color transparent-white rounded-corners">
							<div class="form-horizontal">
								<div ng-if="branchSaveStatus || branchUniqueOrNot" class="alert alert-success alert-dismissable">
									<!-- <a href="#" class="close" data-dismiss="alert" aria-label="close">×</a> -->
									<div ng-if="branchSaveStatus != '' || branchUniqueOrNot != ''">
										{{branchSaveStatus}} {{branchUniqueOrNot}}
									</div>
								</div>
								
								<input type="hidden" ng-model="branch.branchId" ng-value="branch.branchId">
								<div class="form-group" ng-class="{ 'has-error' : branchForm.branchName.$invalid && !branchForm.branchName.$pristine }">
									<label for="input01" class="col-sm-4 control-label">Branch Name</label>
									<div class="col-sm-8">
										<input type="text" class="form-control" name="branchName"
											ng-model="branch.branch_name" ng-value="{{branch.branch_name}}" required/>
										<p ng-show="branchForm.branchName.$invalid && !branchForm.branchName.$pristine">Branch Name is required.</p>
									</div>
								</div>
								<div class="form-group" ng-class="{ 'has-error' : branchForm.branchCode.$invalid && !branchForm.branchCode.$pristine }">
									<label for="input01" class="col-sm-4 control-label">Branch Code</label>
									<div class="col-sm-8">
										<input type="text" class="form-control" name="branchCode"
											ng-model="branch.branch_code" ng-value="{{branch.branch_code}}" required/>
										<p ng-show="branchForm.branchCode.$invalid && !branchForm.branchCode.$pristine">Branch Code is required.</p>
									</div>
								</div>
								<div class="form-group">
									<label for="input01" class="col-sm-4 control-label">Branch State</label>
									<div class="col-sm-8">
										<select ng-model="branch.state_id"
											ng-value="{{branch.state_id}}"
											ng-change="loadDistrictsOfState(branch.state_id)"
											class="chosen-select chosen-transparent form-control" id="input07">
											<option value="">Select State</option>
											<option ng-repeat="state in allStatesForDropdown"
											 	ng-selected="state.state_id == branch.state_id" 
												value="{{state.state_id}}">{{state.state_name}}</option>
										</select>
									</div>
								</div>
								<div class="form-group">
									<label for="input01" class="col-sm-4 control-label">Branch District</label>
									<div class="col-sm-8">
										<select ng-model="branch.district_id"
											ng-value="{{branch.district_id}}"
											class="chosen-select chosen-transparent form-control"
											id="input07">
											<option value="">Select District</option>
											<option ng-repeat="district in districtsOfState"
												ng-selected="district.districtId == branch.district_id" 
												value="{{district.districtId}}">{{district.districtName}}</option>
										</select>
									</div>
								</div>
								<div class="form-group">
									<label for="input01" class="col-sm-4 control-label">Branch
										PIN</label>
									<div class="col-sm-8">
										<input type="text" class="form-control" id="stateName"
											ng-model="branch.branch_pin" ng-value="{{branch.branch_pin}}">
									</div>
								</div>
								<div class="form-group">
									<label for="input01" class="col-sm-4 control-label">Branch Type</label>
									<div class="col-sm-8">
										<select ng-model="branch.branch_type"
											ng-value="branch.branch_type"
											class="chosen-select chosen-transparent form-control"
											id="input07">
											<option value="">Select Branch Type</option>
											<option value="1">Rural</option>
											<option value="2">Urban</option>
										</select>
									</div>
								</div>
								<div class="form-group">
									<label for="input01" class="col-sm-4 control-label">Mandal/Municipal/Corp.</label>
									<div class="col-sm-8">
										<input type="text" class="form-control"
											ng-model="branch.branch_mandal_municipal"
											ng-value="branch.branch_mandal_municipal">
									</div>
								</div>
								<div class="form-group">
									<label for="input01" class="col-sm-4 control-label">Branch Address</label>
									<div class="col-sm-8">
										<textarea ng-model="branch_mandal_municipal"
											ng-value="{{branch_mandal_municipal}}" class="form-control"
											id="input05" rows="4"></textarea>
									</div>
								</div>
								<div class="form-group">
									<label for="input01" class="col-sm-4 control-label">Branch Phone</label>
									<div class="col-sm-8">
										<input type="text" class="form-control" id="stateName"
											ng-model="branch.branch_phone" ng-value="{{branch.branch_phone}}">
									</div>
								</div>
								<div class="form-group">
									<label for="input01" class="col-sm-4 control-label">Begin
										Date</label>
									<div class="col-sm-8">
										<input type="text" class="form-control" id="stateName"
											ng-model="branch.branch_begin_dt"
											ng-value="{{branch.branch_begin_dt}}">
									</div>
								</div>
								<div class="form-group">
									<label for="input01" class="col-sm-4 control-label">Co-Ordinates
										X:</label>
									<div class="col-sm-3">
										<input type="text" class="form-control"
											ng-model="branch.branch_coordinates_x"
											ng-value="branch.branch_coordinates_x">
									</div>
									<label for="input01" class="col-sm-1 control-label">Y:</label>
									<div class="col-sm-4">
										<input type="text" class="form-control"
											ng-model="branch.branch_coordinates_y"
											ng-value="branch.branch_coordinates_y">
									</div>
								</div>
								<div class="form-group form-footer">
									<div class="col-sm-offset-4 col-sm-8">
										<button type="button" class="btn btn-primary" ng-click="saveBranch()"  ng-disabled="branchForm.$invalid" ng-if="branchUpdateStatus != 'update'">Create</button>
                        				<button type="button" class="btn btn-primary" ng-click="updateBranch()" ng-if="branchUpdateStatus == 'update'">Update</button>
										<button type="reset" class="btn btn-default" ng-click="resetBranch()" >Reset</button>
									</div>
								</div>
							</div>

						</div>
						</form>
						<!-- /tile body -->

					</section>
					<!-- /tile -->

					<!-- tile -->
					<section class="tile transparent col-md-6" ng-if="listOfBranches">


						<!-- tile header -->
						<div class="tile-header transparent">
							<h1>
								<strong>Branches</strong> List
							</h1>
						</div>
						<!-- /tile header -->

						<!-- tile body -->
						<div class="tile-body color transparent-white rounded-corners">
							<div ng-if="branchDeleteStatus">
								<div class="alert alert-success alert-dismissable" ng-if="branchDeleteStatus != ''">
									<a href="#" class="close" data-dismiss="alert" aria-label="close">×</a>
									{{branchDeleteStatus}}
								</div>
							</div>
							
							<div class="table-responsive">
								<table class="table table-custom">
									<thead>
										<tr>
											<th class="sort-numeric col-md-1"></th>
											<th class="sort-alpha col-md-5">Branch Name</th>
											<th class="sort-numeric col-md-1">View</th>
											<th class="sort-numeric col-md-1">Edit</th>
											<th class="sort-numeric col-md-1">Delete</th>
										</tr>
									</thead>
									<tbody>

										<tr class="odd gradeX" ng-repeat="branch in listOfBranches">
											<td class="text-center">{{branch.branch_id}}</td>
											<td class="">{{branch.branch_name}}</td>
											<td class="actions text-center"><a class="edit" href="#"><span
													ng-click="viewBranch(branch.branch_id,branch.branch_name,branch.state_id,branch.district_id,branch.branch_pin,branch.branch_type,branch.branch_mandan_municipal,branch.branch_address,branch.branch_phone,branch.branch_begin_dt,branch.branch_coordinates_x,branch.branch_coordinates_y)"
													class="label label-success">View</span></a></td>
											<td class="actions text-center"><button
													ng-click="editBranch(branch.branch_id,branch.branch_name,branch.state_id,branch.district_id,branch.branch_pin,branch.branch_type,branch.branch_mandan_municipal,branch.branch_address,branch.branch_phone,branch.branch_begin_dt,branch.branch_coordinates_x,branch.branch_coordinates_y)"
													type="button" class="label label-warning">Edit</button></td>
											<td class="actions text-center"><button
													ng-click="deleteBranch(branch.branch_id,branch.branch_name,branch.state_id,branch.district_id,branch.branch_pin,branch.branch_type,branch.branch_mandan_municipal,branch.branch_address,branch.branch_phone,branch.branch_begin_dt,branch.branch_coordinates_x,branch.branch_coordinates_y)"
													type="button" class="label label-danger">Delete</button></td>
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
				<!-- ====================== Branch Code Ends ======================= -->
				<!-- State-Master Content End -->
				<!-- ====================== Block Code starts ======================= -->
				<div ng-if="master=='Block'">
					<section class="tile transparent col-md-6">

						<!-- tile header -->
						<div class="tile-header transparent">
							<h1>
								<strong>Block</strong>
							</h1>
							<button type="button"
								class="btn btn-amethyst margin-bottom-20 pull-right"
								ng-click="showListOfBlocks()">View</button>
						</div>

						<!-- tile body -->
						<form name="blockForm">
						<div class="tile-body  color transparent-white rounded-corners">
							<div class="form-horizontal">
								<div class="alert alert-success alert-dismissable"
									ng-if="blockSaveStatus || blockUniqueOrNot">
									<a href="#" class="close" data-dismiss="alert" aria-label="close">×</a>
									{{blockSaveStatus}} {{blockUniqueOrNot}}</div>
								<div class="form-group"   ng-class="{ 'has-error' : blockForm.blockStateId.$invalid && !blockForm.blockStateId.$pristine }">
									<label for="input01" class="col-sm-4 control-label">State</label>
									<div class="col-sm-8">
										<select ng-model="block.state_id" ng-value="{{block.state_id}}" name="blockStateId"
											ng-change="loadDistrictsOfState(block.state_id)"
											class="chosen-select chosen-transparent form-control" required>
											<option value="">Select State</option>
											<option ng-repeat="state in allStatesForDropdown"
												value="{{state.state_id}}"  ng-selected="state.state_id == block.state_id" >{{state.state_name}}</option>
										</select>
										<p ng-show="blockForm.blockStateId.$invalid && !blockForm.blockStateId.$pristine">State selection is required.</p>
									</div>
								</div>
								<div class="form-group"  ng-class="{ 'has-error' : blockForm.blockDistrictId.$invalid && !blockForm.blockDistrictId.$pristine }">
									<label for="input01" class="col-sm-4 control-label">District</label>
									<div class="col-sm-8">
										<select ng-model="block.district_id"
											ng-value="{{block.district_id}}"  name="blockDistrictId"
											class="chosen-select chosen-transparent form-control" required>
											<option value="">Select District</option>
											<option ng-repeat="district in districtsOfState"
												value="{{district.districtId}}"  ng-selected="district.districtId == block.district_id" >{{district.districtName}}</option>
										</select>
										<p ng-show="blockForm.blockDistrictId.$invalid && !blockForm.blockDistrictId.$pristine">District selection is required.</p>
									</div>
								</div>
								<div class="form-group" ng-class="{ 'has-error' : blockForm.blockBlockShortCode.$invalid && !blockForm.blockBlockShortCode.$pristine }">
									<label for="input01" class="col-sm-4 control-label">Block Short Code</label>
									<div class="col-sm-8">
										<input type="hidden" ng-model="block.block_id"
											ng-value="block.blockId"> 
											<input type="text"
											class="form-control" id="shortCode" name="blockBlockShortCode"
											ng-model="block.block_short_code"
											ng-value="{{block.block_short_code}}" required>
											<p ng-show="blockForm.blockBlockShortCode.$invalid && !blockForm.blockBlockShortCode.$pristine">Block Short Code is required.</p>
									</div>
								</div>
								<div class="form-group"  ng-class="{ 'has-error' : blockForm.blockBlockLongName.$invalid && !blockForm.blockBlockLongName.$pristine }">
									<label for="input01" class="col-sm-4 control-label">Block Name</label>
									<div class="col-sm-8">
										<input type="text" class="form-control" id="stateName" name="blockBlockLongName"
											ng-model="block.block_long_name" ng-value="{{block.block_long_name}}" required>
										<p ng-show="blockForm.blockBlockLongName.$invalid && !blockForm.blockBlockLongName.$pristine">Block Long Name is required.</p>
									</div>
								</div>

								<div class="form-group form-footer">
									<div class="col-sm-offset-4 col-sm-8">
										<button type="button" class="btn btn-primary"
											ng-click="saveBlock()" ng-disabled="blockForm.$invalid" ng-if="blockUpdateStatus != 'update'">Create</button>
										<button type="button" class="btn btn-primary"
											ng-click="updateBlock()"
											ng-if="blockUpdateStatus == 'update'">Update</button>

										<button type="reset" class="btn btn-default" ng-click="resetBlock()">Reset</button>
									</div>
								</div>
							</div>

						</div>
						</form>
						<!-- /tile body -->

					</section>
					<!-- /tile -->

					<!-- tile -->
					<section class="tile transparent col-md-6" ng-if="listOfBlocks">

						<!-- tile header -->
						<div class="tile-header transparent">
							<h1>
								<strong>Block</strong> List
							</h1>

							<div class="controls">
								<a href="#" class="minimize"><i class="fa fa-chevron-down"></i></a>
								<a href="#" class="refresh"><i class="fa fa-refresh"></i></a>
							</div>
						</div>
						<!-- /tile header -->

						<!-- tile body -->
						<div class="tile-body color transparent-white rounded-corners">
							<div class="alert alert-success alert-dismissable" ng-if="blockDeleteStatus">
								<a href="#" class="close" data-dismiss="alert" aria-label="close">×</a>
								{{blockDeleteStatus}}</div>

							<div class="table-responsive">
								<table class="table table-custom">
									<thead>
										<tr>
											<th class="sort-numeric col-md-1"></th>
											<th class="sort-alpha col-md-5">District Name</th>
											<th class="sort-numeric col-md-1">View</th>
											<th class="sort-numeric col-md-1">Edit</th>
											<th class="sort-numeric col-md-1">Delete</th>
										</tr>
									</thead>
									<tbody>

										<tr class="odd gradeX" ng-repeat="block in listOfBlocks">
											<td class="text-center">{{block.block_id}}</td>
											<td class="">{{block.block_long_name}}</td>
											<td class="actions text-center"><a class="edit" href="#"><span
													ng-click="viewBlock(block.block_id,block.block_short_cd,block.block_long_name,block.state_id,block.district_id)"
													class="label label-success">View</span></a></td>
											<td class="actions text-center"><button
													ng-click="editBlock(block.block_id,block.block_short_cd,block.block_long_name,block.state_id,block.district_id)"
													type="button" class="label label-warning">Edit</button></td>
											<td class="actions text-center"><button
													ng-click="deleteBlock(block.block_id,block.block_long_name)"
													type="button" class="label label-danger">Delete</button></td>
											<!-- <td class="actions text-center"><a class="edit" href="#"><span class="label label-danger">Delete</span></a></td> -->
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
				<!-- ====================== Block Code Ends ======================= -->
				<!-- State-Master Content End -->
				<!-- ====================== Designation Code starts ======================= -->
				<div ng-if="master=='Designation'">
					<section class="tile transparent col-md-6">
						<!-- tile header -->
						<div class="tile-header transparent">
							<h1>
								<strong>Designation</strong>
							</h1>
							<button type="button"
								class="btn btn-amethyst margin-bottom-20 pull-right"
								ng-click="showListOfDesignation()">View</button>
							<div class="controls">
								<a href="#" class="minimize"><i class="fa fa-chevron-down"></i></a>
								<a href="#" class="refresh"><i class="fa fa-refresh"></i></a>
							</div>
						</div>

						<!-- tile body -->
						<form name="designationForm">
						<div class="tile-body  color transparent-white rounded-corners">
							<div class="form-horizontal">
								<div class="alert alert-success alert-dismissable" ng-if="designationSaveStatus || designationUniqueOrNot">
									<a href="#" class="close" data-dismiss="alert" aria-label="close">×</a>
									{{designationSaveStatus}} {{designationUniqueOrNot}}
								</div>
								
								<div class="form-group" ng-class="{ 'has-error' : designationForm.designation.$invalid && !designationForm.designation.$pristine }">
									<label for="input01" class="col-sm-4 control-label">Designation Name</label>
									<div class="col-sm-8">
										<input type="hidden" ng-model="designation.designationId"
											ng-value="designation.designationId"/> 
										<input type="text" ng-model="designation.designationName" name="designation"
											ng-value="designation.designationName" class="form-control" required/>
											<p ng-show="designationForm.designation.$invalid && !designationForm.designation.$pristine">Designation Name is required.</p>
									</div>
								</div>
								
								<div class="form-group" ng-class="{ 'has-error' : designationForm.deartment.$invalid && !designationForm.deartment.$pristine }">
									<label for="input01" class="col-sm-4 control-label">Department</label>
									<div class="col-sm-8">
										<select ng-model="designation.department" ng-value="designation.department"  name="deartment"
											class="chosen-select chosen-transparent form-control" required>
											<option value="">Select Department</option>
											<option value="1" ng-selected="designation.department == '1'">IT</option>
											<option value="2" ng-selected="designation.department == '2'">Finance</option>
											<option value="3" ng-selected="designation.department == '3'">Technical</option>
										</select>
										<p ng-show="designationForm.deartment.$invalid && !designationForm.deartment.$pristine">Department is required.</p>
									</div>
								</div>
								
								<div class="form-group" ng-class="{ 'has-error' : designationForm.role.$invalid && !designationForm.role.$pristine }">
									<label for="input01" class="col-sm-4 control-label">Role</label>
									<div class="col-sm-8">
										<select ng-model="designation.role" ng-value="designation.role"  name="role"
											class="chosen-select chosen-transparent form-control" required>
											<option value="">Select Role</option>
											<option value="1" ng-selected="designation.role == '1'">ADMIN</option>
											<option value="2" ng-selected="designation.role == '2'">USER</option>
										</select>
										<p ng-show="designationForm.role.$invalid && !designationForm.role.$pristine">Role is required.</p>
									</div>
								</div>

								<div class="form-group form-footer">
									<div class="col-sm-offset-4 col-sm-8">
										<button type="button" class="btn btn-primary" ng-click="saveDesignation()"  ng-disabled="designationForm.$invalid" ng-if="designationUpdateStatus != 'update'">Create</button>
										<button type="button" class="btn btn-primary" ng-click="updateDesignation()" ng-if="designationUpdateStatus == 'update'">Update</button>
										<button type="reset" class="btn btn-default" ng-click="resetDesignation()">Reset</button>
									</div>
								</div>
							</div>
						</div>
						</form>
						<!-- /tile body -->

					</section>
					<!-- /tile -->

					<!-- tile -->
					<section class="tile transparent col-md-6" ng-if="listOfDesignation">


						<!-- tile header -->
						<div class="tile-header transparent">
							<h1>
								<strong>Designation</strong> List
							</h1>
						</div>
						<!-- /tile header -->

						<!-- tile body -->
						<div class="tile-body color transparent-white rounded-corners">
							<div class="alert alert-success alert-dismissable" ng-if="designationDeleteStatus">
								<a href="#" class="close" data-dismiss="alert" aria-label="close">×</a>
								{{designationDeleteStatus}}
							</div>

							<div class="table-responsive">
								<table class="table table-custom">
									<thead>
										<tr>
											<th class="sort-numeric col-md-1"></th>
											<th class="sort-alpha col-md-5">Designation Name</th>
											<th class="sort-numeric col-md-1">View</th>
											<th class="sort-numeric col-md-1">Edit</th>
											<th class="sort-numeric col-md-1">Delete</th>
										</tr>
									</thead>
									<tbody>

										<tr class="odd gradeX" ng-repeat="designation in listOfDesignation">
											<td class="text-center">{{designation.designationId}}</td>
											<td class="">{{designation.designationName}}</td>
											<td class="actions text-center"><a class="edit" href="#"><span ng-click="viewDesignation(designation.designationId,designation.designationName,designation.department,designation.role)" class="label label-success">View</span></a></td>
											<td class="actions text-center"><button ng-click="editDesignation(designation.designationId,designation.designationName,designation.department,designation.role)"
													type="button" class="label label-warning">Edit</button></td>
											<td class="actions text-center"><button
													ng-click="deleteDesignation(designation.designationId,designation.designationName)"
													type="button" class="label label-danger">Delete</button></td>
											<!-- <td class="actions text-center"><a class="edit" href="#"><span class="label label-danger">Delete</span></a></td> -->
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
				<!-- ====================== Designation Code Ends ======================= -->
				<!-- State-Master Content End -->
				<!-- ====================== Village Code starts ======================= -->
				<div ng-if="master=='Village/Town/City'">
					<section class="tile transparent col-md-6">
						<!-- tile header -->
						<div class="tile-header transparent">
							<h1>
								<strong>Village/Town/City</strong>
							</h1>
							<button type="button"
								class="btn btn-amethyst margin-bottom-20 pull-right"
								ng-click="showListOfVtc()">View</button>
						</div>

						<!-- tile body -->
						<form name="vtcForm">
						<div class="tile-body  color transparent-white rounded-corners">
							<div class="form-horizontal">
								<div class="alert alert-success alert-dismissable" ng-if="vtcSaveStatus || vtcUniqueOrNot">
									<a href="#" class="close" data-dismiss="alert" aria-label="close">×</a>
									{{vtcSaveStatus}} {{vtcUniqueOrNot}}
								</div>
								 
								<div class="form-group" ng-class="{ 'has-error' : vtcForm.vtcStateId.$invalid && !vtcForm.vtcStateId.$pristine }">
								<input type="hidden" ng-model="vtc.vtc_id" ng-value="{{vtc.vtc_id}}"/>
									<label for="input01" class="col-sm-4 control-label">State</label>
									<div class="col-sm-8">
										<select ng-model="vtc.state_id" ng-value="{{vtc.state_id}}" name="vtcStateId" 
											ng-change="loadDistrictsOfStateForVtc()"
											class="chosen-select chosen-transparent form-control" required>
											<option value="">Select State</option>
											<option ng-repeat="state in allStatesForDropdown" 
												ng-selected="state.state_id == vtc.state_id"
												value="{{state.state_id}}">{{state.state_name}}</option>
										</select>
										<p ng-show="vtcForm.vtcStateId.$invalid && !vtcForm.vtcStateId.$pristine">State selection is required.</p>
									</div>
								</div>
								<div class="form-group" ng-class="{ 'has-error' : vtcForm.vtcDistrictId.$invalid && !vtcForm.vtcDistrictId.$pristine }">
									<label for="input01" class="col-sm-4 control-label">District</label>
									<div class="col-sm-8">
										<select ng-model="vtc.district_id" ng-value="{{vtc.district_id}}" name="vtcDistrictId" 
											ng-change="loadBlocksOfDistrictForVtc()"
											class="chosen-select chosen-transparent form-control" required>
											<option value="">Select District</option>
											<option ng-repeat="district in districtsOfStateForVtc"
												ng-selected="district.districtId == vtc.district_id"
												value="{{district.districtId}}">{{district.districtName}}</option>
										</select>
										<p ng-show="vtcForm.vtcDistrictId.$invalid && !vtcForm.vtcDistrictId.$pristine">District selection is required.</p>
									</div>
								</div>
								<div class="form-group" ng-class="{ 'has-error' : vtcForm.vtcBlockId.$invalid && !vtcForm.vtcBlockId.$pristine }">
									<label for="input01" class="col-sm-4 control-label">Block</label>
									<div class="col-sm-8">
										<select ng-model="vtc.block_id" ng-value="{{vtc.block_id}}" name="vtcBlockId" 
											class="chosen-select chosen-transparent form-control" required>
											<option value="">Select Block</option>
											<option ng-repeat="block in blocksOfDistrictForVtc"
												ng-selected="block.blockId == vtc.block_id"
												value="{{block.blockId}}">{{block.blockLongName}}</option>
										</select>
										<p ng-show="vtcForm.vtcBlockId.$invalid && !vtcForm.vtcBlockId.$pristine">Block selection is required.</p>
									</div>
								</div>
								<div class="form-group" ng-class="{ 'has-error' : vtcForm.vtcVtcShortCode.$invalid && !vtcForm.vtcVtcShortCode.$pristine }">
									<label for="input01" class="col-sm-4 control-label">Short Code</label>
									<div class="col-sm-8">
										<input type="text" class="form-control" id="shortCode" name="vtcVtcShortCode" 
											ng-model="vtc.vtc_short_cd" ng-value="{{vtc.vtc_short_cd}}" required/>
										<p ng-show="vtcForm.vtcVtcShortCode.$invalid && !vtcForm.vtcVtcShortCode.$pristine">Short Code is required.</p>
									</div>
								</div>
								<div class="form-group" ng-class="{ 'has-error' : vtcForm.vtcLongName.$invalid && !vtcForm.vtcLongName.$pristine }">
									<label for="input01" class="col-sm-4 control-label">Long Name</label>
									<div class="col-sm-8">
										<input type="text" class="form-control" name="vtcLongName" 
											ng-model="vtc.vtc_long_name" ng-value="{{vtc.vtc_long_name}}" required>
										<p ng-show="vtcForm.vtcLongName.$invalid && !vtcForm.vtcLongName.$pristine">Long Name is required.</p>
									</div>
								</div>

								<div class="form-group form-footer">
									<div class="col-sm-offset-4 col-sm-8">
										<button type="button" class="btn btn-primary" ng-click="saveVtc()" ng-if="vtcUpdateStatus != 'update'" ng-disabled="vtcForm.$invalid">Create</button>
										<button type="button" class="btn btn-primary" ng-click="updateVtc()" ng-if="vtcUpdateStatus == 'update'">Update</button>
										<button type="reset" class="btn btn-default" ng-click="resetVtc()">Reset</button>
									</div>
								</div>
							</div>

						</div>
						</form>
						<!-- /tile body -->

					</section>
					<!-- /tile -->

					<!-- tile -->
					<section class="tile transparent col-md-6" ng-if="listOfVtc">

						<!-- tile header -->
						<div class="tile-header transparent">
							<h1>
								<strong>Village/Town/City</strong> List
							</h1>
						</div>
						<!-- /tile header -->

						<!-- tile body -->
						<div class="tile-body color transparent-white rounded-corners">
							<div ng-if="vtcDeleteStatus">
								<div class="alert alert-success alert-dismissable" ng-if="vtcDeleteStatus != ''">
									<a href="#" class="close" data-dismiss="alert" aria-label="close">×</a>
									{{vtcDeleteStatus}}
								</div>
							</div>
							<div class="table-responsive">
								<table class="table table-custom">
									<thead>
										<tr>
											<th class="sort-numeric col-md-1"></th>
											<th class="sort-alpha col-md-5">Village/Town/City Name</th>
											<th class="sort-numeric col-md-1">View</th>
											<th class="sort-numeric col-md-1">Edit</th>
											<th class="sort-numeric col-md-1">Delete</th>
										</tr>
									</thead>
									<tbody>

										<tr class="odd gradeX" ng-repeat="vtc in listOfVtc">
											<td class="text-center">{{vtc.vtc_id}}</td>
											<td class="">{{vtc.vtc_long_name}}</td>
											<td class="actions text-center"><a class="edit" href="#">
												<span class="label label-success"
												ng-click="viewVtc(vtc.vtc_id,vtc.vtc_short_cd,vtc.vtc_long_name,vtc.block_id,vtc.district_id,vtc.state_id)">View</span></a>
											</td>
											<td class="actions text-center">
												<button ng-click="editVtc(vtc.vtc_id,vtc.vtc_short_cd,vtc.vtc_long_name,vtc.block_id,vtc.district_id,vtc.state_id)"
													type="button" class="label label-warning">Edit</button>
											</td>
											<td class="actions text-center">
												<button ng-click="deleteVtc(vtc.vtc_id,vtc.vtc_long_name)"
													type="button" class="label label-danger">Delete</button>
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
				<!-- ====================== Village Code Ends ======================= -->
				<!-- ====================== Role Code starts ======================= -->
				<div ng-if="master=='User Role'">
					<section class="tile transparent col-md-6">
						<!-- tile header -->
						<div class="tile-header transparent">
							<h1>
								<strong>Role</strong>
							</h1>
							<button type="button"
								class="btn btn-amethyst margin-bottom-20 pull-right"
								ng-click="showListOfRoles()">View</button>
						</div>

						<!-- tile body -->
						<form name="userRoleForm">
						<div class="tile-body  color transparent-white rounded-corners">
							<div class="form-horizontal">
								<div ng-if="roleSaveStatus || roleUniqueOrNot">
									<div class="alert alert-success alert-dismissable" ng-if="roleSaveStatus != '' || roleUniqueOrNot != ''">
										<a href="#" class="close" data-dismiss="alert" aria-label="close">×</a>
										{{roleSaveStatus}} {{roleUniqueOrNot}}
									</div>
								</div>
								 
								<div class="form-group" ng-class="{ 'has-error' : userRoleForm.parentRoleId.$invalid && !userRoleForm.parentRoleId.$pristine }">
								<input type="hidden" ng-model="role.role_id" ng-value="{{role.role_id}}"/>
									<label for="input01" class="col-sm-4 control-label">Parent Role</label>
									
									<div class="col-sm-8">
										<select ng-model="role.parent_role_id" ng-value="{{role.parent_role_id}}"  name="parentRoleId" 
											class="chosen-select chosen-transparent form-control" required>
											<option value="">Select Parent Role</option>
											<option ng-repeat="role1 in listOfRolesForDropdown" value="{{role1.role_id}}" ng-selected="role1.role_id == role.parent_role_id" >{{role1.role_name}}</option>
										</select>
										<p ng-show="userRoleForm.parentRoleId.$invalid && !userRoleForm.parentRoleId.$pristine">Parent Role is required.</p>
									</div>
									
								</div>
								<div class="form-group" ng-class="{ 'has-error' : userRoleForm.roleName.$invalid && !userRoleForm.roleName.$pristine }">
									<label for="input01" class="col-sm-4 control-label">Role Name</label>
									<div class="col-sm-8">
										<input type="text" class="form-control"  name="roleName" 
											ng-model="role.role_name" ng-value="{{role.role_name}}" required/>
										<p ng-show="userRoleForm.roleName.$invalid && !userRoleForm.roleName.$pristine">Role Name is required.</p>
									</div>
								</div>

								<div class="form-group form-footer">
									<div class="col-sm-offset-4 col-sm-8">
										<button type="button" class="btn btn-primary" ng-click="saveRole()"  ng-disabled="userRoleForm.$invalid" ng-if="roleUpdateStatus != 'update'">Create</button>
										<button type="button" class="btn btn-primary" ng-click="updateRole()" ng-if="roleUpdateStatus == 'update'">Update</button>
										<button type="reset" class="btn btn-default" ng-click="resetRole()" >Reset</button>
									</div>
								</div>
							</div>

						</div>
						</form>
						<!-- /tile body -->

					</section>
					<!-- /tile -->

					<!-- tile -->
					<section class="tile transparent col-md-6" ng-if="listOfRoles">

						<!-- tile header -->
						<div class="tile-header transparent">
							<h1>
								<strong>Role</strong> List
							</h1>
						</div>
						<!-- /tile header -->

						<!-- tile body -->
						<div class="tile-body color transparent-white rounded-corners">
							<div ng-if="roleDeleteStatus">
								<div class="alert alert-success alert-dismissable" ng-if="roleDeleteStatus != ''">
									<a href="#" class="close" data-dismiss="alert" aria-label="close">×</a>
									{{roleDeleteStatus}}
								</div>
							</div>
							

							<div class="table-responsive">
								<table class="table table-custom">
									<thead>
										<tr>
											<th class="sort-numeric col-md-1"></th>
											<th class="sort-alpha col-md-5">Role Name</th>
											<th class="sort-numeric col-md-1">View</th>
											<th class="sort-numeric col-md-1">Edit</th>
											<th class="sort-numeric col-md-1">Delete</th>
										</tr>
									</thead>
									<tbody>
										<tr class="odd gradeX" ng-repeat="role11 in listOfRoles">
											<td class="text-center">{{role11.role_id}}</td>
											<td class="">{{role11.role_name}}</td>
											<td class="actions text-center"><a class="edit" href="#">
												<span  ng-click="viewRole(role11.role_id,role11.role_name,role11.parent_role_id)" class="label label-success">View</span></a>
											</td>
											<td class="actions text-center">
												<button ng-click="editRole(role11.role_id,role11.role_name,role11.parent_role_id)"
													type="button" class="label label-warning">Edit</button>
											</td>
											<td class="actions text-center">
												<button ng-click="deleteRole(role11.role_id,role11.role_name)"
													type="button" class="label label-danger">Delete</button>
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
				<!-- ====================== Role Code Ends ======================= -->
				<!-- ====================== Language Code starts ======================= -->
				<div ng-if="master=='Language'">
					<section class="tile transparent col-md-6">
						<!-- tile header -->
						<div class="tile-header transparent">
							<h1>
								<strong>Language</strong>
							</h1>
							<button type="button"
								class="btn btn-amethyst margin-bottom-20 pull-right"
								ng-click="showListOfLanguages()">View</button>
						</div>

						<!-- tile body -->
						<form name="languageForm">
						<div class="tile-body  color transparent-white rounded-corners">
							<div class="form-horizontal">
								<div ng-if="languageSaveStatus || languageUniqueOrNot">
									<div class="alert alert-success alert-dismissable" ng-if="languageSaveStatus != '' || languageUniqueOrNot != ''">
										<a href="#" class="close" data-dismiss="alert" aria-label="close">×</a>
										{{languageSaveStatus}} {{languageUniqueOrNot}}
									</div>
								</div>
								 
								<div class="form-group" ng-class="{ 'has-error' : languageForm.language.$invalid && !languageForm.language.$pristine }">
									<input type="hidden" ng-model="language.lang_id" ng-value="{{language.lang_id}}"/>
									<label for="input01" class="col-sm-4 control-label">Language Name</label>
									<div class="col-sm-8">
										<input type="text" class="form-control" name="language"
											ng-model="language.lang_nm" ng-value="{{language.lang_nm}}" required>
											<p ng-show="languageForm.language.$invalid && !languageForm.language.$pristine">Language is required.</p>
									</div>
								</div>

								<div class="form-group form-footer">
									<div class="col-sm-offset-4 col-sm-8">
										<button type="button" class="btn btn-primary" ng-click="saveLanguage()"  ng-disabled="languageForm.$invalid" ng-if="languageUpdateStatus != 'update'">Create</button>
										<button type="button" class="btn btn-primary" ng-click="updateLanguage()" ng-if="languageUpdateStatus == 'update'">Update</button>
										<button type="reset" class="btn btn-default" ng-click="resetLanguage()" >Reset</button>
									</div>
								</div>
							</div>

						</div>
						</form>
						<!-- /tile body -->

					</section>
					<!-- /tile -->

					<!-- tile -->
					<section class="tile transparent col-md-6" ng-if="listOfLanguages">

						<!-- tile header -->
						<div class="tile-header transparent">
							<h1>
								<strong>Language</strong> List
							</h1>
						</div>
						<!-- /tile header -->

						<!-- tile body -->
						<div class="tile-body color transparent-white rounded-corners">
							<div ng-if="languageDeleteStatus">
								<div class="alert alert-success alert-dismissable" ng-if="languageDeleteStatus != ''">
									<a href="#" class="close" data-dismiss="alert" aria-label="close">×</a>
									{{languageDeleteStatus}}
								</div>
							</div>
							

							<div class="table-responsive">
								<table class="table table-custom">
									<thead>
										<tr>
											<th class="sort-numeric col-md-1"></th>
											<th class="sort-alpha col-md-5">Role Name</th>
											<th class="sort-numeric col-md-1">View</th>
											<th class="sort-numeric col-md-1">Edit</th>
											<th class="sort-numeric col-md-1">Delete</th>
										</tr>
									</thead>
									<tbody>
										<tr class="odd gradeX" ng-repeat="language1 in listOfLanguages">
											<td class="text-center">{{language1.lang_id}}</td>
											<td class="">{{language1.lang_nm}}</td>
											<td class="actions text-center"><a class="edit" href="#">
												<span  ng-click="viewLanguage(language1.lang_id,language1.lang_nm)" class="label label-success">View</span></a>
											</td>
											<td class="actions text-center">
												<button ng-click="editLanguage(language1.lang_id,language1.lang_nm)"
													type="button" class="label label-warning">Edit</button>
											</td>
											<td class="actions text-center">
												<button ng-click="deleteLanguage(language1.lang_id,language1.lang_nm)"
													type="button" class="label label-danger">Delete</button>
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
				<!-- ====================== Language Code Ends ======================= -->
				<!-- ====================== Education Code starts ======================= -->
				<div ng-if="master=='Education'">
					<section class="tile transparent col-md-6">
						<!-- tile header -->
						<div class="tile-header transparent">
							<h1>
								<strong>Education</strong>
							</h1>
							<button type="button"
								class="btn btn-amethyst margin-bottom-20 pull-right"
								ng-click="showListOfEducations()">View</button>
						</div>

						<!-- tile body -->
						<form name="educationForm">
						<div class="tile-body  color transparent-white rounded-corners">
							<div class="form-horizontal">
								<div ng-if="educationSaveStatus || educationUniqueOrNot">
									<div class="alert alert-success alert-dismissable" ng-if="educationSaveStatus != '' || educationUniqueOrNot != ''">
										<a href="#" class="close" data-dismiss="alert" aria-label="close">×</a>
										{{educationSaveStatus}} {{educationUniqueOrNot}}
									</div>
								</div>
								 
								<div class="form-group" ng-class="{ 'has-error' : educationForm.eduaction.$invalid && !educationForm.eduaction.$pristine }">
									<input type="hidden" ng-model="education.education_id" ng-value="{{education.education_id}}"/>
									<label for="input01" class="col-sm-4 control-label">Education Name</label>
									<div class="col-sm-8">
										<input type="text" class="form-control" name="eduaction"
											ng-model="education.education_nm" ng-value="{{education.education_nm}}" required>
										<p ng-show="educationForm.eduaction.$invalid && !educationForm.eduaction.$pristine">Education Name is required.</p>
									</div>
								</div>

								<div class="form-group form-footer">
									<div class="col-sm-offset-4 col-sm-8">
										<button type="button" class="btn btn-primary" ng-click="saveEducation()"  ng-disabled="educationForm.$invalid" ng-if="educationUpdateStatus != 'update'">Create</button>
										<button type="button" class="btn btn-primary" ng-click="updateEducation()" ng-if="educationUpdateStatus == 'update'">Update</button>
										<button type="reset" class="btn btn-default" ng-click="resetEducation()" >Reset</button>
									</div>
								</div>
							</div>

						</div>
						</form>
						<!-- /tile body -->

					</section>
					<!-- /tile -->

					<!-- tile -->
					<section class="tile transparent col-md-6" ng-if="listOfEducations">

						<!-- tile header -->
						<div class="tile-header transparent">
							<h1>
								<strong>Education</strong> List
							</h1>
						</div>
						<!-- /tile header -->

						<!-- tile body -->
						<div class="tile-body color transparent-white rounded-corners">
							<div ng-if="educationDeleteStatus">
								<div class="alert alert-success alert-dismissable" ng-if="educationDeleteStatus != ''">
									<a href="#" class="close" data-dismiss="alert" aria-label="close">×</a>
									{{educationDeleteStatus}}
								</div>
							</div>
							

							<div class="table-responsive">
								<table class="table table-custom">
									<thead>
										<tr>
											<th class="sort-numeric col-md-1"></th>
											<th class="sort-alpha col-md-5">Role Name</th>
											<th class="sort-numeric col-md-1">View</th>
											<th class="sort-numeric col-md-1">Edit</th>
											<th class="sort-numeric col-md-1">Delete</th>
										</tr>
									</thead>
									<tbody>
										<tr class="odd gradeX" ng-repeat="education1 in listOfEducations">
											<td class="text-center">{{education1.education_id}}</td>
											<td class="">{{education1.education_nm}}</td>
											<td class="actions text-center"><a class="edit" href="#">
												<span  ng-click="viewEducation(education1.education_id,education1.education_nm)" class="label label-success">View</span></a>
											</td>
											<td class="actions text-center">
												<button ng-click="editEducation(education1.education_id,education1.education_nm)"
													type="button" class="label label-warning">Edit</button>
											</td>
											<td class="actions text-center">
												<button ng-click="deleteEducation(education1.education_id,education1.education_nm)"
													type="button" class="label label-danger">Delete</button>
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
				<!-- ====================== Education Code Ends ======================= -->
				<!-- ====================== Religion Code starts ======================= -->
				<div ng-if="master=='Religion'">
					<section class="tile transparent col-md-6">
						<!-- tile header -->
						<div class="tile-header transparent">
							<h1>
								<strong>Religion</strong>
							</h1>
							<button type="button"
								class="btn btn-amethyst margin-bottom-20 pull-right"
								ng-click="showListOfReligions()">View</button>
						</div>

						<!-- tile body -->
						<form name="religionForm">
						<div class="tile-body  color transparent-white rounded-corners">
							<div class="form-horizontal">
								<div ng-if="religionSaveStatus || religionUniqueOrNot">
									<div class="alert alert-success alert-dismissable" ng-if="religionSaveStatus != '' || religionUniqueOrNot != ''">
										<a href="#" class="close" data-dismiss="alert" aria-label="close">×</a>
										{{religionSaveStatus}} {{religionUniqueOrNot}}
									</div>
								</div>
								 
								<div class="form-group" ng-class="{ 'has-error' : religionForm.religionReligionName.$invalid && !religionForm.religionReligionName.$pristine }">
									<input type="hidden" ng-model="religion.rel_id" ng-value="{{religion.rel_id}}"/>
									<label for="input01" class="col-sm-4 control-label">Religion Name</label>
									<div class="col-sm-8">
										<input type="text" class="form-control" name="religionReligionName"
											ng-model="religion.religion_name" ng-value="{{religion.religion_name}}" required/>
										<p ng-show="religionForm.religionReligionName.$invalid && !religionForm.religionReligionName.$pristine">Religion Name is required.</p>
									</div>
								</div>

								<div class="form-group form-footer">
									<div class="col-sm-offset-4 col-sm-8">
										<button type="button" class="btn btn-primary"  ng-disabled="religionForm.$invalid" ng-click="saveReligion()" ng-if="religionUpdateStatus != 'update'">Create</button>
										<button type="button" class="btn btn-primary" ng-click="updateReligion()" ng-if="religionUpdateStatus == 'update'">Update</button>
										<button type="reset" class="btn btn-default" ng-click="resetReligion()" >Reset</button>
									</div>
								</div>
							</div>
						</div>
						</form>
						<!-- /tile body -->

					</section>
					<!-- /tile -->

					<!-- tile -->
					<section class="tile transparent col-md-6" ng-if="listOfReligions">

						<!-- tile header -->
						<div class="tile-header transparent">
							<h1>
								<strong>Religions</strong> List
							</h1>
						</div>
						<!-- /tile header -->

						<!-- tile body -->
						<div class="tile-body color transparent-white rounded-corners">
							<div ng-if="religionDeleteStatus">
								<div class="alert alert-success alert-dismissable" ng-if="religionDeleteStatus != ''">
									<a href="#" class="close" data-dismiss="alert" aria-label="close">×</a>
									{{religionDeleteStatus}}
								</div>
							</div>
							

							<div class="table-responsive">
								<table class="table table-custom">
									<thead>
										<tr>
											<th class="sort-numeric col-md-1"></th>
											<th class="sort-alpha col-md-5">Role Name</th>
											<th class="sort-numeric col-md-1">View</th>
											<th class="sort-numeric col-md-1">Edit</th>
											<th class="sort-numeric col-md-1">Delete</th>
										</tr>
									</thead>
									<tbody>
										<tr class="odd gradeX" ng-repeat="religion1 in listOfReligions">
											<td class="text-center">{{religion1.rel_id}}</td>
											<td class="">{{religion1.religion_name}}</td>
											<td class="actions text-center"><a class="edit" href="#">
												<span  ng-click="viewReligion(religion1.rel_id,religion1.religion_name)" class="label label-success">View</span></a>
											</td>
											<td class="actions text-center">
												<button ng-click="editReligion(religion1.rel_id,religion1.religion_name)"
													type="button" class="label label-warning">Edit</button>
											</td>
											<td class="actions text-center">
												<button ng-click="deleteReligion(religion1.rel_id,religion1.religion_name)"
													type="button" class="label label-danger">Delete</button>
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
				<!-- ====================== Religion Code Ends ======================= -->
				<!-- ====================== Department Code starts ======================= -->
				<div ng-if="master=='Department'">
					<section class="tile transparent col-md-6">
						<!-- tile header -->
						<div class="tile-header transparent">
							<h1>
								<strong>Department</strong>
							</h1>
							<button type="button"
								class="btn btn-amethyst margin-bottom-20 pull-right"
								ng-click="showListOfDepartments()">View</button>
						</div>

						<!-- tile body -->
						<form name="departmentForm">
						<div class="tile-body  color transparent-white rounded-corners">
							<div class="form-horizontal">
								<div ng-if="departmentSaveStatus || departmentUniqueOrNot">
									<div class="alert alert-success alert-dismissable" ng-if="departmentSaveStatus != '' || departmentUniqueOrNot != ''">
										<a href="#" class="close" data-dismiss="alert" aria-label="close">×</a>
										{{departmentSaveStatus}} {{departmentUniqueOrNot}}
									</div>
								</div>
								 
								<div class="form-group" ng-class="{ 'has-error' : departmentForm.departmentName.$invalid && !departmentForm.departmentName.$pristine }">
									<input type="hidden" ng-model="department.department_id" ng-value="{{department.department_id}}"/>
									<label for="input01" class="col-sm-4 control-label">Department Name</label>
									<div class="col-sm-8">
										<input type="text" class="form-control" name="departmentName"
											ng-model="department.department_name" ng-value="{{department.department_name}}" required>
										<p ng-show="departmentForm.departmentName.$invalid && !departmentForm.departmentName.$pristine">Department Name is required.</p>
									</div>
								</div>

								<div class="form-group form-footer">
									<div class="col-sm-offset-4 col-sm-8">
										<button type="button" class="btn btn-primary" ng-click="saveDepartment()"  ng-disabled="departmentForm.$invalid" ng-if="departmentUpdateStatus != 'update'">Create</button>
										<button type="button" class="btn btn-primary" ng-click="updateDepartment()" ng-if="departmentUpdateStatus == 'update'">Update</button>
										<button type="reset" class="btn btn-default" ng-click="resetDepartment()" >Reset</button>
									</div>
								</div>
							</div>
						</div>
						</form>
						<!-- /tile body -->

					</section>
					<!-- /tile -->

					<!-- tile -->
					<section class="tile transparent col-md-6" ng-if="listOfDepartments">

						<!-- tile header -->
						<div class="tile-header transparent">
							<h1>
								<strong>Departments</strong> List
							</h1>
						</div>
						<!-- /tile header -->

						<!-- tile body -->
						<div class="tile-body color transparent-white rounded-corners">
							<div ng-if="departmentDeleteStatus">
								<div class="alert alert-success alert-dismissable" ng-if="departmentDeleteStatus != ''">
									<a href="#" class="close" data-dismiss="alert" aria-label="close">×</a>
									{{departmentDeleteStatus}}
								</div>
							</div>
							

							<div class="table-responsive">
								<table class="table table-custom">
									<thead>
										<tr>
											<th class="sort-numeric col-md-1"></th>
											<th class="sort-alpha col-md-5">Department Name</th>
											<th class="sort-numeric col-md-1">View</th>
											<th class="sort-numeric col-md-1">Edit</th>
											<th class="sort-numeric col-md-1">Delete</th>
										</tr>
									</thead>
									<tbody>
										<tr class="odd gradeX" ng-repeat="department1 in listOfDepartments">
											<td class="text-center">{{department1.department_id}}</td>
											<td class="">{{department1.department_name}}</td>
											<td class="actions text-center"><a class="edit" href="#">
												<span  ng-click="viewDepartment(department1.department_id,department1.department_name)" class="label label-success">View</span></a>
											</td>
											<td class="actions text-center">
												<button ng-click="editDepartment(department1.department_id,department1.department_name)"
													type="button" class="label label-warning">Edit</button>
											</td>
											<td class="actions text-center">
												<button ng-click="deleteDepartment(department1.department_id,department1.department_name)"
													type="button" class="label label-danger">Delete</button>
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
				<!-- ====================== Department Code Ends ======================= -->
				<!-- ====================== Occupation Code starts ======================= -->
				<div ng-if="master=='Occupation'">
					<section class="tile transparent col-md-6">
						<!-- tile header -->
						<div class="tile-header transparent">
							<h1>
								<strong>Occupation</strong>
							</h1>
							<button type="button"
								class="btn btn-amethyst margin-bottom-20 pull-right"
								ng-click="showListOfOccupations()">View</button>
						</div>

						<!-- tile body -->
						<form name="occupationForm">
						<div class="tile-body  color transparent-white rounded-corners">
							<div class="form-horizontal">
								<div ng-if="occupationSaveStatus || occupationUniqueOrNot">
									<div class="alert alert-success alert-dismissable" ng-if="occupationSaveStatus != '' || occupationUniqueOrNot != ''">
										<a href="#" class="close" data-dismiss="alert" aria-label="close">×</a>
										{{occupationSaveStatus}} {{occupationUniqueOrNot}}
									</div>
								</div>
								 
								<div class="form-group" ng-class="{ 'has-error' : occupationForm.occupationName.$invalid && !occupationForm.occupationName.$pristine }">
									<input type="hidden" ng-model="occupation.occupation_id" ng-value="{{occupation.occupation_id}}"/>
									<label for="input01" class="col-sm-4 control-label">Occupation Name</label>
									<div class="col-sm-8">
										<input type="text" class="form-control" name="occupationName"
											ng-model="occupation.occupation_name" ng-value="{{occupation.occupation_name}}" required/>
										<p ng-show="occupationForm.occupationName.$invalid && !occupationForm.occupationName.$pristine">Occupation Name is required.</p>
									</div>
								</div>

								<div class="form-group form-footer">
									<div class="col-sm-offset-4 col-sm-8">
										<button type="button" class="btn btn-primary" ng-click="saveOccupation()"  ng-disabled="occupationForm.$invalid"  ng-if="occupationUpdateStatus != 'update'">Create</button>
										<button type="button" class="btn btn-primary" ng-click="updateOccupation()" ng-if="occupationUpdateStatus == 'update'">Update</button>
										<button type="reset" class="btn btn-default" ng-click="resetOccupation()" >Reset</button>
									</div>
								</div>
							</div>

						</div>
						</form>
						<!-- /tile body -->

					</section>
					<!-- /tile -->

					<!-- tile -->
					<section class="tile transparent col-md-6" ng-if="listOfOccupations">

						<!-- tile header -->
						<div class="tile-header transparent">
							<h1>
								<strong>Occupations</strong> List
							</h1>
						</div>
						<!-- /tile header -->

						<!-- tile body -->
						<div class="tile-body color transparent-white rounded-corners">
							<div ng-if="occupationDeleteStatus">
								<div class="alert alert-success alert-dismissable" ng-if="occupationDeleteStatus != ''">
									<a href="#" class="close" data-dismiss="alert" aria-label="close">×</a>
									{{occupationDeleteStatus}}
								</div>
							</div>

							<div class="table-responsive">
								<table class="table table-custom">
									<thead>
										<tr>
											<th class="sort-numeric col-md-1"></th>
											<th class="sort-alpha col-md-5">Occupation Name</th>
											<th class="sort-numeric col-md-1">View</th>
											<th class="sort-numeric col-md-1">Edit</th>
											<th class="sort-numeric col-md-1">Delete</th>
										</tr>
									</thead>
									<tbody>
										<tr class="odd gradeX" ng-repeat="occupation1 in listOfOccupations">
											<td class="text-center">{{occupation1.occupation_id}}</td>
											<td class="">{{occupation1.occupation_name}}</td>
											<td class="actions text-center"><a class="edit" href="#">
												<span  ng-click="viewOccupation(occupation1.occupation_id,occupation1.occupation_name)" class="label label-success">View</span></a>
											</td>
											<td class="actions text-center">
												<button ng-click="editOccupation(occupation1.occupation_id,occupation1.occupation_name)"
													type="button" class="label label-warning">Edit</button>
											</td>
											<td class="actions text-center">
												<button ng-click="deleteOccupation(occupation1.occupation_id,occupation1.occupation_name)"
													type="button" class="label label-danger">Delete</button>
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
				<!-- ====================== Occupation Code Ends ======================= -->
				<!-- ====================== Status Type Code starts ======================= -->
				<div ng-if="master=='Status Type'">
					<section class="tile transparent col-md-6">
						<!-- tile header -->
						<div class="tile-header transparent">
							<h1>
								<strong>Status Type</strong>
							</h1>
							<button type="button"
								class="btn btn-amethyst margin-bottom-20 pull-right"
								ng-click="showListOfStatusTypes()">View</button>
						</div>

						<!-- tile body -->
						<form name="statusTypeForm">
						<div class="tile-body  color transparent-white rounded-corners">
							<div class="form-horizontal">
								<div ng-if="statusTypeSaveStatus || statusTypeUniqueOrNot">
									<div class="alert alert-success alert-dismissable" ng-if="statusTypeSaveStatus != '' || statusTypeUniqueOrNot != ''">
										<a href="#" class="close" data-dismiss="alert" aria-label="close">×</a>
										{{statusTypeSaveStatus}} {{statusTypeUniqueOrNot}}
									</div>
								</div>
								 
								<div class="form-group" ng-class="{ 'has-error' : statusTypeForm.statusTypeCode.$invalid && !statusTypeForm.statusTypeCode.$pristine }">
									<input type="hidden" ng-model="statusType.status_type_id" ng-value="{{statusType.status_type_id}}"/>
									<label for="input01" class="col-sm-4 control-label">Status Type Code</label>
									<div class="col-sm-8">
										<input type="text" class="form-control" name="statusTypeCode"
											ng-model="statusType.status_type_code" ng-value="{{statusType.status_type_code}}" required>
										<p ng-show="statusTypeForm.statusTypeCode.$invalid && !statusTypeForm.statusTypeCode.$pristine">Status Type Code is required.</p>
									</div>
								</div>
								<div class="form-group" ng-class="{ 'has-error' : statusTypeForm.statusTypeName.$invalid && !statusTypeForm.statusTypeName.$pristine }">
									<label for="input01" class="col-sm-4 control-label">Status Type Name</label>
									<div class="col-sm-8">
										<input type="text" class="form-control" name="statusTypeName"
											ng-model="statusType.status_type_name" ng-value="{{statusType.status_type_name}}" required/>
										<p ng-show="statusTypeForm.statusTypeName.$invalid && !statusTypeForm.statusTypeName.$pristine">Status Type Name is required.</p>
									</div>
								</div>
								<div class="form-group" ng-class="{ 'has-error' : statusTypeForm.statusTypeDescreption.$invalid && !statusTypeForm.statusTypeDescreption.$pristine }">
									<label for="input01" class="col-sm-4 control-label">Status Type Description</label>
									<div class="col-sm-8">
										<input type="text" class="form-control" name="statusTypeDescreption"
											ng-model="statusType.status_type_description" ng-value="{{statusType.status_type_description}}" required/>
										<p ng-show="statusTypeForm.statusTypeDescreption.$invalid && !statusTypeForm.statusTypeDescreption.$pristine">Status Type Description is required.</p>
									</div>
								</div>

								<div class="form-group form-footer">
									<div class="col-sm-offset-4 col-sm-8">
										<button type="button" class="btn btn-primary" ng-click="saveStatusType()" ng-disabled="statusTypeForm.$invalid" ng-if="statusTypeUpdateStatus != 'update'">Create</button>
										<button type="button" class="btn btn-primary" ng-click="updateStatusType()" ng-if="statusTypeUpdateStatus == 'update'">Update</button>
										<button type="reset" class="btn btn-default" ng-click="resetStatusType()" >Reset</button>
									</div>
								</div>
							</div>
						</div>
						</form>
						<!-- /tile body -->

					</section>
					<!-- /tile -->

					<!-- tile -->
					<section class="tile transparent col-md-6" ng-if="listOfStatusTypes">

						<!-- tile header -->
						<div class="tile-header transparent">
							<h1>
								<strong>Status Type</strong> List
							</h1>
						</div>
						<!-- /tile header -->

						<!-- tile body -->
						<div class="tile-body color transparent-white rounded-corners">
							<div ng-if="statusTypeDeleteStatus">
								<div class="alert alert-success alert-dismissable" ng-if="statusTypeDeleteStatus != ''">
									<a href="#" class="close" data-dismiss="alert" aria-label="close">×</a>
									{{statusTypeDeleteStatus}}
								</div>
							</div>
							

							<div class="table-responsive">
								<table class="table table-custom">
									<thead>
										<tr>
											<th class="sort-numeric col-md-1"></th>
											<th class="sort-alpha col-md-5">Status Name</th>
											<th class="sort-numeric col-md-1">View</th>
											<th class="sort-numeric col-md-1">Edit</th>
											<th class="sort-numeric col-md-1">Delete</th>
										</tr>
									</thead>
									<tbody>
										<tr class="odd gradeX" ng-repeat="statusType1 in listOfStatusTypes">
											<td class="text-center">{{statusType1.status_type_id}}</td>
											<td class="">{{statusType1.status_type_name}}</td>
											<td class="actions text-center"><a class="edit" href="#">
												<span  ng-click="viewStatusType(statusType1.status_type_id,statusType1.status_type_code,statusType1.status_type_name,statusType1.status_type_description)" class="label label-success">View</span></a>
											</td>
											<td class="actions text-center">
												<button ng-click="editStatusType(statusType1.status_type_id,statusType1.status_type_code,statusType1.status_type_name,statusType1.status_type_description)"
													type="button" class="label label-warning">Edit</button>
											</td>
											<td class="actions text-center">
												<button ng-click="deleteStatusType(statusType1.status_type_id,statusType1.status_type_name)"
													type="button" class="label label-danger">Delete</button>
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
				<!-- ====================== Status Type Code Ends ======================= -->
				<!-- ====================== Status Code starts ======================= -->
				<div ng-if="master=='Status'">
					<section class="tile transparent col-md-6">
						<!-- tile header -->
						<div class="tile-header transparent">
							<h1>
								<strong>Status</strong>
							</h1>
							<button type="button"
								class="btn btn-amethyst margin-bottom-20 pull-right"
								ng-click="showListOfStatus()">View</button>
						</div>

						<!-- tile body -->
						<form name="statusForm">
						<div class="tile-body  color transparent-white rounded-corners">
							<div class="form-horizontal">
								<div ng-if="statusSaveStatus || statusUniqueOrNot">
									<div class="alert alert-success alert-dismissable" ng-if="statusSaveStatus != '' || statusUniqueOrNot != ''">
										<a href="#" class="close" data-dismiss="alert" aria-label="close">×</a>
										{{statusSaveStatus}} {{statusUniqueOrNot}}
									</div>
								</div>
								<input type="hidden" ng-model="status.status_id" ng-value="{{status.status_id}}"/>
								<div class="form-group" ng-class="{ 'has-error' : statusForm.statusTypeId.$invalid && !statusForm.statusTypeId.$pristine }">
									<label for="input01" class="col-sm-4 control-label">Status Type</label>
									<div class="col-sm-8">
										<select ng-model="status.status_type_id" ng-value="{{status.status_type_id}}"  name="statusTypeId" 
											class="chosen-select chosen-transparent form-control" required>
											<option value="">Select Status Type</option>
											<option ng-repeat="statusType1 in listOfStatusTypesForDropdown"
											 value="{{statusType1.status_type_id}}"  ng-selected="statusType1.status_type_id == status.status_id" >{{statusType1.status_type_name}}</option>
										</select>
										<p ng-show="statusForm.statusTypeId.$invalid && !statusForm.statusTypeId.$pristine">Status Type is required.</p>
									</div>
								</div>
								 
								<div class="form-group" ng-class="{ 'has-error' : statusForm.statusCode.$invalid && !statusForm.statusCode.$pristine }">
									<label for="input01" class="col-sm-4 control-label">Status Code</label>
									<div class="col-sm-8">
										<input type="text" class="form-control"  name="statusCode" 
											ng-model="status.status_code" ng-value="{{status.status_code}}" required/>
										<p ng-show="statusForm.statusCode.$invalid && !statusForm.statusCode.$pristine">Status Code is required.</p>
									</div>
								</div>
								<div class="form-group" ng-class="{ 'has-error' : statusForm.statusName.$invalid && !statusForm.statusName.$pristine }">
									<label for="input01" class="col-sm-4 control-label">Status Name</label>
									<div class="col-sm-8">
										<input type="text" class="form-control"  name="statusName" 
											ng-model="status.status_name" ng-value="{{status.status_name}}" required/>
										<p ng-show="statusForm.statusName.$invalid && !statusForm.statusName.$pristine">Status Name is required.</p>
									</div>
								</div>
								<div class="form-group" ng-class="{ 'has-error' : statusForm.statusDescritption.$invalid && !statusForm.statusDescritption.$pristine }">
									<label for="input01" class="col-sm-4 control-label">Status Description</label>
									<div class="col-sm-8">
										<input type="text" class="form-control"  name="statusDescritption" 
											ng-model="status.status_description" ng-value="{{status.status_description}}" required/>
										<p ng-show="statusForm.statusDescritption.$invalid && !statusForm.statusDescritption.$pristine">Status Description is required.</p>
									</div>
								</div>

								<div class="form-group form-footer">
									<div class="col-sm-offset-4 col-sm-8">
										<button type="button" class="btn btn-primary" ng-click="saveStatus()"  ng-disabled="statusForm.$invalid" ng-if="statusUpdateStatus != 'update'">Create</button>
										<button type="button" class="btn btn-primary" ng-click="updateStatus()" ng-if="statusUpdateStatus == 'update'">Update</button>
										<button type="reset" class="btn btn-default" ng-click="resetStatus()" >Reset</button>
									</div>
								</div>
							</div>
						</div>
						</form>
						<!-- /tile body -->

					</section>
					<!-- /tile -->

					<!-- tile -->
					<section class="tile transparent col-md-6" ng-if="listOfStatus">

						<!-- tile header -->
						<div class="tile-header transparent">
							<h1>
								<strong>Status</strong> List
							</h1>
						</div>
						<!-- /tile header -->

						<!-- tile body -->
						<div class="tile-body color transparent-white rounded-corners">
							<div ng-if="statusDeleteStatus">
								<div class="alert alert-success alert-dismissable" ng-if="statusDeleteStatus != ''">
									<a href="#" class="close" data-dismiss="alert" aria-label="close">×</a>
									{{statusDeleteStatus}}
								</div>
							</div>
							

							<div class="table-responsive">
								<table class="table table-custom">
									<thead>
										<tr>
											<th class="sort-numeric col-md-1"></th>
											<th class="sort-alpha col-md-5">Status Name</th>
											<th class="sort-numeric col-md-1">View</th>
											<th class="sort-numeric col-md-1">Edit</th>
											<th class="sort-numeric col-md-1">Delete</th>
										</tr>
									</thead>
									<tbody>
										<tr class="odd gradeX" ng-repeat="status1 in listOfStatus">
											<td class="text-center">{{status1.status_id}}</td>
											<td class="">{{status1.status_name}}</td>
											<td class="actions text-center"><a class="edit" href="#">
												<span  ng-click="viewStatus(status1.status_id,status1.status_type_id,status1.status_code,status1.status_name,status1.status_description)" class="label label-success">View</span></a>
											</td>
											<td class="actions text-center">
												<button ng-click="editStatus(status1.status_id,status1.status_type_id,status1.status_code,status1.status_name,status1.status_description)"
													type="button" class="label label-warning">Edit</button>
											</td>
											<td class="actions text-center">
												<button ng-click="deleteStatus(status1.status_id,status1.status_name)"
													type="button" class="label label-danger">Delete</button>
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
				<!-- ====================== Status Code Ends ======================= -->
				<!-- ====================== Relationship Type Code Starts====================== -->

				<div ng-if="master=='Relationship Type'">
					<section class="tile transparent col-md-6">

						<!-- tile header -->
						<div class="tile-header transparent">
							<h1>
								<strong>Relationship Type</strong>
							</h1>
							<button type="button"
								class="btn btn-amethyst margin-bottom-20 pull-right"
								ng-click="showListOfRelationshipTypes()">View</button>
						</div>

						<!-- tile body -->
						<form name="relationshipTypeForm">
						<div class="tile-body  color transparent-white rounded-corners">
							<div class="form-horizontal">
								<div ng-if="relationshipTypeSaveStatus || relationshipTypeUniqueOrNot">
									<div class="alert alert-success alert-dismissable"
										ng-if="relationshipTypeSaveStatus != '' || relationshipTypeUniqueOrNot != ''">
										<a href="#" class="close" data-dismiss="alert" aria-label="close">×</a>
										{{relationshipTypeSaveStatus}}{{relationshipTypeUniqueOrNot}}

									</div>
								</div>

								<div class="form-group" ng-class="{ 'has-error' : relationshipTypeForm.relationshipType.$invalid && !relationshipTypeForm.relationshipType.$pristine }">
									<label for="input01" class="col-sm-4 control-label">
										Relationship Type</label>
									<div class="col-sm-8">
										<input type="hidden"
											ng-model="relationshipType.relation_type_id"
											ng-value="{{relationshipType.relation_type_id}}" /> 
										<input type="text" class="form-control" id="relationTypeName" name="relationshipType"
											ng-model="relationshipType.relation_type_nm"
											ng-value="{{relationshipType.relation_type_nm}}" required/>
										<p ng-show="relationshipTypeForm.relationshipType.$invalid && !relationshipTypeForm.relationshipType.$pristine">Relationship Type is required.</p>
									</div>
								</div>
								<div class="form-group form-footer">
									<div class="col-sm-offset-4 col-sm-8">
										<button type="button" class="btn btn-primary"
											ng-click="saveRelationshipType()"
											ng-if="relationshipTypeUpdateStatus != 'update'"
											ng-disabled="relationshipTypeForm.$invalid">Create</button>
										<button type="button" class="btn btn-primary"
											ng-click="updateRelationshipType()"
											ng-if="relationshipTypeUpdateStatus == 'update'">Update</button>
										<button type="reset" class="btn btn-default"
											ng-click="resetRelationshipType()">Reset</button>
									</div>
								</div>
							</div>

						</div>
						</form>
						<!-- /tile body -->

					</section>
					<!-- /tile -->

					<!-- tile -->
					<section class="tile transparent col-md-6" ng-if="listOfRelationshipTypes">


						<!-- tile header -->
						<div class="tile-header transparent">
							<h1>
								<strong>Relationship Types</strong> List
							</h1>
						</div>
						<!-- /tile header -->

						<!-- tile body -->
						<div class="tile-body color transparent-white rounded-corners">
							<div class="alert alert-success alert-dismissable" ng-if="deleteRelationshipTypeStatus">
								<a href="#" class="close" data-dismiss="alert" aria-label="close">×</a>
								{{deleteRelationshipTypeStatus}}
							</div>

							<div class="table-responsive">
								<table class="table table-custom">
									<thead>
										<tr>
											<th class="sort-numeric col-md-1"></th>
											<th class="sort-alpha col-md-5">Relationship Type Name</th>
											<th class="sort-numeric col-md-1">View</th>
											<th class="sort-numeric col-md-1">Edit</th>
											<th class="sort-numeric col-md-1">Delete</th>
										</tr>
									</thead>
									
									<tbody>
										<tr class="odd gradeX" ng-repeat="relation1 in listOfRelationshipTypes">
											<td class="text-center">{{relation1.relation_type_id}}</td>
											<td class="">{{relation1.relation_type_nm}}</td>
											<td class="actions text-center"><a class="edit" href="#"><span
													ng-click="viewRelationshipType(relation1.relation_type_id,relation1.relation_type_nm)"
													class="label label-success">View</span></a></td>
											<td class="actions text-center"><button
													ng-click="editRelationshipType(relation1.relation_type_id,relation1.relation_type_nm)"
													type="button" class="label label-warning">Edit</button></td>
											<td class="actions text-center"><button
													ng-click="deleteRelationshipType(relation1.relation_type_id,relation1.relation_type_nm)"
													type="button" class="label label-danger">Delete</button></td>
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
				<!-- ====================== Relationship Type Code Ends======================== -->
				<!-- ====================== Contact Type Code Starts====================== -->
				<div ng-if="master=='Contact Type'">
					<section class="tile transparent col-md-6">

						<!-- tile header -->
						<div class="tile-header transparent">
							<h1>
								<strong>Contact Type</strong>
							</h1>
							<button type="button"
								class="btn btn-amethyst margin-bottom-20 pull-right"
								ng-click="showListOfRContactTypes()">View</button>
						</div>

						<!-- tile body -->
						<form name="contactTypeForm">
						<div class="tile-body  color transparent-white rounded-corners">
							<div class="form-horizontal">
								<div ng-if="contactTypeSaveStatus || contactTypeUniqueOrNot">
									<div class="alert alert-success alert-dismissable"
										ng-if="contactTypeSaveStatus != '' || contactTypeUniqueOrNot != ''">
										<a href="#" class="close" data-dismiss="alert" aria-label="close">×</a>
										{{contactTypeSaveStatus}}{{contactTypeUniqueOrNot}}
									</div>
								</div>

								<div class="form-group" ng-class="{ 'has-error' : contactTypeForm.contactTypeName.$invalid && !contactTypeForm.contactTypeName.$pristine }">
									<label for="input01" class="col-sm-4 control-label">
										Contact Type Name</label>
									<div class="col-sm-8">
										<input type="hidden"
											ng-model="contactType.contact_type_id"
											ng-value="{{contactType.contact_type_id}}" /> 
										<input type="text" class="form-control" id="relationTypeName" name="contactTypeName" 
											ng-model="contactType.contact_type_name" 
											ng-value="{{contactType.contact_type_name}}" required/>
										<p ng-show="contactTypeForm.contactTypeName.$invalid && !contactTypeForm.contactTypeName.$pristine">Contact Type Name is required.</p>
									</div>
								</div>
								<div class="form-group" ng-class="{ 'has-error' : contactTypeForm.contactTypeDescription.$invalid && !contactTypeForm.contactTypeDescription.$pristine }">
									<label for="input01" class="col-sm-4 control-label">
										Contact Type Description</label>
									<div class="col-sm-8">
										<input type="text" class="form-control" id="relationTypeName"  name="contactTypeDescription" 
											ng-model="contactType.contact_type_desc"
											ng-value="{{contactType.contact_type_desc}}" required/>
										<p ng-show="contactTypeForm.contactTypeDescription.$invalid && !contactTypeForm.contactTypeDescription.$pristine">Contact Type Description is required.</p>
									</div>
								</div>
								<div class="form-group form-footer">
									<div class="col-sm-offset-4 col-sm-8">
										<button type="button" class="btn btn-primary"
											ng-click="saveContactType()"
											ng-if="contactTypeUpdateStatus != 'update'"
											 ng-disabled="contactTypeForm.$invalid">Create</button>
										<button type="button" class="btn btn-primary"
											ng-click="updateContactType()"
											ng-if="contactTypeUpdateStatus == 'update'">Update</button>
										<button type="reset" class="btn btn-default"
											ng-click="resetContactType()">Reset</button>
									</div>
								</div>
							</div>

						</div>
						</form>
						<!-- /tile body -->

					</section>
					<!-- /tile -->

					<!-- tile -->
					<section class="tile transparent col-md-6" ng-if="listOfContactTypes">


						<!-- tile header -->
						<div class="tile-header transparent">
							<h1>
								<strong>Contact Types</strong> List
							</h1>
						</div>
						<!-- /tile header -->

						<!-- tile body -->
						<div class="tile-body color transparent-white rounded-corners">
							<div ng-if="deleteContactTypeStatus">
								<div class="alert alert-success alert-dismissable" ng-if="deleteContactTypeStatus != ''">
									<a href="#" class="close" data-dismiss="alert" aria-label="close">×</a>
									{{deleteContactTypeStatus}}
								</div>
							</div>
							<div class="table-responsive">
								<table class="table table-custom">
									<thead>
										<tr>
											<th class="sort-numeric col-md-1"></th>
											<th class="sort-alpha col-md-5">Contact Type Name</th>
											<th class="sort-numeric col-md-1">View</th>
											<th class="sort-numeric col-md-1">Edit</th>
											<th class="sort-numeric col-md-1">Delete</th>
										</tr>
									</thead>
									
									<tbody>
										<tr class="odd gradeX" ng-repeat="contact1 in listOfContactTypes">
											<td class="text-center">{{contact1.contact_type_id}}</td>
											<td class="">{{contact1.contact_type_name}}</td>
											<td class="actions text-center"><a class="edit" href="#"><span
													ng-click="viewContactType(contact1.contact_type_id,contact1.contact_type_name,contact1.contact_type_desc)"
													class="label label-success">View</span></a></td>
											<td class="actions text-center"><button
													ng-click="editContactType(contact1.contact_type_id,contact1.contact_type_name,contact1.contact_type_desc)"
													type="button" class="label label-warning">Edit</button></td>
											<td class="actions text-center"><button
													ng-click="deleteContactType(contact1.contact_type_id,contact1.contact_type_name,contact1.contact_type_desc)"
													type="button" class="label label-danger">Delete</button></td>
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
				<!-- ====================== Contact Type Code Ends======================== -->
				<!-- ====================== Cluster Code Starts====================== -->
				<div ng-if="master=='Cluster'">
					<section class="tile transparent col-md-6">

						<!-- tile header -->
						<div class="tile-header transparent">
							<h1>
								<strong>Cluster</strong>
							</h1>
							<button type="button"
								class="btn btn-amethyst margin-bottom-20 pull-right"
								ng-click="showListOfClusters()">View</button>
						</div>

						<!-- tile body -->
						<div class="tile-body  color transparent-white rounded-corners">
							<div class="form-horizontal">
								<div ng-if="clusterSaveStatus || clusterUniqueOrNot">
									<div class="alert alert-success alert-dismissable"
										ng-if="clusterSaveStatus != '' || clusterUniqueOrNot != ''">
										<a href="#" class="close" data-dismiss="alert" aria-label="close">×</a>
										{{clusterSaveStatus}}{{clusterUniqueOrNot}}
									</div>
								</div>

								<div class="form-group">
									<label for="input01" class="col-sm-4 control-label">
										Cluster Name</label>
									<div class="col-sm-8">
										<input type="hidden"
											ng-model="cluster.cluster_id"
											ng-value="{{cluster.cluster_id}}" /> 
										<input type="text" class="form-control" id="relationTypeName"
											ng-model="cluster.cluster_short_code"
											ng-value="{{cluster.cluster_short_code}}" />

									</div>
								</div>
								<div class="form-group">
									<label for="input01" class="col-sm-4 control-label">
										Contact Type Description</label>
									<div class="col-sm-8">
										<input type="text" class="form-control" id="relationTypeName"
											ng-model="cluster.cluster_long_name"
											ng-value="{{cluster.cluster_long_name}}" />

									</div>
								</div>
								<div class="form-group form-footer">
									<div class="col-sm-offset-4 col-sm-8">
										<button type="button" class="btn btn-primary"
											ng-click="saveCluster()"
											ng-if="clusterUpdateStatus != 'update'">Create</button>
										<button type="button" class="btn btn-primary"
											ng-click="updateCluster()"
											ng-if="clusterUpdateStatus == 'update'">Update</button>
										<button type="reset" class="btn btn-default"
											ng-click="resetCluster()">Reset</button>
									</div>
								</div>
							</div>

						</div>
						<!-- /tile body -->

					</section>
					<!-- /tile -->

					<!-- tile -->
					<section class="tile transparent col-md-6" ng-if="listOfClusters">


						<!-- tile header -->
						<div class="tile-header transparent">
							<h1>
								<strong>Cluster</strong> List
							</h1>
						</div>
						<!-- /tile header -->

						<!-- tile body -->
						<div class="tile-body color transparent-white rounded-corners">
							<div ng-if="clusterDeleteStatus">
								<div class="alert alert-success alert-dismissable" ng-if="clusterDeleteStatus != ''">
									<a href="#" class="close" data-dismiss="alert" aria-label="close">×</a>
									{{clusterDeleteStatus}}
								</div>
							</div>
							<div class="table-responsive">
								<table class="table table-custom">
									<thead>
										<tr>
											<th class="sort-numeric col-md-1"></th>
											<th class="sort-alpha col-md-5">Cluster Type Name</th>
											<th class="sort-numeric col-md-1">View</th>
											<th class="sort-numeric col-md-1">Edit</th>
											<th class="sort-numeric col-md-1">Delete</th>
										</tr>
									</thead>
									
									<tbody>
										<tr class="odd gradeX" ng-repeat="cluster1 in listOfClusters">
											<td class="text-center">{{cluster1.cluster_id}}</td>
											<td class="">{{cluster1.cluster_long_name}}</td>
											<td class="actions text-center"><a class="edit" href="#"><span
													ng-click="viewCluster(cluster1.cluster_id,cluster1.cluster_long_name,cluster1.cluster_long_name)"
													class="label label-success">View</span></a></td>
											<td class="actions text-center"><button
													ng-click="editCluster(cluster1.cluster_id,cluster1.cluster_long_name,cluster1.cluster_long_name)"
													type="button" class="label label-warning">Edit</button></td>
											<td class="actions text-center"><button
													ng-click="deleteCluster(cluster1.cluster_id,cluster1.cluster_long_name,cluster1.cluster_long_name)"
													type="button" class="label label-danger">Delete</button></td>
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
				<!-- ====================== Cluster Code Ends======================== -->
				<!-- ====================== Employee Role Code Starts====================== -->
				<div ng-if="master=='Employee Role'">
					<section class="tile transparent col-md-6">
						<!-- tile header -->
						<div class="tile-header transparent">
							<h1>
								<strong>Employee Role</strong>
							</h1>
							<button type="button"
								class="btn btn-amethyst margin-bottom-20 pull-right"
								ng-click="showListOfEmployeeRoles()">View</button>
						</div>

						<!-- tile body -->
						<form name="empRoleForm">
						<div class="tile-body  color transparent-white rounded-corners">
							<div class="form-horizontal">
								<div ng-if="employeeRoleSaveStatus || employeeRoleUniqueOrNot">
									<div class="alert alert-success alert-dismissable" ng-if="employeeRoleSaveStatus != '' || employeeRoleUniqueOrNot != ''">
										<a href="#" class="close" data-dismiss="alert" aria-label="close">×</a>
										{{employeeRoleSaveStatus}} {{employeeRoleUniqueOrNot}}
									</div>
								</div>
								 
								<div class="form-group" ng-class="{ 'has-error' : empRoleForm.empRoleCode.$invalid && !empRoleForm.empRoleCode.$pristine }">
									<input type="hidden" ng-model="employeeRole.emp_role_id" ng-value="{{employeeRole.emp_role_id}}"/>
									<label for="input01" class="col-sm-4 control-label">Employee Role Code</label>
									<div class="col-sm-8">
										<input type="text" class="form-control" name="empRoleCode" 
											ng-model="employeeRole.emp_role_code" ng-value="{{employeeRole.emp_role_code}}" required/>
										<p ng-show="empRoleForm.empRoleCode.$invalid && !empRoleForm.empRoleCode.$pristine">Employee Role Code is required.</p>
									</div>
								</div>
								<div class="form-group" ng-class="{ 'has-error' : empRoleForm.empRoleName.$invalid && !empRoleForm.empRoleName.$pristine }">
									<label for="input01" class="col-sm-4 control-label">Employee Role Name</label>
									<div class="col-sm-8">
										<input type="text" class="form-control" name="empRoleName" 
											ng-model="employeeRole.emp_role_name" ng-value="{{employeeRole.emp_role_name}}"required/>
										<p ng-show="empRoleForm.empRoleName.$invalid && !empRoleForm.empRoleName.$pristine">Employee Role Name is required.</p>
									</div>
								</div>
								<div class="form-group" ng-class="{ 'has-error' : empRoleForm.empRoleDesc.$invalid && !empRoleForm.empRoleDesc.$pristine }">
									<label for="input01" class="col-sm-4 control-label">Employee Role Description</label>
									<div class="col-sm-8">
										<input type="text" class="form-control" name="empRoleDesc" 
											ng-model="employeeRole.emp_role_desc" ng-value="{{employeeRole.emp_role_desc}}" required/>
										<p ng-show="empRoleForm.empRoleDesc.$invalid && !empRoleForm.empRoleDesc.$pristine">Employee Role Description is required.</p>
									</div>
								</div>

								<div class="form-group form-footer">
									<div class="col-sm-offset-4 col-sm-8">
										<button type="button" class="btn btn-primary" ng-click="saveEmployeeRole()" ng-disabled="empRoleForm.$invalid" ng-if="employeeRoleUpdateStatus != 'update'">Create</button>
										<button type="button" class="btn btn-primary" ng-click="updateEmployeeRole()" ng-if="employeeRoleUpdateStatus == 'update'">Update</button>
										<button type="reset" class="btn btn-default" ng-click="resetEmployeeRole()" >Reset</button>
									</div>
								</div>
							</div>

						</div>
						</form>
						<!-- /tile body -->

					</section>
					<!-- /tile -->

					<!-- tile -->
					<section class="tile transparent col-md-6" ng-if="listOfEmployeeRoles">

						<!-- tile header -->
						<div class="tile-header transparent">
							<h1>
								<strong>Employee Role</strong> List
							</h1>
						</div>
						<!-- /tile header -->

						<!-- tile body -->
						<div class="tile-body color transparent-white rounded-corners">
							<div ng-if="employeeRoleDeleteStatus">
								<div class="alert alert-success alert-dismissable" ng-if="employeeRoleDeleteStatus != ''">
									<a href="#" class="close" data-dismiss="alert" aria-label="close">×</a>
									{{employeeRoleDeleteStatus}}
								</div>
							</div>
							

							<div class="table-responsive">
								<table class="table table-custom">
									<thead>
										<tr>
											<th class="sort-numeric col-md-1"></th>
											<th class="sort-alpha col-md-5">Employee Role Name</th>
											<th class="sort-numeric col-md-1">View</th>
											<th class="sort-numeric col-md-1">Edit</th>
											<th class="sort-numeric col-md-1">Delete</th>
										</tr>
									</thead>
									<tbody>
										<tr class="odd gradeX" ng-repeat="employeeRole1 in listOfEmployeeRoles">
											<td class="text-center">{{employeeRole1.emp_role_id}}</td>
											<td class="">{{employeeRole1.emp_role_name}}</td>
											<td class="actions text-center"><a class="edit" href="#">
												<span  ng-click="viewEmployeeRole(employeeRole1.emp_role_id,employeeRole1.emp_role_code,employeeRole1.emp_role_name,employeeRole1.emp_role_desc)" class="label label-success">View</span></a>
											</td>
											<td class="actions text-center">
												<button ng-click="editEmployeeRole(employeeRole1.emp_role_id,employeeRole1.emp_role_code,employeeRole1.emp_role_name,employeeRole1.emp_role_desc)"
													type="button" class="label label-warning">Edit</button>
											</td>
											<td class="actions text-center">
												<button ng-click="deleteEmployeeRole(employeeRole1.emp_role_id,employeeRole1.emp_role_name)"
													type="button" class="label label-danger">Delete</button>
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
				<!-- ====================== Employee Role Code Ends======================== -->
				<!-- ====================== Employee Code Starts======================== -->
				<div ng-if="master=='Employee'">
					<section class="tile transparent col-md-6">
						<!-- tile header -->
						<div class="tile-header transparent">
							<h1>
								<strong>Employee </strong>
							</h1>
							<button type="button"
								class="btn btn-amethyst margin-bottom-20 pull-right"
								ng-click="showListOfEmployee()">View</button>
						</div>

						<!-- tile body -->
						<form name="empForm">
						<div class="tile-body  color transparent-white rounded-corners">
							<div class="form-horizontal">
								<div ng-if="employeeSaveStatus || employeeUniqueOrNot">
									<div class="alert alert-success alert-dismissable" ng-if="employeeSaveStatus != '' || employeeUniqueOrNot != ''">
										<a href="#" class="close" data-dismiss="alert" aria-label="close">×</a>
										{{employeeSaveStatus}} {{employeeUniqueOrNot}}
									</div>
								</div>
								 
								<div class="form-group" ng-class="{ 'has-error' : empForm.empCode.$invalid && !empForm.empCode.$pristine }">
									<input type="hidden" ng-model="employee.employee_id" ng-value="{{employee.employee_id}}"/>
									<label for="input01" class="col-sm-4 control-label">Employee Code</label>
									<div class="col-sm-8">
										<input type="text" class="form-control" name="empCode"
											ng-model="employee.employee_code" ng-value="{{employee.employee_code}}" required/>
										<p ng-show="empForm.empCode.$invalid && !empForm.empCode.$pristine">Employee Code is required.</p>
									</div>
								</div>
								<div class="form-group" ng-class="{ 'has-error' : empForm.empFirstName.$invalid && !empForm.empFirstName.$pristine }">
									<label for="input01" class="col-sm-4 control-label">Employee First Name</label>
									<div class="col-sm-8">
										<input type="text" class="form-control" name="empFirstName"
											ng-model="employee.emp_first_name" ng-value="{{employee.emp_first_name}}" required/>
										<p ng-show="empForm.empFirstName.$invalid && !empForm.empFirstName.$pristine">Employee First Name is required.</p>
									</div>
								</div>
								<div class="form-group" ng-class="{ 'has-error' : empForm.empMidName.$invalid && !empForm.empMidName.$pristine }">
									<label for="input01" class="col-sm-4 control-label">Employee Middle Name</label>
									<div class="col-sm-8">
										<input type="text" class="form-control" name="empMidName"
											ng-model="employee.emp_mid_name" ng-value="{{employee.emp_mid_name}}" required/>
										<p ng-show="empForm.empMidName.$invalid && !empForm.empMidName.$pristine">Employee Middle Name is required.</p>
									</div>
								</div>
								
								<div class="form-group" ng-class="{ 'has-error' : empForm.empLastName.$invalid && !empForm.empLastName.$pristine }">
									<label for="input01" class="col-sm-4 control-label">Employee Last Name</label>
									<div class="col-sm-8">
										<input type="text" class="form-control" name="empLastName"
											ng-model="employee.emp_last_name" ng-value="{{employee.emp_last_name}}" required/>
										<p ng-show="empForm.empLastName.$invalid && !empForm.empLastName.$pristine">Employee Last Name is required.</p>
									</div>
								</div>

								<div class="form-group form-footer">
									<div class="col-sm-offset-4 col-sm-8">
										<button type="button" class="btn btn-primary" ng-click="saveEmployee()" ng-disabled="empForm.$invalid" ng-if="employeeUpdateStatus != 'update'">Create</button>
										<button type="button" class="btn btn-primary" ng-click="updateEmployee()" ng-if="employeeUpdateStatus == 'update'">Update</button>
										<button type="reset" class="btn btn-default" ng-click="resetEmployee()" >Reset</button>
									</div>
								</div>
							</div>

						</div>
						</form>
						<!-- /tile body -->

					</section>
					<!-- /tile -->

					<!-- tile -->
					<section class="tile transparent col-md-6" ng-if="listOfEmployee">

						<!-- tile header -->
						<div class="tile-header transparent">
							<h1>
								<strong>Employee </strong> List
							</h1>
						</div>
						<!-- /tile header -->

						<!-- tile body -->
						<div class="tile-body color transparent-white rounded-corners">
							<div ng-if="employeeDeleteStatus">
								<div class="alert alert-success alert-dismissable" ng-if="employeeDeleteStatus != ''">
									<a href="#" class="close" data-dismiss="alert" aria-label="close">×</a>
									{{employeeDeleteStatus}}
								</div>
							</div>
							

							<div class="table-responsive">
								<table class="table table-custom">
									<thead>
										<tr>
											<th class="sort-numeric col-md-1"></th>
											<th class="sort-alpha col-md-5">Employee </th>
											<th class="sort-numeric col-md-1">View</th>
											<th class="sort-numeric col-md-1">Edit</th>
											<th class="sort-numeric col-md-1">Delete</th>
										</tr>
									</thead>
									<tbody>
										<tr class="odd gradeX" ng-repeat="employee1 in listOfEmployee">
											<td class="text-center">{{employee1.employee_id}}</td>
											<td class="">{{employee1.emp_first_name}}</td>
											<td class="actions text-center"><a class="edit" href="#">
												<span  ng-click="viewEmployee(employee1.employee_id,employee1.employee_code,employee1.emp_first_name,employee1.emp_mid_name,employee1.emp_last_name)" class="label label-success">View</span></a>
											</td>
											<td class="actions text-center">
												<button ng-click="editEmployee(employee1.employee_id,employee1.employee_code,employee1.emp_first_name,employee1.emp_mid_name,employee1.emp_last_name)"
													type="button" class="label label-warning">Edit</button>
											</td>
											<td class="actions text-center">
												<button ng-click="deleteEmployee(employee.employee_id,employee1.emp_first_name)"
													type="button" class="label label-danger">Delete</button>
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
				<!-- ====================== Employee Code Ends======================== -->
				<!-- ====================== Organisation Cluster Code Ends======================== -->
				<div ng-if="master=='Organisation Cluster'">
					<section class="tile transparent col-md-6">

						<!-- tile header -->
						<div class="tile-header transparent">
							<h1>
								<strong>Organisation Cluster</strong>
							</h1>
							<button type="button"
								class="btn btn-amethyst margin-bottom-20 pull-right"
								ng-click="showlistOfOrganisationClusters()">View</button>
						</div>

						<!-- tile body -->
						<form name="orgClusterForm">
						<div class="tile-body  color transparent-white rounded-corners">
							<div class="form-horizontal">
								<div ng-if="organisationClusterSaveStatus || organisationClusterUniqueOrNot">
									<div class="alert alert-success alert-dismissable"
										ng-if="organisationClusterSaveStatus != '' || organisationClusterUniqueOrNot != ''">
										<a href="#" class="close" data-dismiss="alert" aria-label="close">×</a>
										{{organisationClusterSaveStatus}}{{organisationClusterUniqueOrNot}}
									</div>
								</div>

								<div class="form-group" ng-class="{ 'has-error' : orgClusterForm.orgClusterName.$invalid && !orgClusterForm.orgClusterName.$pristine }">
									<label for="input01" class="col-sm-4 control-label">
										Organisation Cluster Name</label>
									<div class="col-sm-8">
										<input type="hidden"
											ng-model="organisationCluster.org_cluster_id"
											ng-value="{{organisationCluster.org_cluster_id}}" /> 
										<input type="text" class="form-control" id="orgClusterName"
											ng-model="organisationCluster.org_cluster_name"  name="districtDistrictShortCode" 
											ng-value="{{organisationCluster.org_cluster_name}}" required/>
										<p ng-show="orgClusterForm.orgClusterName.$invalid && !orgClusterForm.orgClusterName.$pristine">Organisation Cluster Name is required.</p>
									</div>
								</div>
								
							<div class="form-group form-footer">
									<div class="col-sm-offset-4 col-sm-8">
										<button type="button" class="btn btn-primary"
											ng-click="saveOrganisationCluster()"  ng-disabled="orgClusterForm.$invalid"
											ng-if="organisationClusterUpdateStatus != 'update'">Create</button>
										<button type="button" class="btn btn-primary"
											ng-click="updateOrganisationCluster()" 
											ng-if="organisationClusterUpdateStatus == 'update'">Update</button>
										<button type="reset" class="btn btn-default"
											ng-click="resetCluster()">Reset</button>
									</div>
								</div>
							</div>

						</div>
						</form>
						<!-- /tile body -->

					</section>
					<!-- /tile -->

					<!-- tile -->
					<section class="tile transparent col-md-6" ng-if="listOfOrganisationClusters">


						<!-- tile header -->
						<div class="tile-header transparent">
							<h1>
								<strong> Organisation Cluster</strong> List
							</h1>
						</div>
						<!-- /tile header -->

						<!-- tile body -->
						<div class="tile-body color transparent-white rounded-corners">
							<div ng-if="organisationClusterDeleteStatus">
								<div class="alert alert-success alert-dismissable" ng-if="organisationClusterDeleteStatus != ''">
									<a href="#" class="close" data-dismiss="alert" aria-label="close">×</a>
									{{organisationClusterDeleteStatus}}
								</div>
							</div>
							<div class="table-responsive">
								<table class="table table-custom">
									<thead>
										<tr>
											<th class="sort-numeric col-md-1"></th>
											<th class="sort-alpha col-md-5">Organisation Cluster Name</th>
											<th class="sort-numeric col-md-1">View</th>
											<th class="sort-numeric col-md-1">Edit</th>
											<th class="sort-numeric col-md-1">Delete</th>
										</tr>
									</thead>
									
									<tbody>
										<tr class="odd gradeX" ng-repeat="cluster in listOfOrganisationClusters">
											<td class="text-center">{{cluster.org_cluster_id}}</td>
											<td class="">{{cluster.org_cluster_name}}</td>
											<td class="actions text-center"><a class="edit" href="#"><span
													ng-click="viewOrganisationCluster(cluster.org_cluster_id,cluster.org_cluster_name)"
													class="label label-success">View</span></a></td>
											<td class="actions text-center"><button
													ng-click="editOrganisationCluster(cluster.org_cluster_id,cluster.org_cluster_name)"
													type="button" class="label label-warning">Edit</button></td>
											<td class="actions text-center"><button
													ng-click="deleteOrganisationCluster(cluster.org_cluster_id,cluster.org_cluster_name)"
													type="button" class="label label-danger">Delete</button></td>
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
				<!-- ====================== Organisation Cluster Code Ends======================== -->
				<!--  ======================== Zone Code Starts ==================  -->
				<div ng-if="master=='Zone'">
					<section class="tile transparent col-md-6">

						<!-- tile header -->
						<div class="tile-header transparent">
							<h1>
								<strong>Zone</strong>
							</h1>
							<button type="button"
								class="btn btn-amethyst margin-bottom-20 pull-right"
								ng-click="showListOfZones()">View</button>
						</div>

						<!-- tile body -->
						<form name="zoneForm">
						<div class="tile-body  color transparent-white rounded-corners">
							<div class="form-horizontal">
								<div ng-if="zoneSaveStatus || zoneUniqueOrNot">
									<div class="alert alert-success" ng-if="zoneSaveStatus != '' || zoneUniqueOrNot != ''">
										{{zoneSaveStatus}}{{zoneUniqueOrNot}}
									</div>
								</div>
								<div class="form-group"  ng-class="{ 'has-error' : zoneForm.zoneShortCode.$invalid && !zoneForm.zoneShortCode.$pristine }">
									<label for="input01" class="col-sm-4 control-label">Zone
										Short Code</label>
									<div class="col-sm-8">
										<input type="hidden" ng-model="zone.zone_id"
											ng-value="{{zone.zone_id}}"> 
										<input type="text"
											class="form-control" id="shortCode" name="zoneShortCode"
											ng-model="zone.zone_short_code"
											ng-value="{{zone.zone_short_code}}" required/>
										<p ng-show="zoneForm.zoneShortCode.$invalid && !zoneForm.zoneShortCode.$pristine">Zone Short Code is required.</p>
									</div>
								</div>
								<div class="form-group"  ng-class="{ 'has-error' : zoneForm.zoneName.$invalid && !zoneForm.zoneName.$pristine }">
									<label for="input01" class="col-sm-4 control-label">Zone Name</label>
									<div class="col-sm-8">
										<input type="text" class="form-control" id="zoneName"  name="zoneName"
											ng-model="zone.zone_long_name" ng-value="{{zone.zone_long_name}}" required/>
										<p ng-show="zoneForm.zoneName.$invalid && !zoneForm.zoneName.$pristine">Zone Name is required.</p>
									</div>
								</div>
								<div class="form-group form-footer">
									<div class="col-sm-offset-4 col-sm-8">
										<button type="button" class="btn btn-primary" ng-click="save_zone()"  ng-disabled="zoneForm.$invalid" ng-if="zoneUpdateStatus != 'update'">Create</button>
										<button type="button" class="btn btn-primary" ng-click="update_zone()" 
											ng-if="zoneUpdateStatus == 'update'">Update</button>
										<button ng-click="reset_zone()" type="reset" class="btn btn-default">Reset</button>
									</div>
								</div>
							</div>

						</div>
						</form>
						<!-- /tile body -->

					</section>
					<!-- /tile -->

					<!-- tile -->
					<section class="tile transparent col-md-6" ng-if="listOfZones">


						<!-- tile header -->
						<div class="tile-header transparent">
							<h1>
								<strong>Zone</strong> List
							</h1>

							<div class="controls">
								<a href="#" class="minimize"><i class="fa fa-chevron-down"></i></a>
								<a href="#" class="refresh"><i class="fa fa-refresh"></i></a>
							</div>
						</div>
						<!-- /tile header -->

						<!-- tile body -->
						<div class="tile-body color transparent-white rounded-corners">
							<div ng-if="zoneDeleteStatus">
								<div class="alert alert-success" ng-if="zoneDeleteStatus != ''">
									{{zoneDeleteStatus}}
								</div>
							</div>

							<div class="table-responsive">
								<table class="table table-custom">
									<thead>
										<tr>
											<th class="sort-numeric col-md-1"></th>
											<th class="sort-alpha col-md-5">Zone Name</th>
											<th class="sort-numeric col-md-1">View</th>
											<th class="sort-numeric col-md-1">Edit</th>
											<th class="sort-numeric col-md-1">Delete</th>
										</tr>
									</thead>
									<tbody>

										<tr class="odd gradeX" ng-repeat="zone in listOfZones">
											<td class="text-center">{{zone.zone_id}}</td>
											<td class="">{{zone.zone_long_name}}</td>
											<td class="actions text-center"><a class="edit" href="#"><span
													ng-click="view_zone(zone.zone_id,zone.zone_short_code,zone.zone_long_name)" class="label label-success">View</span></a></td>
											<td class="actions text-center"><button
													ng-click="edit_zone(zone.zone_id,zone.zone_short_code,zone.zone_long_name)"
													type="button" class="label label-warning">Edit</button></td>
											<td class="actions text-center"><button
													ng-click="delete_zone(zone.zone_id,zone.zone_long_name)"
													type="button" class="label label-danger">Delete</button></td>

											<!-- <td class="actions text-center"><a class="edit" href="#"><span class="label label-danger">Delete</span></a></td> -->
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
				 <!-- ======================== Zone Code Ends ==================  -->
			</div>
			<!-- Master Content End -->
              <!-- /col 12 -->


              
            </div>
            <!-- /row -->
          


          </div>
          <!-- /content container -->

        </div>
        <!-- Page content end -->

<jsp:include page="part/footer.jsp"></jsp:include>

<!-- String realPath = getServletContext().getRealPath("/");
File file = new FIle(realPath+"/TestFolder", "testFIle.txt");
file.mkdirs(); -->