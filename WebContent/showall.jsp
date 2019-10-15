
<%@page import="myPackage.classes.Questions"%>
<%@page import="java.util.*"%>
<jsp:useBean id="pDAO" class="myPackage.DatabaseClass" scope="page"/>

<style>

.activate-btn:hover{
        background: linear-gradient(110deg, #00902F,#00BA2F);
    color: white;
}
.activate-btn{
        background: linear-gradient(60deg, #00BA2F, #00FA2F);
        width: 70px;
        padding: 5px;
        font-size: 23px;
        border-radius: 4px;
	    text-align: center;
        color: whitesmoke;
        vertical-align: central;
    
    box-shadow: 0 4px 20px 0px rgba(0, 0, 0, 0.14), 0 7px 10px -5px rgba(0, 188, 212, 0.4);
}
</style>
<!-- SIDEBAR -->
			<div class="sidebar" style="background-image: url(sidebar-1.jpg)">
				<div class="sidebar-background" >
					<h2 class="logo-text">
						Online Examination System
					</h2>

					<div class="left-menu">
						<a href="adm-page.jsp?pgprt=0"><h2>Profile</h2></a>
						<a href="adm-page.jsp?pgprt=2"><h2>Courses</h2></a>
                        <a class="active" href="adm-page.jsp?pgprt=3"><h2>Questions</h2></a>
						<a href="adm-page.jsp?pgprt=1"><h2>Accounts</h2></a>
						<a href="adm-page.jsp?pgprt=5"><h2>Result Analysis</h2></a>
					</div>
				</div>
			</div>
            <!-- CONTENT AREA -->
            <div class="content-area" >
                <div style="text-align:center">
        <%
           if(request.getParameter("coursename")!=null){
        	   
        	   if(request.getParameter("que").equals("exam"))
        	   {
        		   
               ArrayList list=pDAO.getAllQuestions(request.getParameter("coursename"));
               String coursename = request.getParameter("coursename");
               %>
               <h2><%=coursename %></h2>
               <%
               for(int i=0;i<list.size();i++){
                   Questions question=(Questions)list.get(i);
                   if(question.getstatus().equals("y"))
                   {
                   %>
                   
                   <div class="question-panel">
						<div class="question" >
                                                    <label class="question-label"><%=i+1 %></label>
						<%=question.getQuestion() %>	
<a href="controller.jsp?page=questions&operation=delQuestion&coursename=<%=coursename%>&qid=<%=question.getQuestionId() %>" 
                      onclick="return confirm('Are you sure you want to delete this ?');" >
    <div class="delete-btn" style="position: absolute;right: 10px;top: -20px;">Delete</div></a>
                                                </div>
						<div class="answer">
                             <label class="show"><%=question.getOpt1() %></label>
							<label class="show"><%=question.getOpt2() %></label>
							<label class="show"><%=question.getOpt3() %></label>
							<label class="show"><%=question.getOpt4() %></label>
                            <label class="show-correct"><%=question.getCorrect() %></label>
						</div>
					</div>
                   
                   <%
               }
               }
        	  }
        	   else if(request.getParameter("que").equals("bank"))
        	{
        		   ArrayList list=pDAO.getBankQuestions(request.getParameter("coursename"));
        		   String coursename = request.getParameter("coursename");
        		   %><h2>Question Bank : <%=coursename %></h2>
        		   
        		   <%
        		  
                   for(int i=0;i<list.size();i++){
                       Questions question=(Questions)list.get(i);
                       
                       
                       %>
                        
                       <div class="question-panel">
    						<div class="question" >
                            <label class="question-label"><%=i+1 %></label>
    						<%=question.getQuestion() %>
    						
    						<% if(question.getstatus().equals("y"))
    						{
    							%>	
    <a href="controller.jsp?page=update&operation=delQueFromExam&qid=<%=question.getQuestionId() %>&c=<%=coursename %>" 
                          onclick="return confirm('Are you sure you want to delete this ?');" >
        <div class="delete-btn" style="position: absolute;right: 10px;top: -20px;">Delete</div></a>
        
        <%}
    						
			else if(question.getstatus().equals("n"))
			{ 
				
			%>
			<a href="controller.jsp?page=update&operation=addQueinExam&qid=<%=question.getQuestionId() %>&c=<%=coursename %>" 
                          onclick="return confirm('Are you sure you want to add this ?');" >
        <div class="activate-btn" style="position: absolute;right: 10px;top: -20px;">Add</div></a>
			
			<%} %>
        
      <%--  <span >   <a href="controller.jsp?page=questions&operation=delQuestion&qid=<%=question.getQuestionId() %>" 
                          onclick="return confirm('Are you sure you want to delete this ?');" >
        <div class="delete-btn" style="position: absolute;right: 100px;top:-20px;">delete</div></a></span> --%>
                                                    </div>
    						<div class="answer">
                                 <label class="show"><%=question.getOpt1() %></label>
    							<label class="show"><%=question.getOpt2() %></label>
    							<label class="show"><%=question.getOpt3() %></label>
    							<label class="show"><%=question.getOpt4() %></label>
                                <label class="show-correct"><%=question.getCorrect() %></label>
    						</div>
    					</div>
                       
                       <%
                   
                   }
    			   }
          } %>
          
       </div>
            </div>