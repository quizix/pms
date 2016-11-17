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
@Table(name = "mes_feed_log")
@Access(AccessType.FIELD)
public class FeedLog {
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
     * 料仓
     */
    @Column(name = "warehouseId")
    private Long warehouseId;

    @ManyToOne()
    @JoinColumn(name="userId",
    		insertable = false, updatable = false)
    private User user;
    
    @Column(name = "userId")
    private Long userId;
    
    @Column(name="purchaseOrderId")
    private Long purchaseOrderId;

    @Column(name = "quantity")
    protected float quantity;
    
    @Column(name = "operation")
    private Integer operation;

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

	public Long getWarehouseId() {
		return warehouseId;
	}

	public void setWarehouseId(Long warehouseId) {
		this.warehouseId = warehouseId;
	}

	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}

	public float getQuantity() {
		return quantity;
	}

	public void setQuantity(float quantity) {
		this.quantity = quantity;
	}

	public Integer getOperation() {
		return operation;
	}

	public void setOperation(Integer operation) {
		this.operation = operation;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Long getPurchaseOrderId() {
		return purchaseOrderId;
	}

	public void setPurchaseOrderId(Long purchaseOrderId) {
		this.purchaseOrderId = purchaseOrderId;
	}

}
