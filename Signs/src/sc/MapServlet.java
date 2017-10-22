package sc;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import java.util.List;
import java.io.IOException;
/**
 * Not in use
 * 
 * Copyright 2017 RichardBradleySmith.com
 */
public class MapServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
/**
 * This doPost is not in use.
 */
protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	System.out.println("servlet " + request.getServletPath().toString() + " doPost in MapServlet.java");
	System.out.println("In MapServlet (not in use)  ");
    response.sendRedirect("home");
    return;
}
/**
 * This doGet is driven to display map locations
 */
protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	System.out.println("servlet " + request.getServletPath().toString() + " doPost in MapServlet.java");
    getServletContext().getRequestDispatcher("/maplocations.jsp").forward(request,response);
  }
}
