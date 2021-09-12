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
				url="${initParam.hostURL}${pageContext.request.contextPath}/login.jsp" />
		</c:if>
		<c:if test="${sessionScope.authorized_user.authLevel < 2}">
			<c:redirect
				url="${initParam.hostURL}${pageContext.request.contextPath}/index.jsp" />
		</c:if>
		<c:if test="${sessionScope.cateData == null}">
			<c:redirect
				url="${initParam.hostURL}${pageContext.request.contextPath}/getcategoryname.do?head=updated" />
		</c:if>
		<c:if test="${sessionScope.bookInfo == null}">
			<c:redirect
				url="${initParam.hostURL}${pageContext.request.contextPath}/index.jsp" />
		</c:if>

		<!-- Page container -->
		<div class="page-container">

			<!-- Page content -->
			<div class="page-content">

				<!-- Main content -->
				<div class="content-wrapper">
					<div class="row">
						<div class="col-lg-5">

							<!-- Blog layout #1 with image -->
							<div class="panel panel-flat blog-horizontal blog-horizontal-1">
								<div class="panel-heading">
									<h5 class="panel-title text-semibold">
										<a href="#">Book Image</a>
									</h5>
								</div>

								<div class="panel-body">
									<div class="thumb">
										<a href="assets/images/placeholder.jpg" data-popup="lightbox">
											<img
											src="${initParam.hostURL}${pageContext.request.contextPath}/FileDisplayServlet/${bookInfo.imageUrl}"
											alt=""> <span class="zoom-image"><i
												class="icon-plus2"></i></span>
										</a>
									</div>

									<div class="blog-preview extra-text">
										<p>${bookInfo.description}</p>
									</div>
								</div>
							</div>
							<!-- /blog layout #1 with image -->

						</div>

						<div class="col-lg-7">
							<!-- Form validation -->
							<div class="panel panel-flat">
								<div class="panel-heading">
									<h5 class="panel-title">Update a Book</h5>
									<div class="heading-elements">
										<ul class="icons-list">
											<li><a data-action="collapse"></a></li>
											<li><a data-action="reload"></a></li>
											<li><a data-action="close"></a></li>
										</ul>
									</div>
								</div>

								<div class="panel-body">
									<form class="form-horizontal form-validate-jquery"
										method="post"
										action="${initParam.hostURL}${pageContext.request.contextPath}/bookcontroller.do"
										enctype="multipart/form-data">

										<input type="hidden" name="command" value="UPDATE" /> <input
											type="hidden" name="bookId" value="${bookInfo.id}" />

										<fieldset class="content-group">
											<legend class="text-bold">#ID:${bookInfo.id}</legend>

											<!-- Book Info -->
											<div class="form-group">
												<label class="control-label col-lg-3">Title<span
													class="text-danger">*</span></label>
												<div class="col-lg-9">
													<input type="text" name="title" class="form-control"
														required="required" placeholder="Text input validation"
														value="${bookInfo.title}">
												</div>
											</div>
											<div class="form-group">
												<label class="control-label col-lg-3">Author<span
													class="text-danger">*</span></label>
												<div class="col-lg-9">
													<input type="text" name="author" class="form-control"
														required="required" placeholder="Text input validation"
														value="${bookInfo.author}">
												</div>
											</div>
											<div class="form-group">
												<label class="control-label col-lg-3">Published <span
													class="text-danger">*</span>
												</label>
												<div class="col-lg-3">
													<input type="text" name="date_iso" class="form-control"
														required="required"
														placeholder="YYYY/MM/DD or any other ISO date format"
														value="${bookInfo.released}">
												</div>


												<label class="control-label col-md-2 col-md-offset-1">Quantity<span
													class="text-danger">*</span></label>
												<div class="col-md-2">
													<input type="text" name="digits" class="form-control"
														required="required" placeholder="Enter digits only"
														value="${bookInfo.quantity}">
												</div>
											</div>
											<div class="form-group">
												<label class="control-label col-lg-3">Category<span
													class="text-danger">*</span></label>
												<div class="col-lg-3">
													<select id="category" name="cateName"
														class="bootstrap-select" data-width="100%">
														<c:forEach items="${sessionScope.cateData}" var="cName">
															<option value="${cName}">${cName}</option>
														</c:forEach>
													</select>
												</div>
												<label class="control-label col-md-2 col-md-offset-1">Price<span
													class="text-danger">*</span></label>
												<div class="col-md-2">
													<input type="text" name="numbers" class="form-control"
														required="required"
														placeholder="Enter decimal number only"
														value="${bookInfo.price}">
												</div>
											</div>
											<div class="form-group">
												<label class="col-lg-3 control-label">Photo:</label>
												<div class="col-lg-9">
													<input name="photo" type="file" class="file-styled">
													<span class="help-block">Accepted formats: gif, png,
														jpg. Max file size 2Mb</span>
												</div>
											</div>
											<div class="form-group">
												<label class="control-label col-lg-3">Description<span
													class="text-danger">*</span></label>
												<div class="col-lg-9">
													<textarea rows="5" cols="5" name="description"
														class="form-control" required="required"
														placeholder="Default textarea">${bookInfo.description}"</textarea>
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
					</div>
					<!-- /layout 1 -->

				</div>
				<!-- /main content -->

			</div>
			<!-- /page content -->

		</div>
		<!-- /page container -->
		<jsp:include page="footer.jsp" />
	</div>
	<script>
		$(function() { /* to make sure the script runs after page load */
			$('.extra-text')
					.each(
							function(event) { /* select all divs with the item class */
								var max_length = 150; /* set the max content length before a read more link will be added */
								if ($(this).html().length > max_length) { /* check for content length */
									var short_content = $(this).html().substr(
											0, max_length); /* split the content in two parts */
									var long_content = $(this).html().substr(
											max_length);
									$(this)
											.html(
													short_content
															+ '<a href="#" class="read_more"><br/>Read More</a>'
															+ '<span class="more_text" style="display:none;">'
															+ long_content
															+ '</span>'); /* Alter the html to allow the read more functionality */
									$(this).find('a.read_more').click(
											function(event) { /* find the a.read_more element within the new html and bind the following code to it */
												event.preventDefault(); /* prevent the a from changing the url */
												$(this).hide(); /* hide the read more button */
												$(this).parents('.extra-text')
														.find('.more_text')
														.show(); /* show the .more_text span */
											});
								}
							});
		});
	</script>
</body>
</html>