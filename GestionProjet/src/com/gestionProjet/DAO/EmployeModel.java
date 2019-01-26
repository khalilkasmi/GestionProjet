package com.gestionProjet.DAO;

import java.sql.Date;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Restrictions;

import com.gestioProjet.Controller.tacheController;
import com.gestioProjet.entities.Employe;
import com.gestioProjet.entities.Equipe;
import com.gestioProjet.entities.Projet;
import com.gestioProjet.entities.Taches;
import com.gestionProjet.HibernateUtil.HibernateUtil;

public class EmployeModel implements IEmploye {

	private SessionFactory factory = HibernateUtil.getFactory();

	@Override
	public boolean authentification(String emailEmpl, String motPassEmpl) {
		// TODO Auto-generated method stub
		Session s = factory.getCurrentSession();
		s.beginTransaction();
		String trueMotPassEmpl = (String) s
				.createQuery(
						"select motPassEmpl from Employe where emailEmpl like :email")
				.setParameter("email", emailEmpl).getSingleResult();
		s.getTransaction().commit();
		if (motPassEmpl.equals(trueMotPassEmpl)) {
			s.close();
			return true;
		} else {
			s.close();
			return false;
		}
	}

	@Override
	public String getRole(String email) {
		// TODO Auto-generated method stub
		Session s = factory.getCurrentSession();
		s.beginTransaction();
		String roleempl = (String) s
				.createQuery(
						"select roleEmpl from Employe where emailEmpl like :email")
				.setParameter("email",email).getSingleResult();
		s.getTransaction().commit();
		s.close();
		return roleempl;
	}

	@Override
	public void deconnexion() {
		// TODO Auto-generated method stub
		factory.close();
	}

	@Override
	public List<Taches> getTaches(int idEmpl) {
		// TODO Auto-generated method stub
		Session s = factory.getCurrentSession();
		s.beginTransaction();
		List<Taches> taches = (List<Taches>) s.createQuery("from Taches where idEmpl =:i").setParameter("i",idEmpl).list();
		s.getTransaction().commit();
		s.close();
		return taches;
	}

	@Override
	public void updateTache(int id, String status, Date dateDebutTache,
			Date dateFinTache,int chargeHoraireTache,int prioriteTache,Projet projet,String descriptionTache) {
		// TODO Auto-generated method stub
		Session s = factory.getCurrentSession();
		s.beginTransaction();
		Taches tache = new Taches();
		tache = s.get(Taches.class, id);
		tache.setStatusTache(status);
		tache.setDateDebutTache(dateDebutTache);
		tache.setDateFinTache(dateFinTache);
		tache.setChargeHoraireTache(chargeHoraireTache);
		tache.setDescriptionTache(descriptionTache);
		tache.setPrioriteTache(prioriteTache);
		tache.setProjet(projet);
		
		s.save(tache);
		s.getTransaction().commit();
		s.close();
	}
	@Override
	public void updateTache(int id, String status, Date dateDebutTache,
			Date dateFinTache,Employe employe) {
		// TODO Auto-generated method stub
		Session s = factory.getCurrentSession();
		s.beginTransaction();
		Taches tache = new Taches();
		tache = s.get(Taches.class, id);
		tache.setStatusTache(status);
		tache.setDateDebutTache(dateDebutTache);
		tache.setDateFinTache(dateFinTache);
		tache.setEmploye(employe);
		s.save(tache);
		s.getTransaction().commit();
		s.close();
	}
	@Override
	public void updateTache(int id, String status, Date dateDebutTache,
			Date dateFinTache) {
		// TODO Auto-generated method stub
		Session s = factory.getCurrentSession();
		s.beginTransaction();
		Taches tache = new Taches();
		tache = s.get(Taches.class, id);
		tache.setStatusTache(status);
		tache.setDateDebutTache(dateDebutTache);
		tache.setDateFinTache(dateFinTache);
		s.save(tache);
		s.getTransaction().commit();
		s.close();
	}

	@Override
	public void ajouterProjet(Projet projet) {
		// TODO Auto-generated method stub
		Session s = factory.getCurrentSession();
		s.beginTransaction();
		s.save(projet);
		s.getTransaction().commit();
		s.close();
	}

	@Override
	public void deleteProjet(Projet projet) {
		// TODO Auto-generated method stub
		Session s = factory.getCurrentSession();
		s.beginTransaction();
		s.delete(projet);
		s.getTransaction().commit();
		s.close();
	}

