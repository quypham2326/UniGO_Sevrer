package com.unistart.entities;
// Generated Oct 1, 2017 10:03:30 PM by Hibernate Tools 4.3.1.Final

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import com.fasterxml.jackson.annotation.JsonView;
import com.unistart.view.UniversityView;

/**
 * University generated by hbm2java
 */
@Entity
@JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
@Table(name = "University", schema = "dbo", catalog = "University")
public class University implements java.io.Serializable {

    @JsonView({UniversityView.Simple.class,
        UniversityView.LocationAndAddressIncluded.class})
    private Integer id;

    @JsonView({UniversityView.LocationAndAddressIncluded.class})
    private Location location;

    @JsonView({UniversityView.LocationAndAddressIncluded.class})
    private TrainSystem trainSystem;

    @JsonView({UniversityView.Simple.class,
        UniversityView.LocationAndAddressIncluded.class})
    private String code;

    @JsonView({UniversityView.Simple.class,
        UniversityView.LocationAndAddressIncluded.class})
    private String name;

    @JsonView({UniversityView.Simple.class,
        UniversityView.LocationAndAddressIncluded.class})
    private String email;

    @JsonView({UniversityView.Simple.class,
        UniversityView.LocationAndAddressIncluded.class})
    private String phone;

    @JsonView({UniversityView.Simple.class,
        UniversityView.LocationAndAddressIncluded.class})
    private String logo;

    @JsonView({UniversityView.Simple.class,
        UniversityView.LocationAndAddressIncluded.class})
    private String description;

    @JsonView({UniversityView.Simple.class,
        UniversityView.LocationAndAddressIncluded.class})
    private String image;

    @JsonView({UniversityView.Simple.class,
        UniversityView.LocationAndAddressIncluded.class})
    private Integer priority;

    private Boolean isActive;

    private Set<Review> reviews = new HashSet<Review>(0);
    
    private int[]majorId;

    public University( TrainSystem trainSystem, String code, String name, String email, String phone, String logo, String description, String image, Integer priority, int[] majorId) {
        this.trainSystem = trainSystem;
        this.code = code;
        this.name = name;
        this.email = email;
        this.phone = phone;
        this.logo = logo;
        this.description = description;
        this.image = image;
        this.priority = priority;
        this.majorId = majorId;
    }

   

    public int[] getMajorId() {
        return majorId;
    }

    public void setMajorId(int[] majorId) {
        this.majorId = majorId;
    }
    @JsonManagedReference
    private Set<MajorUniversity> majorUniversities = new HashSet<MajorUniversity>(0);

    @JsonView({UniversityView.Simple.class,
        UniversityView.LocationAndAddressIncluded.class})
    private String address;

    public University(Integer id) {
        this.id = id;
    }

    public University(Integer id, String name) {
        this.id = id;
        this.name = name;
    }

    public University() {

    }

    public University(Set<MajorUniversity> majorUniversities) {
        this.majorUniversities = majorUniversities;
    }

    public University(Integer id, String image, String name, Integer priority) {
        super();
        this.id = id;
        this.name = name;
        this.image = image;
        this.priority = priority;
    }

    public University(Integer id, String name, Location location, TrainSystem trainSystem, String logo) {
        this.id = id;
        this.name = name;
        this.location = location;
        this.trainSystem = trainSystem;
        this.logo = logo;

    }

    public University(String code, String name, String email, String phone, String logo, String image, int priority,
            String description, Boolean isActive) {
        this.code = code;
        this.name = name;
        this.email = email;
        this.phone = phone;
        this.logo = logo;
        this.description = description;
        this.image = image;
        this.priority = priority;
        this.isActive = isActive;

    }

    public University(Integer id, String name, String logo) {
        this.id = id;
        this.name = name;
        this.logo = logo;

    }

    public University(Integer id, String name, String logo, String phone) {
        this.id = id;
        this.name = name;
        this.logo = logo;
        this.phone = phone;

    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "Id", unique = true, nullable = false)
    public Integer getId() {
        return this.id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "LocationId")
    public Location getLocation() {
        return this.location;
    }

    public void setLocation(Location location) {
        this.location = location;
    }

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "TrainSystemId")
    public TrainSystem getTrainSystem() {
        return trainSystem;
    }

    public void setTrainSystem(TrainSystem trainSystem) {
        this.trainSystem = trainSystem;
    }

    @Column(name = "Code", nullable = false)
    public String getCode() {
        return this.code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    @Column(name = "Name", nullable = false)
    public String getName() {
        return this.name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Column(name = "Email")
    public String getEmail() {
        return this.email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @Column(name = "Phone")
    public String getPhone() {
        return this.phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    @Column(name = "Logo")
    public String getLogo() {
        return this.logo;
    }

    public void setLogo(String logo) {
        this.logo = logo;
    }

    @Column(name = "Description")
    public String getDescription() {
        return this.description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Column(name = "Image")
    public String getImage() {
        return this.image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    @Column(name = "Priority")
    public Integer getPriority() {
        return this.priority;
    }

    public void setPriority(Integer priority) {
        this.priority = priority;
    }

    @Column(name = "IsActive")
    public Boolean getIsActive() {
        return this.isActive;
    }

    public void setIsActive(Boolean isActive) {
        this.isActive = isActive;
    }

//	@JsonIgnore
//	@OneToMany(fetch = FetchType.LAZY, mappedBy = "university")
//	public Set<Users> getUserses() {
//		return this.userses;
//	}
//
//	public void setUserses(Set<Users> userses) {
//		this.userses = userses;
//	}
    @JsonIgnore
    @OneToMany(fetch = FetchType.LAZY, mappedBy = "university")
    public Set<Review> getReviews() {
        return this.reviews;
    }

    public void setReviews(Set<Review> reviews) {
        this.reviews = reviews;
    }

    @JsonIgnore
    @OneToMany(fetch = FetchType.LAZY, mappedBy = "university")
    public Set<MajorUniversity> getMajorUniversities() {
        return this.majorUniversities;
    }

    public void setMajorUniversities(Set<MajorUniversity> majorUniversities) {
        this.majorUniversities = majorUniversities;
    }

    @Column(name = "UniAddress", nullable = true)
    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

}
