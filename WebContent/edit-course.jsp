<%@page import="myPackage.classes.Courses"%>
<jsp:useBean id="pDAO" class="myPackage.DatabaseClass" scope="page"/>


<% Courses course = pDAO.getCoursebyName(request.getParameter("cname"));

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
                 

			   <div class="title">Edit Course</div>
               <div class="central-div form-style-6" style="position:inherit;margin-top: 70px;" >
               
                    <form action="controller.jsp">
                        <input type="hidden" name="page" value="course"> 
                        
				<table>
					
					<tr>
						<td>
							<label>Course Name</label>
						</td>
						<td>
                               <input disabled type="text" name="cname" value="<%=course.getcName()%>" class="text" ">
                               <input  type="hidden" name="cname" value="<%=course.getcName()%> ">
						</td>
					</tr>
					<tr>
						<td>
							<label>Total Marks</label>
						</td>
						<td>
                                                    <input type="text"  name="tmarks" value="<%=course.gettMarks() %>" class="text" placeholder="100">
						</td>
					</tr>
					
					<tr>
						<td>
							<label>Exam Time</label>
						</td>
						<td>
                                                    <input type="text" name="time" value="<%=course.getTime() %>" class="text" placeholder="60MM">
						</td>
					</tr>
					<tr>
						<td>
							<center>
							
							<input type="submit" value="Done" class="button">
							</center>
						</td>
					</tr>
				</table>
			</form>
		</div>