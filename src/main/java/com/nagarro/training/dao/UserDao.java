package com.nagarro.training.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.object.UpdatableSqlQuery;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.nagarro.training.entity.User;

@Repository
public class UserDao {
	@Autowired
	private HibernateTemplate hibernateTemplate;
	 private SessionFactory sessionFactory; 
	
	public UserDao(SessionFactory sessionFactory)
	{
		this.sessionFactory = sessionFactory;
	}
	
	@Transactional
	public void RegisterUser(User user) {
		this.hibernateTemplate.save(user);
	}
	
	@Transactional
	public User check(User user) {
		User user2 =hibernateTemplate.get(User.class, user.getUsername());
		if(user2!=null && user2.getPassword().equals(user.getPassword())) {
			return user2;
		}
		return null;
	}
	public User checkUser(User user) {
		User user2=this.hibernateTemplate.get(User.class, user.getUsername());
		return user2;
	}
}
