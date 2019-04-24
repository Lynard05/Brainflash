package com.techelevator.model;

import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotBlank;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.SessionAttributes;
@Component
@SessionAttributes
public class Deck {
	@NotBlank(message="Required field")
	private Integer deckId;
	@NotBlank(message="User ID is a required")
	private Integer userId;
	@NotBlank(message="Required field")
	@Size(min=1, max=128, message="Deck name must be between 1 and 128 characters")
	private String name;
	@NotBlank(message="Please enter a desciption for the Deck")
	private String description;
	
	public Integer getDeckId() {
		return deckId;
	}
	public void setDeckId(Integer deckId) {
		this.deckId = deckId;
	}
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	
}
