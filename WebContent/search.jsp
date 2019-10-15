<%@page import="myPackage.classes.User"%>
<%@page import="myPackage.classes.Exams" %>
<%@page import="java.util.ArrayList"%>
<jsp:useBean id="pDAO" class="myPackage.DatabaseClass" scope="page"/>
</style>
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
						<a href="adm-page.jsp?pgprt=1"><h2>Accounts</h2></a>
						<a class="active" href="adm-page.jsp?pgprt=5"><h2>Result Analysis</h2></a>
					</div>
				</div>
			</div>
  
			 <div class="content-area">
	                <div class="inner" style="margin-top: 50px">
	                
	              <%   if(request.getParameter("search").equals("1"))
	                {
	              %>
				       <table id="one-column-emphasis" >
				<colgroup>
				<col class="oce-first" />
				</colgroup>
				<thead>
				<tr>
				<th scope="col">Roll No</th>
				<th scope="col">Name</th>
				<th scope="col">Department</th>
				<th scope="col">Division</th>
				<th scope="col">View Results</th>
				</tr>
				</thead>
				<tbody>
				<%
				
				ArrayList list=(ArrayList)session.getAttribute("students");
				User user;
				
				for(int i=0;i<list.size();i++)
				{
					//user = (User)list.get(i);
					//System.out.println(user.getroll());
				}
				for(int i=0;i<list.size();i++){
					
				  user=(User)list.get(i);
				  
				 
				  if(user.getUserId()!= Integer.parseInt(session.getAttribute("userId").toString())){
					 // System.out.println(user.getroll() + " ###*");
				%>
				
				<tr>
				<td><%=user.getroll() %></td>
				<td><%=user.getFirstName()+" "+user.getLastName() %></td>
				<td><%=user.getDept() %></td>
				<td><%=user.getdiv() %></td>
				<td><a href="adm-page.jsp?pgprt=1&uid=<%=user.getUserId()%>">Details</a></td>
				</tr>
			
				
				</tbody>
				
			
            </div>
				     		
				     	</div>
				<%}
				  
				  }
				}
				
				else if(request.getParameter("search").equals("2"))
				{%>
				    <table id="one-column-emphasis" >
				<colgroup>
				<col class="oce-first" />
				</colgroup>
				<thead>
				<tr>
				<th scope="col">Roll no</th>
				<th scope="col">Name</th>
				<th scope="col">Division</th>
				<th scope="col">Course</th>
				<th scope="col">Obt Marks</th>
				<th scope="col">Status</th>
				<th scope="col">Details</th>
				</tr>
				</thead>
				
				<%
				
				ArrayList list=(ArrayList)session.getAttribute("stuIdlist");
			
				int i=0;
				int pass=0,fail=0,term=0;
				while(i<list.size()){
					
				  int eid=(int)list.get(i);
				  String sid=list.get(i+1).toString();
				  String cname=(String)list.get(i+2);
				  int obtM=(int)list.get(i+3);
				  String status=(String)list.get(i+4);
				 
				User user = pDAO.getUserDetails(sid);
				String div = (String)request.getParameter("div");
				System.out.print(div);
				 if(div.isEmpty())
				{
				%>
				<tbody>
				<tr>
				<td><%=user.getroll() %></td>
				<td><%=user.getFirstName() +" " + user.getLastName() %></td>
				<td><%=user.getdiv() %></td>
			
				<td><%=cname%></td>
				<td><%=obtM%></td>
				
				<% if(status!=null){
                if(status.equals("Pass")){ pass+=1 ;%>
                <td style="background: #00cc33;color:white"><%=status%></td>
            <% }else{ fail+=1;%>
            <td style="background: #ff3333;color:white"><%=status%></td>
            <% }
            }else{ term+=1;%>
            <td style="background: bisque ;">Terminated</td>
            <% } %>
				
				<td><a href="adm-page.jsp?pgprt=8&eid=<%=eid%>">Details</a></td>
				</tr>
			
				
				</tbody>
				 
			
            </div>
				     		
				     	</div>
				     	
	<%
				}
				 
				 else if((div.equals(user.getdiv())))
				 {
					 
				 %>
					 <tbody>
						<tr>
						<td><%=user.getroll() %></td>
						<td><%=user.getFirstName() +" " + user.getLastName() %></td>
						<td><%=user.getdiv() %></td>
					
						<td><%=cname%></td>
						<td><%=obtM%></td>
						
						<% if(status!=null){
		                if(status.equals("Pass")){ pass+=1;%>
		                <td style="background: #00cc33;color:white"><%=status%></td>
		            <% }else{ fail+=1;%>
		            <td style="background: #ff3333;color:white"><%=status%></td>
		            <% }
		            }else{ term+=1;%>
		            <td style="background: bisque ;">Terminated</td>
		            <% } %>
						
						<td><a href="adm-page.jsp?pgprt=8&eid=<%=eid%>">Details</a></td>
						</tr>
					
						
						</tbody>
						
					
		            </div>
						     		
					     	</div>
		<%	
				 }
				 
				 i=i+5;
				  }%>
				
				  </table>
				  <div class="pass" style="margin-top: -30px">Pass : <%=pass %></div>
				   <div class="fail" style="margin-top: -30px">Fail : <%=fail %></div>
				    <div class="term" style="margin-top: -30px">Terminated : <%=term %></div>
				  <% }%>
				     