package com.nagarro.training.services;

import java.util.List;

import com.nagarro.training.entity.Author;
import com.nagarro.training.entity.User;

public interface Service {
	public boolean checkUnameAndPass(String name,String pass);
	public boolean checkUname(String name,String pass);
	public void addUser(User user);
	public List<Author> findAll();
	public void addBook(String id,String name,String auth);
	public Author findAuthor(int id);
	public void updateBook(Author author);
	public void deleteBook(Author author);
	
}
