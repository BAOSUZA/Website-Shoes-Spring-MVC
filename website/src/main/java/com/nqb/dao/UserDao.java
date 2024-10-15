package com.nqb.dao;

import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.nqb.model.Role;
import com.nqb.model.User;

@Component
public class UserDao {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	@Autowired
	private HibernateTemplate hibernateTemplate;

	public boolean isValid(String email, String password) {
		User user = getUserByEmailAndPassword(email, password);
		return (user != null ? true : false);
	}

	public User getUserByEmailAndPassword(String email, String password) {
		try (Session session = sessionFactory.openSession();) {
			
			CriteriaBuilder criteriaBuilder = session.getCriteriaBuilder();
			CriteriaQuery<User> criteriaQuery = criteriaBuilder.createQuery(User.class);
			Root<User> root = criteriaQuery.from(User.class);

			Predicate emailPredicate = criteriaBuilder.equal(root.get("email"), email);
			Predicate passwordPredicate = criteriaBuilder.equal(root.get("password"), password);

			criteriaQuery.select(root).where(criteriaBuilder.and(emailPredicate, passwordPredicate));

			User user = session.createQuery(criteriaQuery).uniqueResult();
			
			return user;
		}
	}
	
	public void addUser(String fullname, String email, String address, String phone_number, String password) {
		try (Session session = sessionFactory.openSession()) {
			session.getTransaction().begin();
			Role r = session.get(Role.class, 1);
			
			User u = new User();
			u.setFullname(fullname);
			u.setEmail(email);
			u.setAddress(address);
			u.setPhone_number(phone_number);
			u.setPassword(password);
			u.setRole(r);
			
			session.save(u);
			session.getTransaction().commit();
		}
	}
	
	public List<User> getAccountList() {
		return hibernateTemplate.loadAll(User.class);
	}
	
	
}
