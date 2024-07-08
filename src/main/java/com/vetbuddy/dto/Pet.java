package com.vetbuddy.dto;


public class Pet {

	private Integer petId;
	private Integer OwnerId;
	private String petName;
	private String breed;
	private String species;
	private Integer age;
	
	
	public String getSpecies() {
		return species;
	}
	public void setSpecies(String species) {
		this.species = species;
	}
	public Pet() {
	
	}
	public Pet(Integer petId, Integer ownerId, String petName, String breed, Integer age) {
		super();
		this.petId = petId;
		OwnerId = ownerId;
		this.petName = petName;
		this.breed = breed;
		this.age = age;
	}
	public Integer getPetId() {
		return petId;
	}
	public void setPetId(Integer petId) {
		this.petId = petId;
	}
	public Integer getOwnerId() {
		return OwnerId;
	}
	public void setOwnerId(Integer ownerId) {
		OwnerId = ownerId;
	}
	public String getPetName() {
		return petName;
	}
	public void setPetName(String petName) {
		this.petName = petName;
	}
	public String getBreed() {
		return breed;
	}
	public void setBreed(String breed) {
		this.breed = breed;
	}
	public Integer getAge() {
		return age;
	}
	public void setAge(Integer age) {
		this.age = age;
	}

	

	
	
	
}
