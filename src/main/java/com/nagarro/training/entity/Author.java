package com.nagarro.training.entity;

import java.time.LocalDate;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.PrePersist;

@Entity
public class Author {
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE)
	private int id;
	private String author;
	private String book;
	private LocalDate date;

	@PrePersist
	public void prePersist() {
		setDate(LocalDate.now());
	}

	/**
	 * @return the id
	 */
	public int getId() {
		return this.id;
	}

	/**
	 * @param id the id to set
	 */
	public void setId(int id) {
		this.id = id;
	}

	/**
	 * @return the author
	 */
	public String getAuthor() {
		return author;
	}

	/**
	 * @param author the author to set
	 */
	public void setAuthor(String author) {
		this.author = author;
	}

	/**
	 * @return the book
	 */
	public String getBook() {
		return book;
	}

	/**
	 * @param book the book to set
	 */
	public void setBook(String book) {
		this.book = book;
	}
	/**
	 * @return the date
	 */
	/*
	 * public String getDate() { return date; }
	 *//**
		 * @param date the date to set
		 *//*
			 * public void setDate(String date) { this.date = date; }
			 */

	public LocalDate getDate() {
		return date;
	}

	
	  public void setDate(LocalDate date) { this.date = date; }
	 

}
