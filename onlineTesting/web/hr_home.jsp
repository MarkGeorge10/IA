
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% Class.forName("com.mysql.jdbc.Driver"); %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> HR Posted Jobs  </title>
    </head>
    <body>
        
        <h1> <%=session.getAttribute("name")%> </h1>
        <div class="container">
            <form class="form-inline" method="post" action="search.jsp">
            <input type="text" name="roll_no" class="form-control" placeholder="Search roll no..">
            <button type="submit" name="save" class="btn btn-primary">Search</button>
            </form>
        </div>
                <a href="hr_home.jsp">home</a>

        <a href="postJob.jsp">Post Job</a>
        <a href="logout">Logout</a>

        <%            
            if(session.getAttribute("type").equals("hr")){
                     
                        String url = "jdbc:mysql://localhost:3306/onlinetest";
                        String user = "root";
                        String password = "";
                        Connection Con =null;
                        Statement Stmt = null;
                        ResultSet RS = null;

                        Con = DriverManager.getConnection(url, user, password);
                        Stmt = (Statement) Con.createStatement();
                        int hrId = (Integer)session.getAttribute("id");
                        String query = "Select * from jobs where hr_id='"+hrId+"'";
                        RS =Stmt.executeQuery(query);
                   
                    while(RS.next()){%>
                        <div>

                            <h3><%=RS.getString("title")%></h3>
                            <h3><%=RS.getString("salary")%></h3>
                            <h3><%=RS.getString("vacances")%></h3>
                            <h3><%=RS.getString("yearsOfExperience")%></h3>
                            <h3><%=RS.getString("level")%></h3>
                            <h3><%=RS.getString("responsiblites")%></h3>
                            <h3><%=RS.getString("requirments")%></h3>
                            <%int hr_id = RS.getInt("hr_id");%>
                            <%int job_id = RS.getInt("id");%>

                            <a href="editJob.jsp?job_id=<%=job_id%>&hr_id=<%=hr_id%>">Edit</a>                      
                            <a href="deleteJob?job_id=<%=job_id%>&hr_id=<%=hr_id%>">Delete</a>
                            <a href="showCandidates.jsp?job_id=<%=job_id%>&hr_id=<%=hr_id%>">Show Candidates</a>

                        </div><hr>   
                      
                    <%}
                      
                  }else{
                      response.sendRedirect("hrLogin.jsp");
                  }
        
        
        %>
    </body>
</html>
