package com.nqb.dao;

import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.Date;
import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.nqb.model.Order;
import com.nqb.model.OrderDetail;
import com.nqb.model.Product;
import com.nqb.model.User;

@Component
public class OrderDao {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	@Autowired
	private HibernateTemplate hibernateTemplate;
	
	public int insertRowInOrder(String reciever, String address, String phone, String email, int total_money, int user_id) {
		int orderId = -1;
		try(Session session = sessionFactory.openSession()) {
			session.getTransaction().begin();
			
			Order order = new Order();
			order.setReciever(reciever);
			order.setAddress(address);
			order.setPhone(phone);
			order.setEmail(email);
			Timestamp currentTimestamp = new Timestamp(new Date().getTime());
	        order.setOrder_date(currentTimestamp);
			order.setStatus("Đang xử lý");
			order.setTotal_money(total_money);
			order.setUser(session.get(User.class, user_id));
			
			session.save(order);
			
			session.flush();
			
			orderId = order.getId();
			
			session.getTransaction().commit();
		}
		
		return orderId;
	}
	
	public List<Order> getOrderList() {
		return hibernateTemplate.loadAll(Order.class);
	}
	
	public List<Order> getOrderListByUserId(int user_id) {
		try (Session session = sessionFactory.openSession()) {
			CriteriaBuilder criteriaBuilder = session.getCriteriaBuilder();
		    
		    CriteriaQuery<Order> criteriaQuery = criteriaBuilder.createQuery(Order.class);
		    Root<Order> root = criteriaQuery.from(Order.class);

		    Predicate predicate = criteriaBuilder.equal(root.get("user"), user_id);
		    criteriaQuery.select(root).where(predicate);

		    Query<Order> query = session.createQuery(criteriaQuery);
		    List<Order> resultList = query.getResultList();
		    return resultList;
		}
	}
	
	public void updateStatusOrder(int id, String choice) {
		try(Session session = sessionFactory.openSession()) {
			session.getTransaction().begin();
			
			Order order = session.get(Order.class, id);
			
	        if (order != null) {
	        	if (choice.equals("transport")) {
	        		order.setStatus("Đang vận chuyển");
				}else {
					order.setStatus("Đã giao hàng");
				}
	            session.update(order);
	        }
	        
			session.getTransaction().commit();
		}
	}
	
}
