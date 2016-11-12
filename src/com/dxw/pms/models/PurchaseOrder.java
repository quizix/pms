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

import org.hibernate.annotations.NaturalId;

/**
 * 采购订单
 * @author zhang
 *
 */
@Entity
@Table(name = "erp_purchase_order")
@Access(AccessType.FIELD)
public class PurchaseOrder {
	/**
     * 内部id
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
    
    /**
     * 订单编码
     */
    @NaturalId(mutable=true)
    @Column(name="code")
    private String code;
    
    /**
     * 猪种
     */
    @ManyToOne()
    @JoinColumn(name="pigId",
    		insertable = false, updatable = false)
    private Pig pig;
	
    /**
     * 供应商
     */
    @ManyToOne()
    @JoinColumn(name="vendorId",
    		insertable = false, updatable = false)
    private Vendor vendor;
    
    /**
     * 订单总数
     */
    @Column
    private int number;
    
    /**
     * 单只重量
     */
    @Column
    private float weight;
    
	@Column
	private Date createTime;
	
	@Column
	private Date modifyTime;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public Pig getPig() {
		return pig;
	}

	public void setPig(Pig pig) {
		this.pig = pig;
	}

	public Vendor getVendor() {
		return vendor;
	}

	public void setVendor(Vendor vendor) {
		this.vendor = vendor;
	}

	public int getNumber() {
		return number;
	}

	public void setNumber(int number) {
		this.number = number;
	}

	public float getWeight() {
		return weight;
	}

	public void setWeight(float weight) {
		this.weight = weight;
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
	
}
