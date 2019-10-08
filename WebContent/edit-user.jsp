<%@page import="myPackage.classes.User"%>
<%! User user; %>
<div class="central-div" style="top:10%">
                    <form action="controller.jsp">
                        <input type="hidden" name="page" value="profile"> 
				<table>
					
					<tr>
						<td>
							<label>First Name</label>
						</td>
						<td>
                                                    <input type="text" name="fname" value="<%=user.getFirstName() %>" class="text" placeholder="First Name">
						</td>
					</tr>
					<tr>
						<td>
							<label>Last Name</label>
						</td>
						<td>
                                                    <input type="text"  name="lname" value="<%=user.getLastName() %>" class="text" placeholder="Last Name">
						</td>
					</tr>
					
					<tr>
						<td>
							<label>User Name</label>
						</td>
						<td>
                                                    <input type="text" name="uname" value="<%=user.getUserName() %>" class="text" placeholder="User Name">
						</td>
					</tr>
					<tr>
						<td>
							<label>Email</label>
						</td>
						<td>
                                                    <input type="email" name="email" value="<%=user.getEmail() %>" class="text" placeholder="Email">
						</td>
					</tr>
					
					<tr>
						<td>
							<label>Password</label>
						</td>
						<td>
                                                    <input type="password" value="<%=user.getPassword() %>" name="pass" class="text" placeholder="Password">
						</td>
					</tr>
                                        <tr>
						<td>
							<label>Roll No</label>
						</td>
						<td>
                                                    <input type="text" name="rollno" value="<%=user.getroll() %>" class="text" placeholder="Roll No">
						</td>
					</tr>
                                        <tr>
						<td>
							<label>Department</label>
						</td>
						<td>
                                                    <input type="text" name="dept" value="<%=user.getDept() %>" class="text" placeholder="Comp">
						</td>
					</tr>
                                        <tr>
						<td>
							<label>Division</label>
						</td>
						<td>
                                                    <input type="text" name="div" value="<%=user.getdiv() %>" class="text" placeholder="TE10">
						</td>
					</tr>
					<tr>
						<td>
						</td>
						<td>
							<center>
							
							<input type="submit" value="Done" class="button">
							</center>
						</td>
					</tr>
				</table>
			</form>
		</div>