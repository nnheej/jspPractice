<%@ page contentType="text/html; charset=euc-kr"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.SQLException"%>
<%
	String idValue = request.getParameter("id");

Connection conn = null;
PreparedStatement pstmtItem = null;
PreparedStatement pstmtDetail = null;

String jdbcDriver = "jdbc:mysql://localhost:3306/test?"
		+"useUnicode=true&characterEncoding=euckr";
String dbUser = "jspexam";
String dbPass = "jspex";

Throwable occuredException = null;

try{
	int id  = Integer.parseInt(idValue);
	
	conn = DriverManager.getConnection(jdbcDriver,dbUser,dbPass);
	conn.setAutoCommit(false); //transcation start
	
	pstmtItem = conn.prepareStatement("insert into ITEM values(?,?)");
	pstmtItem.setInt(1, id);
	pstmtItem.setString(2,"상품 이름"+id);
	pstmtItem.executeUpdate();
	
	if(request.getParameter("error")!=null){
		throw new Exception("의도적 익셉션 발생");
	}
	pstmtDetail = conn.prepareStatement("insert into ITEM_DETAIL values(?,?)");
	pstmtDetail.setInt(1, id);
	pstmtDetail.setString(2, "상세설명"+id);
	pstmtDetail.executeUpdate();
	
	conn.commit();
}catch(Throwable e){
	if(conn!=null){
		try{
	conn.rollback();
		}catch(SQLException ex){}
		}
	occuredException = e;
}finally{
	if(pstmtItem !=null)
		try{pstmtItem.close();}catch(SQLException ex){}
	if(pstmtDetail !=null)
		try{pstmtDetail.close();}catch(SQLException ex){}
	if(conn!=null)try{conn.close();}catch(SQLException ex){}
}
%>
<html>
<head><title>item insert</title></head>
<body>
<%if(occuredException !=null){%>
	에러가 발생하였슴: <%=occuredException.getMessage()%>
<% }else{%>
데이터가 성공적으로 들어감
<% } %>

</body>
</html>