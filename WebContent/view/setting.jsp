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
					<div class="panel-heading">Setting</div>
					<div class="panel-body">
						<div style="width: 100%;">
							<canvas id="canvas"></canvas>
						</div>
						<button id="randomizeData" class="btn">Randomize Data</button>
						<button id="addDataset" class="btn">Add Dataset</button>
						<button id="removeDataset" class="btn">Remove Dataset</button>
						<button id="addData" class="btn">Add Data</button>
						<button id="removeData" class="btn">Remove Data</button>
					</div>
					<!-- /.panel-body -->
				</div>
				<!-- /.panel -->
			</div>
			<!-- /.col-lg-12 -->
		</div>
	</section>
</body>
<script type="text/javascript" src="../js/setting.js"></script>
</html>
