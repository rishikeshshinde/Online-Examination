
<%@page import="myPackage.classes.User"%>
<%@page import="java.util.ArrayList"%>
<jsp:useBean id="pDAO" class="myPackage.DatabaseClass" scope="page"/>

<%
//getting the userId and checking whether admin/student and then displaying the information
           User user=pDAO.getUserDetails(session.getAttribute("userId").toString());

           if(user.getType().endsWith("admin")){
        %>
         <!-- SIDEBAR -->
			<div class="sidebar" style="background-image: url(sidebar-1.jpg)">
				<div class="sidebar-background" >
					<h2 class="logo-text">
						Online Examination System
					</h2>
					
					<div class="left-menu">
						<a class="active" href="adm-page.jsp?pgprt=0"><h2>Profile</h2></a>
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
						<a class="active" href="std-page.jsp?pgprt=0"><h2>Profile</h2></a>
						<a href="std-page.jsp?pgprt=1"><h2>Exams</h2></a>
						<a href="std-page.jsp?pgprt=2"><h2>Results</h2></a>
					</div>
				</div>
		
                       </div>
               <!-- CONTENT AREA -->
			<div class="content-area">
                            <div class="panel" style="float: left;max-width: 600px">
               <%
               String pedt= request.getAttribute("pedt").toString();
              // System.out.println("%%" + pedt);
           }
           if(request.getAttribute("pedt").toString().equals("10"))
           {
           %>
           <div class="title">Profile</div>
           <div class="profile ">
               <h2><span class="tag">Your Name</span><span class="val"><%=user.getFirstName()+" " %><%=user.getLastName() %></span><br/>
               <span class="tag">Email</span><span class="val"><%=user.getEmail() %></span><br/>
               <span class="tag">Department</span><span class="val"><%=user.getDept() %></span><br/>
               
               <%-- <span class="tag">Roll No</span><span class="val"><%=user.getroll() %></span><br/>
               <span class="tag">Division</span><span class="val"><%=user.getdiv() %></span></h2> --%>
               
               
           </div>
               <br/>
               <a href="adm-page.jsp?pgprt=7&edit=101"><span class="add-btn">Edit Profile</span></a>
           <%
           }
           
           else if(request.getAttribute("pedt").toString().equals("5"))
        	   {
        	   System.out.println( " ** " + request.getAttribute("pedt"));
        	   %>
        	   <div class="title">Profile</div>
               <div class="profile ">
                   <h2><span class="tag">Your Name</span><span class="val"><%=user.getFirstName()+" " %><%=user.getLastName() %></span><br/>
                   <span class="tag">Email</span><span class="val"><%=user.getEmail() %></span><br/>
                   <span class="tag">Department</span><span class="val"><%=user.getDept() %></span><br/>
                   
                  <span class="tag">Roll No</span><span class="val"><%=user.getroll() %></span><br/>
                   <span class="tag">Division</span><span class="val"><%=user.getdiv() %></span></h2> 
                   
                   
               </div>
               
               <br/>
               <a href="std-page.jsp?pgprt=7&edit=51"><span class="add-btn">Edit Profile</span></a>
        		<% 
        	   }
           %>
          <!--  if(request.getParameter("pedt").toString().equals("50"))
           {
               %>
                -->
               <!-- Start of Edit Form --->
              <%--  <div class="title">Edit Profile</div>
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
                                        <tr>
						<td>
							<label>Roll No</label>
						</td>
						<td>
                                                    <input type="text" name="rollno" value="<%=user.getroll() %>" class="text" placeholder="10927">
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
							<div style="text-align : center">
							
							<input type="submit" value="Done" class="button">
							</div>
						</td>
					</tr>
				</table>
			</form>
		</div>

                
               <%
           }
           %> --%>
    
        </div>
    </div>