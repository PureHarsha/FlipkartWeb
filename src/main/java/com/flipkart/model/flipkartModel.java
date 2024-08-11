package com.flipkart.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

@Entity(name = "FLIPKART_CUSTOMER")
public class flipkartModel {

	@Id
	@Column(name = "CUSTOMER_ID")
	private int CUSTOMER_ID;
	
	@Column(name = "CUSTOMER_NAME")
	private String CUSTOMER_NAME;
	
	@Column(name = "EMAIL")
	private String EMAIL;
	
	@Column(name = "PRODUCT_NAME")
	private String PRODUCT_NAME;
	
	@Column(name = "PRODUCT_ORDERED_FOR")
	private String PRODUCT_ORDERED_FOR;

	public int getCUSTOMER_ID() {
		return CUSTOMER_ID;
	}

	public void setCUSTOMER_ID(int cUSTOMER_ID) {
		CUSTOMER_ID = cUSTOMER_ID;
	}

	public String getCUSTOMER_NAME() {
		return CUSTOMER_NAME;
	}

	public void setCUSTOMER_NAME(String cUSTOMER_NAME) {
		CUSTOMER_NAME = cUSTOMER_NAME;
	}

	public String getEMAIL() {
		return EMAIL;
	}

	public void setEMAIL(String eMAIL) {
		EMAIL = eMAIL;
	}

	public String getPRODUCT_NAME() {
		return PRODUCT_NAME;
	}

	public void setPRODUCT_NAME(String pRODUCT_NAME) {
		PRODUCT_NAME = pRODUCT_NAME;
	}

	public String getPRODUCT_ORDERED_FOR() {
		return PRODUCT_ORDERED_FOR;
	}

	public void setPRODUCT_ORDERED_FOR(String pRODUCT_ORDERED_FOR) {
		PRODUCT_ORDERED_FOR = pRODUCT_ORDERED_FOR;
	}

	public Object getId() {
		// TODO Auto-generated method stub
		 return CUSTOMER_ID;
	}

	public String getName() {
		// TODO Auto-generated method stub
        return CUSTOMER_NAME;
	}

	public String getEmail() {
		// TODO Auto-generated method stub
        return EMAIL;
	}




	
	
	
}
