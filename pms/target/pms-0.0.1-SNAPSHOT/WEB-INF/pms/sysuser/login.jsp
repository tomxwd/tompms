<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0">

<title>pms - 登录</title>
<meta name="keywords" content="pms">
<meta name="description"
	content="tomxwd的pms">
<link href="${ctx}/css/bootstrap.min.css" rel="stylesheet">
<link href="${ctx}/css/font-awesome.css" rel="stylesheet">
<link href="${ctx}/css/animate.css" rel="stylesheet">
<link href="${ctx}/css/style.css" rel="stylesheet">
<link href="${ctx}/css/login.css" rel="stylesheet">
<script type="text/javascript" src="${ctx}/js/jquery.min.js"></script>
<!--[if lt IE 9]>
<meta http-equiv="refresh" content="0;ie.html" />
<![endif]-->
<script>
	if (window.top !== window.self) {
		window.top.location = window.location;
	}
</script>

</head>
<script type="text/javascript">
//抖动js
	jQuery.fn.shake = function (intShakes /*Amount of shakes*/, intDistance /*Shake distance*/, intDuration /*Time duration*/) {
		      this.each(function () {
		          var jqNode = $(this);
		          jqNode.css({ position: 'relative' });
		          for (var x = 1; x <= intShakes; x++) {
		        	  var a = intDuration/intShakes;
		        	  var b = intDuration/intShakes;
		        	  var c = intDuration/intShakes;
		            jqNode.animate({left:(intDistance * -1)},(a/4))
		              .animate({ left: intDistance }, (b/2))
		              .animate({ left: 0 }, (c/4));
		          }
		     });
	     return this;
	 };
	
	function changeInput(idName,msg){
		var idNameVal = $("#"+idName).val();
		if(!idNameVal){
			$("#"+idName).attr("placeholder",msg);
			$("#"+idName).shake(2,10,400);
			$("#"+idName).css("border","1px solid red");
		}else{
			$("#"+idName).css("border","")
		}
	}
	
	
	$(function(){
		//为验证码图片以及”看不清“文字绑定事件
		$("#verify_img,#verId2").click(function(){
			$("#verify_img").attr("src","${ctx}/validate/image.jsp?time="+new Date().getTime());
		});
		//点击登录按钮进行登录操作
		$("#submit_btn").click(function(){
			var uname = $("#uname").val();
			var pwd = $("#pwd").val();
			var verify = $("#verify_code").val();
			if(!uname.length){
				$("#uname").attr("placeholder","账号不能为空！");
				$("#uname").shake(2,10,400);
				$("#uname").css("border","1px solid red");
			}
			if(!pwd.length){
				$("#pwd").attr("placeholder","密码不能为空！");
				$("#pwd").shake(2,10,400);
				$("#pwd").css("border","1px solid red");
			}
			if(!verify.length){
				$("#verify_code").attr("placeholder","验证码不能为空！");
				$("#verify_code").shake(2,10,400);
				$("#verify_code").css("border","1px solid red");
			}
			if(uname.length&&pwd.length&&verify.length){
				$.post("${ctx}/sysuser/login",{uname:uname,pwd:pwd,verify:verify},function(data){
					if(data.ok==0){
						//$("#submit_btn").before("<span style='color:red;font-size:20px'>"+data.msg+"</span>")
						//$("#errorMsg").text(data.msg);
						$("#submit_btn").html("<span style='color:red;font-weight:bold;font-size:16px'>"+data.msg+"</span>");
						$("#submit_btn").shake(2,10,400);
						setTimeout(function(){
							$("#submit_btn").text("登录");
						},3000)
					}else if(data.ok==1){
						window.location.href="${ctx}/toIndex"
					}else{
						alert("网络错误，请稍后再试");
					}
				});
			}
		});
		
		
	});
</script>
<body class="signin">
	<div class="signinpanel">
		<div class="row">
			<div class="col-sm-7">
				<div class="signin-info">
					<div class="logopanel m-b">
						<h1>欢迎使用</h1>
					</div>
					<div class="m-b"></div>
					<h4>
						tomxwd <strong>pms物业办公系统</strong>
					</h4>
					<ul class="m-b">
						<li><i class="fa fa-arrow-circle-o-right m-r-xs"></i> 优势一</li>
						<li><i class="fa fa-arrow-circle-o-right m-r-xs"></i> 优势二</li>
						<li><i class="fa fa-arrow-circle-o-right m-r-xs"></i> 优势三</li>
						<li><i class="fa fa-arrow-circle-o-right m-r-xs"></i> 优势四</li>
						<li><i class="fa fa-arrow-circle-o-right m-r-xs"></i> 优势五</li>
					</ul>
					<strong>还没有账号？ <a href="#">立即注册&raquo;</a></strong>
				</div>
			</div>
			<div class="col-sm-5">
				<form method="post">
					<h4 class="no-margins">登录：</h4>
					<p class="m-t-md">登录到tomxwd的pms系统</p>
					<div class="form-group has-error">
						<label class="control-label" for="inputError1" id="inputErrorid">欢迎使用本系统！</label>
					</div>
					<input id="uname" onblur="changeInput('uname','账号不能为空！')" type="text" class="form-control uname" placeholder="用户名" />
					<input id="pwd" onblur="changeInput('pwd','密码不能为空！')" type="password" class="form-control pword m-b"
						placeholder="密码" />
					<p style="text-align:right;"><a id="forget" style="color: white" href="">忘记密码了？</a></p>
					
							<!-- <input style="color: black;width: 100px" type="text"
							name="verifycode" maxlength="4" class="form-control  code	"
							width="50%" placeholder="验证码" />  -->
							<input id="verify_code" onblur="changeInput('verify_code','验证码不能为空！')" placeholder="验证码" style="color: black;font-size:14px;width:157px;height: 34px;padding-left:10px;" maxlength="4" class="code" />
							<img id="verify_img" style="margin-bottom: 5px;cursor: pointer;" alt="验证码" title="看不清，换一张 " src="${ctx}/validate/image.jsp">
					
					<p style="text-align:right;"><a style="color: white" id="verId2">看不清？点击可更换</a></p>
					<span id="errorMsg" style="color: red;font-size: 14px" ></span>
					<button id="submit_btn" type="button" class="btn btn-success btn-block">登录</button>
				</form>
			</div>
		</div>
		<div class="signup-footer">
			<div class="pull-left">&copy; 2019 tomxwd的pms</div>
		</div>
	</div>
</body>

</html>
