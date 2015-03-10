<%@page import="com.sun.glass.ui.Screen"%>
<%@page import="com.sun.java.swing.plaf.windows.resources.windows"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link type="text/css" href="css/mainStyle.css" rel="stylesheet" />
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>HOMEPAGE</title>
</head>
<body>
	<div class="mainDiv" width="document.body.clientWidth"
	height="document.body.clientHeight">
		<div id="top"><jsp:include page="top.jsp" flush="true" /></div>
		<div id="middle"><jsp:include page="list.jsp" flush="true" /></div>
	</div>
</body>
</html>