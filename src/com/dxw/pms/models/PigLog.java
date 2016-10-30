package com.dxw.pms.models;

import java.util.Date;

import javax.persistence.Access;
import javax.persistence.AccessType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "mes_pig_log")
@Access(AccessType.FIELD)
public class PigLog {
	/**
     * 内部id
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    /**
     * 创建时间
     */
    @Column(name = "createTime")
    private Date createTime;

    /**
     * 修改时间
     */
    @Column(name = "modifyTime")
    private Date modifyTime;

    /**
     * 猪种编号
     */
    @Column(name = "pigId")
    private Long pigId;
    
    /**
     * 源栏位
     */
    @Column(name = "styIdFrom")
    private Long styIdFrom;
    
    /**
     * 目标栏位
     */
    @Column(name = "styIdTo")
    private Long styIdTo;

    /**
     * 供应商
     */
    @Column(name = "vendorId")
    private Long vendorId;
    
    
    @ManyToOne()
    @JoinColumn(name="userId",
    		insertable = false, updatable = false)
    private User user;
    
    /**
     * 用户
     */
    @Column(name = "userId")
    private Long userId;

    /**
     * 数量
     */
    @Column(name = "number")
    private int number;
    
    /**
     * 操作
     */
    @Column(name = "operation")
    private Integer operation;
    
    @Column(name="detail")
    private String detail;

	public Integer getOperation() {
		return operation;
	}

	public void setOperation(Integer operation) {
		this.operation = operation;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

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

	public Long getStyIdFrom() {
		return styIdFrom;
	}

	public void setStyIdFrom(Long styIdFrom) {
		this.styIdFrom = styIdFrom;
	}

	public Long getStyIdTo() {
		return styIdTo;
	}

	public void setStyIdTo(Long styIdTo) {
		this.styIdTo = styIdTo;
	}

	public Long getVendorId() {
		return vendorId;
	}

	public void setVendorId(Long vendorId) {
		this.vendorId = vendorId;
	}

	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}

	public int getNumber() {
		return number;
	}

	public void setNumber(int number) {
		this.number = number;
	}

	public Long getPigId() {
		return pigId;
	}

	public void setPigId(Long pigTypeId) {
		this.pigId = pigTypeId;
	}

	public String getDetail() {
		return detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
}
