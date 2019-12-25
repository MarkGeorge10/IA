<%-- 
    Document   : login
    Created on : Dec 20, 2019, 7:20:56 PM
    Author     : Ahmed
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Login</title>

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
                        <h2 class="form-title">Login</h2>
                        <form method="POST" action="loginValidate" class="register-form" id="register-form"
                              onsubmit="return checkUser();">
                          
                            <div id="ajaxGetUserServletResponse"  style="color: red"><%
                                    if(session.getAttribute("msg")!=null){
                                            out.println(session.getAttribute("msg"));
                                        }
                                %></div>
                            <div class="form-group">
                                <label for="email"><i class="zmdi zmdi-email"></i></label>
                                <input type="email" name="email" id="Email" placeholder="Your Email"/>
                            </div>
                            <div class="form-group">
                                <label for="pass"><i class="zmdi zmdi-lock"></i></label>
                                <input type="password" name="pass" id="Password" placeholder="Password"/>
                            </div>
                            
                            <div class="form-group form-button">
                                <input type="submit" name="signup" id="Signup" class="form-submit" value="Login"/>
                            </div>
                        </form>
                        
                    </div>
                    
                    <div class="signup-image">
                        <figure><img src="images/signup-image.jpg" alt="sing up image"></figure>
                        <a href="register.jsp" class="signup-image-link">Not member? Create Account</a>
                        <a href="hrLogin.jsp" class="signup-image-link">Login As HR</a>
                        <a href="hrRegister.jsp" class="signup-image-link">Sign Up As HR</a>

                    </div>
                </div>
            </div>
        </section>

    </div>

    <!-- JS -->
    <script>
        
        function checkUser(){
            if($('#Email').val() === ""){
                $('#ajaxGetUserServletResponse').text("Enter valid email");
                return false;
            }
            if($('#Password').val() === ""){
               $('#ajaxGetUserServletResponse').text("Enter valid Password");
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