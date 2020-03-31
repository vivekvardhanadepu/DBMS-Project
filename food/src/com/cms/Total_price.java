package com.cms;

public class Total_price {
	private String cart_id;
    private int price;
    private double gst;
    private int delivery_charge;
    
    public void setCart_id(String id) {
    	cart_id = id;
    }
    
    public void setPrice(int p) {
    	price = p;
    }
    
    public void setGst() {
    	gst = 5.5;
    }
    
    public void setDelivery_charge() {
    	delivery_charge = 5;
    }
    
    public String getCart_id() {
    	return cart_id;
    }
    
    public int getPrice() {
    	return price;
    }
    
    public double getGst() {
    	return gst;
    }
    
    public int getDelivery_charge() {
    	return delivery_charge;
    }
}
