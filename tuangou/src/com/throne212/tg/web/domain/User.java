package com.throne212.tg.web.domain;

// default package

import static javax.persistence.GenerationType.IDENTITY;

import java.util.Date;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * User entity.
 * 
 * @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "tg_user")
public class User implements java.io.Serializable {

	private static final long serialVersionUID = 1L;
	private Long id;
	private String userType;
	private String loginName;
	private String password;
	private String email;
	private Date regDate;
	private String tel;
	private String qq;
	private String location;
	private String birthday;
	private Boolean gender;
	private String photo;
	
   private Set<Teams>  collectTeams;
	
	
   private Set<Teams> buyedTeams;
	// Constructors

	/** default constructor */
	public User() {
	}

	/** full constructor */
	public User(String userType, String loginName, String password, String email, Date regDate, String tel, String qq) {
		this.userType = userType;
		this.loginName = loginName;
		this.password = password;
		this.email = email;
		this.regDate = regDate;
		this.tel = tel;
		this.qq = qq;
	}

	// Property accessors
	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "id", unique = true, nullable = false)
	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	@Column(name = "user_type")
	public String getUserType() {
		return this.userType;
	}

	public void setUserType(String userType) {
		this.userType = userType;
	}

	@Column(name = "loginName", length = 20)
	public String getLoginName() {
		return this.loginName;
	}

	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}

	@Column(name = "password", length = 50)
	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Column(name = "email", length = 100)
	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "regDate", length = 0)
	public Date getRegDate() {
		return this.regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	@Column(name = "tel", length = 100)
	public String getTel() {
		return this.tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	@Column(name = "qq", length = 100)
	public String getQq() {
		return this.qq;
	}

	public void setQq(String qq) {
		this.qq = qq;
	}
	@Column(name = "location", length = 100)
	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}
	@Column(name = "birthday", length = 100)
	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	@Column(name = "gender", length=4)
	public Boolean getGender() {
		return gender;
	}

	public void setGender(Boolean gender) {
		this.gender = gender;
	}
	@ManyToMany(targetEntity=Teams.class,fetch = FetchType.EAGER,
            cascade={CascadeType.MERGE,CascadeType.PERSIST})
    @JoinTable(name = "user_collectteams", joinColumns = { 
		   @JoinColumn(name = "User_ID", referencedColumnName = "id") }, 
		   inverseJoinColumns = { @JoinColumn(name = "Teams_ID", referencedColumnName = "id") })
	public Set<Teams> getCollectTeams() {
		return collectTeams;
	}

	public void setCollectTeams(Set<Teams> collectTeams) {
		this.collectTeams = collectTeams;
	}
	@ManyToMany(targetEntity=Teams.class,fetch = FetchType.EAGER,
            cascade={CascadeType.MERGE,CascadeType.PERSIST})
   @JoinTable(name = "user_buyedteams", joinColumns = { 
		   @JoinColumn(name = "User_ID", referencedColumnName = "id") }, 
		   inverseJoinColumns = { @JoinColumn(name = "Teams_ID", referencedColumnName = "id") })
	public Set<Teams> getBuyedTeams() {
		return buyedTeams;
	}

	public void setBuyedTeams(Set<Teams> buyedTeams) {
		this.buyedTeams = buyedTeams;
	}
	@Column(name = "photo", length = 100)
	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

}