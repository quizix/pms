package com.dxw.pms.models;

import java.util.Date;

import javax.persistence.Access;
import javax.persistence.AccessType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.NaturalId;

@Entity
@Table(name="erp_sty")
@Access(AccessType.FIELD)
public class Sty {
	@Id
    @GeneratedValue(strategy= GenerationType.IDENTITY)
    protected Long id;
		
	public Long getId(){
		return id;
	}
	
	/**
     * 创建时间
     */
    @Column(name="createTime")
    private Date createTime;

    /**
     * 修改时间
     */
    @Column(name="modifyTime")
    private Date modifyTime;
    
    
    /**
     * 名字
     */
    @Column(name="name")
    private String name;

    /**
     * 编码
     */
    @NaturalId(mutable=true)
    @Column(name="code")
    private String code;
    
	/**
     * 编号
     */
    @Column(name="no")
    private int no;
    
    /**
     * 猪的数量，并由此推断栏位状态
     */
    @Column(name="currentNumber")
    private int currentNumber;
    
    @Column
    private Long shedId;
    
    
	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Date getModifyTime() {
		return modifyTime;
	}

	public void setModifyTime(Date modifyTime) {
		this.modifyTime = modifyTime;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getCurrentNumber() {
		return currentNumber;
	}

	public void setCurrentNumber(int currentNumber) {
		this.currentNumber = currentNumber;
	}

	public Long getShedId() {
		return shedId;
	}

	public void setShedId(Long shedId) {
		this.shedId = shedId;
	}
}

