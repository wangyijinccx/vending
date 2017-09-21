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

select.form-control {
	width: auto;
}

.p0 {
	padding: 0px;
}
</style>

<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/add_goods_validate.js"></script>
</head>

<body>
	<c:set var="currentNav" value="search"></c:set>
	<%@ include file="/common/nav.jsp"%>
	<main>
	<div class="container-fluid">
		<div class="row border-bottom padding-top-15 ">
			<div class="col-xs-4 text-left">
				<ol class="breadcrumb">
					<li><a href="#">商品</a></li>
					<li><a href="#" class="active">添加</a></li>
				</ol>
			</div>
		</div>
		<div class="row padding-15-tb">
			<div class="col-xs-12">
				<form id="form_task" class="form-horizontal"
					action="${pageContext.request.contextPath}/goods/add">
					<div class="form-group">
						<label for="inputEmail" class="col-xs-3 control-label">商品名称</label>
						<div class="col-xs-6 s">
							<input name="name" type="text" class="form-control"
								id="name" placeholder="商品名称" required="required">
						</div>
					</div>
				
					
					<div class="form-group">
						<label for="inputEmail" class="col-xs-3 control-label">原价</label>
						<div class="col-xs-6 s">
							<input name="originalPrice" type="text" class="form-control"
								id="originalPrice" placeholder="原价" required="required">
						</div>
					</div>
					
					<div class="form-group">
						<label for="inputEmail" class="col-xs-3 control-label">折扣</label>
						<div class="col-xs-6 s">
							<input name="discount" type="text" class="form-control"
								id="discount" placeholder="折扣" required="required">
						</div>
					</div>
					
					<div class="form-group">
						<label for="inputEmail" class="col-xs-3 control-label">商品数量</label>
						<div class="col-xs-6 s">
							<input name="num" type="text" class="form-control"
								id="num" placeholder="商品数量" required="required">
						</div>
					</div>
					
					<div class="form-group">
						<label for="inputPassword" class="col-xs-3  control-label">是否下架</label>
						<div class="col-xs-7">
							<select class="form-control" id="status" name="status">
								<option value="0" selected="selected">否</option>
								<option value="1">是</option>
							</select>
						</div>
					</div>
					
					
					<div class="form-group">
						<div class="col-sm-offset-2 col-xs-3 s text-center">
							<button type="submit" class="btn btn-primary" id="btn_add">创建</button>
							<a href="./published" type="reset" class="btn btn-default">返回</a>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>

	</main>

</body>
</html>