	@Override
	public void updateProjet(String codePro, String nomPro,
			String descriptionPro, int cahrgeHorairePro) {
		// TODO Auto-generated method stub
		Session s = factory.getCurrentSession();
		s.beginTransaction();
		Projet projet = s.get(Projet.class, codePro);
		projet.setNomPro(nomPro);
		projet.setDescriptionPro(descriptionPro);
		projet.setChargeHorairePro(cahrgeHorairePro);
		s.save(projet);
		s.getTransaction().commit();
		s.close();
	}

	@Override
	public List<Projet> getAllProjets(int idChefProjet) {
		// TODO Auto-generated method stub
		Session s = factory.getCurrentSession();
		s.beginTransaction();
		List<Projet> projets = (List<Projet>) s
				.createQuery("from Projet where idEmpl = :id ")
				.setParameter("id", idChefProjet).list();
		s.getTransaction().commit();
		s.close();
		return projets;
	}

	@Override
	public List<Projet> searchProjet(String codeProjet, String nomProjet,int idEmpl) {
		// TODO Auto-generated method stub
		Session s = factory.getCurrentSession();
		s.beginTransaction();
		List<Projet> projets = (List<Projet>) s.createQuery("from Projet where idEmpl =:ide and codePro like :codep  or nomPro like :nomp  ").setParameter("ide",idEmpl).setParameter("codep","%"+codeProjet+"%").setParameter("nomp","%"+nomProjet+"%").list();
		s.getTransaction().commit();
		s.close();
		return projets;
	}

	@Override
	public List<Taches> getTaches(Projet projet) {
		// TODO Auto-generated method stub
		Session s = factory.getCurrentSession();
		s.beginTransaction();
		List<Taches> taches = (List<Taches>)s.createQuery("from Taches where codePro =:code").setParameter("code",projet.getCodePro()).list();
		s.getTransaction().commit();
		s.close();
		return taches;
	}

	@Override
	public void affectTache(Taches tache, Employe empl) {
		// TODO Auto-generated method stub
		Session s = factory.getCurrentSession();
		s.beginTransaction();
		tache.setEmploye(empl);
		s.save(tache);
		s.getTransaction().commit();
		s.close();
	}

	@Override
	public List<Taches> searchTache(int idTache, String status) {
		// TODO Auto-generated method stub
		Session s = factory.getCurrentSession();
		s.beginTransaction();
		@SuppressWarnings("deprecation")
		Criteria criteria = s.createCriteria(Taches.class);
		Criterion critereId = Restrictions.idEq(idTache);
		Criterion critereStatus = Restrictions.ilike("statusTache", status);
		criteria.add(critereId);
		criteria.add(critereStatus);
		List<Taches> taches = (List<Taches>) criteria.list();
		s.getTransaction().commit();
		s.close();
		return taches;
	}

	@Override
	public List<Equipe> getAllEquipes() {
		// TODO Auto-generated method stub
		Session s = factory.getCurrentSession();
		s.beginTransaction();
		List<Equipe> equipes = (List<Equipe>) s.createQuery("from Equipe")
				.list();
		s.getTransaction().commit();
		s.close();
		return equipes;
	}

	@Override
	public void addEquipe(Equipe equipe) {
		// TODO Auto-generated method stub
		Session s = factory.getCurrentSession();
		s.beginTransaction();
		s.save(equipe);
		s.getTransaction().commit();
		s.close();
	}

	@Override
	public void deleteEquipe(Equipe equipe) {
		// TODO Auto-generated method stub
		Session s = factory.getCurrentSession();
		s.beginTransaction();
		s.delete(equipe);
		s.getTransaction().commit();
		s.close();
	}

	@Override
	public void updateEquipe(int idEquipe, String nomEquipe,
			String descriptionEquipe) {
		// TODO Auto-generated method stub
		Session s = factory.getCurrentSession();
		s.beginTransaction();
		Equipe equipe = s.get(Equipe.class, idEquipe);
		equipe.setNomEquipe(nomEquipe);
		equipe.setDescriptionEquipe(descriptionEquipe);
		s.save(equipe);
		s.getTransaction().commit();
		s.close();
	}

	@Override
	public List<Equipe> searchEquipe(String nomEquipe) {
		// TODO Auto-generated method stub
		Session s = factory.getCurrentSession();
		s.beginTransaction();
		List<Equipe> equipes = (List<Equipe>) s.createQuery("from Equipe where nomEquipe like :nom").setParameter("nom","%"+nomEquipe+"%").list();
		s.getTransaction().commit();
		s.close();
		return equipes;
	}

	@Override
	public List<Employe> getAllEmployes() {
		// TODO Auto-generated method stub
		Session s = factory.getCurrentSession();
		s.beginTransaction();
		List<Employe> employes = (List<Employe>) s.createQuery("from Employe")
				.list();
		s.getTransaction().commit();
		s.close();
		return employes;
	}

