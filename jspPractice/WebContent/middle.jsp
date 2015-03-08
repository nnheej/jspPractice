<%@ page contentType="text/html; charset=euc-kr"%>
<%@ page import="java.sql.*"%>

<html>
<!-- MIDDLE -->
<head>
<link type="text/css" href="css/middleStyle.css" rel="stylesheet" />
<title>ȸ�� ���</title>
</head>
<body>

	MEMBER ���̺��� ����
	<table id="memberTable">
		<tr>
			<th>name</th>
			<th>id</th>
			<th>email</th>
		</tr>
		<%
			//1. JDBC ����̹� �ε�
		//	Class.forName("com.mysql.jdbc.Driver");
			Connection conn = null;
			Statement stmt = null;
			ResultSet rs = null;

			try {
				String jdbcDriver = "jdbc:mysql://localhost:3306/test";
				String dbUser = "jspexam";
				String dbPass = "jspex";
				String query = "select * from MEMBER order by MEMBERID";

				//2. �����ͺ��̽� Ŀ�ؼ� ����
				conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);

				//3. statement ����
				stmt = conn.createStatement();

				//4. ����  ����		
				rs = stmt.executeQuery(query);

				//5. ��� ���
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
				//6. ����� statement connection ���� 
				if(rs!=null)try{rs.close();}catch(SQLException ex){}
				if(stmt!=null)try{stmt.close();}catch(SQLException ex){}
				if(conn!=null)try{conn.close();}catch(SQLException ex){}
			}
		%>
	</table>
</body>
</html>