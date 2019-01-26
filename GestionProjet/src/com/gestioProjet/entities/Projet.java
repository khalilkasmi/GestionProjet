package com.gestioProjet.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "projet")
public class Projet {

	@Id
	String codePro;

	@ManyToOne
	@JoinColumn(name = "idEmpl")
	private Employe employe;
	
	@Column
	String nomPro;

	public Employe getEmploye() {
		return employe;
	}

	public void setEmploye(Employe employe) {
		this.employe = employe;
	}

	@Column
	String descriptionPro;

	@Column
	int chargeHorairePro;

	/**
	 * @param codePro
	 * @param nomPro
	 * @param descriptionPro
	 * @param chargeHorairePro
	 */
	public Projet(String codePro, String nomPro, String descriptionPro,
			int chargeHorairePro) {
		super();
		this.codePro = codePro;
		this.nomPro = nomPro;
		this.descriptionPro = descriptionPro;
		this.chargeHorairePro = chargeHorairePro;
	}

	/**
	 * 
	 */
	public Projet() {
		super();
	}

	public String getCodePro() {
		return codePro;
	}

	public void setCodePro(String codePro) {
		this.codePro = codePro;
	}

	public String getNomPro() {
		return nomPro;
	}

	public void setNomPro(String nomPro) {
		this.nomPro = nomPro;
	}

	public String getDescriptionPro() {
		return descriptionPro;
	}

	public void setDescriptionPro(String descriptionPro) {
		this.descriptionPro = descriptionPro;
	}

	public int getChargeHorairePro() {
		return chargeHorairePro;
	}

	public void setChargeHorairePro(int chargeHorairePro) {
		this.chargeHorairePro = chargeHorairePro;
	}

	@Override
	public String toString() {
		return "Projet [codePro=" + codePro + ", nomPro=" + nomPro
				+ ", descriptionPro=" + descriptionPro + ", chargeHorairePro="
				+ chargeHorairePro + "]";
	}

}
