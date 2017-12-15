package com.test.dao;

import java.util.ArrayList;

import com.test.beans.Station;
import com.test.beans.Utilisateur;

public interface StationDAO {

	void creer( Station station ) throws DAOException;

}