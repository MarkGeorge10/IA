<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% Class.forName("com.mysql.jdbc.Driver"); %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Applications</title>
    </head>
    <body>
        <h1>All Applied Jobs!</h1>
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
                          int userId = (Integer)session.getAttribute("id");
                          String query = "Select * from jobs INNER JOIN applied_for_jobs ON jobs.id=applied_for_jobs.job_id where applied_for_jobs.user_id='"+userId+"'";
                          RS =Stmt.executeQuery(query);
                   
                    while(RS.next()){%>
                         
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
                        <%int exam_id = RS.getInt("hasExamId");%>
                        <% String title = RS.getString("title");%>
                           <%
                                if(RS.getInt("status") == 1){%>
                                <h4 style="color: green">Status: Viewed</h4>    
                                    <h4 style="color: green">Status: Shortlisted</h4>
                                    <a href="exam.jsp?user_id=<%=user_id%>&job_id=<%=job_id%>&exam_id=<%=exam_id%>&hr_id=<%=hr_id%>&title=<%=title%>">Start Exam</a>
                                <%} 
                                  else{%>
                                        <a style="pointer-events: none;cursor: default;" 
                                        href="exam.jsp?">Start Exam</a>
                                      <%}       
                           %>                           
                           
                    
                    </div><hr>   
                      
                    <%}
                      
                  }else{
                      
                      response.sendRedirect("login.jsp");
                  }     
               %>     
        </div>
       
    </body>
</html>
