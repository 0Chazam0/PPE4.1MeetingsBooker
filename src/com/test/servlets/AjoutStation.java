package com.test.servlets;

import java.io.IOException;


import javax.servlet.ServletException;

import javax.servlet.http.HttpServlet;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;

import com.test.beans.Station;


import com.test.dao.DAOFactory;

import com.test.dao.StationDAO;
import com.test.forms.AjoutStationForm;


public class AjoutStation extends HttpServlet {

    public static final String CONF_DAO_FACTORY = "daofactory";

    public static final String ATT_USER         = "utilisateur";

    public static final String ATT_FORM         = "form";

    public static final String VUE              = "/ajoutStation.jsp";


    private StationDAO  stationDao;


    public void init() throws ServletException {

        /* Récupération d'une instance de notre DAO Utilisateur */

        this.stationDao = ( (DAOFactory) getServletContext().getAttribute( CONF_DAO_FACTORY ) ).getStationDao();

    }


    public void doGet( HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException {

        /* Affichage de la page d'inscription */

        this.getServletContext().getRequestDispatcher( VUE ).forward( request, response );

    }


    public void doPost( HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException {

        /* Préparation de l'objet formulaire */

    	AjoutStationForm form = new AjoutStationForm( stationDao );


        /* Traitement de la requête et récupération du bean en résultant */

        Station station = form.ajouterStation( request );


        /* Stockage du formulaire et du bean dans l'objet request */

        request.setAttribute( ATT_FORM, form );

        request.setAttribute( ATT_USER, station );


        this.getServletContext().getRequestDispatcher( VUE ).forward( request, response );

    }

}