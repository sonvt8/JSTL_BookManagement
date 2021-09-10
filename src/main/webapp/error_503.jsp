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
<title>Book Management Admin Page</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="robots" content="all,follow">
<jsp:include page="lib.jsp" />
</head>
<body class="login-container">
	<jsp:include page="navbar.jsp" />
	<!-- Page container -->
	<div class="page-container">

		<!-- Page content -->
		<div class="page-content">

			<!-- Main content -->
			<div class="content-wrapper">

				<!-- Error title -->
				<div class="text-center content-group">
					<h1 class="error-title">503</h1>
					<h5>
						<c:if test="${ex != null}">
			                    ERROR: ${ex}<br>
			                    ERROR Msg: ${ex.message}<br>
						</c:if>
					</h5>
				</div>
				<!-- /error title -->


				<!-- Error content -->
				<div class="row">
					<div class="col-lg-4 col-lg-offset-4 col-sm-6 col-sm-offset-3">
						<form action="#" class="main-search panel panel-body">
							<div class="form-group has-feedback">
								<input type="text" class="form-control input-lg"
									placeholder="Search...">
								<div class="form-control-feedback">
									<i class="icon-search4 text-size-large text-muted"></i>
								</div>
							</div>

							<div class="text-center">
								<a href="#" class="btn bg-pink-400"><i
									class="icon-circle-left2 position-left"></i> Back to dashboard</a>
							</div>
						</form>
					</div>
				</div>
				<!-- /error wrapper -->

			</div>
			<!-- /main content -->

		</div>
		<!-- /page content -->

		<!-- /page container -->
		<jsp:include page="footer.jsp" />
	</div>
</body>
</html>