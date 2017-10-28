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
.row {
	margin: 10px !important;
}
.pull-left{
	color: #000;
}
</style>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<jsp:include page="nav.jsp"></jsp:include>
	<section id="main_section">
		<div class="row" style="margin: 10px;">
			<div class="col-lg-3 col-md-6">
				<div class="panel panel-green">
					<div class="panel-heading">
						<div class="row">
							<div class="col-xs-3">
								<i class="fa fa-tasks fa-5x"></i>
							</div>
							<div class="col-xs-9 text-right">
								<div class="huge">12</div>
								<div>New Tasks!</div>
							</div>
						</div>
					</div>
					<a href="#">
						<div class="panel-footer">
							<span class="pull-left">View Details</span> <span
								class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
							<div class="clearfix"></div>
						</div>
					</a>
				</div>
			</div>
			<div class="col-lg-3 col-md-6">
				<div class="panel panel-green">
					<div class="panel-heading">
						<div class="row">
							<div class="col-xs-3">
								<i class="fa fa-tasks fa-5x"></i>
							</div>
							<div class="col-xs-9 text-right">
								<div class="huge">12</div>
								<div>New Tasks!</div>
							</div>
						</div>
					</div>
					<a href="#">
						<div class="panel-footer">
							<span class="pull-left">View Details</span> <span
								class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
							<div class="clearfix"></div>
						</div>
					</a>
				</div>
			</div>
			<div class="col-lg-3 col-md-6">
				<div class="panel panel-green">
					<div class="panel-heading">
						<div class="row">
							<div class="col-xs-3">
								<i class="fa fa-tasks fa-5x"></i>
							</div>
							<div class="col-xs-9 text-right">
								<div class="huge">12</div>
								<div>New Tasks!</div>
							</div>
						</div>
					</div>
					<a href="#">
						<div class="panel-footer">
							<span class="pull-left">View Details</span> <span
								class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
							<div class="clearfix"></div>
						</div>
					</a>
				</div>
			</div>
			<div class="col-lg-3 col-md-6">
				<div class="panel panel-green">
					<div class="panel-heading">
						<div class="row">
							<div class="col-xs-3">
								<i class="fa fa-tasks fa-5x"></i>
							</div>
							<div class="col-xs-9 text-right">
								<div class="huge">12</div>
								<div>New Tasks!</div>
							</div>
						</div>
					</div>
					<a href="#">
						<div class="panel-footer">
							<span class="pull-left">View Details</span> <span
								class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
							<div class="clearfix"></div>
						</div>
					</a>
				</div>
			</div>

		</div>
		<div class="row">
			<div class="col-lg-8">
				<div class="panel panel-default">
					<div class="panel-heading">
						<i class="fa fa-bar-chart-o fa-fw"></i> Area Chart Example
						<div class="pull-right">
							<div class="btn-group">
								<button type="button"
									class="btn btn-default btn-xs dropdown-toggle"
									data-toggle="dropdown">
									Actions <span class="caret"></span>
								</button>
								<ul class="dropdown-menu pull-right" role="menu">
									<li><a href="#">Action</a></li>
									<li><a href="#">Another action</a></li>
									<li><a href="#">Something else here</a></li>
									<li class="divider"></li>
									<li><a href="#">Separated link</a></li>
								</ul>
							</div>
						</div>
					</div>
					<!-- /.panel-heading -->
					<div class="panel-body">
						<div id="morris-area-chart"
							style="position: relative; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);">
							<svg height="342" version="1.1" width="593"
								xmlns="http://www.w3.org/2000/svg"
								xmlns:xlink="http://www.w3.org/1999/xlink"
								style="overflow: hidden; position: relative;">
								<desc style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">Created with Raphaël 2.2.0</desc>
								<defs style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></defs>
								<text x="51.65625" y="305.5" text-anchor="end"
									font-family="sans-serif" font-size="12px" stroke="none"
									fill="#888888"
									style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: end; font-family: sans-serif; font-size: 12px; font-weight: normal;"
									font-weight="normal">
								<tspan style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"
									dy="4.25">0</tspan></text>
								<path fill="none" stroke="#aaaaaa" d="M64.15625,305.5H567.65625"
									stroke-width="0.5"
									style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></path>
								<text x="51.65625" y="235.375" text-anchor="end"
									font-family="sans-serif" font-size="12px" stroke="none"
									fill="#888888"
									style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: end; font-family: sans-serif; font-size: 12px; font-weight: normal;"
									font-weight="normal">
								<tspan style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"
									dy="4.25">7,500</tspan></text>
								<path fill="none" stroke="#aaaaaa"
									d="M64.15625,235.375H567.65625" stroke-width="0.5"
									style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></path>
								<text x="51.65625" y="165.25" text-anchor="end"
									font-family="sans-serif" font-size="12px" stroke="none"
									fill="#888888"
									style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: end; font-family: sans-serif; font-size: 12px; font-weight: normal;"
									font-weight="normal">
								<tspan style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"
									dy="4.25">15,000</tspan></text>
								<path fill="none" stroke="#aaaaaa"
									d="M64.15625,165.25H567.65625" stroke-width="0.5"
									style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></path>
								<text x="51.65625" y="95.12499999999997" text-anchor="end"
									font-family="sans-serif" font-size="12px" stroke="none"
									fill="#888888"
									style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: end; font-family: sans-serif; font-size: 12px; font-weight: normal;"
									font-weight="normal">
								<tspan style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"
									dy="4.249999999999972">22,500</tspan></text>
								<path fill="none" stroke="#aaaaaa"
									d="M64.15625,95.12499999999997H567.65625" stroke-width="0.5"
									style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></path>
								<text x="51.65625" y="25" text-anchor="end"
									font-family="sans-serif" font-size="12px" stroke="none"
									fill="#888888"
									style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: end; font-family: sans-serif; font-size: 12px; font-weight: normal;"
									font-weight="normal">
								<tspan style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"
									dy="4.25">30,000</tspan></text>
								<path fill="none" stroke="#aaaaaa" d="M64.15625,25H567.65625"
									stroke-width="0.5"
									style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></path>
								<text x="474.6647554678007" y="318" text-anchor="middle"
									font-family="sans-serif" font-size="12px" stroke="none"
									fill="#888888"
									style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: middle; font-family: sans-serif; font-size: 12px; font-weight: normal;"
									font-weight="normal" transform="matrix(1,0,0,1,0,8.25)">
								<tspan style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"
									dy="4.25">2012</tspan></text>
								<text x="251.36281136087484" y="318" text-anchor="middle"
									font-family="sans-serif" font-size="12px" stroke="none"
									fill="#888888"
									style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: middle; font-family: sans-serif; font-size: 12px; font-weight: normal;"
									font-weight="normal" transform="matrix(1,0,0,1,0,8.25)">
								<tspan style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"
									dy="4.25">2011</tspan></text>
								<path fill="#7cb57c" stroke="none"
									d="M64.15625,255.82344999999998C78.22733140947753,250.68095,106.36949422843256,240.00909374999998,120.44057563791009,235.25345C134.51165704738762,230.49780625,162.65381986634264,224.2885568306011,176.72490127582017,217.7783C190.64303614823814,211.3388068306011,218.47930589307413,185.37591374309395,232.3974407654921,183.45445C246.16262910085055,181.55410124309392,273.6930057715674,201.0935589285714,287.4581941069259,202.49104999999997C301.5292755164034,203.9195964285714,329.6714383353584,193.8072375,343.74251974483593,194.7586C357.81360115431346,195.70996250000002,385.9557639732685,226.9898382513661,400.02684538274605,210.10195C413.944980255164,193.39762575136612,441.78125,68.538275,455.69938487241797,60.38974999999999C469.61751974483593,52.24122499999999,497.4537894896719,132.9658167349727,511.3719243620899,144.91375C525.4430057715674,156.99297923497267,553.5851685905225,153.60223749999997,567.65625,156.49839999999998L567.65625,305.5L64.15625,305.5Z"
									fill-opacity="1"
									style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); fill-opacity: 1;"></path>
								<path fill="none" stroke="#4da74d"
									d="M64.15625,255.82344999999998C78.22733140947753,250.68095,106.36949422843256,240.00909374999998,120.44057563791009,235.25345C134.51165704738762,230.49780625,162.65381986634264,224.2885568306011,176.72490127582017,217.7783C190.64303614823814,211.3388068306011,218.47930589307413,185.37591374309395,232.3974407654921,183.45445C246.16262910085055,181.55410124309392,273.6930057715674,201.0935589285714,287.4581941069259,202.49104999999997C301.5292755164034,203.9195964285714,329.6714383353584,193.8072375,343.74251974483593,194.7586C357.81360115431346,195.70996250000002,385.9557639732685,226.9898382513661,400.02684538274605,210.10195C413.944980255164,193.39762575136612,441.78125,68.538275,455.69938487241797,60.38974999999999C469.61751974483593,52.24122499999999,497.4537894896719,132.9658167349727,511.3719243620899,144.91375C525.4430057715674,156.99297923497267,553.5851685905225,153.60223749999997,567.65625,156.49839999999998"
									stroke-width="3"
									style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></path>
								<circle cx="64.15625" cy="255.82344999999998" r="2"
									fill="#4da74d" stroke="#ffffff" stroke-width="1"
									style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></circle>
								<circle cx="120.44057563791009" cy="235.25345" r="2"
									fill="#4da74d" stroke="#ffffff" stroke-width="1"
									style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></circle>
								<circle cx="176.72490127582017" cy="217.7783" r="2"
									fill="#4da74d" stroke="#ffffff" stroke-width="1"
									style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></circle>
								<circle cx="232.3974407654921" cy="183.45445" r="2"
									fill="#4da74d" stroke="#ffffff" stroke-width="1"
									style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></circle>
								<circle cx="287.4581941069259" cy="202.49104999999997" r="2"
									fill="#4da74d" stroke="#ffffff" stroke-width="1"
									style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></circle>
								<circle cx="343.74251974483593" cy="194.7586" r="2"
									fill="#4da74d" stroke="#ffffff" stroke-width="1"
									style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></circle>
								<circle cx="400.02684538274605" cy="210.10195" r="2"
									fill="#4da74d" stroke="#ffffff" stroke-width="1"
									style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></circle>
								<circle cx="455.69938487241797" cy="60.38974999999999" r="2"
									fill="#4da74d" stroke="#ffffff" stroke-width="1"
									style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></circle>
								<circle cx="511.3719243620899" cy="144.91375" r="2"
									fill="#4da74d" stroke="#ffffff" stroke-width="1"
									style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></circle>
								<circle cx="567.65625" cy="156.49839999999998" r="2"
									fill="#4da74d" stroke="#ffffff" stroke-width="1"
									style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></circle>
								<path fill="#a8b4bd" stroke="none"
									d="M64.15625,280.5729C78.22733140947753,274.948875,106.36949422843256,263.00308125,120.44057563791009,258.0768C134.51165704738762,253.15051875,162.65381986634264,243.85606311475408,176.72490127582017,241.16264999999999C190.64303614823814,238.49851311475408,218.47930589307413,238.81250683701654,232.3974407654921,236.64659999999998C246.16262910085055,234.50449433701655,273.6930057715674,226.93480123626372,287.4581941069259,223.9306C301.5292755164034,220.85963873626375,329.6714383353584,212.21855624999998,343.74251974483593,212.34595C357.81360115431346,212.47334375,385.9557639732685,237.9667382513661,400.02684538274605,224.94975C413.944980255164,212.07425075136612,441.78125,116.41027499999998,455.69938487241797,108.77599999999998C469.61751974483593,101.14172499999998,497.4537894896719,155.8610544398907,511.3719243620899,163.87554999999998C525.4430057715674,171.9781169398907,553.5851685905225,170.902075,567.65625,173.24425L567.65625,305.5L64.15625,305.5Z"
									fill-opacity="1"
									style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); fill-opacity: 1;"></path>
								<path fill="none" stroke="#7a92a3"
									d="M64.15625,280.5729C78.22733140947753,274.948875,106.36949422843256,263.00308125,120.44057563791009,258.0768C134.51165704738762,253.15051875,162.65381986634264,243.85606311475408,176.72490127582017,241.16264999999999C190.64303614823814,238.49851311475408,218.47930589307413,238.81250683701654,232.3974407654921,236.64659999999998C246.16262910085055,234.50449433701655,273.6930057715674,226.93480123626372,287.4581941069259,223.9306C301.5292755164034,220.85963873626375,329.6714383353584,212.21855624999998,343.74251974483593,212.34595C357.81360115431346,212.47334375,385.9557639732685,237.9667382513661,400.02684538274605,224.94975C413.944980255164,212.07425075136612,441.78125,116.41027499999998,455.69938487241797,108.77599999999998C469.61751974483593,101.14172499999998,497.4537894896719,155.8610544398907,511.3719243620899,163.87554999999998C525.4430057715674,171.9781169398907,553.5851685905225,170.902075,567.65625,173.24425"
									stroke-width="3"
									style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></path>
								<circle cx="64.15625" cy="280.5729" r="2" fill="#7a92a3"
									stroke="#ffffff" stroke-width="1"
									style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></circle>
								<circle cx="120.44057563791009" cy="258.0768" r="2"
									fill="#7a92a3" stroke="#ffffff" stroke-width="1"
									style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></circle>
								<circle cx="176.72490127582017" cy="241.16264999999999" r="2"
									fill="#7a92a3" stroke="#ffffff" stroke-width="1"
									style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></circle>
								<circle cx="232.3974407654921" cy="236.64659999999998" r="2"
									fill="#7a92a3" stroke="#ffffff" stroke-width="1"
									style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></circle>
								<circle cx="287.4581941069259" cy="223.9306" r="2"
									fill="#7a92a3" stroke="#ffffff" stroke-width="1"
									style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></circle>
								<circle cx="343.74251974483593" cy="212.34595" r="2"
									fill="#7a92a3" stroke="#ffffff" stroke-width="1"
									style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></circle>
								<circle cx="400.02684538274605" cy="224.94975" r="2"
									fill="#7a92a3" stroke="#ffffff" stroke-width="1"
									style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></circle>
								<circle cx="455.69938487241797" cy="108.77599999999998" r="2"
									fill="#7a92a3" stroke="#ffffff" stroke-width="1"
									style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></circle>
								<circle cx="511.3719243620899" cy="163.87554999999998" r="2"
									fill="#7a92a3" stroke="#ffffff" stroke-width="1"
									style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></circle>
								<circle cx="567.65625" cy="173.24425" r="2" fill="#7a92a3"
									stroke="#ffffff" stroke-width="1"
									style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></circle>
								<path fill="#2677b5" stroke="none"
									d="M64.15625,280.5729C78.22733140947753,280.3111,106.36949422843256,282.1507125,120.44057563791009,279.5257C134.51165704738762,276.90068749999995,162.65381986634264,260.7350101092896,176.72490127582017,259.5728C190.64303614823814,258.4232226092896,218.47930589307413,272.50909323204417,232.3974407654921,270.27855C246.16262910085055,268.0725182320442,273.6930057715674,244.02619024725277,287.4581941069259,241.8265C301.5292755164034,239.57792774725277,329.6714383353584,250.15968750000002,343.74251974483593,252.4855C357.81360115431346,254.8113125,385.9557639732685,271.4828095628415,400.02684538274605,260.433C413.944980255164,249.5032970628415,441.78125,171.42450624999998,455.69938487241797,164.56744999999998C469.61751974483593,157.71039374999998,497.4537894896719,197.85729474043717,511.3719243620899,205.57655C525.4430057715674,213.38063224043717,553.5851685905225,221.3897375,567.65625,226.6608L567.65625,305.5L64.15625,305.5Z"
									fill-opacity="1"
									style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); fill-opacity: 1;"></path>
								<path fill="none" stroke="#0b62a4"
									d="M64.15625,280.5729C78.22733140947753,280.3111,106.36949422843256,282.1507125,120.44057563791009,279.5257C134.51165704738762,276.90068749999995,162.65381986634264,260.7350101092896,176.72490127582017,259.5728C190.64303614823814,258.4232226092896,218.47930589307413,272.50909323204417,232.3974407654921,270.27855C246.16262910085055,268.0725182320442,273.6930057715674,244.02619024725277,287.4581941069259,241.8265C301.5292755164034,239.57792774725277,329.6714383353584,250.15968750000002,343.74251974483593,252.4855C357.81360115431346,254.8113125,385.9557639732685,271.4828095628415,400.02684538274605,260.433C413.944980255164,249.5032970628415,441.78125,171.42450624999998,455.69938487241797,164.56744999999998C469.61751974483593,157.71039374999998,497.4537894896719,197.85729474043717,511.3719243620899,205.57655C525.4430057715674,213.38063224043717,553.5851685905225,221.3897375,567.65625,226.6608"
									stroke-width="3"
									style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></path>
								<circle cx="64.15625" cy="280.5729" r="2" fill="#0b62a4"
									stroke="#ffffff" stroke-width="1"
									style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></circle>
								<circle cx="120.44057563791009" cy="279.5257" r="2"
									fill="#0b62a4" stroke="#ffffff" stroke-width="1"
									style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></circle>
								<circle cx="176.72490127582017" cy="259.5728" r="2"
									fill="#0b62a4" stroke="#ffffff" stroke-width="1"
									style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></circle>
								<circle cx="232.3974407654921" cy="270.27855" r="2"
									fill="#0b62a4" stroke="#ffffff" stroke-width="1"
									style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></circle>
								<circle cx="287.4581941069259" cy="241.8265" r="2"
									fill="#0b62a4" stroke="#ffffff" stroke-width="1"
									style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></circle>
								<circle cx="343.74251974483593" cy="252.4855" r="2"
									fill="#0b62a4" stroke="#ffffff" stroke-width="1"
									style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></circle>
								<circle cx="400.02684538274605" cy="260.433" r="2"
									fill="#0b62a4" stroke="#ffffff" stroke-width="1"
									style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></circle>
								<circle cx="455.69938487241797" cy="164.56744999999998" r="2"
									fill="#0b62a4" stroke="#ffffff" stroke-width="1"
									style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></circle>
								<circle cx="511.3719243620899" cy="205.57655" r="2"
									fill="#0b62a4" stroke="#ffffff" stroke-width="1"
									style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></circle>
								<circle cx="567.65625" cy="226.6608" r="2" fill="#0b62a4"
									stroke="#ffffff" stroke-width="1"
									style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></circle></svg>
							<div class="morris-hover morris-default-style"
								style="left: 479.688px; top: 123px; display: none;">
								<div class="morris-hover-row-label">2012 Q2</div>
								<div class="morris-hover-point" style="color: #0b62a4">
									iPhone: 8,432</div>
								<div class="morris-hover-point" style="color: #7A92A3">
									iPad: 5,713</div>
								<div class="morris-hover-point" style="color: #4da74d">
									iPod Touch: 1,791</div>
							</div>
						</div>
					</div>
					<!-- /.panel-body -->
				</div>
				<!-- /.panel -->
			</div>
			<!-- /.col-lg-8 -->
			<div class="col-lg-4">
				<div class="panel panel-default">
					<div class="panel-heading">
						<i class="fa fa-bell fa-fw"></i> Notifications Panel
					</div>
					<!-- /.panel-heading -->
					<div class="panel-body">
						<div class="list-group">
							<a href="#" class="list-group-item"> <i
								class="fa fa-comment fa-fw"></i> New Comment <span
								class="pull-right text-muted small"><em>4 minutes
										ago</em> </span>
							</a> <a href="#" class="list-group-item"> <i
								class="fa fa-twitter fa-fw"></i> 3 New Followers <span
								class="pull-right text-muted small"><em>12 minutes
										ago</em> </span>
							</a> <a href="#" class="list-group-item"> <i
								class="fa fa-envelope fa-fw"></i> Message Sent <span
								class="pull-right text-muted small"><em>27 minutes
										ago</em> </span>
							</a> <a href="#" class="list-group-item"> <i
								class="fa fa-tasks fa-fw"></i> New Task <span
								class="pull-right text-muted small"><em>43 minutes
										ago</em> </span>
							</a> <a href="#" class="list-group-item"> <i
								class="fa fa-upload fa-fw"></i> Server Rebooted <span
								class="pull-right text-muted small"><em>11:32 AM</em> </span>
							</a>
						</div>
						<!-- /.list-group -->
						<a href="#" class="btn btn-default btn-block">View All Alerts</a>
					</div>
					<!-- /.panel-body -->
				</div>
				<!-- /.panel -->

				<!-- /.panel -->
				<!-- /.panel .chat-panel -->
			</div>
			<!-- /.col-lg-4 -->
		</div>
	</section>
</body>
<script type="text/javascript" src="../js/index.js"></script>
</html>
