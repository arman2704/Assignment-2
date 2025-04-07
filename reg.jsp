<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Registration Process</title>
</head>
<body>

<%
String un = request.getParameter("un");
String pwd = request.getParameter("pwd");
String add = request.getParameter("add");
String zip = request.getParameter("zip");

Connection con = null;
PreparedStatement pstmt = null;

try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "SACHIN9838a");

    String query = "INSERT INTO user (name, password, address, zip) VALUES (?, ?, ?, ?)";
    pstmt = con.prepareStatement(query);
    pstmt.setString(1, un);
    pstmt.setString(2, pwd);
    pstmt.setString(3, add);
    pstmt.setString(4, zip);
    
    int rowsInserted = pstmt.executeUpdate();
    if (rowsInserted > 0) {
        response.sendRedirect("login.html");
    } else {
        out.println("Registration failed!");
    }
} catch (Exception e) {
    out.println("Error: " + e.getMessage());
} finally {
    if (pstmt != null) pstmt.close();
    if (con != null) con.close();
}
%>

</body>
</html>