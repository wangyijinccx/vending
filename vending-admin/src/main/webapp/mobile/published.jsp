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
	<%@ include file="/common/navformobile.jsp"%>
	<main>
	<div class="container-fluid">
		<div class="row border-bottom padding-top-15 ">
		</div>
		<div class="row border-bottom padding-15-tb">
			<div class="col-xs-12 text-right">
				<div class="form-inline " role="form">
					<div class="input-group">
							<div class="input-group-addon">公司</div>
							<select class="form-control" onchange="search()"
								id="companyid" name="companyid" style="width:60%;">
								<c:forEach items="${company}" var="item">
									<option value="${item.id}">${item.company}</option>
								</c:forEach>
							</select>
						</div>
				</div>
			</div>
		</div>
		

		<!-- 模态框（Modal） -->
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">×</button>
						<h4 class="modal-title" id="myModalLabel">上货</h4>
					</div>
					<div class="modal-body">
						<input type="hidden" id='goodId'></input> <input name="num"
							type="text" class="form-control" id="num" placeholder="商品数量"
							required="required">
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭
						</button>
						<button type="button" class="btn btn-primary" id="save">
							提交更改</button>
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal-dialog -->
		</div>
		<!-- /.modal -->



		<div class="row padding-15-tb">
			<div class="col-xs-12">
				<table id="datalist"
					class="table table-striped table-bordered table-condensed">
					<thead>
						<tr>
							<th>序号</th>
							<th>商品</th>
							<th>总上架数量</th>
							<th>剩余库存</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
					</tbody>
				</table>
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
											"url" : "${pageContext.request.contextPath}/mobile/exit",
											"data" : function(d) {
												d.id = $("#companyid").val();
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
													"data" : "inventory" 
												},
												{
													"render" : function(
															data, type,
															row) {
														return  '<button class="btn btn-primary btn-xs" type="button" onclick="btn('
														+ row.id
														+ ')">编辑</button>'
													}
												}

										],
										"oLanguage" : {
											"sUrl" : "${pageContext.request.contextPath}/thirdpart_framework/jquery-datatable/language/zh_CN_mobile.json"
										}
									});

						});
		function search() {
			$('#datalist').dataTable().fnDraw();
		}

		function btn(id) {
			$("#goodId").val(id);
			$("#myModal").modal();
		}

		$("#save").click(function() {
			var num = $("#num").val();
			var goodId = $("#goodId").val();

			$.ajax({
				type : "POST",
				url : '${pageContext.request.contextPath}/goods/addnum',
				data : {
					num : num,
					goodId : goodId
				},
				error : function(request) {
					console.inf('connection error');

				},
				success : function(data) {
					if (200 == data) {
						alert('上货成功');
						$("#num").val("");
						$('#myModal').modal('hide');
						$('#datalist').dataTable().fnDraw();
						//window.location = flushurl;
					} else {
						alert('上货失败');
					}
				}
			});
		});

		$('#myModal').on('hide.bs.modal', function() {
			$("#num").val("");
		})
	</script> </main>
</body>
</html>
