
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String driver = "com.mysql.jdbc.Driver";
String url = "jdbc:mysql://localhost:3306/onlinetest";
String user = "root";
String password = "";

String roll_no=request.getParameter("roll_no").trim();
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection Con =null;
Statement Stmt = null;
ResultSet RS = null;
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
            <body>
                <h1><%=roll_no%></h1>
                <table border="1">
        <tr>
        <td>Name</td>
        <td>Email</td>

        </tr>
            <%
            try{
            Con = DriverManager.getConnection(url, user, password);
            Stmt = (Statement) Con.createStatement();
            String sql ="select * from user,exam where name='"+roll_no+"' or email='"+roll_no+"' or type='"+roll_no+"'";
            RS = Stmt.executeQuery(sql);
            if(RS.next()){
            %>
        <tr>
        <td><%=RS.getString("name") %></td>
        <td><%=RS.getString("email") %></td>


        </tr>
            <%
            }
            Con.close();
            } catch (Exception e) {
            e.printStackTrace();
            }
            %>
        </table>
    </body>
</html>
