<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<%@ page
	import="com.ipeaksoft.moneyday.admin.util.security.SpringSecurityUtils"%>
<div class="navbar navbar-default navbar-fixed-top">
	<div class="container">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target=".navbar-collapse">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand">自助售货</a>
		</div>
		<div class="navbar-collapse collapse">
			<ul class="nav navbar-nav">
				<security:authorize ifAnyGranted="R_ADMIN">
					<li class="dropdown"><a class="dropdown-toggle"
						data-toggle="dropdown" href="#">付款<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li class=""><a
								href="${pageContext.request.contextPath}/bill/checked/list">审核订单</a></li>
						</ul></li>
				</security:authorize>
				
				<security:authorize ifAnyGranted="R_ADMIN">
					<li class="dropdown"><a class="dropdown-toggle"
						data-toggle="dropdown" href="#">公司柜台管理<span class="caret"></span></a>
						<ul class="dropdown-menu">
						<li class=""><a
								href="${pageContext.request.contextPath}/company/create">添加公司货架</a></li>
							<li class=""><a
								href="${pageContext.request.contextPath}/company/published">公司货架列表</a></li>
						</ul></li>
				</security:authorize>
				
				<security:authorize ifAnyGranted="R_ADMIN">
					<li class="dropdown"><a class="dropdown-toggle"
						data-toggle="dropdown" href="#">商品管理<span class="caret"></span></a>
						<ul class="dropdown-menu">
						<li class=""><a
								href="${pageContext.request.contextPath}/goods/create">添加商品</a></li>
							<li class=""><a
								href="${pageContext.request.contextPath}/goods/published">商品列表</a></li>
						</ul></li>
				</security:authorize>
				
			</ul>
			
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown"><%=SpringSecurityUtils.getCurrentUserName()%>
						<b class="caret"></b></a>
					<ul class="dropdown-menu">
						<li><a
							href="${pageContext.request.contextPath}/common/change_password.jsp">修改密码</a></li>
						<li><a
							href="${pageContext.request.contextPath}/j_spring_security_logout">退出</a></li>
					</ul></li>
			</ul>
		</div>
	</div>
</div>
