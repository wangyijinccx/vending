<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
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
			<div class="col-xs-2 text-left">
				<ol class="breadcrumb">
					<li><a href="#">用户管理</a></li>
					<li><a href="#" class="active">用户信息</a></li>
				</ol>
			</div>
			
		</div>
		
		<div class="row padding-15-tb">
			<div class="col-xs-12">
				<table id="datalist"
					class="table table-striped table-bordered table-condensed">
					<thead>
						<tr>
							<th>帐号</th>
							<th>姓名</th>
							<th>电话</th>
							<th>职务</th>
							<th width="63">状态</th>
						</tr>
					</thead>
					<tbody>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		$(function() {
			var table = $('#datalist').dataTable(
					{
						"bAutoWidth" : false,
						"bPaginate" : true, //是否分页。
						"bServerSide" : true,
						"bProcessing" : true,
						"searching" : true,
						"bLengthChange" : true,
						"scrollCollapse" : true,
						"order" : [ [ 0, "desc" ] ],
						//"scrollY": "400px",
						"pagingType" : "full_numbers",
						"aLengthMenu" : [ 20, 50, 100 ],
						// "sAjaxSource": "Handler.ashx?actionname=getdatalist2",
						"ajax" : {
							"url" : "${pageContext.request.contextPath}/account/Load_UserList",
							"dataType" : "json",
							"method" : "POST"
						},

						"columns" : [
								{
									"data" : "username"
								},
								{
									"data" : "linkman"
								},
								{
									"data" : "phone"
								},
								{
									"render" : function(data, type, row) {
										if (row.level == "-1") {
											return "超级管理员";
										}
										if (row.level == "0") {
											return "管理员";
										}
										if (row.level == "4") {
											return "运维人员";
										}
										return "";
									}
								},
								{
									"render" : function(data, type, row) {
										if(row.level == "-1"){
											return '';
										} 
										if (row.isValid == "1" && row.leval != "-1") {
											return '<a type="button" class="label label-success" href="${pageContext.request.contextPath}/account/delete?id=' + row.id + '">正常</a>'
										} else {
											return '<a type="button" class="label label-danger" href="${pageContext.request.contextPath}/account/activation?id=' + row.id + '">冻结</a>'
										}
									}
								}

						],
						"oLanguage" : {
							"sUrl" : "${pageContext.request.contextPath}/thirdpart_framework/jquery-datatable/language/zh_CN.json"
						}
					});

		});
		function kickOut(id) {
			$.ajax({
				type : "POST",
				url : '${pageContext.request.contextPath}/account/kickout',
				data : {
					id : id
				},
				error : function(request) {
					console.info(request);
					alert("Connection error");
				},
				success : function(data) {

					bootbox.alert({
						buttons : {
							ok : {
								label : '确定',
								className : 'btn-myStyle'
							},
							list : {
								label : '关闭',
								className : 'btn-myStyle'
							}
						},
						message : JSON.parse(data).msg,
						callback : function(e) {

						},
						title : "提示",
					});
				}
			});
		}
		function search() {
			$('#datalist').dataTable().fnDraw();
		}
	</script> </main>
</body>
</html>
