package com.nagarro.training.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.nagarro.training.entity.Author;

@Repository
public class AuthorDao {
	
	@Autowired
	private HibernateTemplate hibernateTemplate;
	
	@Transactional
	public void saveBook(Author author) {
		this.hibernateTemplate.save(author);
	}
	
	@Transactional
	public void updateBookDetails(Author author) {
		this.hibernateTemplate.update(author);
	}
	@Transactional
	public void delete(Author author) {
		this.hibernateTemplate.delete(author);
	}
	
	
	public List<Author>	getAll(){
		
		
		  Session session=this.hibernateTemplate.getSessionFactory().openSession();
		  session.beginTransaction(); 
		  String hqlString="FROM Author"; 
		  Query query=session.createQuery(hqlString,Author.class);
		  List<Author> filteredList=query.list();
		  session.getTransaction().commit(); session.close(); return filteredList;
		 
		
	}
	
	public List<Object> onlyAuthors(){
		Session session=this.hibernateTemplate.getSessionFactory().openSession();
		session.beginTransaction();
		String hString="SELECT DISTINCT author FROM Author";
		Query query=session.createQuery(hString,Author.class);
		List<Object> filteredAuthorList=query.list();
		session.getTransaction().commit();
		session.close();
		return filteredAuthorList;
		
	}
	public Author getAuthor(int id) {
		return this.hibernateTemplate.get(Author.class, id);
	}
	
}
