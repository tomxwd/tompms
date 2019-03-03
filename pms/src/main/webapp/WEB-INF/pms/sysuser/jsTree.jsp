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
<link href="${ctx}/css/plugins/jsTree/style.min.css" rel="stylesheet">
<link href="${ctx}/css/animate.css" rel="stylesheet">
<link href="${ctx}/css/style.css?v=4.1.0" rel="stylesheet">

</head>

<body class="gray-bg">
	<div class="wrapper wrapper-content  animated fadeInRight">

		<div class="row">
			<div class="col-sm-12">
				<div class="ibox float-e-margins">
					<div class="ibox-content">

						<strong>jsTree</strong>是一个基于jQuery的Tree控件。支持
						XML，JSON，Html三种数据源。提供创建，重命名，移动，删除，拖放节点操作。可以自己自定义创建，删除，嵌套，重命名，选择节点的规则。在这些操作上可以添加多种监听事件。
						<br>更多信息请访问： <a href="http://www.jstree.com/" target="_blank">http://www.jstree.com/</a>
					</div>
				</div>
			</div>
		</div>
		<div class="row">

			<div class="col-sm-6">
				<div class="ibox float-e-margins">
					<div class="ibox-title">
						<h5>一次性加载</h5>
						<div class="ibox-tools">
							<a class="collapse-link"> <i class="fa fa-chevron-up"></i>
							</a> <a class="close-link"> <i class="fa fa-times"></i>
							</a>
						</div>
					</div>
					<div class="ibox-content">

						<div id="one_json"></div>

					</div>
				</div>
			</div>

			<div class="col-sm-6">
				<div class="ibox float-e-margins">
					<div class="ibox-title">
						<h5>懒加载</h5>
						<div class="ibox-tools">
							<a class="collapse-link"> <i class="fa fa-chevron-up"></i>
							</a> <a class="close-link"> <i class="fa fa-times"></i>
							</a>
						</div>
					</div>
					<div class="ibox-content">

						<div id="lazy_json"></div>

					</div>
				</div>
			</div>


		</div>

		<div class="row">

			<div class="col-sm-6">
				<div class="ibox float-e-margins">
					<div class="ibox-title">
						<h5>拖拽功能</h5>
						<div class="ibox-tools">
							<a class="collapse-link"> <i class="fa fa-chevron-up"></i>
							</a> <a class="close-link"> <i class="fa fa-times"></i>
							</a>
						</div>
					</div>
					<div class="ibox-content">

						<div id="one_json_dnd"></div>

					</div>
				</div>
			</div>
			<div class="col-sm-6">
				<div class="ibox float-e-margins">
					<div class="ibox-title">
						<h5>增删改功能</h5>
						<div class="ibox-tools">
							<a class="collapse-link"> <i class="fa fa-chevron-up"></i>
							</a> <a class="close-link"> <i class="fa fa-times"></i>
							</a>
						</div>
					</div>
					<div class="ibox-content">

						<div id="one_json_change"></div>

					</div>
				</div>
			</div>


		</div>
	

	</div>
	
	<div class="modal inmodal" id="addModal" tabindex="-1" role="dialog"
		aria-hidden="true">
		<div class="modal-dialog">
		<div class="modal-content animated flipInY">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title">添加</h4>
					<small class="font-bold"></small>
				</div>
				<div class="modal-body">
					<form class="form-horizontal m-t" method="post" id="addForm">
						<div class="form-group">
							<label class="col-sm-3 control-label">名称：</label>
							<div class="col-sm-7">
								<input id="add_text" name="text" placeholder="请输入名称" class="form-control"
									type="text"
									class="valid">
								<input id="add_parent_id" name="add_parent_id" hidden="hidden"/>
							</div>
						</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-white" data-dismiss="modal">关闭</button>
					<button onclick="addTreeNode()" type="button" class="btn btn-primary">保存</button>
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


	<!-- jsTree plugin javascript -->
	<script src="${ctx}/js/plugins/jsTree/jstree.min.js"></script>
	
	<!-- layer javascript -->
	<script src="${ctx}/js/plugins/layer/layer.min.js"></script>

	<style>
.jstree-open>.jstree-anchor>.fa-folder:before {
	content: "\f07c";
}

.jstree-default .jstree-icon.none {
	width: 0;
}
</style>

	<script>
		
		function addTreeNode(){
			var text = $("#add_text").val();
			var parent_id = $("#add_parent_id").val();
			$.post("${ctx}/sysuser/addTree",{text:text,parent_id:parent_id},function(data){
				if(data.ok==1){
					layer.alert(data.msg, {
						skin: 'layui-layer-molv', //样式类名
						shift:4
						},function(index){
							layer.close(index);
							$("#addModal").modal('hide');
							$("#one_json_change").jstree().refresh(true);
						});
				}else{
					parent.layer.alert(data.msg,{
						skin: 'layui-layer-molv',
						shift:4
					},function(index){
						layer.close(index);
						$("#addModal").modal('hide');
					});
				}
			})
			
		}
	
		$(document).ready(function() {

			$('#one_json').jstree({
				'core' : {
					'data' : {
						"url" : "${ctx}/sysuser/oneJsTree",
						"dataType" : "json", // needed only if you do not supply JSON headers
			
					}
				},
			});

			$("#lazy_json").jstree({
				'core' : {
					'data' : {
						"url" : "${ctx}/sysuser/lazyJsTree",
						"data" : function(node) {
							return {
								"id" : node.id
							};
						}
					}
				}
			});
			
			$('#one_json_dnd').jstree({
				'core' : {
					'check_callback' : true,
					'data' : {
						"url" : "${ctx}/sysuser/oneJsTree",
						"dataType" : "json", // needed only if you do not supply JSON headers
			
					}
				},"plugins" : ["dnd"]
			});
			
			$('#one_json_change').jstree({
				'core' : {
					'data' : {
						"url" : "${ctx}/sysuser/oneJsTree",
						"dataType" : "json", // needed only if you do not supply JSON headers
			
					}
				},"contextmenu":{
			    	items:{
		                "add":{  
		                    "label":"添加",  
		                    "icon" : "glyphicon glyphicon-plus",
		                    "action":function(obj){
		                    	var inst = jQuery.jstree.reference(obj.reference);
		                    	var clickedNode = inst.get_node(obj.reference);
		                    	console.log(clickedNode)
		                    	$("#add_parent_id").val(clickedNode.id);
		                    	/* $.post("${ctx}/sysuser/addTree",formData,function(data){
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
							} */
		                    	$("#addModal").modal('show');
		                    }
		                },"edit":{
		                	"label":"修改",
		                	"icon" : "glyphicon glyphicon-pencil",
		                	"action":function(obj){
		                		var inst = jQuery.jstree.reference(obj.reference);
		                    	var clickedNode = inst.get_node(obj.reference);
		                	}
		                },"remove":{
		                	"label":"删除",
		                	"icon" : "glyphicon glyphicon-remove",
		                	"action":function(obj){
		                		var inst = jQuery.jstree.reference(obj.reference);
		                    	var clickedNode = inst.get_node(obj.reference);
		                	}
		                }
			    	}
				},"plugins":["contextmenu"],
			});

		});
	</script>

</body>

</html>
