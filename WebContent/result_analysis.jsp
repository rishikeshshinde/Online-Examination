<%@page import="myPackage.classes.User"%>
<%@page import="myPackage.classes.Exams" %>
<%@page import="java.util.ArrayList"%>
<jsp:useBean id="pDAO" class="myPackage.DatabaseClass" scope="page"/>

<style>

.s_button{
 background-color: white; 
  color: black; 
  border: 2px solid #008CBA;
  padding: 16px 22px;
  margin-top:20px;
  margin-left:20px;
}
.s_button:hover{
  background-color: #008CBA;
  color: white;
   transition-duration: 0.4s;
  cursor: pointer;
  
}

</style>
<!-- SIDEBAR -->
			<div class="sidebar" style="background-image: url(sidebar-1.jpg)">
				<div class="sidebar-background" >
					<h2 class="logo-text">
						Online Examination System
					</h2>

					<div class="left-menu">
						<a  href="adm-page.jsp?pgprt=0"><h2>My Profile</h2></a>
						<a href="adm-page.jsp?pgprt=2"><h2>Courses</h2></a>
                                                <a href="adm-page.jsp?pgprt=3"><h2>Questions</h2></a>
						<a href="adm-page.jsp?pgprt=1"><h2>Accounts</h2></a>
						<a class="active" href="adm-page.jsp?pgprt=5"><h2>Result Analysis</h2></a>
					</div>
				</div>
			</div>
     <div class="content-area">
     	
     	<form action="controller.jsp">
     	
     	 <div class="panel form-style-6">
     		<table>
     			<tr>
     				<td><label>Department</label></td>
     					 <td><input type="text" name="department_name" class="text" placeholder="IT" style="width: 200px ; margin-left:10px" ></td>
   					 <td><label  style="margin-left:150px">Division </label></td>
   					     <td><input type="text" name="division_name" class="text" placeholder="TE10" style="width: 200px;margin-left:10px"></td>
     			</tr>  
     		</table>
     		
     		</div>
     		<input type="hidden" name="page" value="result_analysis">
             <input type="hidden" name="operation" value="search"> 
     		 <input type="submit" value="Search" class="s_button">
     	</form>
     			
     	
     	<form action="controller.jsp">
     	
     	 <div class="panel form-style-6">
     		<table>
     			<tr>
     				<td><label>Course</label></td>
     					 <td><input type="text" name="cname" class="text" placeholder="DBMS" style="width: 200px ; margin-left:10px" ></td>
   					 <td><label  style="margin-left:150px">Division</label></td>
   					     <td><input type="text" name="div" class="text" placeholder="TE10" style="width: 200px;margin-left:10px"></td>
     			</tr>  
     		</table>
     		
     		</div>
     		<input type="hidden" name="page" value="result_analysis">
             <input type="hidden" name="operation" value="search_course"> 
     		 <input type="submit" value="Search" class="s_button">
     	</form>
     	</div>
     
     	
     	
  	
     	
     	
     	
     	
     	<!-- <div class="content-area">
     	
     	<form action="controller.jsp">
     	
     	 <div class="panel form-style-6">
     		<table>
     			<tr>
     				<td><label>Course</label></td>
     					 <td><input type="text" name="cname" class="text" placeholder="DBMS" style="width: 200px ; margin-left:10px" ></td>
   					 <td><label  style="margin-left:150px">Division</label></td>
   					     <td><input type="text" name="div" class="text" placeholder="TE10" style="width: 200px;margin-left:10px"></td>
     			</tr>  
     		</table>
     		
     		</div>
     		<input type="hidden" name="page" value="result_analysis">
             <input type="hidden" name="operation" value="search_course"> 
     		 <input type="submit" value="Search" class="s_button">
     	</form>
     	</div> -->