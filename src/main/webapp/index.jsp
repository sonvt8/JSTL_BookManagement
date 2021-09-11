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
	<div class="page">
		<c:choose>
			<c:when test="${sessionScope.authorized_user == null}">
				<jsp:include page="login_content.jsp" />
			</c:when>
			<c:otherwise>
				<jsp:include page="Protected/index_content.jsp" />
			</c:otherwise>
		</c:choose>
		<jsp:include page="footer.jsp" />
	</div>
</body>
</html>