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
						<div>
							<div class="">
								<div class="col-sm-3">
									<span id="add_sysuser" class="btn btn-primary">添加用户</span>
								</div>
								<div class="col-sm-4">
									<input id="search" placeholder="请输入需要查询的用户名或昵称" name="search" class="form-control"
										type="text" class="valid">
								</div>
								<button onclick="searchList()" class="btn btn-primary" type="submit">查询</button>
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
					<h4 class="modal-title">编辑用户</h4>
					<small class="font-bold"></small>
				</div>
					<form class="form-horizontal m-t" method="post" id="infoForm">
				<div class="modal-body">
						<div class="form-group">
							<label class="col-sm-3 control-label">用户id：</label>
							<div class="col-sm-7">
								<input id="id" name="id" readonly="readonly"  placeholder="用户id" class="form-control"
									type="text"
									class="valid">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label">用户名：</label>
							<div class="col-sm-7">
								<input id="uname" name="uname" readonly="readonly"  placeholder="请输入用户名" class="form-control"
									type="text"
									class="valid">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label">昵称：</label>
							<div class="col-sm-7">
								<input id="nickname" name="nickname" placeholder="请输入昵称" class="form-control"
									type="text"
									class="valid">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label">电话：</label>
							<div class="col-sm-7">
								<input id="phone" placeholder="必填" name="phone" class="form-control"
									type="text"
									class="valid">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label">电子邮箱：</label>
							<div class="col-sm-7">
								<input id="email" name="email" class="form-control"
									type="text"
									class="valid">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label">QQ：</label>
							<div class="col-sm-7">
								<input id="qq" name="qq" class="form-control"
									type="text"
									class="valid">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label">注册时间：</label>
							<div class="col-sm-7">
								<input id="regtime"  name="regtime" class="form-control"
									type="text"
									class="layer-date laydate-icon">
							</div>
						</div>

						<!-- <div class="form-group">
							<div class="col-sm-offset-3 col-sm-8">
								<button class="btn btn-sm btn-primary" type="submit">编辑完成</button>
							</div>
						</div> -->
						
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-white" data-dismiss="modal">关闭</button>
					<button type="submit" class="btn btn-primary">保存</button>
				</div>
					</form>
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
	
	<!-- layerDate plugin javascript -->
	<script src="${ctx}/js/plugins/layer/laydate/laydate.js"></script>
	
	<!-- layer javascript -->
	<script src="${ctx}/js/plugins/layer/layer.min.js"></script>
	
	<!-- 表单校验jqueryvalidate -->
	<script src="${ctx}/js/plugins/validate/jquery.validate.min.js"></script>
	<!-- 表单校验默认的提示字 -->
	<script src="${ctx}/js/plugins/validate/messages_zh.min.js"></script>

	<!-- Page-Level Scripts -->
	<script>
		//日期格式化
		function formatDate(value){
			var time = new Date(value);
			var year = time.getFullYear();
			var month = time.getMonth() + 1;
			var day = time.getDate();
			return year + "-" + month + "-" + day;
		}
	
		function formatter_date(cellvalue, options, rowObject) {
			return formatDate(cellvalue);
		}

		function formatter_status(cellvalue, options, rowObject) {
			if (cellvalue == 1) {
				return "<span style='color:green'>在职</span>"
			} else {
				return "<span style='color:red'>离职</span>"
			}
		}

		function formatter_operation(cellvalue, options, rowObject) {
			var formObj = JSON.stringify(rowObject);
			var editfunc = "onclick='editSysUser(" + formObj + ")'";
			var dimissfunc = "onclick='dimissSysUser("+rowObject.id+","+rowObject.delstatus+")'";
			var removefunc = "onclick='deleteSysUser("+rowObject.id+")'";
			var editStr = "<a  class='btn btn-primary btn-sm'"+editfunc+"><i class='fa fa-paste'></i>编辑</a>";
			if(rowObject.delstatus==1){
				var dimissStr = "<a class='btn btn-warning btn-sm'"+dimissfunc+"><i class='fa fa-times'></i>离职</a>";
			}else{
				var dimissStr = "<a class='btn btn-info btn-sm'"+dimissfunc+"><i class='fa fa-check'></i>复职</a>";
			}
			var removeStr = "<a class='btn btn-danger btn-sm' "+removefunc+"><i class='fa fa-warning'>删除</a>";
			return editStr+"&nbsp;&nbsp;&nbsp;&nbsp;"+dimissStr+"&nbsp;&nbsp;&nbsp;&nbsp;"+removeStr;
		}

		function editSysUser(obj) {
			/* $("#showModal").modal({
                remote: "${ctx}/sysuser/showInfo/?id="+id
            }); */
            console.log(obj);
            console.log(obj.id)
            $("#id").val(obj.id);
            $("#uname").val(obj.uname);
            $("#nickname").val(obj.nickname);
            $("#phone").val(obj.phone);
            $("#qq").val(obj.qq);
            $("#email").val(obj.email);
            $("#regtime").val(formatDate(obj.regtime));
            $("#myModal").modal('show');
		}
		
		//离职复职按钮
		function dimissSysUser(id,status) {
			var statusStr;
			if(status==1){
				statusStr = "确定将该用户离职吗？";
			}else{
				statusStr = "确定将该用户复职吗？";
			}
			layer.confirm(statusStr,{title:'温馨提示',skin: 'layui-layer-molv'},function(index){
				$.get("${ctx}/sysuser/dimissOrRestore",{id:id,delstatus:status},function(data){
					layer.alert(data.msg, {
						skin: 'layui-layer-molv', //样式类名
						shift:4
						});
					$("#table_list_1").trigger("reloadGrid");
					layer.close(index);
				});
			})
		}
		
		//删除按钮事件
		function deleteSysUser(id){
			layer.confirm('确定删除该用户吗？删除后不可恢复',{icon:2 ,title:'温馨提示',skin: 'layui-layer-molv'},function(index){
				$.get("${ctx}/sysuser/deleteUser",{id:id},function(data){
					layer.alert(data.msg, {
						skin: 'layui-layer-molv', //样式类名
						shift:4
						});
					$("#table_list_1").trigger("reloadGrid");
					layer.close(index);
				});
			})
			
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
				//初始化日历插件	
				laydate({
					event:"focus",
					elem:"#regtime",
				});
				
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
								height : 470,
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
									width : 80
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
									width : 200,
									formatter : formatter_operation,
								} ],
								pager : "#pager_list_1",
								viewrecords : true,
								caption : "用户信息列表",
								hidegrid : false
							});
					//使用自带的查询添加等功能
					/* $("#table_list_1").jqGrid('navGrid', '#pager_list_1', {
						edit : false,
						add : false,
						refresh: false,
						del : false,
						search : false
					}, {
						height : 200,
						reloadAfterSubmit : true
					}).jqGrid('navButtonAdd','#pager_list_1',{
						caption:"<span style='width:100px;heigth:100px' class='btn-primary'>添加</span>",
						buttonicon:"ui-icon-del",
						onClickButton: function(){   
							alert("Deleting Row");  
						},   
					}); */
					

					/* jquery Validate 添加自定义校验规则 */
					/* $.validator.addMethod(name,method,message) */
					$.validator.addMethod("checkPhone",function(value,element,param){
						var pattern = /^1[3,4,5,8,9][0-9]{9}$/
						return pattern.test(value);
					},"请输入11位有效的手机号码")
					
					/* jquery Validate 初始化 */
					$("#infoForm").validate({
						rules:{
							nickname:"required",
							phone:{
								required:true,
								checkPhone:true
							},
							email:"required",
							qq:"required",
							regtime:"required",
						},messages:{
							nickname:"昵称不能为空",
							phone:{
								required:"电话不能为空",
								checkPhone:"请输入11位有效的手机号码"
							},
							email:"邮箱不能为空",
							qq:"qq不能为空",
							regtime:" 注册日期不能为空",
						},submitHandler:function(){
							//1、序列化表单
							var formDate = $("#infoForm").serialize();
							//2、使用ajax请求提交
							/* $.post("${ctx}/sysuser/adduser",{uname:$("#uname").val(),pwd:$("#pwd").val(),nickname:$("#nickname").val(),regtime:$("#regtime").val()},function(data){
								console.log(data);
							}) */
							$.post("${ctx}/sysuser/edituser",formDate,function(data){
								if(data.ok==1){
									layer.alert(data.msg, {
										skin: 'layui-layer-molv', //样式类名
										shift:4
										},function(index){
											layer.close(index);
										});
								}else{
									parent.layer.alert(data.msg,{
										skin: 'layui-layer-molv',
										shift:4
									});
								}
								$("#myModal").modal('hide');
								$("#table_list_1").trigger("reloadGrid");
							})
						}
					});

				});
	</script>

</body>

</html>