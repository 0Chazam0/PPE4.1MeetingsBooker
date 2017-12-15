package com.test.beans;

public class Station {

	private Long 	  id;
	
    private String    nom;

    private String    adresse;

    private String    ville;
    
    private String    codePostal;
    
    private String    NbPlaces;

	public String getCodePostal() {
		return codePostal;
	}

	public void setCodePostal(String codePostal) {
		this.codePostal = codePostal;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getNbPlaces() {
		return NbPlaces;
	}

	public void setNbPlaces(String nbPlaces) {
		NbPlaces = nbPlaces;
	}

	public String getVille() {
		return ville;
	}

	public void setVille(String ville) {
		this.ville = ville;
	}

	public String getAdresse() {
		return adresse;
	}

	public void setAdresse(String adresse) {
		this.adresse = adresse;
	}

	public String getNom() {
		return nom;
	}

	public void setNom(String nom) {
		this.nom = nom;
	}
    
}