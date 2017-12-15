package com.test.servlets;

import java.io.IOException;


import javax.servlet.ServletException;

import javax.servlet.http.HttpServlet;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;


import com.test.beans.Utilisateur;

import com.test.dao.DAOFactory;

import com.test.dao.UtilisateurDao;



public class Connexion extends HttpServlet {
	
	   public static final String CONF_DAO_FACTORY = "daofactory";

	    public static final String ATT_USER         = "utilisateur";

	    public static final String ATT_FORM         = "form";

	    public static final String VUE              = "/connexion.jsp";
}
