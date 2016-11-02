package com.dxw.pms.models;

import java.util.List;

import javax.persistence.Access;
import javax.persistence.AccessType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.JoinColumn;

import javax.persistence.Table;

@Entity
@Table(name="erp_shed")
@Access(AccessType.FIELD)
public class Shed {

	@Id
    @GeneratedValue(strategy= GenerationType.IDENTITY)
	private Long id;
	
	@Column(name="name")
	private String name;
	
	@Column(name="code")
	private String code;
	
	@OneToMany(fetch = FetchType.EAGER)
	@JoinColumn(name="shedId")
	private List<Sty> sties;
	
	
	@OneToMany(fetch = FetchType.EAGER)
	@JoinColumn(name="shedId")
	private List<Warehouse> warehouses;

	public Long getId() {
		return id;
	}


	public void setId(Long id) {
		this.id = id;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public List<Sty> getSties() {
		return sties;
	}


	public void setSties(List<Sty> sties) {
		this.sties = sties;
	}


	public List<Warehouse> getWarehouses() {
		return warehouses;
	}


	public void setWarehouses(List<Warehouse> warehouses) {
		this.warehouses = warehouses;
	}


	public String getCode() {
		return code;
	}


	public void setCode(String code) {
		this.code = code;
	}
}
