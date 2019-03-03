<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>

<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">


<link href="${ctx}/css/plugins/jqgrid/ui.jqgrid.css?0820"
	rel="stylesheet">
<link href="${ctx}/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
<link href="${ctx}/css/font-awesome.css?v=4.4.0" rel="stylesheet">
<!-- webupload -->
<link href="${ctx}/css/plugins/webuploader/webuploader.css"
	rel="stylesheet">


<!-- 全局js -->
<script src="${ctx}/js/jquery.min.js?v=2.1.4"></script>
<script src="${ctx}/js/bootstrap.min.js?v=3.3.6"></script>
<!-- webupload -->
<script src="${ctx}/js/plugins/webuploader/webuploader.min.js"></script>

<title>fileupload文件上传组件测试</title>

</head>
<body>

	<h1>webupload文件上传组件</h1>
	<div id="uploader" class="wu-example">
		<!--用来存放文件信息-->
		<div id="thelist" class="uploader-list"></div>
		<div class="btns">
			<div id="picker">选择文件</div>
			<button id="ctlBtn" class="btn btn-default">开始上传</button>
		</div>
	</div>
	<script type="text/javascript">
		jQuery(function() {
			var $ = jQuery, $list = $('#thelist'), $btn = $('#ctlBtn'), state = 'pending', uploader;

			//初始化
			uploader = WebUploader.create({

				// 不压缩image
				resize : false,

				// swf文件路径  flash动画的时候引入的文件
				/*   swf: BASE_URL + '/js/Uploader.swf', */

				// 文件接收服务端。
				server : "${ctx}/sysuser/fileUpLoadTest",

				// 选择文件的按钮。可选。
				// 内部根据当前运行是创建，可能是input元素，也可能是flash.
				pick : '#picker'
			});

			// 当有文件添加进来的时候
			uploader.on('fileQueued', function(file) {
				$list.append('<div id="' + file.id + '" class="item">'
						+ '<h4 class="info">' + file.name + '</h4>'
						+ '<p class="state">等待上传...</p>' + '</div>');
			});

			// 文件上传过程中创建进度条实时显示。
			uploader
					.on(
							'uploadProgress',
							function(file, percentage) {
								var $li = $('#' + file.id), $percent = $li
										.find('.progress .progress-bar');

								// 避免重复创建
								if (!$percent.length) {
									$percent = $(
											'<div class="progress progress-striped active">'
													+ '<div class="progress-bar" role="progressbar" style="width: 0%">'
													+ '</div>' + '</div>')
											.appendTo($li)
											.find('.progress-bar');
								}

								$li.find('p.state').text('上传中');

								$percent.css('width', percentage * 100 + '%');
							});

			uploader.on('uploadSuccess', function(file) {
				$('#' + file.id).find('p.state').text('已上传');
			});

			uploader.on('uploadError', function(file) {
				$('#' + file.id).find('p.state').text('上传出错');
			});

			uploader.on('uploadComplete', function(file) {
				$('#' + file.id).find('.progress').fadeOut();
			});

			uploader.on('all', function(type) {
				if (type === 'startUpload') {
					state = 'uploading';
				} else if (type === 'stopUpload') {
					state = 'paused';
				} else if (type === 'uploadFinished') {
					state = 'done';
				}

				if (state === 'uploading') {
					$btn.text('暂停上传');
				} else {
					$btn.text('开始上传');
				}
			});

			$btn.on('click', function() {
				if (state === 'uploading') {
					uploader.stop();
				} else {
					uploader.upload();
				}
			});
		});
	</script>

</body>
</html>