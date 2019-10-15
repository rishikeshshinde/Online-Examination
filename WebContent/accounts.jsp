
<%@page import="myPackage.classes.User"%>
<%@page import="myPackage.classes.Exams" %>
<%@page import="java.util.ArrayList"%>
<jsp:useBean id="pDAO" class="myPackage.DatabaseClass" scope="page"/>

 <script src="node_modules/tablefilter/dist/tablefilter/tablefilter.js"></script>
 
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css"> -->
          <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
           <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

 
 
<!-- SIDEBAR -->
			<div class="sidebar" style="background-image: url(sidebar-1.jpg)">
				<div class="sidebar-background" >
					<h2 class="logo-text">
						Online Examination System
					</h2>

					<div class="left-menu">
						<a  href="adm-page.jsp?pgprt=0"><h2>Profile</h2></a>
						<a href="adm-page.jsp?pgprt=2"><h2>Courses</h2></a>
                                                <a href="adm-page.jsp?pgprt=3"><h2>Questions</h2></a>
						<a class="active" href="adm-page.jsp?pgprt=1"><h2>Accounts</h2></a>
						<a href="adm-page.jsp?pgprt=5"><h2>Result Analysis</h2></a>
					</div>
				</div>
			</div>
            <!-- CONTENT AREA -->
            <div class="content-area">
            <!--  -->
            <%  if(request.getParameter("uid")==null){ %>
			
                            <div class="inner" style="margin-top: 50px">
                                <div class="title" style="margin-top: -30px">List of All Registered Students</div>
       
                                <br>
                                <br>
                                <br/>
                                <%  request.getSession().setAttribute("newUser","0");%>
                                <a href="register.jsp" class="button"><span class="add-btn" style="margin-left: 80px;">Add New Student</span></a><br><br>
           <br>
           <input class="form-control" style="width: 70%;float:right;height:30px;background-color: white;padding-left: 20px;padding-right: 20px;margin-right: 180px" id="myInput" type="text" placeholder="Search..">
           
                       <table id="one-column-emphasis"  >
    <colgroup>
    	<col class="oce-first" />
    </colgroup>
    <thead>
    	<tr>
        	<th scope="col">Name</th>
            <th scope="col">Roll No</th>
            <th scope="col">Username</th>
            <th scope="col">Password</th>
            <th scope="col">Department</th>
            <th scope="col">Division</th>
            <th scope="col">Exams Appeared</th>
            <th scope="col">Action</th>
            
        </tr>
    </thead>
    <tbody id="mytable">
           <%
              ArrayList list=pDAO.getAllUsers();
              User user;
             
              for(int i=0;i<list.size();i++){
                  user=(User)list.get(i);
                  if(user.getUserId()!= Integer.parseInt(session.getAttribute("userId").toString())){
               %>
   
    	<tr>
        	<td><%=user.getFirstName()+" "+user.getLastName() %></td>
            <td><%=user.getroll() %></td>
            <td><%=user.getUserName() %></td>
            <td><%=user.getPassword() %></td>
            <td><%=user.getDept() %></td>
            <td><%=user.getdiv() %></td>
            <td><a href="adm-page.jsp?pgprt=1&uid=<%=user.getUserId()%>">Details</a></td>
            <td><a href="controller.jsp?page=accounts&operation=del&uid=<%=user.getUserId() %>" 
                  onclick="return confirm('Are you sure you want to delete this ?');">
                <div class="delete-btn" style="max-width: 40px;font-size: 17px; padding: 3px">X</div>
                </a></td>
            
        </tr>
         
               <%
                  }
                  }
              
               %>
               
               
                </tbody>
</table>
           
    
                            </div>
                        
                        <% } else{
                        	
                       %>
                        <div class="panel" style="float: left;max-width: 900px"> 
                       <div class="title">All Results</div>
           <table id="rounded-corner">
    <thead>
    	<tr>
        	<th scope="col" class="rounded-company">Date</th>
            <th scope="col" class="rounded-q1">Course</th>
            <th scope="col" class="rounded-q2">Time</th>
            <th scope="col" class="rounded-q3">Marks</th>
            <th scope="col" class="rounded-q3">Status</th>
            <th scope="col" class="rounded-q4">Action</th>
        </tr>
    </thead>
        
    <tbody>
        
        <%
        //Displaying all results of the user who is logged in.
        	//int uId = Integer.parseInt(session.getAttribute("userId").toString());
       // System.out.println(Integer.parseInt(request.getParameter("uid")));
            ArrayList list=pDAO.getAllResultsFromExams(Integer.parseInt(request.getParameter("uid")));
            if(list.isEmpty())
            {
            	%>
            	<tr>
                <td><h3><%="No exams appeared !"%></h3></td>
              	</tr>
              	<%
            }
            
              for(int i=0;i<list.size();i++){
                Exams e=(Exams)list.get(i);
            %>
    	<tr>
            <td><%=e.getDate() %></td>
            <td><%=e.getcName() %></td>
            <td><%=e.getStartTime()+" - "+e.getEndTime()%></td>
            <td><%=e.getObtMarks() %></td>
            <% if(e.getStatus()!=null){
                if(e.getStatus().equals("Pass")){%>
                <td style="background: #00cc33;color:white"><%=e.getStatus()%></td>
            <% }else{%>
            <td style="background: #ff3333;color:white"><%=e.getStatus()%></td>
            <% }
            }else{%>
            <td style="background: bisque ;">Terminated</td>
            <% } %>
            
            <%session.setAttribute("set", "2"); %>
            <td><a href="adm-page.jsp?pgprt=8&eid=<%=e.getExamId()%>">Details</a></td>
        </tr>
       
       <% }
       %>
    </tbody>
</table>
       <%
            }
            
            
                  %>      
                        
                       </div>
                       </div>
                        <script>
$(document).ready(function(){
  $("#myInput").on("keyup", function() {
    var value = $(this).val().toLowerCase();
    $("#mytable tr").filter(function() {
      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
    });
  });
});
</script>
                      
                       			
                       
                      