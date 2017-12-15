package com.test.dao;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.beans.Station;

/**
 * Servlet implementation class StationDaoImpl
 */
@WebServlet("/StationDaoImpl")
public class StationDaoImpl implements StationDAO  {
	private static final long serialVersionUID = 1L;
       
    /**
     * @param daoFactory 
     * @see HttpServlet#HttpServlet()
     */
    public StationDaoImpl(DAOFactory daoFactory) {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

	@Override
	public void creer(Station station) throws DAOException {
		// TODO Auto-generated method stub
		
	}

}
