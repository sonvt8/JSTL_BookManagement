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
<jsp:include page="../lib.jsp" />
</head>
<body class="login-container">
	<jsp:include page="../navbar.jsp" />
	<div class="page">
		<c:choose>
			<c:when test="${sessionScope.bookData == null}">
				<h1>${initParam.hostURL}${pageContext.request.contextPath}/WelcomeServlet</h1>
				<c:redirect
					url="${initParam.hostURL}${pageContext.request.contextPath}/bookcontroller.do" />
			</c:when>
			<c:otherwise>
				<c:redirect
					url="${initParam.hostURL}${pageContext.request.contextPath}/welcome.jsp" />
			</c:otherwise>
		</c:choose>

		<table class="table table-togglable table-hover">
			<thead>
				<tr>
					<th data-toggle="true">Title</th>
					<th data-hide="phone">Author</th>
					<th data-hide="phone,tablet">Category</th>
					<th data-hide="phone,tablet">Price</th>
					<th data-hide="phone,tablet">Quantity</th>
					<th data-hide="phone,tablet" data-name="Date Released">Released</th>
					<th class="text-center" style="width: 50px; word-wrap: break-word">Description</th>
					<th class="text-center" style="width: 30px;">Photo</th>
					<th class="text-center" style="width: 30px;"><i
						class="icon-menu-open2"></i></th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>Book1</td>
					<td>Tommy</td>
					<td>Cat1</td>
					<td>1.1$</td>
					<td>35</td>
					<td>1 Nov 1961</td>
					<td>12312312313rasdasdasdfs
						fdsdfsdfsadfasdfasdfasdfasdfasdfasdfasdfsadfsdfsdf</td>
					<td>img1</td>
					<td class="text-center">
						<ul class="icons-list">
							<li class="dropup"><a href="#" class="dropdown-toggle"
								data-toggle="dropdown"> <i class="icon-menu9"></i>
							</a>

								<ul class="dropdown-menu dropdown-menu-right">
									<li><a href="#"><i class="icon-pencil7"></i> Edit</a></li>
									<li><a href="#"><i class="icon-trash"></i> Delete</a></li>
								</ul></li>
						</ul>
					</td>
				</tr>
				<tr>
					<td>Book2</td>
					<td>Tommy</td>
					<td>Cat2</td>
					<td>1.1$</td>
					<td>35</td>
					<td>1 Nov 1961</td>
					<td>12312312313rasdasdasdfs
						fdsdfsdfsadfasdfasdfasdfasdfasdfasdfasdfsadfsdfsdf</td>
					<td>img1</td>
					<td class="text-center">
						<ul class="icons-list">
							<li class="dropup"><a href="#" class="dropdown-toggle"
								data-toggle="dropdown"> <i class="icon-menu9"></i>
							</a>

								<ul class="dropdown-menu dropdown-menu-right">
									<li><a href="#"><i class="icon-pencil7"></i> Edit</a></li>
									<li><a href="#"><i class="icon-trash"></i> Delete</a></li>
								</ul></li>
						</ul>
					</td>
				</tr>
				<tr>
					<td>Book3</td>
					<td>Tommy</td>
					<td>Cat3</td>
					<td>1.1$</td>
					<td>35</td>
					<td>1 Nov 1961</td>
					<td>12312312313rasdasdasdfs
						fdsdfsdfsadfasdfasdfasdfasdfasdfasdfasdfsadfsdfsdf</td>
					<td>img1</td>
					<td class="text-center">
						<ul class="icons-list">
							<li class="dropup"><a href="#" class="dropdown-toggle"
								data-toggle="dropdown"> <i class="icon-menu9"></i>
							</a>

								<ul class="dropdown-menu dropdown-menu-right">
									<li><a href="#"><i class="icon-pencil7"></i> Edit</a></li>
									<li><a href="#"><i class="icon-trash"></i> Delete</a></li>
								</ul></li>
						</ul>
					</td>
				</tr>
			</tbody>
		</table>
		<jsp:include page="../footer.jsp" />
	</div>
</body>
</html>