	@Override
	public void addEmploye(Employe employe) {
		// TODO Auto-generated method stub
		Session s = factory.getCurrentSession();
		s.beginTransaction();
		s.save(employe);
		s.getTransaction().commit();
		s.close();
	}

	@Override
	public void deleteEmloye(Employe employe) {
		// TODO Auto-generated method stub
		Session s = factory.getCurrentSession();
		s.beginTransaction();
		s.delete(employe);
		s.getTransaction().commit();
		s.close();
	}

	@Override
	public void updateEmploye(int idEmpl, String nomEmpl, String prenomEmpl,
			String roleEmpl, String motPassEmpl, String emailEmpl,
			Date dateNaissanceEmpl,Equipe equipe) {
		// TODO Auto-generated method stub
		Session s = factory.getCurrentSession();
		s.beginTransaction();
		Employe employe = s.get(Employe.class, idEmpl);
		employe.setNomEmpl(nomEmpl);
		employe.setPrenomEmpl(prenomEmpl);
		employe.setRoleEmpl(roleEmpl);
		employe.setMotPassEmpl(motPassEmpl);
		employe.setEmailEmpl(emailEmpl);
		employe.setDateNaissanceEmpl(dateNaissanceEmpl);
		employe.setEquipe(equipe);
		s.getTransaction().commit();
		s.close();
	}

	@Override
	public List<Employe> searchEmloye(String nomEmpl,
			String prenomEmpl,String emailEmpl) {
		// TODO Auto-generated method stub
		Session s = factory.getCurrentSession();
		s.beginTransaction();
		List<Employe> employes = (List<Employe>) s.createQuery("from Employe"
				+ " where emailEmpl like :email or nomEmpl like :nom or prenomEmpl like :prenom").
		setParameter("email","%"+emailEmpl+"%").setParameter("nom","%"+nomEmpl+"%").setParameter("prenom","%"+prenomEmpl+"%").list();
		s.getTransaction().commit();
		s.close();
		return employes;
	}

	@Override
	public Employe getByEmail(String email) {
		// TODO Auto-generated method stub
		Session s = factory.getCurrentSession();
		s.beginTransaction();
		@SuppressWarnings("deprecation")
		Criteria criteria = s.createCriteria(Employe.class);
		Criterion critereEmail = Restrictions.ilike("emailEmpl", email);
		criteria.add(critereEmail);
		Employe employe = (Employe) criteria.uniqueResult();
		s.getTransaction().commit();
		s.close();
		return employe;
	}

	@Override
	public Projet getByCode(String codeP) {
		// TODO Auto-generated method stub
		Session s = factory.getCurrentSession();
		s.beginTransaction();
		Projet p = (Projet) s.createQuery("from Projet where codePro =:code").setParameter("code",codeP).getSingleResult();
		s.getTransaction().commit();
		s.close();
		return p;
	}

	@Override
	public Taches getTacheById(int id) {
		// TODO Auto-generated method stub
		Session s = factory.getCurrentSession();
		s.beginTransaction();
		Taches p = s.get(Taches.class,id);
		s.getTransaction().commit();
		s.close();
		return p;
	}

	@Override
	public void deleteTache(int id) {
		// TODO Auto-generated method stub
		Session s = factory.getCurrentSession();
		s.beginTransaction();
		Taches p = s.get(Taches.class,id);
		s.delete(p);
		s.getTransaction().commit();
		s.close();
	}

	@Override
	public Employe getById(int id) {
		// TODO Auto-generated method stub
		Session s = factory.getCurrentSession();
		s.beginTransaction();
		Employe employe = (Employe) s.createQuery("from Employe where idEmpl =:id").setParameter("id",id).getSingleResult();	
		s.getTransaction().commit();
		s.close();
		return employe;
	}

	@Override
	public void ajouterTache(Taches tache) {
		// TODO Auto-generated method stub
		Session s = factory.getCurrentSession();
		s.beginTransaction();
		s.save(tache);
		s.getTransaction().commit();
		s.close();
	}

	@Override
	public Equipe getEquipeById(int id) {
		// TODO Auto-generated method stub
		Session s = factory.getCurrentSession();
		s.beginTransaction();
		Equipe e = (Equipe) s.createQuery("from Equipe where codeEquipe =:id ").setParameter("id", id).uniqueResult();
		s.getTransaction().commit();
		s.close();
		return e;
	}

	@Override
	public List<Employe> getEmpEmploye() {
		// TODO Auto-generated method stub
		Session s = factory.getCurrentSession();
		s.beginTransaction();
		List<Employe> e = (List<Employe>) s.createQuery("from Employe where roleEmpl = 'Employe' ").list();
		s.getTransaction().commit();
		s.close();
		return e;
	}
	

}
