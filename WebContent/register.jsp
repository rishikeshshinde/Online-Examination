<!DOCTYPE html>
<html>
<head>
	<title></title>
	<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
	<div style="text-align : center">
	
	
		<div class="central-div" style="top:10%">
                    <form action="controller.jsp">
                        <input type="hidden" name="page" value="register">
      <% 
    //  request.getSession().setAttribute("newUser", "0");
      System.out.println(request.getSession().getAttribute("newUser"));
                                                        if(request.getSession().getAttribute("newUser")!=null){
                                                            System.out.println("registering...");
                                                      if(request.getSession().getAttribute("newUser").equals("5")){  
                                                          System.out.println("username taken");
                                                    %>
                                                    <script>alert("Username is already taken");</script>
                                                   
                                                    <%
                                                      }
                                                        }
                                                          %>
                                                    
				<table>
					<tr>
						<td colspan="2">
							<center><h2>Register New User</h2></center>
						</td>
					</tr>
					<tr>
						<td>
							<label>First Name</label>
						</td>
						<td>
                                                    <input type="text" name="fname" class="text" placeholder="First Name" required>
						</td>
					</tr>
					<tr>
						<td>
							<label>Last Name</label>
						</td>
						<td>
                                                    <input type="text"  name="lname" class="text" placeholder="Last Name" required>
						</td>
					</tr>
					
					<tr>
						<td>
							<label>User Name</label>
						</td>
						<td>
                                                    <input type="text" name="uname" class="text" placeholder="User Name" required>
						</td>
					</tr>
					<tr>
						<td>
							<label>Email</label>
						</td>
						<td>
                                                    <input type="email" name="email" class="text" placeholder="Email" required>
						</td>
					</tr>
					
					<tr>
						<td>
							<label>Password</label>
						</td>
						<td>
                                                    <input type="password" name="pass" class="text" placeholder="Password" required>
						</td>
					</tr>
                                        <tr>
						<td>
							<label>Roll No</label>
						</td>
						<td>
                                                    <input type="text" name="rollno" class="text" placeholder="10927" required>
						</td>
					</tr>
                                        <tr>
						<td>
							<label>Department</label>
						</td>
						<td>
                                                    <input type="text" name="dept" class="text" placeholder="Comp" required>
						</td>
					</tr>
                                        <tr>
						<td>
							<label>Division</label>
						</td>
						<td>
                                                    <input type="text" name="div" class="text" placeholder="TE10" required>
						</td>
					</tr>
					
					<tr>
						<td>
						</td>
						<td>
							<div style="text-align : center">
							
							<input type="submit" value="Register Now" class="button">
							</div>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</body>
</html>