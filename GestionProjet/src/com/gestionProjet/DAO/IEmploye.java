package com.gestionProjet.DAO;

import java.sql.Date;
import java.util.List;

import com.gestioProjet.Controller.tacheController;
import com.gestioProjet.entities.Employe;
import com.gestioProjet.entities.Equipe;
import com.gestioProjet.entities.Projet;
import com.gestioProjet.entities.Taches;

public interface IEmploye {

	// authentification et deconnexion 
	
	boolean authentification(String emailEmpl, String motPassEmpl);
	String getRole(String email);
	void deconnexion();
	Employe getById(int id);
	// role employee
	
	List<Taches> getTaches(int idEmpl);
	void updateTache(int id, String status, Date dateDebutTache,
			Date dateFinTache,int chargeHoraireTache,int prioriteTache,Projet projet,String descriptionTache);	
	void updateTache(int id, String status, Date dateDebutTache,
			Date dateFinTache,Employe emp);
	void updateTache(int id, String status, Date dateDebutTache,
			Date dateFinTache);
	// role chef de Projet 
	
	// -> gestion de projets 
	
	void ajouterProjet(Projet projet);
	void deleteProjet(Projet projet);
	void updateProjet(String codePro, String nomPro, String descriptionPro, int cahrgeHorairePro);
	List<Projet> getAllProjets(int idChefProjet);
	List<Projet> searchProjet(String codeProjet, String nomProjet,int idEmpl);
	Projet getByCode(String codeP);
	List<Employe> getEmpEmploye();
	// gestion des taches 
	
	List<Taches> getTaches(Projet projet);
	void affectTache(Taches tache,Employe empl);
	List<Taches> searchTache(int idTache, String status);
	Taches getTacheById(int id);
	void deleteTache(int id);
	void ajouterTache(Taches tache);
	// role administrateur
	
	// -> gestion equipes
	
	List<Equipe> getAllEquipes();
	void addEquipe(Equipe equipe);
	void deleteEquipe(Equipe equipe);
	void updateEquipe(int idEquipe, String nomEquipe, String descriptionEquipe);
	List<Equipe> searchEquipe(String nomEquipe);
	Equipe getEquipeById(int id);
	
	// -> gestion Employes
	
	List<Employe> getAllEmployes();
	void addEmploye(Employe employe);
	void deleteEmloye(Employe employe);
	void updateEmploye(int idEmpl, String nomEmpl, String prenomEmpl, String roleEmpl,
			String motPassEmpl, String emailEmpl, Date dateNaissanceEmpl, Equipe equipe );
	List<Employe> searchEmloye(String nomEmpl, String prenomEmpl,String emailEmpl);
	Employe getByEmail(String email);
	
}
