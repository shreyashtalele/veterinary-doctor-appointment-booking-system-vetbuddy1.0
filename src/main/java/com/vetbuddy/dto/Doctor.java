package com.vetbuddy.dto;

import java.io.InputStream;

public class Doctor {
	
  private Integer did;
  private String name;
  private String email;
  private String password;
  private String address;
  private Integer Postal_code;
  private String village;
  private String district;
  private InputStream certificate;
  private Long mobile;
  private String verification;
  private Integer available;
  private String base64Image;
  private String specialization;
  
  
  
  
public String getBase64Image() {
	return base64Image;
}

public void setBase64Image(String base64Image) {
	this.base64Image = base64Image;
}

public String getVerification() {
	return verification;
}

public void setVerification(String verification) {
	this.verification = verification;
}

public Integer getAvailable() {
	return available;
}

public void setAvailable(Integer available) {
	this.available = available;
}

public Doctor(String name, String email,  String address, Integer postal_code,
		String village, String district, InputStream certificate, Long mobile,String password,String specialization) {
		super();
		this.specialization=specialization;
		this.name = name;
		this.email = email;
		this.address = address;
		this.Postal_code = postal_code;
		this.village = village;
		this.district = district;
		this.certificate = certificate;
		this.mobile = mobile;
		this.password = password;
}

public String getSpecialization() {
	return specialization;
}

public void setSpecialization(String specialization) {
	this.specialization = specialization;
}

public Doctor() {
	
}



public Integer getDid() {
	return did;
}




public void setDid(Integer did) {
	this.did = did;
}




public String getName() {
	return name;
}




public void setName(String name) {
	this.name = name;
}




public String getEmail() {
	return email;
}




public void setEmail(String email) {
	this.email = email;
}




public String getPassword() {
	return password;
}




public void setPassword(String password) {
	this.password = password;
}




public String getAddress() {
	return address;
}




public void setAddress(String address) {
	this.address = address;
}




public Integer getPostal_code() {
	return Postal_code;
}




public void setPostal_code(Integer postal_code) {
	Postal_code = postal_code;
}




public String getVillage() {
	return village;
}
public void setVillage(String village) {
	this.village = village;
}

public String getDistrict() {
	return district;
}

public void setDistrict(String district) {
	this.district = district;
}

public InputStream getCertificate() {
	return certificate;
}

public void setCertificate(InputStream certificate) {
	this.certificate = certificate;
}

public Long getMobile() {
	return mobile;
}

public void setMobile(Long mobile) {
	this.mobile = mobile;
}

@Override
public String toString() {
	return "Doctor [did=" + did + ", name=" + name + ", email=" + email + ", password=" + password + ", address="
			+ address + ", Postal_code=" + Postal_code + ", village=" + village + ", district=" + district
			+ ", certificate=" + certificate + ", mobile=" + mobile + ", verification=" + verification + ", available="
			+ available + "]";
}


  

}
