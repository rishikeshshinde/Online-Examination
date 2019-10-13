package myPackage;
import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import javax.servlet.*;


/**
 * Servlet implementation class photoprocess
 */
@WebServlet("/photoprocess")
//@MultipartConfig
@MultipartConfig(maxFileSize=1024*1024*50)

public class photoprocess extends HttpServlet {
/*	private static final long serialVersionUID = 1L;
       
    *//**
     * @see HttpServlet#HttpServlet()
     *//*
    public photoprocess() {
        super();
        // TODO Auto-generated constructor stub
    }*/

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	/*protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}
*/
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		response.setContentType("text/html);charset=ISO-8859-1");
		 DatabaseClass pDAO;
		try {
			pDAO = new DatabaseClass();
			
			System.out.print(pDAO);
		
		 if(request.getParameter("page").toString().equals("questions")){
		if(request.getParameter("operation").toString().equals("addnew")){
	    	
	    	Part photo = request.getPart("photo");
	        pDAO.addQuestion(request.getParameter("coursename"),request.getParameter("question"),
	                request.getParameter("opt1"), request.getParameter("opt2"),request.getParameter("opt3"),
	        request.getParameter("opt4"), request.getParameter("correct"),photo);
	        
	        response.sendRedirect("adm-page.jsp?pgprt=3");
	        
		}
		 }
		}
		 catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	        
	}
	
	
}
