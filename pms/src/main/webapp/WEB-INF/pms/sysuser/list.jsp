<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>

<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">


<title>pms-添加用户</title>
<link rel="shortcut icon" href="${ctx}/favicon.ico">
<link href="${ctx}/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
<link href="${ctx}/css/font-awesome.css?v=4.4.0" rel="stylesheet">

<!-- jqgrid-->
<link href="${ctx}/css/plugins/jqgrid/ui.jqgrid.css?0820"
	rel="stylesheet">

<link href="${ctx}/css/animate.css" rel="stylesheet">
<link href="${ctx}/css/style.css?v=4.1.0" rel="stylesheet">

</head>

<body class="gray-bg">
	<div class="wrapper wrapper-content  animated fadeInRight">
		<div class="row">
			<div class="col-sm-12">
				<div class="ibox ">
					<div class="ibox-title">
						<h5>用户列表</h5>
						<div>
							<div class="">
								<div class="col-sm-3"></div>
								<div class="col-sm-4">
									<input id="search" placeholder="请输入需要查询的用户名或昵称" name="search" class="form-control"
										type="text" class="valid">
								</div>
								<button onclick="searchList()" class="btn btn-sm btn-primary" type="submit">查询</button>
							</div>
						</div>
					</div>
					<div class="ibox-content">
						<div class="jqGrid_wrapper">
							<table id="table_list_1"></table>
							<div id="pager_list_1"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="modal inmodal" id="myModal" tabindex="-1" role="dialog"
		aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content animated flipInY">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title">窗口标题</h4>
					<small class="font-bold">这里可以显示副标题。 
				</div>
				<div class="modal-body">
					<p>
						<strong>H+</strong>
						是一个完全响应式，基于Bootstrap3.3.6最新版本开发的扁平化主题，她采用了主流的左右两栏式布局，使用了Html5+CSS3等现代技术，她提供了诸多的强大的可以重新组合的UI组件，并集成了最新的jQuery版本(v2.1.1)，当然，也集成了很多功能强大，用途广泛的jQuery插件，她可以用于所有的Web应用程序，如网站管理后台，网站会员中心，CMS，CRM，OA等等，当然，您也可以对她进行深度定制，以做出更强系统。
					</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-white" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary">保存s</button>
				</div>
			</div>
		</div>
	</div>

	<!-- 全局js -->
	<script src="${ctx}/js/jquery.min.js?v=2.1.4"></script>
	<script src="${ctx}/js/bootstrap.min.js?v=3.3.6"></script>



	<!-- Peity -->
	<script src="${ctx}/js/plugins/peity/jquery.peity.min.js"></script>

	<!-- jqGrid -->
	<script src="${ctx}/js/plugins/jqgrid/i18n/grid.locale-cn.js?0820"></script>
	<script src="${ctx}/js/plugins/jqgrid/jquery.jqGrid.min.js?0820"></script>

	<!-- 自定义js -->
	<script src="${ctx}/js/content.js?v=1.0.0"></script>
	
	<!-- layer javascript -->
	<script src="${ctx}/js/plugins/layer/layer.min.js"></script>

	<!-- Page-Level Scripts -->
	<script>
		function formatter_date(cellvalue, options, rowObject) {
			var time = new Date(cellvalue);
			var year = time.getFullYear();
			var month = time.getMonth() + 1;
			var day = time.getDate();
			return year + "-" + month + "-" + day;
		}

		function formatter_status(cellvalue, options, rowObject) {
			if (cellvalue == 1) {
				return "<span style='color:green'>在职</span>"
			} else {
				return "<span style='color:red'>离职</span>"
			}
		}

		function formatter_operation(cellvalue, options, rowObject) {
			console.log(rowObject);
			onblur = "changeInput('uname','账号不能为空！')"
			var eidtFunc = "onclick='editSysUser(" + rowObject.id + ")";
			var str = "<button class='btn btn-sm btn-primary'>编辑</button>&nbsp;&nbsp;&nbsp;<button class='btn btn-sm btn-danger'>删除</button>";
			return "<a data-toggle='modal' href='${ctx}/sysuser/info?id="+rowObject.id+"' data-target='#myModal'>Click me</a>";

		}

		function editSysUser(id) {

		}
		
		function searchList(){
			var search = $("#search").val();
			/* if(search){
				console.log(search);
				$("#table_list_1").jqGrid('setGridParam',{ 
	                url:"${ctx}/sysuser/sysuserlist",
	                postData:{'searchNameOrNickName':search}, //发送数据 
	                page:1 
	            }).trigger("reloadGrid"); //重新载入
			}else{
				layer.alert("查询条件不能为空！", {
					skin: 'layui-layer-molv', //样式类名
					shift:4
					});
			} */
			$("#table_list_1").jqGrid('setGridParam',{ 
                url:"${ctx}/sysuser/sysuserlist",
                postData:{'searchNameOrNickName':search}, //发送数据 
                page:1 
            }).trigger("reloadGrid"); //重新载入
		}

		$(document).ready(
				function() {
				
				//搜索框绑定事件
				$("#search").keyup(function(event){
					if(event.keyCode==13){
						searchList();
					}
				});
				

					$.jgrid.defaults.styleUI = 'Bootstrap';

					// Configuration for jqGrid Example 1
					$("#table_list_1").jqGrid(
							{
								mtype : 'POST',
								url : "${ctx}/sysuser/sysuserlist",
								datatype : "json",
								jsonReader : {
									root : 'root',//数据
									page : 'page',//当前页数
									total : 'total',//总页数
									records : 'records',//总条数
									rows : 'size',
									id : 'id'
								},
								height : 400,
								autowidth : true,
								shrinkToFit : true,
								rowNum : 10,
								rowList : [ 10, 20, 30, 50 ],
								emptyrecords : '没有符合条件的数据！',
								colNames : [ 'id号', '用户名', '昵称', '电话', '邮箱',
										'QQ号', '注册时间', '状态', '操作' ],
								colModel : [ {
									name : 'id',
									width : 60,
								}, {
									name : 'uname',
									width : 90,
								}, {
									name : 'nickname',
									width : 100
								}, {
									name : 'phone',
									width : 80,
								}, {
									name : 'email',
									width : 150,
								}, {
									name : 'qq',
									width : 100,
								}, {
									name : 'regtime',
									width : 150,
									formatter : formatter_date,
								}, {
									name : 'delstatus',
									width : 80,
									formatter : formatter_status,
								}, {
									width : 100,
									formatter : formatter_operation,
								} ],
								pager : "#pager_list_1",
								viewrecords : true,
								caption : "用户信息列表",
								hidegrid : false
							});
					//使用自带的查询添加等功能
					$("#table_list_1").jqGrid('navGrid', '#pager_list_1', {
						edit : true,
						add : true,
						del : true,
						search : true
					}, {
						height : 200,
						reloadAfterSubmit : true
					}).jqGrid('navButtonAdd','#pager_list_1',{
						caption:"add",
						buttonicon:"ui-icon-del",
						onClickButton: function(){   
							alert("Deleting Row");  
						},   
					});

				});
	</script>

</body>

</html>