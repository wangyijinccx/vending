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
					<li><a href="${pageContext.request.contextPath}/bill/checked/list">审核订单</a></li>
					<li><a href="#" class="active">订单明细</a></li>
				</ol>
			</div>
            <div class="col-xs-9 text-right">
                <div class="form-group form-inline">
                    <input type="hidden" class="form-control input-lg" id="day"
                            value="${day }" />
                </div>
            </div>
		</div>
		<div class="row border-bottom padding-15-tb">
			<div class="col-xs-2 text-left ">${day }日提交</div>
			<div class="col-xs-3 text-left ">金额： 
				10 <input type="radio" name="amount" value="10">
				50 <input type="radio" name="amount" value="50">
				100 <input type="radio" name="amount" value="100">
				500 <input type="radio" name="amount" value="500">
				全部 <input type="radio" name="amount" value="">
			</div>
			
			
		</div>
		<div class="">
			<table id="datalist"
				class="table table-striped table-bordered table-condensed">
				<thead>
					<tr>
						<th class="text-center">提交时间</th>
						<th class="text-center">手机号</th>
						<th class="text-center">昵称</th>
						<th class="text-center">提现次数</th>
						<th class="text-center">兑换金额(元)</th>
						<th class="text-center">状态</th>
						<th class="text-center">操作</th>
					</tr>
				</thead>
				<tbody class="text-center">
				</tbody>
			</table>
		</div>
	</div>
	<script type="text/javascript">
		$(document).ready(function() {
			var table = $('#datalist').dataTable({
				"bAutoWidth" : false,
				"bPaginate" : true, //是否分页。
				"bServerSide" : true,
				"bProcessing" : true,
				"searching" : true,
				"bLengthChange" : true, //改变每页显示数据数量
				//"bFilter": true, //过滤功能
				"aoColumnDefs" : [ {
					"bSortable" : false,
					"aTargets" : [ 1, 2, 3, 4 ]
				} ], // 屏蔽不需排序的列
				"bSort" : true, //排序功能
				"aaSorting" : [ [ 0, "desc" ] ],
				//"bStateSave": false, //保存当前页面信息为cookie，默认关闭
				"scrollCollapse" : true,
				//"scrollY": "400px",
				"pagingType" : "full_numbers",
				"ajax" : {
					"url" : "${pageContext.request.contextPath}/bill/checked/data_load_day",
					"data" : function(d) {
						d.day = $("#day").val();
						d.amount = $("input[name='amount']:checked").val();
						d.comCount = $("input[name='comCount']:checked").val();
						d.city = $("input[name='city']").val();
					},
					"dataType" : "json",
					"method" : "POST"
				},
				"columns" : [{
					"data" : "day"
				}, {
					"data" : "mobile"
				}, {
					"data" : "nickname"
				},  {
					"data" : "cashs"
				}, {
					"data" : "amount"
				},  {
					"data" : "status"
				}, {
					"render" : function(data, type, row) {
						var str =  '<a type="button" class="btn btn-primary btn-xs" href="${pageContext.request.contextPath}/bill/checked/checking?token=' + row.id+'">查看</a>';
						return str;
					}
				} ],
				"oLanguage" : {
					"sUrl" : "${pageContext.request.contextPath}/thirdpart_framework/jquery-datatable/language/zh_CN.json"
				}
			});
			
		   
		    
		    $("input[name='amount']").click(function () {
		    	$('#datalist').dataTable().fnDraw();
		    });
		 
		});
		
		
		
	
		
		
	</script> </main>
</body>
</html>