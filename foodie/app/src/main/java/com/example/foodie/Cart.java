package com.example.foodie;

public class Cart {
    private String cart_id;
    private String location_id;
    private String username;
    private int delivery_time;

    public void setCart_id() {
        int k = (int) Math.random();
        cart_id = Double.toString(k);
    }

    public void setLocation_id(String lid) {
        location_id = lid;
    }

    public void setUsername(String uname) {
        username = uname;
    }

    public void setDelivery_time(int t) {
        delivery_time = t;
    }

    public String getCart_id() {
        return cart_id;
    }

    public String getLocation_id() {
        return location_id;
    }

    public String getUsername() {
        return username;
    }

    public int getDelivery_time() {
        return delivery_time;

    }

}
