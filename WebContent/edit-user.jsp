<%@page import="myPackage.classes.User"%>
<jsp:useBean id="pDAO" class="myPackage.DatabaseClass" scope="page"/>


<% User user=pDAO.getUserDetails(session.getAttribute("userId").toString());

if(user.getType().endsWith("admin")){
%>
<!-- SIDEBAR -->
	<div class="sidebar" style="background-image: url(sidebar-1.jpg)">
		<div class="sidebar-background" >
			<h2 class="logo-text">
				Online Examination System
			</h2>

			<div class="left-menu">
				<a class="active" href="adm-page.jsp?pgprt=0"><h2>My Profile</h2></a>
				<a href="adm-page.jsp?pgprt=2"><h2>Courses</h2></a>
             <a href="adm-page.jsp?pgprt=3"><h2>Questions</h2></a>
				<a href="adm-page.jsp?pgprt=1"><h2>Accounts</h2></a>
				<a href="adm-page.jsp?pgprt=5"><h2>Result Analysis</h2></a>
			</div>
		</div>
	</div>
 <!-- CONTENT AREA -->
	<div class="content-area">
                 <div class="panel" style="float: left;max-width: 600px">
 <%
}else{
	  
    %>
    
    <!-- SIDEBAR -->
	<div class="sidebar" style="background-image: url(sidebar-1.jpg)">
		<div class="sidebar-background" >
			<h2 class="logo-text">
				Online Examination System
			</h2>
			<div class="left-menu">
				<a class="active" href="std-page.jsp?pgprt=0"><h2>My Profile</h2></a>
				<a href="std-page.jsp?pgprt=1"><h2>Exams</h2></a>
				<a href="std-page.jsp?pgprt=2"><h2>Results</h2></a>
			</div>
		</div>

            </div>
    <!-- CONTENT AREA -->
	<div class="content-area">
                 <div class="panel" style="float: left;max-width: 600px">
    <%
   /*  String pedt= request.getAttribute("pedt").toString();
    System.out.println("%%" + pedt);
    */
} 
%>
			   <div class="title">Edit Profile</div>
               <div class="central-div form-style-6" style="position:inherit;margin-top: 70px;" >
               
                    <form action="controller.jsp">
                        <input type="hidden" name="page" value="profile"> 
                        <input type="hidden" name="utype" value="<%=user.getType()%>">
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
					<% if(request.getParameter("edit").equals("51"))
						
						{
						%>
						
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
							<label>Division</label>
						</td>
						<td>
                                         
                                                    <input type="text" name="div" value="<%=user.getdiv() %>" class="text" placeholder="TE10">
						</td>
					</tr>
					<tr>
						<td>
						</td>
						<%
						}
						%>
						
						  <tr>
						<td>
							<label>Department</label>
						</td>
						<td>
                                                    <input type="text" name="dept" value="<%=user.getDept() %>" class="text" placeholder="Comp">
						</td>
					</tr>
					
						<td>
							<center>
							
							<input type="submit" value="Done" class="button">
							</center>
						</td>
					</tr>
				</table>
			</form>
		</div>