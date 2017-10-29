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
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<jsp:include page="nav.jsp"></jsp:include>
	<section id="main_section">
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-heading">Portfolio</div>
					<div class="panel-body">
						<div class="">
							<div class="col-lg-12">
								<form role="form">
									<div class="form-group" class="col-lg-12">
										<label class="col-lg-2" style="text-align: center;">Add Symbol</label>
										<div class="col-lg-8">
											<input id="symbol" class="form-control">
										</div>
										<div class="col-lg-2">
											<div class="btn btn-success" id="symbolBtn">Add</div>
										</div>
									</div>
								</form>								
							</div>
							<!-- /.col-lg-6 (nested) -->
						</div>
						<!-- /.row (nested) -->
					</div>
					<div class="panel-body">
						<div class="">
							<div class="col-lg-12">
								<table class="table table-striped datatable_s" id="datatable">
									<thead>
										<tr>
											<th>A</th>
											<th>B</th>
											<th>C</th>
											<th>D</th>
											<th>E</th>
										</tr>
									</thead>
									<tbody></tbody>
								</table>
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
<script type="text/javascript" src="../js/portfolio.js"></script>
</html>
