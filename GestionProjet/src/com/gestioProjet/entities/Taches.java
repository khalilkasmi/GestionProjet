package com.gestioProjet.entities;

import java.sql.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.Cascade;

@Entity
@Table(name = "taches")
public class Taches {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	int idTache;

	@ManyToOne
	@JoinColumn(name = "idEmpl")
	private Employe employe;
	
	@ManyToOne
	@JoinColumn(name = "codePro")
	private Projet projet;
	
	@Column(nullable = false)
	String descriptionTache;

	@Column(nullable = false)
	int chargeHoraireTache;

	@Column(nullable = false)
	int prioriteTache;

	@Column(nullable = false)
	String statusTache;

	@Column
	Date dateDebutTache;

	@Column
	Date dateFinTache;

	/**
	 * @param descriptionTache
	 * @param chargeHoraireTache
	 * @param prioriteTache
	 * @param statusTache
	 * @param dateDebutTache
	 * @param dateFinTache
	 */
	public Taches(String descriptionTache, int chargeHoraireTache,
			int prioriteTache, String statusTache, Date dateDebutTache,
			Date dateFinTache) {
		super();
		this.descriptionTache = descriptionTache;
		this.chargeHoraireTache = chargeHoraireTache;
		this.prioriteTache = prioriteTache;
		this.statusTache = statusTache;
		this.dateDebutTache = dateDebutTache;
		this.dateFinTache = dateFinTache;
	}

	/**
	 * 
	 */
	public Taches() {
		super();
	}

	
	public Employe getEmploye() {
		return employe;
	}

	public void setEmploye(Employe employe) {
		this.employe = employe;
	}

	public Projet getProjet() {
		return projet;
	}

	public void setProjet(Projet projet) {
		this.projet = projet;
	}

	public int getId() {
		return idTache;
	}

	public void setId(int id) {
		this.idTache = id;
	}

	public String getDescriptionTache() {
		return descriptionTache;
	}

	public void setDescriptionTache(String descriptionTache) {
		this.descriptionTache = descriptionTache;
	}

	public int getChargeHoraireTache() {
		return chargeHoraireTache;
	}

	public void setChargeHoraireTache(int chargeHoraireTache) {
		this.chargeHoraireTache = chargeHoraireTache;
	}

	public int getPrioriteTache() {
		return prioriteTache;
	}

	public void setPrioriteTache(int prioriteTache) {
		this.prioriteTache = prioriteTache;
	}

	public String getStatusTache() {
		return statusTache;
	}

	public void setStatusTache(String statusTache) {
		this.statusTache = statusTache;
	}

	public Date getDateDebutTache() {
		return dateDebutTache;
	}

	public void setDateDebutTache(Date dateDebutTache) {
		this.dateDebutTache = dateDebutTache;
	}

	public Date getDateFinTache() {
		return dateFinTache;
	}

	public void setDateFinTache(Date dateFinTache) {
		this.dateFinTache = dateFinTache;
	}

	@Override
	public String toString() {
		return "Taches [id=" + idTache + ", descriptionTache=" + descriptionTache
				+ ", chargeHoraireTache=" + chargeHoraireTache
				+ ", prioriteTache=" + prioriteTache + ", statusTache="
				+ statusTache + ", dateDebutTache=" + dateDebutTache
				+ ", dateFinTache=" + dateFinTache + "]";
	}

}
