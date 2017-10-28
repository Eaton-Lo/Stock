<%@page import="java.util.List,java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="../config/headerFile.file"%>
<title></title>
<style type="text/css">

</style>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<jsp:include page="nav.jsp"></jsp:include>
	<section id="main_section">
		<div class="row">
			<div class="col-lg-3"></div>
			<div class="col-lg-6">
				<div class="panel panel-default">
					<div class="panel-heading">Profile</div>
					<div class="panel-body">
						<div class="row">
							<div class="col-lg-12">
								<form role="form">
									<div class="form-group" style="display:none">
										<label>id</label> <input class="form-control" id="userId"
											disabled>
									</div>
									<div class="form-group">
										<label>Email</label> <input class="form-control" id="email"
											disabled>
									</div>
									<div class="form-group">
										<label>First Name</label> <input id="firstName"
											class="form-control">
									</div>
									<div class="form-group">
										<label>Last Name</label> <input id="lastName"
											class="form-control">
									</div>
									<div class="form-group">
										<label>Passorwd</label> <input type="password" id="password"
											class="form-control">
									</div>
									<hr />
									<div class="form-group">
										<div class="btn btn-success col-lg-12" id="submitBtn">Submit</div>
									</div>
								</form>
							</div>
							<!-- /.col-lg-6 (nested) -->
						</div>
						<!-- /.row (nested) -->
					</div>
					<!-- /.panel-body -->
				</div>
				<!-- /.panel -->
			</div>
			<!-- /.col-lg-12 -->
		</div>
	</section>
</body>
<script type="text/javascript" src="../js/profile.js"></script>
</html>
