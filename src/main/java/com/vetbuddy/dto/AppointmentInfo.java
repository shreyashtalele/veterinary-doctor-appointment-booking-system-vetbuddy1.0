package com.vetbuddy.dto;

import java.sql.Date;
import java.time.LocalDate;

public class AppointmentInfo {
	
	private  String ownerName;
	private  String doctorName;

	private Integer  oid;
	private Integer  aid;
	private String email;
	private  String address;
    private  Long mobile;
    private  String petSpecies;
    private  String specialization;
   
	private  String breed;
    private  Date appointmentDate;
    private  Date bookingDate;
    private  String appointment_status;
    
    public String getSpecialization() {
		return specialization;
	}
	public void setSpecialization(String specialization) {
		this.specialization = specialization;
	}
    
	public String getDoctorName() {
		return doctorName;
	}
	public void setDoctorName(String doctorName) {
		this.doctorName = doctorName;
	}
    public Integer getAid() {
		return aid;
	}
	public void setAid(Integer aid) {
		this.aid = aid;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
    public Integer getOid() {
		return oid;
	}
	public void setOid(Integer oid) {
		this.oid = oid;
	}
	public String getOwnerName() {
		return ownerName;
	}
	public void setOwnerName(String ownerName) {
		this.ownerName = ownerName;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public Long getMobile() {
		return mobile;
	}
	public void setMobile(Long mobile) {
		this.mobile = mobile;
	}
	public String getPetSpecies() {
		return petSpecies;
	}
	public void setPetSpecies(String petSpecies) {
		this.petSpecies = petSpecies;
	}
	public String getBreed() {
		return breed;
	}
	public void setBreed(String breed) {
		this.breed = breed;
	}
	public Date getAppointmentDate() {
		return appointmentDate;
	}
	public void setAppointmentDate(Date appointmentDate) {
		this.appointmentDate = appointmentDate;
	}
	public Date getBookingDate() {
		return bookingDate;
	}
	public void setBookingDate(Date bookingDate) {
		this.bookingDate = bookingDate;
	}
	public String getAppointment_status() {
		return appointment_status;
	}
	public void setAppointment_status(String appointment_status) {
		this.appointment_status = appointment_status;
	}
	@Override
	public String toString() {
		return "AppointmentInfo [ownerName=" + ownerName + ", address=" + address + ", mobile=" + mobile
				+ ", petSpecies=" + petSpecies + ", breed=" + breed + ", appointmentDate=" + appointmentDate
				+ ", bookingDate=" + bookingDate + ", appointment_status=" + appointment_status + "]";
	}


}
