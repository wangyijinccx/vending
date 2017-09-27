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
					<li><a href="#">商品</a></li>
					<li><a href="#" class="active">列表</a></li>
				</ol>
			</div>
			<div class="col-xs-9 text-right">
				<div class="form-group form-inline">
					<input type="hidden" class="form-control input-lg" id="companyId"
						value="${company.id }" />
					<input type="hidden" id='goodId'></input>
				</div>
			</div>
		</div>

		<div class="row border-bottom padding-15-tb">
			<div class="col-xs-6 text-left ">${company.company }</div>

			<div class="col-xs-6 text-right ">
				<button id="btn_collect_button" type="button" onclick=""
					class="btn btn-success">一键添加</button>
			</div>
		</div>

		

		<div>

			<div class="row padding-15-tb" style="float: left; width: 50%">
				<div class="col-xs-12">
					<table id="datalist"
						class="table table-striped table-bordered table-condensed">
						<thead>
							<tr>
								<th>已上架</th>
								<th>商品</th>
								<th>总上架数量</th>
								<th>总销售数量</th>
								<th>剩余库存</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody>
						</tbody>
					</table>
				</div>
			</div>


			<div class="row padding-15-tb" style="float: right; width: 50%">
				<div class="col-xs-12">
					<table id="datalist2"
						class="table table-striped table-bordered table-condensed">
						<thead>
							<tr>
								<th>未上架</th>
								<th>商品</th>
								<th>数量</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
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
												"bLengthChange" : true,
												"scrollCollapse" : true,
												"order" : [ [ 0, "desc" ] ],
												//"scrollY": "400px",
												"pagingType" : "full_numbers",
												"aLengthMenu" : [ 20, 50, 100 ],
												// "dom": '<"toolbar">frtip',
												// "sAjaxSource": "Handler.ashx?actionname=getdatalist2",
												"ajax" : {
													"url" : "${pageContext.request.contextPath}/companygoods/data_exit",
													"data" : function(d) {
														d.id = $("#companyId").val();
													},
													"dataType" : "json",
													"method" : "POST"
												},
												"columns" : [
														{
															"data" : "id"
														},
														{
															"data" : "name"
														},
														{
															"data" : "num"
														},
														{
															"data" : "snum" 
														},
														{
															"data" : "inventory" 
														},
														{
															"render" : function(
																	data, type,
																	row) {
																return  '<button class="btn btn-primary btn-xs" type="button" onclick="down('
																+ row.id
																+ ')">下架</button>'
																		
															}
														}

												],
												"oLanguage" : {
													"sUrl" : "${pageContext.request.contextPath}/thirdpart_framework/jquery-datatable/language/zh_CN_goods.json"
												}
											});

							var table2 = $('#datalist2')
									.dataTable(
											{
												"bAutoWidth" : false,
												"bPaginate" : true, //是否分页。
												"bServerSide" : true,
												"bProcessing" : true,
												"searching" : false,
												"bLengthChange" : true,
												"scrollCollapse" : true,
												"order" : [ [ 0, "desc" ] ],
												//"scrollY": "400px",
												"pagingType" : "full_numbers",
												"aLengthMenu" : [ 20, 50, 100 ],
												// "dom": '<"toolbar">frtip',
												// "sAjaxSource": "Handler.ashx?actionname=getdatalist2",
												"ajax" : {
													"url" : "${pageContext.request.contextPath}/companygoods/data_nothave",
													"data" : function(d) {
														d.id = $("#companyId").val();
													},
													"dataType" : "json",
													"method" : "POST"
												},
												"columns" : [
														{
															"data" : "id"
														},
														{
															"data" : "name"
														},
														{
															"data" : "num"
														},
														{
															"render" : function(
																	data, type,
																	row) {
																return  '<button class="btn btn-primary btn-xs" type="button" onclick="shelves('
																		+ row.id
																		+ ')">上架</button>'
															}
														}

												],
												"oLanguage" : {
													"sUrl" : "${pageContext.request.contextPath}/thirdpart_framework/jquery-datatable/language/zh_CN_goods.json"
												}
											})

						});
		function search() {
			$('#datalist').dataTable().fnDraw();
		}

		function shelves(id) {
			var companyId = $("#companyId").val();

			$.ajax({
				type : "POST",
				url : '${pageContext.request.contextPath}/companygoods/shelves',
				
				data : {
					goodId : id,
					companyId : companyId
				},
				dataType:"json",
				error : function(request) {
					console.inf('connection error');

				},
				success : function(data) {
					if (200 == data.status) {
						alert(data.msg);
						$('#datalist2').dataTable().fnDraw();
						$('#datalist').dataTable().fnDraw();
					} else {
						alert(data.msg);
					}
				}
			});
		}
		
		function down(id) {
			var companyId = $("#companyId").val();

			$.ajax({
				type : "POST",
				url : '${pageContext.request.contextPath}/companygoods/down',
				
				data : {
					goodId : id,
					companyId : companyId
				},
				dataType:"json",
				error : function(request) {
					console.inf('connection error');

				},
				success : function(data) {
					if (200 == data.status) {
						alert(data.msg);
						$('#datalist2').dataTable().fnDraw();
						$('#datalist').dataTable().fnDraw();
					} else {
						alert(data.msg);
					}
				}
			});
		}


		
	</script> </main>
</body>
</html>
