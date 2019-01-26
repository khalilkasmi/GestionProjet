package com.gestionProjet.HibernateUtil;

import javax.servlet.jsp.jstl.core.Config;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import com.gestioProjet.entities.Employe;
import com.gestioProjet.entities.Equipe;
import com.gestioProjet.entities.Projet;
import com.gestioProjet.entities.Taches;

public class HibernateUtil {

	private static SessionFactory factory = null;

	public static SessionFactory getFactory() {

		if (factory == null) {
			factory = new Configuration().configure()
					.addAnnotatedClass(Employe.class)
					.addAnnotatedClass(Equipe.class)
					.addAnnotatedClass(Projet.class)
					.addAnnotatedClass(Taches.class).buildSessionFactory();
			return factory;
		}else{
			return factory;
		}

	}

}
