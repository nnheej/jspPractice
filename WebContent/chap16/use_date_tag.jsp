<%@page import="java.util.TimeZone"%>
<%@page contentType="text/html; charset=euc-kr"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head><title>formatDate tag using</title></head>
<body>
<c:set var="now" value="<%=new java.util.Date() %>"/>
<fmt:formatDate value="${now }" type="date" dateStyle="full"/><br>
<fmt:formatDate value="${now }" type="date" dateStyle="short"/><br>
<fmt:formatDate value="${now }" type="time"/> <br>
<fmt:formatDate value="${now }" type="both" dateStyle="full" timeStyle="full"/><br>
<fmt:formatDate value="${now }" pattern="z a h:mm"/><br>

홍콩시간<br>
<fmt:timeZone value="Hongkong">
<fmt:formatDate value="${now }" type="both" dateStyle="full" timeStyle="full"/>
</fmt:timeZone>
<br/>
시간대 목록 <br>
<c:forEach var="id" items="<%=TimeZone.getAvailableIDs() %>">
 ${id }<br/>
 </c:forEach>

</body>
</html>