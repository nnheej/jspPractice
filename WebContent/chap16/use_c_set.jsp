<%@page contentType="text/html; charset=euc-kr"%>
<%@page import="mvjsp.chap16.Member"%>
<%@page import="java.util.HashMap" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	Member member = new Member();
	HashMap<String, String> pref = new HashMap<String, String>();
	
%>
<html>
<body>
<c:set var="member" value="<%=member%>"/>
<c:set target="${member }" property="name" value="�Ѹ�"/>

<c:set var="pref" value="<%=pref %>"/>
<c:set var="favoriteColor" value="#{pref.color }"/>

ȸ���̸� : ${member.name} , 
�����ϴ� �� : ${favoriteColor}

<br/>
<c:set target="${pref}" property="color" value="red"/>

���� ���� �����ϴ� �� : ${favoriteColor }

<c:choose>
 <c:when test="false"> ...1
 </c:when>
 <c:when test="false"> ...2
 </c:when>
 <c:otherwise>  ...3
 </c:otherwise>
</c:choose>
</body>
</html>