package com.dxw.pms.dal;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dxw.pms.models.User;

@Repository
public class UserDaoImpl implements UserDao {

	SessionFactory sessionFactory;

	@Autowired
	public UserDaoImpl(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	
	@Override
	public User findById(Long id) {
		Session session = 
				sessionFactory.getCurrentSession();
		return (User) session.get(User.class, id);
	}
	
	@Override
	public User findByName(String name) {
		Session session = 
				sessionFactory.getCurrentSession();
		Criteria criteria = session
				.createCriteria(User.class)
				.add(Restrictions.eq("userName", name));
		return (User)criteria.uniqueResult();
	}

	@Override
	public List findAll() {
		Session session = 
				sessionFactory.getCurrentSession();
		
		Query query = session.createQuery("from User");
		return query.list();
	}


	@Override
	public User findByNaturalId(String code) {
		Session session = 
				sessionFactory.getCurrentSession();
		
		User user = (User) session.bySimpleNaturalId(User.class)
				.load(code);
		return user;
	}


	

}
