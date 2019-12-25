<%-- 
    Document   : register
    Created on : Dec 20, 2019, 8:10:26 PM
    Author     : Ahmed
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>HR Sign Up</title>

    <!-- Font Icon -->
    <link rel="stylesheet" href="fonts/material-icon/css/material-design-iconic-font.min.css">

    <!-- Main css -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/style.css">
</head>
<body>

    <div class="main">

        <!-- Sign up form -->
        <section class="signup">
            <div class="container">
                <div class="signup-content">
                    <div class="signup-form">
                        <h2 class="form-title">HR Sign up</h2>
                        <form method="POST" onsubmit="return checkHr();" class="register-form" id="register-form" 
                              action="hrRegisterValidation">
                            <div id="ajaxGetUserServletResponse" style="color: red"><%
                                    if(session.getAttribute("msg")!=null){
                                            out.println(session.getAttribute("msg"));
                                        }
                                %></div>

                            <div class="form-group">
                                <label for="name"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                <input type="text" name="name" id="name" placeholder="Your Name"/>
                            </div>
                            <div class="form-group">
                                <label for="email"><i class="zmdi zmdi-email"></i></label>
                                <input type="email" name="email" id="Email" placeholder="Your Email"/>
                            </div>
                            <div class="form-group">
                                <label for="pass"><i class="zmdi zmdi-lock"></i></label>
                                <input type="password" name="pass" id="Password" placeholder="Password"/>
                            </div>
                            
                            <div class="form-group">
                                <label for="name"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                <input type="text" name="company" id="company" placeholder="Company Name"/>
                            </div>
                            <div class="form-group">
                                <label for="name"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                <input type="text" name="address" id="address" placeholder="Company Address"/>
                            </div>
                            <div class="form-group">
                                <label for="name"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                <input type="text" name="industry" id="industry" placeholder="Company Industry"/>
                            </div>
                            <div class="form-group form-button">
                                <input type="submit" name="signup" id="signup" class="form-submit" value="Register"/>
                            </div>
                        </form>
                    </div>
                    
                    <div class="signup-image">
                        <figure><img src="images/signup-image.jpg" alt="sing up image"></figure>
                        <a href="hrLogin.jsp" class="signup-image-link">I am already member</a>
                    </div>
                </div>
            </div>
        </section>
    </div>
    <script>
        
        function checkHr(){
            if($('#name').val() === ""){
                $('#ajaxGetUserServletResponse').text("Enter valid name");
                return false;
            }
            if($('#Email').val() === ""){
                $('#ajaxGetUserServletResponse').text("Enter valid email");
                return false;
            }
            if($('#Password').val() === ""){
               $('#ajaxGetUserServletResponse').text("Enter valid Password");
               return false;
            }
            if($('#company').val() === ""){
               $('#ajaxGetUserServletResponse').text("Enter valid company name");
               return false;
            }
            if($('#address').val() === ""){
               $('#ajaxGetUserServletResponse').text("Enter valid address");
               return false;
            }
            if($('#industry').val() === ""){
               $('#ajaxGetUserServletResponse').text("Enter valid industry");
               return false;
            }
            return true;
        }
    </script>

    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/main.js"></script>
</body><!-- This templates was made by Colorlib (https://colorlib.com) -->
</html>