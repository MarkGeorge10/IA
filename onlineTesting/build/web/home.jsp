<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% Class.forName("com.mysql.jdbc.Driver"); %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
    </head>
    <body>
        <h1>All Jobs!</h1>
        <a href="home.jsp">Home</a>
        <a href="applications.jsp">My Applications</a>
        <a href="logout">Log out</a>

        <div>
            
                <%
        
                    
                  if(session.getAttribute("type").equals("user")){
                     
                        String url = "jdbc:mysql://localhost:3306/onlinetest";
                        String user = "root";
                        String password = "";
                        Connection Con =null;
                        Statement Stmt = null;
                        ResultSet RS = null;

                          Con = DriverManager.getConnection(url, user, password);
                          Stmt = (Statement) Con.createStatement();
                          String query = "Select * from jobs ORDER BY id DESC";
                          RS =Stmt.executeQuery(query);
                   
                    while(RS.next()){%>
                       <h2><%if(session.getAttribute("msg")!=null){out.print(session.getAttribute("msg"));}%></h2>  
                    <div>
                        <h3><%=RS.getString("title")%></h3>
                        <h3><%=RS.getString("salary")%></h3>
                        <h3><%=RS.getString("vacances")%></h3>
                        <h3><%=RS.getString("yearsOfExperience")%></h3>
                        <h3><%=RS.getString("responsiblites")%></h3>
                        <h3><%=RS.getString("requirments")%></h3>
                        <h3><%=RS.getString("level")%></h3>
                        
                        <%int user_id = (Integer)session.getAttribute("id");%>
                        <%int hr_id = RS.getInt("hr_id");%>
                        <%int job_id = RS.getInt("id");%>
                        <% String title = RS.getString("title");%>
                        
                        <a href="apply?user_id=<%=user_id%>&job_id=<%=job_id%>&hr_id=<%=hr_id%>&title=<%=title%>">Apply</a>
                    </div><hr>   
                      
                    <%}
                      
                  }else{
                      
                      response.sendRedirect("login.jsp");
                  }     
               %>     
        </div>
       
    </body>
</html>
