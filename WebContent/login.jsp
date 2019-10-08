<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title></title>
    <link rel="stylesheet" href="login-style.css">
  </head>
  <body>
    <form method='post' action="controller.jsp">
         <input type="hidden" name="page" value="login"> 
        
<div class="login-box">
  <h1>Login</h1>
  <div class="textbox">
    <i class="fas fa-user"></i>
    <input type="text" placeholder="Username" name ="username">
  </div>

  <div class="textbox">
    <i class="fas fa-lock"></i>
    <input type="password" placeholder="Password" name="password">
  </div>

  
                                                    <% 
                                                    
                                                    //userStaus is set to -1 in controller.jsp 
                                                    
                                                        if(request.getSession().getAttribute("userStatus")!=null){
                                                            System.out.println("its called");
                                                      if(request.getSession().getAttribute("userStatus").equals("-1")){  
                                                          System.out.println("now inside");
                                                    %>
                                                    <script>alert("username or password is incorrect");</script>
                                                    <p style="color: rgba(255, 255, 51, 1);font-size: 17px">Username or Password is incorrect</p>
                                                    <br>
                                                    <%
                                                      }
                                                        }
                                                          %>

  <input type="submit" class="btn" value="Login">
</div>
  </body>
</form>
</html>
