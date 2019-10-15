<%@page import="java.time.LocalTime"%>
<%@page import="myPackage.*"%>
<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="javax.servlet.*" %>
<%@page import="javax.servlet.http.*" %>

 <jsp:useBean id="pDAO" class="myPackage.DatabaseClass" scope="page"/>
 
<%
//pDAO is the instance(object) of DatabaseClass which has scope page


//login validation and set userStatus to 1 if successful else -1 and redirect to dashboard.jsp for admin/student login 

if(request.getParameter("page").toString().equals("login")){
if(pDAO.loginValidate(request.getParameter("username").toString(), request.getParameter("password").toString())){
    session.setAttribute("userStatus", "1");
    session.setAttribute("userId",pDAO.getUserId(request.getParameter("username").toString(),request.getParameter("password").toString()));
    response.sendRedirect("dashboard.jsp");
}else{
    request.getSession().setAttribute("userStatus", "-1");
    response.sendRedirect("login.jsp");
}
}else if(request.getParameter("page").toString().equals("register")){
        
        String fName =request.getParameter("fname");
        String lName =request.getParameter("lname");
        String uName=request.getParameter("uname");
        String email=request.getParameter("email");
        String pass=request.getParameter("pass");
        String rollNo =request.getParameter("rollno"); 
        String dept =request.getParameter("dept");
         String div =request.getParameter("div");
    
         
    int str = pDAO.addNewStudent(fName,lName,uName,email,pass,dept,rollNo,div);
    System.out.println("Str value :"+str);
    if(str==1)
    {
    	request.getSession().setAttribute("newUser","1");
    	 response.sendRedirect("adm-page.jsp?pgprt=1");
    }
    else 
    	{
    	request.getSession().setAttribute("newUser","5");
    	 response.sendRedirect("register.jsp");
    	 }
    
   // System.out.println(str);
   
   
    
}else if(request.getParameter("page").toString().equals("profile")){
        
        String fName =request.getParameter("fname");
        String lName =request.getParameter("lname");
        String uName=request.getParameter("uname");
        String email=request.getParameter("email");
        String pass=request.getParameter("pass");
        String rollNo =request.getParameter("rollno");
        String dept =request.getParameter("dept");
        String div =request.getParameter("div");
         String uType =request.getParameter("utype");
        int uid=Integer.parseInt(session.getAttribute("userId").toString());
    
         
    pDAO.updateStudent(uid,fName,lName,uName,email,pass,rollNo,dept,div,uType);
    response.sendRedirect("dashboard.jsp");
}
else if(request.getParameter("page").toString().equals("course")){
    
   String cname =request.getParameter("cname");
    int tmarks =Integer.parseInt(request.getParameter("tmarks"));
    String time=request.getParameter("time");

	pDAO.updateCourse(tmarks, time,cname);
	response.sendRedirect("adm-page.jsp?pgprt=2");
}

else if(request.getParameter("page").toString().equals("courses")){
    if(request.getParameter("operation").toString().equals("addnew")){
        pDAO.addNewCourse(request.getParameter("coursename"),Integer.parseInt(request.getParameter("totalmarks")),
                request.getParameter("time"));
        response.sendRedirect("adm-page.jsp?pgprt=2");
    }else if(request.getParameter("operation").toString().equals("del")){
        pDAO.delCourse(request.getParameter("cname").toString());
        response.sendRedirect("adm-page.jsp?pgprt=2");
    }
}else if(request.getParameter("page").toString().equals("accounts")){
    if(request.getParameter("operation").toString().equals("del")){
        pDAO.delUser(Integer.parseInt(request.getParameter("uid")));
        response.sendRedirect("adm-page.jsp?pgprt=1");
    }
}else if(request.getParameter("page").toString().equals("questions")){
	
    /* if(request.getParameter("operation").toString().equals("addnew")){
    	
    	Part photo = request.getPart("photo");
        pDAO.addQuestion(request.getParameter("coursename"),request.getParameter("question"),
                request.getParameter("opt1"), request.getParameter("opt2"),request.getParameter("opt3"),
        request.getParameter("opt4"), request.getParameter("correct"),photo);
        
        response.sendRedirect("adm-page.jsp?pgprt=3");
        
    } */ if(request.getParameter("operation").toString().equals("del")){
        pDAO.delCourse(request.getParameter("cname").toString());
        response.sendRedirect("adm-page.jsp?pgprt=3");
        
    }else if(request.getParameter("operation").toString().equals("delQuestion")){
        pDAO.delQuestion(Integer.parseInt(request.getParameter("qid")));
        String cname=request.getParameter("coursename");
       
        response.sendRedirect("adm-page.jsp?pgprt=4&que=exam&coursename="+cname);
        
    }
}
else if(request.getParameter("page").equals("update"))
{
	 if(request.getParameter("operation").equals("delQueFromExam"))
	 {
		pDAO.delQuestion(Integer.parseInt(request.getParameter("qid")));
		 String cname=request.getParameter("c");
		response.sendRedirect("adm-page.jsp?pgprt=4&que=bank&coursename="+cname);
	 }
	 else if(request.getParameter("operation").equals("addQueinExam")){
		 pDAO.updateStatus(Integer.parseInt(request.getParameter("qid")));
		 String cname=request.getParameter("c");
		 response.sendRedirect("adm-page.jsp?pgprt=4&que=bank&coursename="+cname);
	 }
}
else if(request.getParameter("page").toString().equals("exams"))
{
    if(request.getParameter("operation").toString().equals("startexam"))
    {
        String cName=request.getParameter("coursename");
        int userId=Integer.parseInt(session.getAttribute("userId").toString());
       // System.out.println(userId);
       //get the examId 
        int examId=pDAO.startExam(cName,userId);
        session.setAttribute("examId",examId);
        session.setAttribute("examStarted","1");
        response.sendRedirect("std-page.jsp?pgprt=1&coursename="+cName);
        
    }
 	else if(request.getParameter("operation").toString().equals("submitted"))
 	{
        try{
        String time=LocalTime.now().toString();
        int size=Integer.parseInt(request.getParameter("size"));
        int eId=Integer.parseInt(session.getAttribute("examId").toString());
        int tMarks=Integer.parseInt(request.getParameter("totalmarks"));
        session.removeAttribute("examId");
        session.removeAttribute("examStarted");
        
        for(int i=0;i<size;i++)
        {
            String question=request.getParameter("question"+i);
            String ans=request.getParameter("ans"+i);
            
            int qid=Integer.parseInt(request.getParameter("qid"+i));
            
            pDAO.insertAnswer(eId,qid,question,ans);
        }
        System.out.println(tMarks+" conn\t Size: "+size);
        pDAO.calculateResult(eId,tMarks,time,size);
        
        response.sendRedirect("std-page.jsp?pgprt=1&eid="+eId+"&showresult=1");
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        
    }
    
}
else if(request.getParameter("page").toString().equals("logout")){
    session.setAttribute("userStatus","0");
    session.removeAttribute("examId");
    session.removeAttribute("examStarted");
   
    response.sendRedirect("index.jsp");
}
else if(request.getParameter("page").toString().equals("result_analysis"))
{
	if(request.getParameter("operation").toString().equals("search"))
	{
		String dname = request.getParameter("department_name");
		String div_name = request.getParameter("division_name");
		
	
		
	ArrayList list = pDAO.getStudentsBySearch(dname, div_name);
	
	session.setAttribute("students",list);

	response.sendRedirect("adm-page.jsp?pgprt=6");
		//System.out.println(dname + div_name);
		//response.sendRedirect("accounts.jsp");
		
	}

}
%>