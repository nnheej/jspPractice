<%@page import="com.sun.glass.ui.Screen"%>
<%@page import="com.sun.java.swing.plaf.windows.resources.windows"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<html>
<head>
<link type="text/css" href="css/mainStyle.css" rel="stylesheet" />
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title> HOMEPAGE </title>
</head>
<body>

<div class="mainDiv">
		<div id="top"><jsp:include page="top.jsp" flush="true" /></div>
		<div id="middle"><jsp:include page="list.jsp" flush="true" /></div>
	</div>
</body>
</html>