<%@ page contentType="text/html;charset=UTF-8" language="java"
	import="com.tommy.dbmodels.*
            , com.tommy.helpers.*
            , java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- Page container -->
<div class="page-container">

	<!-- Page content -->
	<div class="page-content">

		<!-- Main content -->
		<div class="content-wrapper">

			<!-- Simple login form -->
			<form method="post" action="loginUser.do">
				<div class="panel panel-body login-form">
					<div class="text-center">
						<div class="icon-object border-slate-300 text-slate-300">
							<i class="icon-reading"></i>
						</div>
						<h5 class="content-group">
							Login to your account <small class="display-block">Get
								smart and nothing can touch you</small>
						</h5>
					</div>

					<div class="form-group has-feedback has-feedback-left">
						<input name="uid" type="text" required="required"
							class="form-control" placeholder="username">
						<div class="form-control-feedback">
							<i class="icon-user text-muted"></i>
						</div>
					</div>

					<div class="form-group has-feedback has-feedback-left">
						<input name="pwd" type="password" required="required"
							class="form-control" placeholder="password">
						<div class="form-control-feedback">
							<i class="icon-lock2 text-muted"></i>
						</div>
					</div>

					<div class="form-group login-options">
						<div class="row">
							<div class="col-sm-6">
								<label class="checkbox-inline"> <input name="rememberMe"
									type="checkbox" class="styled" checked="checked">
									Remember
								</label>
							</div>

							<div class="col-sm-6 text-right">
								<a href="welcome.jsp">Forgot password?</a>
							</div>
						</div>
					</div>

					<div class="form-group">
						<button type="submit" class="btn bg-pink-400 btn-block">
							Sign in <i class="icon-circle-right2 position-right"></i>
						</button>
					</div>
				</div>
			</form>
			<!-- /simple login form -->

		</div>
		<!-- /main content -->

	</div>
	<!-- /page content -->

</div>
<!-- /page container -->

<c:if test="${sessionScope.errorMessage != null}">
	<script type="text/javascript">
		$(function() {
			var errorMessage = '<%=request.getSession().getAttribute("errorMessage")%>';
			new PNotify({
		        title: 'Login Fail!',
		        text: errorMessage,
		        addclass: 'bg-danger'
		    });
		});
	</script>
</c:if>