package com.nagarro.training.services;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.nagarro.training.dao.AuthorDao;
import com.nagarro.training.dao.UserDao;
import com.nagarro.training.entity.Author;
import com.nagarro.training.entity.User;

@org.springframework.stereotype.Service
public class ServiceImpl implements Service{
	
	@Autowired
	private UserDao userDao;
	
	@Autowired
	private AuthorDao authorDao;
	
	
	public boolean checkUnameAndPass(String name,String pass) {
		User user=new User();
		user.setPassword(pass);
		user.setUsername(name);
		return this.userDao.check(user)==null;
	}
	public boolean checkUname(String name,String pass) {
		User user=new User();
		user.setPassword(pass);
		user.setUsername(name);
		return this.userDao.checkUser(user)==null;
	}

	public void addUser(User user) {
		this.userDao.RegisterUser(user);
	}
	public List<Author> findAll(){
		return this.authorDao.getAll();
	}
	public List<Object> getAuthor(){
		return this.authorDao.onlyAuthors();
	}
	public void addBook(String id,String name,String auth) {
		Author author=new Author();
		author.setId(Integer.parseInt(id));
		author.setAuthor(auth);
		author.setBook(name);
		this.authorDao.saveBook(author);
	}
	public Author findAuthor(int id) {
		return authorDao.getAuthor(id);
	}
	public void updateBook(Author author) {
		this.authorDao.updateBookDetails(author);
	}
	public void deleteBook(Author author) {
		this.authorDao.delete(author);
	}
	
	
}
