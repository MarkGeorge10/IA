

<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% Class.forName("com.mysql.jdbc.Driver"); %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Exam Page</title>
    </head>

    <body>
        <%            
            String url = "jdbc:mysql://localhost:3306/onlinetest";
            String user = "root";
            String password = "";
            Connection Con =null;
            Statement Stmt = null;
            Statement NewStmt = null;

            ResultSet RS = null;
            
            String question ="";
            //List<Integer> allIds = new ArrayList<Integer>();

            try
            {
                Con = DriverManager.getConnection(url, user, password);
                Stmt = (Statement) Con.createStatement();
                NewStmt = (Statement) Con.createStatement();
                
                String jobId = request.getParameter("job_id");
                String user_id = request.getParameter("user_id");
                int exam_id = Integer.parseInt(request.getParameter("exam_id"));
                
                session.setAttribute("job_id",jobId );
                session.setAttribute("exam_id",jobId );
                
                String query = "SELECT * from question where exam_id='"+exam_id+"' ORDER BY RAND() LIMIT 5";
                RS =Stmt.executeQuery(query);
                out.println("<form method='post' action='saveAnswer'>");
                while(RS.next()){
                    
                    question = RS.getString("question");
                    int Qid = Integer.parseInt(RS.getString("id"));
                     
                    Statement Stmt1 = (Statement) Con.createStatement();
                    Statement NewStmt1 = (Statement) Con.createStatement();
                    ResultSet WrongAnswers = Stmt1.executeQuery("SELECT * FROM answer where(quest_id='"+Qid+"' and type=0) ORDER BY RAND() LIMIT 2;");
                    ResultSet correctAnswer = NewStmt1.executeQuery("SELECT * FROM answer where(quest_id='"+Qid+"' and type=1) ORDER BY RAND() LIMIT 1;");

                    out.println("<h2>"+question+"</h2>");
                    
                        while(WrongAnswers.next()||correctAnswer.next()){%>

                            <input type="radio" name="answer" value="<%=WrongAnswers.getInt("type")%>"><%=WrongAnswers.getString("answer")%><br>
                            <%
                                if(correctAnswer.next()){%>
                                    <input type="radio" name="answer" value="<%=correctAnswer.getInt("type")%>"><%=correctAnswer.getString("answer")%><br>                            
                                <%}
                            %>
                        <%}
                         
                }
                 out.println("<input type='submit' value='Submit'/>");
                out.println("</form>");
            }

            catch(Exception cnfe)
            {
                System.err.println("Exception: " + cnfe);
            }
        %>
        
    </body>
</html>
