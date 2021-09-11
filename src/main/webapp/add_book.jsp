<%@ page contentType="text/html;charset=UTF-8" language="java"
	import="com.tommy.dbmodels.*
            , com.tommy.helpers.*
            , java.sql.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>List Books</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="robots" content="all,follow">
<jsp:include page="lib.jsp" />
</head>
<body class="login-container">
	<jsp:include page="navbar.jsp" />
	<div class="page">
		<c:if test="${sessionScope.authorized_user == null}">
			<c:redirect
				url="${initParam.hostURL}${pageContext.request.contextPath}/login.jsp?dest=add_book.jsp" />
		</c:if>
		<c:if test="${sessionScope.cateData == null}">
			<c:redirect
				url="${initParam.hostURL}${pageContext.request.contextPath}/getcategoryname.do" />
		</c:if>
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
									<legend class="text-bold">#Book Info</legend>

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
												<c:forEach items="${sessionScope.cateData}" var="cName" varStatus="iterationCount">
													<option value="${iterationCount.count}">${cName}</option>
												</c:forEach>
											</select>
										</div>
										<label class="control-label col-md-2 col-md-offset-1">Price<span
											class="text-danger">*</span></label>
										<div class="col-md-2">
											<input type="text" name="numbers" class="form-control"
												required="required" placeholder="Enter decimal number only">
										</div>
									</div>
									<div class="form-group">
										<label class="col-lg-3 control-label">Photo:</label>
										<div class="col-lg-9">
											<input type="file" class="file-styled"> <span
												class="help-block">Accepted formats: gif, png, jpg.
												Max file size 2Mb</span>
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
		<jsp:include page="footer.jsp" />
	</div>
</body>
</html>