package com.gestioProjet.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "equipe")
public class Equipe {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	int codeEquipe;

	@Column
	String nomEquipe;
	
	@Column
	String descriptionEquipe;

	/**
	 * @param nomEquipe
	 * @param descriptionEquipe
	 */
	public Equipe(String nomEquipe, String descriptionEquipe) {
		super();
		this.nomEquipe = nomEquipe;
		this.descriptionEquipe = descriptionEquipe;
	}

	/**
	 * 
	 */
	public Equipe() {
		super();
	}

	public int getId() {
		return codeEquipe;
	}

	public void setId(int id) {
		this.codeEquipe = id;
	}

	public String getNomEquipe() {
		return nomEquipe;
	}

	public void setNomEquipe(String nomEquipe) {
		this.nomEquipe = nomEquipe;
	}

	public String getDescriptionEquipe() {
		return descriptionEquipe;
	}

	public void setDescriptionEquipe(String descriptionEquipe) {
		this.descriptionEquipe = descriptionEquipe;
	}

	@Override
	public String toString() {
		return "Equipe [id=" + codeEquipe + ", nomEquipe=" + nomEquipe
				+ ", descriptionEquipe=" + descriptionEquipe + "]";
	}
	
	
	
}
