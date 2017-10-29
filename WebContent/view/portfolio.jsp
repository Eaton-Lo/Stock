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
					<div class="panel-heading ">
						Portfolio<span id="PortfolioName"></span>
						<div class="pull-right btn btn-success" id="createNewPortfolioBtn">create new portfolio
						</div>
					</div>
					<div class="panel-body">
						<div class="">
							<div class="col-lg-12">
								<form role="form">
									<div class="form-group" class="col-lg-12">
										<label class="col-lg-2" style="text-align: center;">Add
											Symbol</label>
										<div class="col-lg-8">
											<input id="symbol" class="form-control">
										</div>
										<div class="col-lg-2">
											<div class="btn btn-success" id="symbolBtn">Select</div>
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
		<div id="dialog-info" title="" style="display: none">
			<div class="col-lg-12">
				<form role="form">
					<div class="form-group" >
						<label>Symbol</label> <input class="form-control" id="symbol"
							disabled>
					</div>
					<div class="form-group" >
						<label>Type</label> <select name="type" class="form-control">
							<option value="buy">Buy</option>
							<option value="sell">Sell</option>
						</select>
					</div>
					<div class="form-group">
						<label>Date</label> <input class="form-control" id="datepicker">
					</div>
					<div class="form-group">
						<label>Shares</label> <input id="shares"
							class="form-control">
					</div>
					<div class="form-group">
						<label>Price</label> <input id="price" class="form-control">
					</div>
					<div class="form-group">
						<label>Commission</label> <input id="commission"
							class="form-control">
					</div>
					<div class="form-group">
						<label>Notes</label> <input id="notes"
							class="form-control">
					</div>
					<hr/>
					<div class="form-group">
						<div class="btn btn-success col-lg-12" id="submitBtn">Submit</div>
					</div>
				</form>
			</div>
		</div>
	</section>
</body>
<script type="text/javascript" src="../js/portfolio.js"></script>
</html>
