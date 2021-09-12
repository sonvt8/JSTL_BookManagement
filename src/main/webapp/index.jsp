<%@ page contentType="text/html;charset=UTF-8" language="java"
	import="com.tommy.dbmodels.*
            , com.tommy.helpers.*
            , java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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
<!-- /theme JS files -->
</head>
<body class="login-container">
	<jsp:include page="navbar.jsp" />
	<div class="page">
		<c:if test="${sessionScope.authorized_user == null}">
			<c:redirect
				url="${initParam.hostURL}${pageContext.request.contextPath}/login.jsp" />
		</c:if>
		<c:if test="${sessionScope.listBooks == null}">
			<c:redirect
				url="${initParam.hostURL}${pageContext.request.contextPath}/bookcontroller.do" />
		</c:if>
		<!-- Page header -->
		<div class="page-header">
			<div class="page-header-content">
				<div class="page-title">
					<button
						onclick="window.location.href='${initParam.hostURL}${pageContext.request.contextPath}/add_book.jsp';"
						type="button" class="btn bg-teal-400 btn-labeled">
						<b><i class="icon-book"></i></b>New Book
					</button>
					<button type="button" class="btn btn-success btn-sm noty-runner"
						data-layout="topRight" data-type="success">
						Launch <i class="icon-play3 position-right"></i>
					</button>
				</div>
			</div>
		</div>
		<!-- /page header -->

		<table class="table table-togglable table-hover">
			<thead>
				<tr>
					<th style="width: 5px;">#</th>
					<th style="width: 10px;">Title</th>
					<th style="width: 10px;">Author</th>
					<th style="width: 10px;">Category</th>
					<th style="width: 5px;">Price($)</th>
					<th style="width: 5px;">Quantity</th>
					<th style="width: 10px;">Released</th>
					<th class="text-center" style="width: 50px;">Photo</th>
					<th style="width: 100px; word-wrap: break-word">Description</th>
					<th class="text-center" style="width: 30px;"><i
						class="icon-menu-open2"></i></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="book" items="${sessionScope.listBooks}"
					varStatus="iterationCount">
					<c:url var="updateBook"
						value="${initParam.hostURL}${pageContext.request.contextPath}/bookcontroller.do">
						<c:param name="command" value="LOAD" />
						<c:param name="bookId" value="${book.id}" />
					</c:url>
					<c:url var="deleteBook"
						value="${initParam.hostURL}${pageContext.request.contextPath}/bookcontroller.do">
						<c:param name="command" value="DELETE" />
						<c:param name="bookId" value="${book.id}" />
					</c:url>
					<tr>
						<td>${iterationCount.count}</td>
						<td>${book.title}</td>
						<td>${book.author}</td>
						<td>${book.getCategoryName()}</td>
						<td>${book.price}</td>
						<td>${book.quantity}</td>
						<td>${book.released}</td>
						<td>${book.imageUrl}</td>
						<td>${book.description}</td>
						<td class="text-center">
							<ul class="icons-list">
								<li class="dropup"><a href="#" class="dropdown-toggle"
									data-toggle="dropdown"> <i class="icon-menu9"></i>
								</a>

									<ul class="dropdown-menu dropdown-menu-right">
										<li><a href="${updateBook}"><i class="icon-pencil7"></i>
												Edit</a></li>
										<li><a href="${deleteBook}"><i class="icon-trash"
												onclick="if(!confirm('Are you sure you want to delete this city?')) return false;"></i>
												Delete</a></li>
									</ul></li>
							</ul>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<jsp:include page="footer.jsp" />
		<c:if test="${sessionScope.loginFail != null}">
			<script type="text/javascript">
				$(function() {
				var errorMessage = '<%=request.getSession().getAttribute("loginFail")%>';
					new PNotify({
						title : 'Login Fail!',
						text : errorMessage,
						addclass : 'bg-danger'
					});
				});
			<%request.getSession().removeAttribute("loginFail");%>
				
			</script>
		</c:if>
		<c:choose>
			<c:when test="${sessionScope.addOk != null}">
				<script type="text/javascript">
					$(function() {
						var addMessage = '<%=request.getSession().getAttribute("addOk")%>';
							new PNotify({
					            title: 'Insert Book',
					            text: addMessage,
					            addclass: 'bg-success'
					        });
					});
					<%request.getSession().removeAttribute("addOk");%>
				</script>
			</c:when>
			<c:when test="${sessionScope.deleteOk != null}">
				<script type="text/javascript">
					$(function() {
						var deleteMessage = '<%=request.getSession().getAttribute("deleteOk")%>';
						new PNotify({
							title : 'Delete Book',
							text : deleteMessage,
							addclass : 'bg-success'
						});
					});
					<%request.getSession().removeAttribute("deleteOk");%>
				</script>
			</c:when>
		</c:choose>
	</div>
</body>
</html>