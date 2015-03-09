<%@ page contentType="text/html; charset=euc-kr"%>
<%@ page import="java.sql.*"%>

<html>
<!-- MIDDLE -->
<head>
<link type="text/css" href="css/middleStyle.css" rel="stylesheet" />
<title>회원 목록</title>
</head>
<body>

	MEMBER 테이블의 내용
	<table id="memberTable">
		<tr>
			<th>name</th>
			<th>id</th>
			<th>email</th>
		</tr>
		<%
			//1. JDBC 드라이버 로딩
		//	Class.forName("com.mysql.jdbc.Driver");
			Connection conn = null;
			Statement stmt = null;
			ResultSet rs = null;

			try {
				String jdbcDriver = "jdbc:apache:commons:dbcp:/pool";
				//String dbUser = "jspexam";
				//String dbPass = "jspex";
				String query = "select * from MEMBER order by MEMBERID";

				//2. 데이터베이스 커넥션 생성
				conn = DriverManager.getConnection(jdbcDriver);

				//3. statement 생성
				stmt = conn.createStatement();

				//4. 쿼리  실행		
				rs = stmt.executeQuery(query);

				//5. 결과 출력
				while (rs.next()) {
		%>
		<tr>
			<td><%=rs.getString("NAME")%></td>
			<td><%=rs.getString("MEMBERID")%></td>
			<td><%=rs.getString("EMAIL") %></td>
		</tr>

		<%
			}
			} catch (SQLException ex) {
				out.println(ex.getMessage());
				ex.printStackTrace();
			} finally {
				//6. 사용한 statement connection 종료 
				if(rs!=null)try{rs.close();}catch(SQLException ex){}
				if(stmt!=null)try{stmt.close();}catch(SQLException ex){}
				if(conn!=null)try{conn.close();}catch(SQLException ex){}
			}
		%>
	</table>
</body>
</html>