
<!-- Page container -->
<div class="page-container">

	<!-- Page content -->
	<div class="page-content">

		<!-- Main content -->
		<div class="content-wrapper">

			<!-- Form validation -->
			<div class="panel panel-flat">
				<div class="panel-heading">
					<h5 class="panel-title">Insert a Book</h5>
					<div class="heading-elements">
						<ul class="icons-list">
							<li><a data-action="collapse"></a></li>
							<li><a data-action="reload"></a></li>
							<li><a data-action="close"></a></li>
						</ul>
					</div>
				</div>

				<div class="panel-body">
					<form class="form-horizontal form-validate-jquery" action="#">
						<fieldset class="content-group">
							<legend class="text-bold">#ID:123</legend>

							<!-- Book Info -->
							<div class="form-group">
								<label class="control-label col-lg-3">Title<span
									class="text-danger">*</span></label>
								<div class="col-lg-9">
									<input type="text" name="title" class="form-control"
										required="required" placeholder="Text input validation">
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-lg-3">Author<span
									class="text-danger">*</span></label>
								<div class="col-lg-9">
									<input type="text" name="author" class="form-control"
										required="required" placeholder="Text input validation">
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-lg-3">Published <span
									class="text-danger">*</span>
								</label>
								<div class="col-lg-3">
									<input type="text" name="date_iso" class="form-control"
										required="required"
										placeholder="YYYY/MM/DD or any other ISO date format">
								</div>

								<label class="control-label col-md-2 col-md-offset-1">Quantity<span
									class="text-danger">*</span></label>
								<div class="col-md-2">
									<input type="text" name="digits" class="form-control"
										required="required" placeholder="Enter digits only">
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-lg-3">Category<span
									class="text-danger">*</span></label>
								<div class="col-lg-3">
									<select class="bootstrap-select" multiple="multiple"
										data-width="100%">
										<option value="AK">Alaska</option>
										<option value="HI">Hawaii</option>
										<option value="CA">California</option>
										<option value="NV">Nevada</option>
										<option value="OR">Oregon</option>
									</select>
								</div>
								<label class="control-label col-md-2 col-md-offset-1">Price<span
									class="text-danger">*</span></label>
								<div class="col-md-2">
									<input type="text" name="price" class="form-control"
										required="required" placeholder="Enter decimal number only">
								</div>
							</div>
							<div class="form-group">
								<label class="col-lg-3 control-label">Photo:</label>
								<div class="col-lg-9">
									<input type="file" class="file-styled"> <span
										class="help-block">Accepted formats: gif, png, jpg. Max
										file size 2Mb</span>
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-lg-3">Description<span
									class="text-danger">*</span></label>
								<div class="col-lg-9">
									<textarea rows="5" cols="5" name="description"
										class="form-control" required="required"
										placeholder="Default textarea"></textarea>
								</div>
							</div>
							<!-- /Book Info -->
						</fieldset>
						<div class="text-right">
							<button type="reset" class="btn btn-default" id="reset">
								Reset <i class="icon-reload-alt position-right"></i>
							</button>
							<button type="submit" class="btn btn-primary">
								Submit <i class="icon-arrow-right14 position-right"></i>
							</button>
						</div>
					</form>
				</div>
			</div>
			<!-- /form validation -->
		</div>
		<!-- /main content -->

	</div>
	<!-- /page content -->

</div>
<!-- /page container -->