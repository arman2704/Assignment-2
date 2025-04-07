<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Process</title>
</head>
<body>

<%
String un = request.getParameter("un");
String pwd = request.getParameter("pwd");

Connection con = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "SACHIN9838a");

    String query = "SELECT * FROM user WHERE name=? AND password=?";
    pstmt = con.prepareStatement(query);
    pstmt.setString(1, un);
    pstmt.setString(2, pwd);
    rs = pstmt.executeQuery();

    if (rs.next()) {
        response.sendRedirect("welcome.jsp");
    } else {
        response.sendRedirect("login.html");
    }
} catch (Exception e) {
    out.println("Error: " + e.getMessage());
} finally {
    if (rs != null) rs.close();
    if (pstmt != null) pstmt.close();
    if (con != null) con.close();
}
%>

</body>
</html>