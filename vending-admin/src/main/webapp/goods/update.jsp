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
					<li><a href="#" class="active">编辑</a></li>
				</ol>
			</div>
		</div>
		<div class="row padding-15-tb">
			<div class="col-xs-12">
				<form id="form_task" class="form-horizontal"
					action="${pageContext.request.contextPath}/company/updateInfo">
					<input type="hidden" name="id" value="${company.id}" />
					<div class="form-group">
						<label for="inputEmail" class="col-xs-3 control-label">公司名称</label>
						<div class="col-xs-3 s">
							<input name=company type="text" class="form-control"
								value="${company.company}" id="company" placeholder="公司名称" >
						</div>
					</div>
					
					
					<div class="form-group">
						<label for="inputEmail" class="col-xs-3 control-label">公司地址</label>
						<div class="col-xs-3 s">
							<input name="address" type="text" class="form-control"
								value="${company.address}" id="address" placeholder="公司地址">
						</div>
					</div>
					
					<div class="form-group">
						<label for="inputEmail" class="col-xs-3 control-label">联系方式</label>
						<div class="col-xs-3 s">
							<input name="tel" type="text" class="form-control"
								value="${company.tel}" id="tel" placeholder="联系方式">
						</div>
					</div>
					
					<div class="form-group">
						<label for="inputPassword" class="col-xs-3  control-label">是否投放</label>
						<div class="col-xs-7">
							<select class="form-control" id="status" name="status">
								<option value="0"
									<c:if test = "${company.status == 0}">selected="selected"</c:if>>否</option>
								<option value="1"
									<c:if test = "${company.status == 1}">selected="selected"</c:if>>是</option>
							</select>
						</div>
					</div>
					
					
					<div class="form-group">
						<div class="col-sm-offset-2 col-xs-3 s text-center">
							<button type="submit" class="btn btn-primary" id="btn_add">保存</button>
							<button type="reset" class="btn btn-default">重置</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>

	</main>

</body>
</html>
