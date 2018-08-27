package com.unistart.entities;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Entity
@JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
@Table(name = "GroupMajor", schema = "dbo", catalog = "University")
public class GroupMajor {
	
    private Integer id;
    private String code;
    private String name;
    private boolean isActive;
    private Set<Major> majors = new HashSet<Major>();
    
    
	public GroupMajor() {
		super();
	}
	public GroupMajor(Integer id, String code, String name, Set<Major> majors) {
		super();
		this.id = id;
		this.code = code;
		this.name = name;
		this.majors = majors;
	}
	
	public GroupMajor(Integer id, String code, String name, boolean isActive, Set<Major> majors) {
		super();
		this.id = id;
		this.code = code;
		this.name = name;
		this.isActive = isActive;
		this.majors = majors;
	}
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name = "Id", unique = true, nullable = false)
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	
	@Column(name = "Code", nullable = false, length = 10)
	public String getCode() {
		return code;
	}
	
	public void setCode(String code) {
		this.code = code;
	}
	
	@Column(name = "Name", nullable = false, length = 50)
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	@Column(name = "IsActive", nullable = false)
	public boolean isActive() {
		return isActive;
	}
	public void setActive(boolean isActive) {
		this.isActive = isActive;
	}
    @JsonIgnore
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "groupMajor")
	public Set<Major> getMajors() {
		return majors;
	}
	public void setMajors(Set<Major> majors) {
		this.majors = majors;
	}
    
    
}
