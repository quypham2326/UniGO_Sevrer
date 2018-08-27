package com.unistart.entities;
// Generated Oct 1, 2017 10:03:30 PM by Hibernate Tools 4.3.1.Final

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

/**
 * Mbtiresult generated by hbm2java
 */
@Entity
@Table(name = "MBTIResult", schema = "dbo", catalog = "University")
public class Mbtiresult implements java.io.Serializable {

	private int id;
	private Mbtitype mbtitype;
	private Users users;
	private Date testDate;

	public Mbtiresult() {
	}

	public Mbtiresult(int id) {
		this.id = id;
	}

	public Mbtiresult(int id, Mbtitype mbtitype, Users users) {
		this.id = id;
		this.mbtitype = mbtitype;
		this.users = users;
	}

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name = "Id", unique = true, nullable = false)
	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "MBTITypeId")
	public Mbtitype getMbtitype() {
		return this.mbtitype;
	}

	public void setMbtitype(Mbtitype mbtitype) {
		this.mbtitype = mbtitype;
	}

	@JsonIgnore
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "UserId")
	public Users getUsers() {
		return this.users;
	}

	public void setUsers(Users users) {
		this.users = users;
	}

	@Column(name = "TestDate")
	public Date getTestDate() {
		return testDate;
	}

	public void setTestDate(Date testDate) {
		this.testDate = testDate;
	}
	
	

}