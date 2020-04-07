package com.example.foodie;

public class Location {
    private String location_id;
    private String flat_no;
    private String street;
    private String city;
    private String state;
    private String pincode;

    public void setLocation_id() {
        int k = (int) Math.random();
        location_id = Double.toString(k);
    }

    public void setFlat_no(String f_no) {
        flat_no = f_no;
    }

    public void setStreet(String stre) {
        street = stre;
    }

    public void setCity(String cit) {
        city = cit;
    }

    public void setState(String stat) {
        state = stat;
    }

    public void setPincode(String pincod) {
        pincode = pincod;
    }

    public String getLocation_id() {
        return location_id;
    }

    public String getFlat_no() {
        return flat_no;
    }

    public String getStreet() {
        return street;
    }

    public String getCity() {
        return city;
    }

    public String getState() {
        return state;
    }

    public String getPincode() {
        return pincode;
    }
}
