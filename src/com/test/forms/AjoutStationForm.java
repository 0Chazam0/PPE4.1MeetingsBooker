package com.test.forms;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.jasypt.util.password.ConfigurablePasswordEncryptor;

import com.test.beans.Station;
import com.test.dao.DAOException;
import com.test.dao.StationDAO;

public final class AjoutStationForm {
    private static final String CHAMP_NomSta      = "NomSta";
    private static final String CHAMP_AdresseSta      = "AdresseSta";
    private static final String CHAMP_VilleSta      = "VilleSta";
    private static final String CHAMP_CodePostalSta        = "CodePostalSta";
    private static final String CHAMP_NbPlaceSta       = "NbPlaceSta";

    private static final String ALGO_CHIFFREMENT = "SHA-256";

    private String              resultat;
    private Map<String, String> erreurs          = new HashMap<String, String>();
    private StationDAO      StationDAO;

    public AjoutStationForm( StationDAO StationDAO ) {
        this.StationDAO = StationDAO;
    }

    public Map<String, String> getErreurs() {
        return erreurs;
    }

    public String getResultat() {
        return resultat;
    }

    public Station ajouterStation( HttpServletRequest request ) {
        String NomSta = getValeurChamp( request, CHAMP_NomSta );
        String AdresseSta = getValeurChamp( request, CHAMP_AdresseSta );
        String VilleSta = getValeurChamp( request, CHAMP_VilleSta);
        String CodePostalSta = getValeurChamp( request, CHAMP_CodePostalSta);
        String NbPlaceSta = getValeurChamp( request, CHAMP_NbPlaceSta );

        Station station = new Station();
        try {
            traiterNomSta( NomSta, station );
            traiterAdresseSta(AdresseSta, station );
            traiterVilleSta( VilleSta, station );
            traiterCodePostalSta( CodePostalSta, station );
            traiterNbPlaceSta( NbPlaceSta, station );

            if ( erreurs.isEmpty() ) {
            	StationDAO.creer( station );
                resultat = "Succès de l'ajout.";
            } else {
                resultat = "Échec de l'ajout.";
            }
        } catch ( DAOException e ) {
            resultat = "Échec de l'ajout : une erreur imprévue est survenue, merci de réessayer dans quelques instants.";
            e.printStackTrace();
        }

        return station;
    }


    private void traiterCodePostalSta( String CodePostalSta, Station station ) {
        try {
            validationCodePostalSta( CodePostalSta );
        } catch ( FormValidationException e ) {
            setErreur( CHAMP_CodePostalSta, e.getMessage() );
        }
        station.setNom( CodePostalSta );
    }

    private void traiterNomSta( String NomSta, Station station ) {
        try {
            validationNomSta( NomSta );
        } catch ( FormValidationException e ) {
            setErreur( CHAMP_NomSta, e.getMessage() );
        }
        station.setNom( NomSta );
    }

    private void traiterAdresseSta(String AdresseSta, Station station ) {
        try {
            validationAdresseSta(AdresseSta);
        } catch ( FormValidationException e ) {
            setErreur(CHAMP_AdresseSta, e.getMessage());
        }
    }

    
    private void traiterVilleSta( String VilleSta, Station station ) {
        try {
            validationVilleSta( VilleSta );
        } catch ( FormValidationException e ) {
            setErreur( CHAMP_VilleSta, e.getMessage() );
        }
        station.setNom( VilleSta );
    }
    
    private void traiterNbPlaceSta( String NbPlaceSta, Station station ) {
        try {
            validationNbPlaceSta( NbPlaceSta );
        } catch ( FormValidationException e ) {
            setErreur( CHAMP_NbPlaceSta, e.getMessage() );
        }
        station.setNom( NbPlaceSta );
    }


    /* Validation du adresse */
    private void validationAdresseSta( String AdresseSta ) throws FormValidationException {
        if ( AdresseSta != null) {
        	if(AdresseSta.length() < 10 ) {
        		 throw new FormValidationException( "Le nom d'utilisateur doit contenir au moins 10 caractères." );
        	}  
        }
    }
    
    /* Validation du nom */
    private void validationCodePostalSta( String CodePostalSta ) throws FormValidationException {
        if ( CodePostalSta != null) {
        	if(CodePostalSta.length() < 4 || CodePostalSta.length() > 6 ){
                throw new FormValidationException( "Le nom d'utilisateur doit contenir au moins 4 caractères etv 6 au plus." );
        	}
        }
    }
    
    /* Validation du code postal */
    private void validationNomSta( String nom ) throws FormValidationException {
        if ( nom != null ) {
        	if( nom.length() < 3 ) {
        		throw new FormValidationException( "Le nom d'utilisateur doit contenir au moins 3 caractères." );
        	}
        }
    }
    
    /* Validation du ville */
    private void validationVilleSta( String VilleSta ) throws FormValidationException {
        if ( VilleSta != null ) {
        	if(VilleSta.length() < 5 ) {
        		throw new FormValidationException( "Le nom d'utilisateur doit contenir au moins 5 caractères." );
        	}      
        }
    }
    
    /* Validation du Nombre de places */
    private void validationNbPlaceSta( String NbPlaceSta ) throws FormValidationException {
        if ( NbPlaceSta != null ) {
            if ( !NbPlaceSta.matches( "([0-9]{1,2}" ) ) {
                throw new FormValidationException( "Veuillez rentrer un nombre positif inférieur à 99." );
            }
        } 
    }

    
    
    /*
     * Ajoute un message correspondant au champ spécifié à la map des erreurs.
     */
    private void setErreur( String champ, String message ) {
        erreurs.put( champ, message );
    }

    /*
     * Méthode utilitaire qui retourne null si un champ est vide, et son contenu
     * sinon.
     */
    private static String getValeurChamp( HttpServletRequest request, String nomChamp ) {
        String valeur = request.getParameter( nomChamp );
        if ( valeur == null || valeur.trim().length() == 0 ) {
            return null;
        } else {
            return valeur;
        }
    }
}