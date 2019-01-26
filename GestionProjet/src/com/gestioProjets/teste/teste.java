package com.gestioProjets.teste;

import java.text.ParseException;
import java.util.List;

import com.gestioProjet.entities.Taches;
import com.gestionProjet.DAO.EmployeModel;

public class teste {

	public static void main(String[] args) throws ParseException {
		// TODO Auto-generated method stub

		EmployeModel emplm = new EmployeModel();
		List<Taches> t = emplm.getTaches(3);
		
		for (Taches taches : t) {
			System.out.println(taches.toString());
		}
			
	}

}
