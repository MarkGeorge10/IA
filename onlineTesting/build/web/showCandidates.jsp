<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% Class.forName("com.mysql.jdbc.Driver"); %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> Job Candidates</title>
    </head>
    <body>
        
        <h1> <%=session.getAttribute("name")%> </h1>
        <a href="hr_home.jsp">home</a>
        <a href="postJob.jsp">Post Job</a>
        <a href="logout">Log out</a>
        <%
            
                  if(session.getAttribute("type").equals("hr")){
                     
                        String url = "jdbc:mysql://localhost:3306/onlinetest";
                        String user = "root";
                        String password = "";
                        Connection Con =null;
                        Statement Stmt = null;
                        ResultSet RS = null;
                        
                        Statement Stmt2 = null;
                        ResultSet RS2 = null;

                        Con = DriverManager.getConnection(url, user, password);
                        Stmt = (Statement) Con.createStatement();
                        Stmt2 = (Statement) Con.createStatement();
                                
                        int hrId = (Integer)session.getAttribute("id");
                        String JobId = request.getParameter("job_id");
                        
                        String query = "Select applied_for_jobs.job_id, user.name, user.email, user.id"
                                + " from applied_for_jobs INNER JOIN"
                                + " user ON applied_for_jobs.user_id=user.id "
                                + "where applied_for_jobs.job_id='"+JobId+"'";
                        RS =Stmt.executeQuery(query);
                        
                        //for exam data to be shown to hr to choose the right exam type
                        String query2 = "Select * from exam";
                        RS2 =Stmt2.executeQuery(query2);
                        List<String> examData = new ArrayList();
                        while(RS2.next()){
                        
                            examData.add(RS2.getString("id"));
                            examData.add(RS2.getString("type"));
                        }
                  
                    while(RS.next()){%>
                        <div>
                            <h3><%=RS.getString("name")%></h3>
                            <h3><%=RS.getString("email")%></h3>
                            <%int user_id = RS.getInt("id");%>
                            <%int job_id = RS.getInt("job_id");%>
                            
                            <form method="get" action="approve">
                                <input type="hidden" name="user_id" value="<%=user_id%>">
                                <input type="hidden" name="job_id" value="<%=job_id%>">
                                <select name="examType" required>
                                    <option value="">Select Exam type..</option>
                                    <%
                                        for(int i=0;i<examData.size();i=i+2){%>
                                            <option value="<%=examData.get(i)%>"><%=examData.get(i+1)%></option>
                                        <%}
                                    %>
                                </select>
                                <input type="submit"  value="Approve">
                            </form>
                                
                            <a href="reject?user_id=<%=user_id%>&job_id=<%=job_id%>">Reject</a>                      
                        </div><hr>                         
                    <%}
                      
                  }else{
                      response.sendRedirect("hrLogin.jsp");
                  }
        %>
    </body>
</html>
