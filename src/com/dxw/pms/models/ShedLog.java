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

/**
 * 猪舍入栏/出栏日志
 * @author zhang
 */
@Entity
@Table(name="mes_shed_log")
@Access(AccessType.FIELD)
public class ShedLog {
	/**
     * 内部id
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@Column
	private Date createTime;
	
	@Column
	private Date modifyTime;
	
	@Column
	private Date date;
	/**
     * 猪舍
     */
    /*@ManyToOne()
    @JoinColumn(name="shedId",
    		insertable = false, updatable = false)
    private Shed shed;*/
    
    @Column
    private Long shedId;

    @Column
    private int entryNumber;

    @Column
    private int illDeliveryNumber;

    @Column
    private int deadDeliveryNumber;

    @Column
    private int healthyDeliveryNumber;

    @Column
    private int stockNumber;

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

	public int getEntryNumber() {
		return entryNumber;
	}

	public void setEntryNumber(int entryNumber) {
		this.entryNumber = entryNumber;
	}

	public int getIllDeliveryNumber() {
		return illDeliveryNumber;
	}

	public void setIllDeliveryNumber(int illDeliveryNumber) {
		this.illDeliveryNumber = illDeliveryNumber;
	}

	public int getDeadDeliveryNumber() {
		return deadDeliveryNumber;
	}

	public void setDeadDeliveryNumber(int deadDeliveryNumber) {
		this.deadDeliveryNumber = deadDeliveryNumber;
	}

	public int getHealthyDeliveryNumber() {
		return healthyDeliveryNumber;
	}

	public void setHealthyDeliveryNumber(int healthyDeliveryNumber) {
		this.healthyDeliveryNumber = healthyDeliveryNumber;
	}

	public int getStockNumber() {
		return stockNumber;
	}

	public void setStockNumber(int stockNumber) {
		this.stockNumber = stockNumber;
	}

	/*public Shed getShed() {
		return shed;
	}

	public void setShed(Shed shed) {
		this.shed = shed;
	}*/

	public Long getShedId() {
		return shedId;
	}

	public void setShedId(Long shedId) {
		this.shedId = shedId;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}
}