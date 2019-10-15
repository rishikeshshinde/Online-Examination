
<%@page import="java.util.ArrayList"%>
<%@page import="myPackage.classes.Courses" %>
<%@page import="myPackage.classes.*" %>
<jsp:useBean id="pDAO" class="myPackage.DatabaseClass" scope="page"/>

<!-- SIDEBAR -->
			<div class="sidebar" style="background-image: url(sidebar-1.jpg)">
				<div class="sidebar-background" >
					<h2 class="logo-text">
						Online Examination System
					</h2>

					<div class="left-menu">
						<a  href="adm-page.jsp?pgprt=0"><h2>My Profile</h2></a>
						<a class="active" href="adm-page.jsp?pgprt=2"><h2>Courses</h2></a>
                                                <a href="adm-page.jsp?pgprt=3"><h2>Questions</h2></a>
						<a href="adm-page.jsp?pgprt=1"><h2>Accounts</h2></a>
						<a href="adm-page.jsp?pgprt=5"><h2>Result Analysis</h2></a>
					</div>
				</div>
			</div>
            <!-- CONTENT AREA -->
			<div class="content-area">
                            
                            <div class="panel" style="max-width: 420px;">
                                <div class="title">
                                   All Courses
                                </div>
                                <table id="one-column-emphasis" style="min-width: 400px;margin: 5px; margin-top: 35px" >
    <colgroup>
    	<col class="oce-first" />
    </colgroup>
    <thead>
    	<tr>
        	<th scope="col">Courses</th>
        	<th scope="col">Department</th>
            <th scope="col">T.Marks</th>
            <th scope="col">Time</th>
           <!--  <th scope="col">Edit</th> -->
            <th scope="col">Action</th>
            
        </tr>
    </thead>
    
                                       
        <% 
            ArrayList list=pDAO.getAllCourses();
            for(int i=0;i<list.size();i=i+1){
            	Courses course =(Courses)list.get(i);
        %>
        <tr>
        <td><%=course.getcName()%></td>
        <td><%=course.getDept() %></td>
        <td><%=course.gettMarks()%></td>
        <td><%=course.getTime()%>
       <%--  <td><a href="adm-page.jsp?pgprt=9&cname=<%=course.getcName()%>">Edit</a></td> --%>
        <td ><a  href="controller.jsp?page=courses&operation=del&cname=<%=course.getcName()%>" 
                onclick="return confirm('All the data related to course will be deleted.Are you sure you want to do this?');" class="del">
                <div class="delete-btn" style="max-width: 40px;font-size: 17px; padding: 3px">X</div>
            </a></td>
    </tr>
            <%
            }
            %>
            </table>
        </div>
        
        <!-- <div style="float : right"><input type="submit" class="form-button" value="Add" name="submit"></div> -->
   
        <div  class="panel form-style-6" style="max-width: 450px" float:right" >
           <div class="title">
                                   Add New Course
                                </div>
            <div style="text-align : center">
               <form action="controller.jsp" >
                   <br>
                   <table >
                       <tr>
                           <td><label>Course Name</label></td>
                           <td> <input type="text" name="coursename" class="text" placeholder="Course Name"  style="width: 230px;"></td>
                       </tr>
                       <tr>
                           <td><label>Department</label></td>
                           <td colspan="3"> 
                               <select name="dname" class="text">
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
                           <td><label>Total Marks</label></td>
                           <td><input type="text" name="totalmarks" class="text" placeholder="Total Marks" style="width: 230px;" ></td>
                       </tr>
                       <tr>
                           <td><label>Exam Time</label></td>
                           <td>
                                <input type="text" name="time" class="text" placeholder="MM" style="width: 230px;" >
                           </td>
                           
                       </tr>
                       <tr>
                           <td colspan="2"><input type="hidden" name="page" value="courses">
                    <input type="hidden" name="operation" value="addnew">
                       <center><input type="submit" class="form-button" value="Add" name="submit"></center></td>
                       </tr>
                   </table>

                </form>
            </div>
           
    </div>
     </div>
                       