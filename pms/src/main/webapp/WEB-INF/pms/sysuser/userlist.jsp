<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>

<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">


<title>用户列表</title>
<link rel="shortcut icon" href="${ctx}/favicon.ico">
<link href="${ctx}/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
<link href="${ctx}/css/font-awesome.css?v=4.4.0" rel="stylesheet">

<!-- Data Tables -->
<link href="${ctx}/css/plugins/dataTables/dataTables.bootstrap.css"
	rel="stylesheet">

<link href="${ctx}/css/animate.css" rel="stylesheet">
<link href="${ctx}/css/style.css?v=4.1.0" rel="stylesheet">

</head>

<body class="gray-bg">
	<div class="wrapper wrapper-content animated fadeInRight">
	
		<div class="row">
			<div class="col-sm-12">
				<div class="ibox float-e-margins">
					<div class="ibox-title">
						<h5>
							基本 <small>分类，查找</small>
						</h5>
						<div class="ibox-tools">
							<a class="collapse-link"> <i class="fa fa-chevron-up"></i>
							</a> <a class="dropdown-toggle" data-toggle="dropdown"
								href="table_data_tables.html#"> <i class="fa fa-wrench"></i>
							</a>
							<ul class="dropdown-menu dropdown-user">
								<li><a href="table_data_tables.html#">选项1</a></li>
								<li><a href="table_data_tables.html#">选项2</a></li>
							</ul>
							<a class="close-link"> <i class="fa fa-times"></i>
							</a>
						</div>
					</div>
					<div class="ibox-content">

						<table
							class="table table-striped table-bordered table-hover dataTables-example">
							<thead>
								<tr>
									<th>渲染引擎</th>
									<th>浏览器</th>
									<th>平台</th>
									<th>引擎版本</th>
									<th>CSS等级</th>
								</tr>
							</thead>
							<tbody>
								<tr class="gradeX">
									<td>Trident</td>
									<td>Internet Explorer 4.0</td>
									<td>Win 95+</td>
									<td class="center">4</td>
									<td class="center">X</td>
								</tr>
								<tr class="gradeC">
									<td>Trident</td>
									<td>Internet Explorer 5.0</td>
									<td>Win 95+</td>
									<td class="center">5</td>
									<td class="center">C</td>
								</tr>
								<tr class="gradeA">
									<td>Trident</td>
									<td>Internet Explorer 5.5</td>
									<td>Win 95+</td>
									<td class="center">5.5</td>
									<td class="center">A</td>
								</tr>
								<tr class="gradeA">
									<td>Trident</td>
									<td>Internet Explorer 6</td>
									<td>Win 98+</td>
									<td class="center">6</td>
									<td class="center">A</td>
								</tr>
								<tr class="gradeA">
									<td>Trident</td>
									<td>Internet Explorer 7</td>
									<td>Win XP SP2+</td>
									<td class="center">7</td>
									<td class="center">A</td>
								</tr>
								<tr class="gradeA">
									<td>Trident</td>
									<td>AOL browser (AOL desktop)</td>
									<td>Win XP</td>
									<td class="center">6</td>
									<td class="center">A</td>
								</tr>
								<tr class="gradeA">
									<td>Gecko</td>
									<td>Firefox 1.0</td>
									<td>Win 98+ / OSX.2+</td>
									<td class="center">1.7</td>
									<td class="center">A</td>
								</tr>
								<tr class="gradeA">
									<td>Gecko</td>
									<td>Firefox 1.5</td>
									<td>Win 98+ / OSX.2+</td>
									<td class="center">1.8</td>
									<td class="center">A</td>
								</tr>
								<tr class="gradeA">
									<td>Gecko</td>
									<td>Firefox 2.0</td>
									<td>Win 98+ / OSX.2+</td>
									<td class="center">1.8</td>
									<td class="center">A</td>
								</tr>
								<tr class="gradeA">
									<td>Gecko</td>
									<td>Firefox 3.0</td>
									<td>Win 2k+ / OSX.3+</td>
									<td class="center">1.9</td>
									<td class="center">A</td>
								</tr>
								<tr class="gradeA">
									<td>Gecko</td>
									<td>Camino 1.0</td>
									<td>OSX.2+</td>
									<td class="center">1.8</td>
									<td class="center">A</td>
								</tr>
								<tr class="gradeA">
									<td>Gecko</td>
									<td>Camino 1.5</td>
									<td>OSX.3+</td>
									<td class="center">1.8</td>
									<td class="center">A</td>
								</tr>
								<tr class="gradeA">
									<td>Gecko</td>
									<td>Netscape 7.2</td>
									<td>Win 95+ / Mac OS 8.6-9.2</td>
									<td class="center">1.7</td>
									<td class="center">A</td>
								</tr>
								<tr class="gradeA">
									<td>Gecko</td>
									<td>Netscape Browser 8</td>
									<td>Win 98SE+</td>
									<td class="center">1.7</td>
									<td class="center">A</td>
								</tr>
								<tr class="gradeA">
									<td>Gecko</td>
									<td>Netscape Navigator 9</td>
									<td>Win 98+ / OSX.2+</td>
									<td class="center">1.8</td>
									<td class="center">A</td>
								</tr>
								<tr class="gradeA">
									<td>Gecko</td>
									<td>Mozilla 1.0</td>
									<td>Win 95+ / OSX.1+</td>
									<td class="center">1</td>
									<td class="center">A</td>
								</tr>
								<tr class="gradeA">
									<td>Gecko</td>
									<td>Mozilla 1.1</td>
									<td>Win 95+ / OSX.1+</td>
									<td class="center">1.1</td>
									<td class="center">A</td>
								</tr>
								<tr class="gradeA">
									<td>Gecko</td>
									<td>Mozilla 1.2</td>
									<td>Win 95+ / OSX.1+</td>
									<td class="center">1.2</td>
									<td class="center">A</td>
								</tr>
								<tr class="gradeA">
									<td>Gecko</td>
									<td>Mozilla 1.3</td>
									<td>Win 95+ / OSX.1+</td>
									<td class="center">1.3</td>
									<td class="center">A</td>
								</tr>
								<tr class="gradeA">
									<td>Gecko</td>
									<td>Mozilla 1.4</td>
									<td>Win 95+ / OSX.1+</td>
									<td class="center">1.4</td>
									<td class="center">A</td>
								</tr>
								<tr class="gradeA">
									<td>Gecko</td>
									<td>Mozilla 1.5</td>
									<td>Win 95+ / OSX.1+</td>
									<td class="center">1.5</td>
									<td class="center">A</td>
								</tr>
								<tr class="gradeA">
									<td>Gecko</td>
									<td>Mozilla 1.6</td>
									<td>Win 95+ / OSX.1+</td>
									<td class="center">1.6</td>
									<td class="center">A</td>
								</tr>
								<tr class="gradeA">
									<td>Gecko</td>
									<td>Mozilla 1.7</td>
									<td>Win 98+ / OSX.1+</td>
									<td class="center">1.7</td>
									<td class="center">A</td>
								</tr>
								<tr class="gradeA">
									<td>Gecko</td>
									<td>Mozilla 1.8</td>
									<td>Win 98+ / OSX.1+</td>
									<td class="center">1.8</td>
									<td class="center">A</td>
								</tr>
								<tr class="gradeA">
									<td>Gecko</td>
									<td>Seamonkey 1.1</td>
									<td>Win 98+ / OSX.2+</td>
									<td class="center">1.8</td>
									<td class="center">A</td>
								</tr>
								<tr class="gradeA">
									<td>Gecko</td>
									<td>Epiphany 2.20</td>
									<td>Gnome</td>
									<td class="center">1.8</td>
									<td class="center">A</td>
								</tr>
								<tr class="gradeA">
									<td>Webkit</td>
									<td>Safari 1.2</td>
									<td>OSX.3</td>
									<td class="center">125.5</td>
									<td class="center">A</td>
								</tr>
								<tr class="gradeA">
									<td>Webkit</td>
									<td>Safari 1.3</td>
									<td>OSX.3</td>
									<td class="center">312.8</td>
									<td class="center">A</td>
								</tr>
								<tr class="gradeA">
									<td>Webkit</td>
									<td>Safari 2.0</td>
									<td>OSX.4+</td>
									<td class="center">419.3</td>
									<td class="center">A</td>
								</tr>
								<tr class="gradeA">
									<td>Webkit</td>
									<td>Safari 3.0</td>
									<td>OSX.4+</td>
									<td class="center">522.1</td>
									<td class="center">A</td>
								</tr>
								<tr class="gradeA">
									<td>Webkit</td>
									<td>OmniWeb 5.5</td>
									<td>OSX.4+</td>
									<td class="center">420</td>
									<td class="center">A</td>
								</tr>
								<tr class="gradeA">
									<td>Webkit</td>
									<td>iPod Touch / iPhone</td>
									<td>iPod</td>
									<td class="center">420.1</td>
									<td class="center">A</td>
								</tr>
								<tr class="gradeA">
									<td>Webkit</td>
									<td>S60</td>
									<td>S60</td>
									<td class="center">413</td>
									<td class="center">A</td>
								</tr>
								<tr class="gradeA">
									<td>Presto</td>
									<td>Opera 7.0</td>
									<td>Win 95+ / OSX.1+</td>
									<td class="center">-</td>
									<td class="center">A</td>
								</tr>
								<tr class="gradeA">
									<td>Presto</td>
									<td>Opera 7.5</td>
									<td>Win 95+ / OSX.2+</td>
									<td class="center">-</td>
									<td class="center">A</td>
								</tr>
								<tr class="gradeA">
									<td>Presto</td>
									<td>Opera 8.0</td>
									<td>Win 95+ / OSX.2+</td>
									<td class="center">-</td>
									<td class="center">A</td>
								</tr>
								<tr class="gradeA">
									<td>Presto</td>
									<td>Opera 8.5</td>
									<td>Win 95+ / OSX.2+</td>
									<td class="center">-</td>
									<td class="center">A</td>
								</tr>
								<tr class="gradeA">
									<td>Presto</td>
									<td>Opera 9.0</td>
									<td>Win 95+ / OSX.3+</td>
									<td class="center">-</td>
									<td class="center">A</td>
								</tr>
								<tr class="gradeA">
									<td>Presto</td>
									<td>Opera 9.2</td>
									<td>Win 88+ / OSX.3+</td>
									<td class="center">-</td>
									<td class="center">A</td>
								</tr>
								<tr class="gradeA">
									<td>Presto</td>
									<td>Opera 9.5</td>
									<td>Win 88+ / OSX.3+</td>
									<td class="center">-</td>
									<td class="center">A</td>
								</tr>
								<tr class="gradeA">
									<td>Presto</td>
									<td>Opera for Wii</td>
									<td>Wii</td>
									<td class="center">-</td>
									<td class="center">A</td>
								</tr>
								<tr class="gradeA">
									<td>Presto</td>
									<td>Nokia N800</td>
									<td>N800</td>
									<td class="center">-</td>
									<td class="center">A</td>
								</tr>
								<tr class="gradeA">
									<td>Presto</td>
									<td>Nintendo DS browser</td>
									<td>Nintendo DS</td>
									<td class="center">8.5</td>
									<td class="center">C/A<sup>1</sup>
									</td>
								</tr>
								<tr class="gradeC">
									<td>KHTML</td>
									<td>Konqureror 3.1</td>
									<td>KDE 3.1</td>
									<td class="center">3.1</td>
									<td class="center">C</td>
								</tr>
								<tr class="gradeA">
									<td>KHTML</td>
									<td>Konqureror 3.3</td>
									<td>KDE 3.3</td>
									<td class="center">3.3</td>
									<td class="center">A</td>
								</tr>
								<tr class="gradeA">
									<td>KHTML</td>
									<td>Konqureror 3.5</td>
									<td>KDE 3.5</td>
									<td class="center">3.5</td>
									<td class="center">A</td>
								</tr>
								<tr class="gradeX">
									<td>Tasman</td>
									<td>Internet Explorer 4.5</td>
									<td>Mac OS 8-9</td>
									<td class="center">-</td>
									<td class="center">X</td>
								</tr>
								<tr class="gradeC">
									<td>Tasman</td>
									<td>Internet Explorer 5.1</td>
									<td>Mac OS 7.6-9</td>
									<td class="center">1</td>
									<td class="center">C</td>
								</tr>
								<tr class="gradeC">
									<td>Tasman</td>
									<td>Internet Explorer 5.2</td>
									<td>Mac OS 8-X</td>
									<td class="center">1</td>
									<td class="center">C</td>
								</tr>
								<tr class="gradeA">
									<td>Misc</td>
									<td>NetFront 3.1</td>
									<td>Embedded devices</td>
									<td class="center">-</td>
									<td class="center">C</td>
								</tr>
								<tr class="gradeA">
									<td>Misc</td>
									<td>NetFront 3.4</td>
									<td>Embedded devices</td>
									<td class="center">-</td>
									<td class="center">A</td>
								</tr>
								<tr class="gradeX">
									<td>Misc</td>
									<td>Dillo 0.8</td>
									<td>Embedded devices</td>
									<td class="center">-</td>
									<td class="center">X</td>
								</tr>
								<tr class="gradeX">
									<td>Misc</td>
									<td>Links</td>
									<td>Text only</td>
									<td class="center">-</td>
									<td class="center">X</td>
								</tr>
								<tr class="gradeX">
									<td>Misc</td>
									<td>Lynx</td>
									<td>Text only</td>
									<td class="center">-</td>
									<td class="center">X</td>
								</tr>
								<tr class="gradeC">
									<td>Misc</td>
									<td>IE Mobile</td>
									<td>Windows Mobile 6</td>
									<td class="center">-</td>
									<td class="center">C</td>
								</tr>
								<tr class="gradeC">
									<td>Misc</td>
									<td>PSP browser</td>
									<td>PSP</td>
									<td class="center">-</td>
									<td class="center">C</td>
								</tr>
								<tr class="gradeU">
									<td>Other browsers</td>
									<td>All others</td>
									<td>-</td>
									<td class="center">-</td>
									<td class="center">U</td>
								</tr>
							</tbody>
							<tfoot>
								<tr>
									<th>渲染引擎</th>
									<th>浏览器</th>
									<th>平台</th>
									<th>引擎版本</th>
									<th>CSS等级</th>
								</tr>
							</tfoot>
						</table>

					</div>
				</div>
			</div>
		</div>
	
	</div>

	<!-- 全局js -->
	<script src="${ctx}/js/jquery.min.js?v=2.1.4"></script>
	<script src="${ctx}/js/bootstrap.min.js?v=3.3.6"></script>



	<script src="${ctx}/js/plugins/jeditable/jquery.jeditable.js"></script>

	<!-- Data Tables -->
	<script src="${ctx}/js/plugins/dataTables/jquery.dataTables.js"></script>
	<script src="${ctx}/js/plugins/dataTables/dataTables.bootstrap.js"></script>

	<!-- 自定义js -->
	<script src="${ctx}/js/content.js?v=1.0.0"></script>


	<!-- Page-Level Scripts -->
	<script>
		$(document).ready(function() {
			$('.dataTables-example').dataTable();
		});
	</script>

</body>

</html>
