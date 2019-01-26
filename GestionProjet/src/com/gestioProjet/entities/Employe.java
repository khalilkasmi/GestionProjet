package com.gestioProjet.entities;

import java.sql.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "employe")
public class Employe {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	int idEmpl;

	@ManyToOne
	@JoinColumn(name = "codeEquipe")
	private Equipe Equipe;

	@Column
	String nomEmpl;

	@Column
	String prenomEmpl;

	@Column(nullable = false)
	String roleEmpl;

	@Column(nullable = false)
	String motPassEmpl;

	@Column(nullable = false)
	String emailEmpl;

	@Column
	Date dateNaissanceEmpl;

	/**
	 * 
	 */
	public Employe() {
		super();
	}

	public Equipe getEquipe() {
		return Equipe;
	}

	public void setEquipe(Equipe equipe) {
		Equipe = equipe;
	}

	/**
	 * @param nomEmpl
	 * @param prenomEmpl
	 * @param roleEmpl
	 * @param motPassEmpl
	 * @param emailEmpl
	 * @param dateNaissanceEmpl
	 */
	public Employe(String nomEmpl, String prenomEmpl, String roleEmpl,
			String motPassEmpl, String emailEmpl, Date dateNaissanceEmpl) {
		super();
		this.nomEmpl = nomEmpl;
		this.prenomEmpl = prenomEmpl;
		this.roleEmpl = roleEmpl;
		this.motPassEmpl = motPassEmpl;
		this.emailEmpl = emailEmpl;
		this.dateNaissanceEmpl = dateNaissanceEmpl;
	}

	public int getId() {
		return idEmpl;
	}

	public void setId(int id) {
		this.idEmpl = id;
	}

	public String getNomEmpl() {
		return nomEmpl;
	}

	public void setNomEmpl(String nomEmpl) {
		this.nomEmpl = nomEmpl;
	}

	public String getPrenomEmpl() {
		return prenomEmpl;
	}

	public void setPrenomEmpl(String prenomEmpl) {
		this.prenomEmpl = prenomEmpl;
	}

	public String getRoleEmpl() {
		return roleEmpl;
	}

	public void setRoleEmpl(String roleEmpl) {
		this.roleEmpl = roleEmpl;
	}

	public String getMotPassEmpl() {
		return motPassEmpl;
	}

	public void setMotPassEmpl(String motPassEmpl) {
		this.motPassEmpl = motPassEmpl;
	}

	public String getEmailEmpl() {
		return emailEmpl;
	}

	public void setEmailEmpl(String emailEmpl) {
		this.emailEmpl = emailEmpl;
	}

	public Date getDateNaissanceEmpl() {
		return dateNaissanceEmpl;
	}

	public void setDateNaissanceEmpl(Date dateNaissanceEmpl) {
		this.dateNaissanceEmpl = dateNaissanceEmpl;
	}

	@Override
	public String toString() {
		return "Employe [id=" + idEmpl + ", nomEmpl=" + nomEmpl
				+ ", prenomEmpl=" + prenomEmpl + ", roleEmpl=" + roleEmpl
				+ ", motPassEmpl=" + motPassEmpl + ", emailEmpl=" + emailEmpl
				+ ", dateNaissanceEmpl=" + dateNaissanceEmpl + "]";
	}

}
