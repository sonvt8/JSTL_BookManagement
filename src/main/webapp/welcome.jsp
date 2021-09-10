<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<body>
     <c:import url="header.jsp" />
     
     <table style="width: 100%">
     	<tr>
	       <td style="width:25%;height:80%;" valign="top">
	                <c:import url="navbar.jsp" />
	       </td>
	       <td style="width:75%;height:80%;">
				<b>Welcome to Servlets!</b>
				<form action="WelcomeServlet" method="get">
					Enter your name: <input type="text" name="name" size="24">
					<input type="submit" value="Submit" />
				</form>
	       </td>
    	</tr>
     </table>

	<c:import url="footer.jsp" >
        <c:param name="copyrightYear" value="${initParam.copyright}" />
        <c:param name="webLink" value="${initParam.weblink}" />
    </c:import>
</body>
</html>
