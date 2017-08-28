<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<%@ include file="/common/meta.jsp"%>
<style type="text/css">
.logo_top_left {
	background-color: #428bca;
	width: auto;
	height: 46px;
	margin: 0 5px;
	border-radius: 3px;
	float: left;
	box-sizing: border-box;
	display: block;
	padding-left: 5px;
	padding-right: 5px;
}

.border-bottom {
	border-bottom: 1px solid #eee;
}

.padding-top-15 {
	padding-top: 15px;
}

.padding-15-tb {
	padding: 15px 0px 15px 0px;
}

.line-height-34 {
	line-height: 34px;
}

div.dataTables_info {
	float: left;
	padding-top: 4px;
}
</style>
</head>
<body>
	<c:set var="currentNav" value="search"></c:set>
	<%@ include file="/common/nav.jsp"%>
	<main>
	<div class="container-fluid">
		<div class="row border-bottom padding-top-15 ">
			<div class="col-xs-3 text-left">
				<ol class="breadcrumb">
					<li><a href="#">付款</a></li>
					<li><a
						href="${pageContext.request.contextPath}/bill/checked/list">审核订单</a></li>
					<li><a
						href="${pageContext.request.contextPath}/bill/checked/daylist?day=${day }">订单明细</a></li>
					<li><a href="#" class="active">个人记录</a></li>
				</ol>
			</div>
			<div class="col-xs-9 text-right">
				<div class="form-group form-inline">
					<input type="hidden" class="form-control input-lg" id="id"
						value="${id }" /><input type="hidden"
						class="form-control input-lg" id="day" value="${day }" /><input
						type="hidden" class="form-control input-lg" id="token"
						value="${token }" />
				</div>
			</div>
		</div>
		<div class="row border-bottom padding-15-tb">
			<div class="col-xs-15 text-right ">
				<div class="form-inline " role="form">
					<div class="form-group">
						<div class="input-group">
							<div class="input-group-addon">从</div>
							<input id="start" name="start" class="form-control "
								placeholder="请选择开始日期" type="text"
								onFocus="WdatePicker({startDate:'%y-%M-01 00:00:00',dateFmt:'yyyy-MM-dd',alwaysUseStartDate:true,onpicked:search,oncleared:search})" />
						</div>
					</div>
					<div class="form-group">
						<div class="input-group">
							<div class="input-group-addon">到</div>
							<input id="end" name="end" class="form-control" type="text"
								placeholder="请选择结束日期"
								onFocus="WdatePicker({startDate:'%y-%M-01 00:00:00',dateFmt:'yyyy-MM-dd',alwaysUseStartDate:true,onpicked:search,oncleared:search})" />
						</div>
					</div>
				</div>
			</div>

		</div>
		<div class="row padding-15-tb">
			<div class="col-xs-12">
				<table id="datalist"
					class="table table-striped table-bordered table-condensed">
					<thead>
						<tr>
							<th class="text-center">提交时间</th>
							<th class="text-center" width="20%">兑换说明</th>
							<th class="text-center">账户余额</th>
							<th class="text-center">处理人</th>
							<th class="text-center">处理时间</th>
							<th class="text-center" width="6%">状态</th>
							<th class="text-center" width="7%">失败原因</th>
							<th class="text-center" width="12%">操作</th>
						</tr>
					</thead>
					<tbody>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		function search() {
			$('#datalist').dataTable().fnDraw();
		}

		function delay(status, id, type) {
			var uid = $("#token").val();
			var url = "";
			if (1 == type) {
				//微信
				url = "${pageContext.request.contextPath}/bill/checked/wxDrawal";
			} else {
				//支付宝
				url = "${pageContext.request.contextPath}/bill/checked/alipayDrawal";
			}
			var flushurl = "${pageContext.request.contextPath}/bill/checked/checking?token="
					+ uid;
			if (confirm('确定执行此操作吗？')) {
				$.post(url, {
					status : status,
					id : id,
					token:uid
				}, function(data) {
					if ("success" == data) {
						alert('操作成功!');
					} else {
						alert('操作失败，请重试!');
					}
					window.location = flushurl;
				});
			}
		}

		$(document)
				.ready(
						function() {
							var table = $('#datalist')
									.dataTable(
											{
												"bAutoWidth" : false,
												"bPaginate" : true, //是否分页。
												"bServerSide" : true,
												"bProcessing" : true,
												"searching" : false,
												"bLengthChange" : true, //改变每页显示数据数量
												//"bFilter": true, //过滤功能
												"aoColumnDefs" : [ {
													"bSortable" : false,
												} ], // 屏蔽不需排序的列
												"bSort" : false, //排序功能
												"aaSorting" : [ [ 0, "desc" ] ],
												//"bStateSave": false, //保存当前页面信息为cookie，默认关闭
												"scrollCollapse" : true,
												//"scrollY": "400px",
												"pagingType" : "full_numbers",
												"ajax" : {
													"url" : "${pageContext.request.contextPath}/bill/checked/data_load_checking",
													"data" : function(d) {
														d.token = $("#token")
																.val();
														d.start_date = $(
																"#start").val();
														d.end_data = $("#end")
																.val();
													},
													"dataType" : "json",
													"method" : "POST"
												},
												"columns" : [
														{
															"data" : "createTime"
														},
														{
															"render" : function(
																	data, type,
																	row) {
																return row.description;
															}
														},
														{
															"render" : function(
																	data, type,
																	row) {
																return row.totalcredits
																		+ '&nbsp;金币';
															}
														},
														{
															"data" : "operator"
														},
														{
															"data" : "operatetime"
														},
														{
															//"data" : "status"
															"render" : function(
																	data, type,
																	row) {
																return '2' == row.status ? "待审核"
																		: 1 == row.status ? "已审核"
																				: "审核异常";
															}
														},
														{
															"data" : "operateResult"
														},
														{
															"render" : function(
																	data, type,
																	row) {
																if (row.status == '2') {
																	$("#day")
																			.val(
																					row.day);
																	return '<div class="text-center"><a type="button" class="btn btn-primary btn-xs" href="javascript:delay(1,'
																			+ row.id
																			+ ','
																			+ row.type
																			+ ')">通过</a>&nbsp;'
																			+ '<a type="button" class="btn btn-primary btn-xs" href="javascript:delay(2,'
																			+ row.id
																			+ ','
																			+ row.type
																			+ ')">异常</a></div>';
																} else {
																	return '';
																}
															}
														} ],
												"oLanguage" : {
													"sUrl" : "${pageContext.request.contextPath}/thirdpart_framework/jquery-datatable/language/zh_CN.json"
												}
											});
						});
	</script> </main>
</body>
</html>