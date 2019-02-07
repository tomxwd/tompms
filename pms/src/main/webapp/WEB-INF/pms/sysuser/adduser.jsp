<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>

<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">


<title>添加用户页面</title>
<link rel="shortcut icon" href="${ctx}/favicon.ico">
<link href="${ctx}/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
<link href="${ctx}/css/font-awesome.css?v=4.4.0" rel="stylesheet">
<link href="${ctx}/css/animate.css" rel="stylesheet">
<link href="${ctx}/css/style.css?v=4.1.0" rel="stylesheet">

</head>

<body class="gray-bg">
	<div class="wrapper wrapper-content animated fadeInRight">

		<div class="col-sm-12">
			<div class="ibox float-e-margins">
				<div class="ibox-title">
					<h5>添加用户</h5>
				</div>
				<div class="ibox-content">
					<form class="form-horizontal m-t" method="post" id="addUserForm">
						<div class="form-group">
							<label class="col-sm-3 control-label">用户名：</label>
							<div class="col-sm-4">
								<input id="uname" name="uname" placeholder="请输入用户名" class="form-control"
									type="text"
									class="valid">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label">昵称：</label>
							<div class="col-sm-4">
								<input id="nickname" name="nickname" placeholder="请输入昵称" class="form-control"
									type="text"
									class="valid">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label">密码：</label>
							<div class="col-sm-4">
								<input id="pwd" name="pwd" placeholder="请输入密码" class="form-control"
									type="password"
									class="valid">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label">确认密码：</label>
							<div class="col-sm-4">
								<input id="check_pwd" name="check_pwd" placeholder="请再次输入密码" class="form-control"
									type="password"
									class="valid">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label">电话：</label>
							<div class="col-sm-4">
								<input id="phone" placeholder="必填" name="phone" class="form-control"
									type="text"
									class="valid">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label">电子邮箱：</label>
							<div class="col-sm-4">
								<input id="email" name="email" class="form-control"
									type="text"
									class="valid">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label">QQ：</label>
							<div class="col-sm-4">
								<input id="qq" name="qq" class="form-control"
									type="text"
									class="valid">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label">注册时间：</label>
							<div class="col-sm-4">
								<input id="regtime" name="regtime" class="form-control"
									type="text"
									class="layer-date laydate-icon">
							</div>
						</div>

						<div class="form-group">
							<div class="col-sm-offset-3 col-sm-8">
								<button class="btn btn-sm btn-primary" type="submit">添加用户</button>
								<button class="btn btn-sm btn-default" type="reset">重置</button>
							</div>
						</div>
						
					</form>
				</div>
			</div>
		</div>
	</div>


	<!-- 全局js -->
	<script src="${ctx}/js/jquery.min.js?v=2.1.4"></script>
	<script src="${ctx}/js/bootstrap.min.js?v=3.3.6"></script>

	<!-- 自定义js -->
	<script src="${ctx}/js/content.js?v=1.0.0"></script>

	<!-- jQuery Validation plugin javascript-->
	<script src="${ctx}/js/plugins/validate/jquery.validate.min.js"></script>
	<script src="${ctx}/js/plugins/validate/messages_zh.min.js"></script>

	<script src="${ctx}/js/demo/form-validate-demo.js"></script>
	
	<!-- layerDate plugin javascript -->
	<script src="${ctx}/js/plugins/layer/laydate/laydate.js"></script>
	
	<!-- 表单校验jqueryvalidate -->
	<script src="${ctx}/js/plugins/validate/jquery.validate.min.js"></script>
	<!-- 表单校验默认的提示字 -->
	<script src="${ctx}/js/plugins/validate/messages_zh.min.js"></script>
	
	<!-- jqueryform表单插件 -->
	<script src="${ctx}/js/jquery.form.js"></script>
	
	<!-- layer javascript -->
	<script src="${ctx}/js/plugins/layer/layer.min.js"></script>
	
	<script type="text/javascript">
	$(function(){
		laydate({
			event:"focus",
			elem:"#regtime",
		});
		
		/* jquery Validate 添加自定义校验规则 */
		/* $.validator.addMethod(name,method,message) */
		$.validator.addMethod("checkPhone",function(value,element,param){
			var pattern = /^1[3,4,5,8,9][0-9]{9}$/
			return pattern.test(value);
		},"请输入11位有效的手机号码")
		
		/* jquery Validate 初始化 */
		$("#addUserForm").validate({
			rules:{
				uname:{
					required:true,
					remote:{
						url:"${ctx}/sysuser/checkuname",
						type:"get",
						dataType:"json",
						data:{
							uname:function(){
								return $("#uname").val();
							}
						},
						
					},
				},
				nickname:"required",
				pwd:"required",
				check_pwd:{
					required:true,
					equalTo:"#pwd"
				},
				phone:{
					required:true,
					checkPhone:true
				},
				email:"required",
				qq:"required",
				regtime:"required",
			},messages:{
				uname:{
					required:"用户名不能为空",
					remote:"该用户名已存在"
				},
				nickname:"昵称不能为空",
				pwd:"密码不能为空",
				check_pwd:{
					required:"确认密码为空",
					equalTo:"两次输入的密码不一样"
				},
				phone:{
					required:"电话不能为空",
					checkPhone:"请输入11位有效的手机号码"
				},
				email:"邮箱不能为空",
				qq:"qq不能为空",
				regtime:" 注册日期不能为空",
			},submitHandler:function(){
				//1、序列化表单
				var formDate = $("#addUserForm").serialize();
				//2、使用ajax请求提交
				/* $.post("${ctx}/sysuser/adduser",{uname:$("#uname").val(),pwd:$("#pwd").val(),nickname:$("#nickname").val(),regtime:$("#regtime").val()},function(data){
					console.log(data);
				}) */
				$.post("${ctx}/sysuser/adduser",formDate,function(data){
					if(data.ok==1){
						layer.alert(data.msg, {
							skin: 'layui-layer-molv', //样式类名
							shift:4
							},function(index){
								layer.close(index);
								$("#addUserForm").resetForm();
							});
					}else{
						parent.layer.alert(data.msg,{
							skin: 'layui-layer-molv',
							shift:4
						});
					}
				})
			}
		});
		
		
	})
	
	</script>
	
</body>

</html>
