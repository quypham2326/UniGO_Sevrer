package com.unistart.entities;
// Generated Oct 1, 2017 10:03:30 PM by Hibernate Tools 4.3.1.Final

import java.util.HashSet;
import java.util.List;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlTransient;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

/**
 * Mbtigroup generated by hbm2java
 */
@Entity
@Table(name = "MBTIGroup", schema = "dbo", catalog = "University")
@JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
public class Mbtigroup implements java.io.Serializable {

	private Integer id;
	private String mbtigroupName;
	private Boolean isActive;
	private Set<Mbtiquestion> mbtiquestions = new HashSet<Mbtiquestion>(0);

	public Mbtigroup() {
	}

	public Mbtigroup(Integer id) {
		this.id = id;
	}


	public Mbtigroup(Integer id, String mbtigroupName, Boolean isActive, Set<Mbtiquestion> mbtiquestions) {
		this.id = id;
		this.mbtigroupName = mbtigroupName;
		this.isActive = isActive;
		this.mbtiquestions = mbtiquestions;
	}

	@Id

	@Column(name = "Id", unique = true, nullable = false)
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@Column(name = "MBTIGroupName")
	public String getMbtigroupName() {
		return this.mbtigroupName;
	}

	public void setMbtigroupName(String mbtigroupName) {
		this.mbtigroupName = mbtigroupName;
	}

	@Column(name = "isActive")
	public Boolean getIsActive() {
		return this.isActive;
	}

	public void setIsActive(Boolean isActive) {
		this.isActive = isActive;
	}

	@JsonIgnore
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "mbtigroup")
	public Set<Mbtiquestion> getMbtiquestions() {
		return this.mbtiquestions;
	}

	public void setMbtiquestions(Set<Mbtiquestion> mbtiquestions) {
		this.mbtiquestions = mbtiquestions;
	}

}
