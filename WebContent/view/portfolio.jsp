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
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-heading ">
						Portfolio<span id="PortfolioName"></span>
						<div class="pull-right btn btn-success" id="deletePortfolioBtn">delete
							 portfolio</div>
						<div class="pull-right btn btn-success" id="createNewPortfolioBtn">create
							new portfolio</div>
						
					</div>
					<div class="panel-body">
						<div class="">
							<div class="col-lg-12" id="addSymbolDiv" style="display: none">
								<form role="form">
									<div class="form-group" class="col-lg-12">
										<label class="col-lg-2" style="text-align: center;">Add
											Symbol</label>
										<div class="col-lg-8">
											<input id="symbol" class="form-control">
										</div>
										<div class="col-lg-2">
											<div class="btn btn-primary" id="symbolBtn">Add to portfolio</div>
										</div>
									</div>
								</form>
							</div>
							<div class="col-lg-12" id="cashDiv" style="display: none">
								<form role="form">
									<div class="form-group" class="col-lg-12">
										<label class="col-lg-2" style="text-align: center;">Cash
										</label><span class="col-lg-2 btn cashTypeBtn">Deposit</span> <label
											class="col-lg-1" style="text-align: center;">/</label> <span
											class="col-lg-2 btn cashTypeBtn">Withdraw</span>
									</div>
								</form>
							</div>
							<div class="col-lg-12" id="cashTypeDiv" style="display: none">
								<form role="form">
									<div class="form-group" class="col-lg-12">
										<label class="col-lg-2" style="text-align: center;"
											id="cashTypeTitle"> </label>
										<div class="col-lg-10">
											<div class="col-lg-12">
												<label class="col-lg-2" style="text-align: center;" id="">Date</label>
												<div class="col-lg-4">
													<input class="form-control" />
												</div>
												<label class="col-lg-2" style="text-align: center;" id="">Amount</label>
												<div class="col-lg-4">
													<input class="form-control" />
												</div>

											</div>
											<div class="col-lg-12">
												<label class="col-lg-2" style="text-align: center;" id="">Notes</label>
												<div class="col-lg-6">
													<input class="form-control" />
												</div>
												<div class="col-lg-4">
													<div class="btn btn-default">Add to portfolio</div>
													<div class="btn btn-default" id="cancelBtn">Cancel</div>
												</div>
											</div>
											<div class="col-lg-12"></div>
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
											<th>Name</th>
											<th>Symbol</th>
											<th>Type</th>
											<th>Shares</th>
											<th>Price</th>
											<th>Balance</th>
											<th>Note</th>
											<!-- <th>Detail</th> -->
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
			<form class="form-horizontal  tasi-form" action="?" method="post">
				<section class="panel">
					<div class="panel-body">
						<div class="form-group">
							<label class="col-lg-3">Symbol</label>
							<div class="col-lg-9">
								<input class="form-control" id="symbol_name" disabled>
							</div>
						</div>
						<div class="form-group">
							<label class="col-lg-3">Type</label>
							<div class="col-lg-9">
								<select name="type" class="form-control">
									<option value="buy">Buy</option>
									<option value="sell">Sell</option>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label class="col-lg-3">Date</label>
							<div class="col-lg-9">
								<input class="form-control" id="datepicker">
							</div>
						</div>
						<div class="form-group">
							<label class="col-lg-3">Shares</label>
							<div class="col-lg-9">
								<input class="form-control" id="shares" type="number">
							</div>
						</div>
						<div class="form-group">
							<label class="col-lg-3">Price</label>
							<div class="col-lg-9">
								<input class="form-control" id="price" type="number">
							</div>
						</div>
						<div class="form-group">
							<label class="col-lg-3">Commission</label>
							<div class="col-lg-9">
								<input class="form-control" id="commission" type="number">
							</div>
						</div>
						<div class="form-group">
							<label class="col-lg-3">Notes</label>
							<div class="col-lg-9">
								<input class="form-control" id="notes">
							</div>
						</div>
						<hr />
						<div class="form-group">
							<div class="btn btn-success col-lg-12" id="submitBtn">Submit</div>
						</div>
					</div>
				</section>
			</form>
		</div>
	</section>
</body>
<script type="text/javascript" src="../js/portfolio.js"></script>
</html>
