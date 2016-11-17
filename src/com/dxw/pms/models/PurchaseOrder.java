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
     * 饲料品种
     */
    @ManyToOne()
    @JoinColumn(name="feedId", insertable=false, updatable=false)
    private Feed feed;
    
    /**
     * 订单类型
     * 1. 猪
     * 2. 饲料
     */
    @Column
    private int type;
    
    /**
     * 订单总数
     */
    @Column
    private float quantity;
    
    /**
     * 单只重量
     */
    @Column
    private float weight;
    
	@Column
	private Date createTime;
	
	@Column
	private Date modifyTime;
	
	/**
	 * 订单完成时间
	 * 如果非空，表示订单已经完成
	 */
	@Column
	private Date executionTime;
	
	/**
	 * 订单完成所上传的图片
	 */
	@Column
	private String executionImg;
	

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

	public float getQuantity() {
		return quantity;
	}

	public void setQuantity(float quantity) {
		this.quantity = quantity;
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

	public Feed getFeed() {
		return feed;
	}

	public void setFeed(Feed feed) {
		this.feed = feed;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public Date getExecutionTime() {
		return executionTime;
	}

	public void setExecutionTime(Date executionTime) {
		this.executionTime = executionTime;
	}

	public String getExecutionImg() {
		return executionImg;
	}

	public void setExecutionImg(String executionImg) {
		this.executionImg = executionImg;
	}
}
