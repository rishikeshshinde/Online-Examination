
<%@page import="myPackage.classes.*" %>
<%@page import="java.util.ArrayList"%>
<jsp:useBean id="pDAO" class="myPackage.DatabaseClass" scope="page"/>
<!DOCTYPE html>
<html>
<head>
	<title></title>
	<link rel="stylesheet" type="text/css" href="style.css">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
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
							<center><h2 class="user"><i class="fa fa-user-circle" aria-hidden="true"></i>
							</h2></center>
							<style type="text/css">
							.user i
							{
								font-size: 80px;
								padding: 20px;							}
							</style>
						</td>
					</tr>
					<tr>
						<td>
							<!-- <label>First Name</label> -->
						</td>
						<td>
                                                    <input type="text" name="fname" class="text" placeholder="First Name" required>
						</td>
					</tr>
					<tr>
						<td>
							<!-- <label>Last Name</label> -->
						</td>
						<td>
                                                    <input type="text"  name="lname" class="text" placeholder="Last Name" required>
						</td>
					</tr>
					
					<tr>
						<td>
							<!-- <label>User Name</label> -->
						</td>
						<td>
                                                    <input type="text" name="uname" class="text" placeholder="User Name" required>
						</td>
					</tr>
					<tr>
						<td>
							<!-- <label>Email</label> -->
						</td>
						<td>
                                                    <input type="email" name="email" class="text" placeholder="Email" required>
						</td>
					</tr>
					
					<tr>
						<td>
							<!-- <label>Password</label> -->
						</td>
						<td>
                                                    <input type="password" name="pass" class="text" placeholder="Password" required>
						</td>
					</tr>
                                        <tr>
						<td>
							<!-- <label>Roll No</label> -->
						</td>
						<td>
                                                    <input type="text" name="rollno" class="text" placeholder="Roll no." required>
						</td>
						
					</tr>
            <!--    <tr>
						<td>
							<label>Department</label>
						</td>
						<td>
                                                    <input type="text" name="dept" class="text" placeholder="Comp" required>
						</td>
	        </tr> -->
					
					
					 <tr>
                           
                           <td colspan="2"> 
                               <select name="dept" class="text">
        <% 
            ArrayList list4=pDAO.getAllDepartments();
            
            for(int i=0;i<list4.size();i=i+1){
            	Department dept = (Department)list4.get(i);
        %>
        <option value="<%=dept.getDname()%>"><%=dept.getDname()%></option>
            <%
            }
            %>
            </select>
                           </td>
                       </tr>
                       
                        <tr>
						<td>
							
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
							
							<br><input type="submit" value="Register Now" class="button">
							</div>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</body>
</html>