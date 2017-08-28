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
			<a class="navbar-brand">西瓜妹社区</a>
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
						data-toggle="dropdown" href="#">游戏<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li class=""><a
								href="${pageContext.request.contextPath}/game/published">游戏列表</a></li>
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
