package com.nqb.dao;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.nqb.model.Order;
import com.nqb.model.OrderDetail;
import com.nqb.model.Product;
import com.nqb.model.ProductSize;
import com.nqb.model.Size;
import com.nqb.model.User;
import com.nqb.service.ProductService;

@Component
public class OrderDetailDao {

	@Autowired
	private SessionFactory sessionFactory;
	
	@Autowired
	private ProductService productService;

	public boolean addToCart(int user_id, int product_id, int size_id, int quantity) {
		try (Session session = sessionFactory.openSession()) {
			session.getTransaction().begin();

			CriteriaBuilder criteriaBuilder = session.getCriteriaBuilder();
			CriteriaQuery<OrderDetail> criteriaQuery = criteriaBuilder.createQuery(OrderDetail.class);
			Root<OrderDetail> root = criteriaQuery.from(OrderDetail.class);
			criteriaQuery.select(root);

			Predicate p1 = criteriaBuilder.equal(root.get("size").get("id"), size_id);
			Predicate p2 = criteriaBuilder.equal(root.get("product").get("id"), product_id);
			Predicate p3 = criteriaBuilder.equal(root.get("user").get("id"), user_id);

			criteriaQuery.where(criteriaBuilder.and(p1, criteriaBuilder.and(p2, p3)));

			Query<OrderDetail> query = session.createQuery(criteriaQuery);

			List<OrderDetail> resultList = query.getResultList();
			if (!resultList.isEmpty()) {
				OrderDetail orderDetail = resultList.get(0);
				// UPDATE
				orderDetail.setQuantity(orderDetail.getQuantity() + quantity);
				session.save(orderDetail);
			} else {
				// INSERT
				Product product = getProduct(session, product_id);

				OrderDetail od = new OrderDetail();
				od.setPrice(product.getPrice());
				od.setQuantity(quantity);
				od.setUser(session.get(User.class, user_id));
				od.setProduct(session.get(Product.class, product_id));
				od.setSize(session.get(Size.class, size_id));
				od.setOrder(null);
				session.save(od);
			}

			session.getTransaction().commit();

			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	private Product getProduct(Session session, int product_id) {
		CriteriaBuilder criteriaBuilder = session.getCriteriaBuilder();
		CriteriaQuery<Product> criteriaQuery = criteriaBuilder.createQuery(Product.class);
		Root<Product> root = criteriaQuery.from(Product.class);
		criteriaQuery.select(root);

		Predicate p1 = criteriaBuilder.equal(root.get("id"), product_id);
		criteriaQuery.where(p1);

		Query<Product> query = session.createQuery(criteriaQuery);
		Product product = query.getSingleResult();

		return product;
	}
	
	public List<OrderDetail> productListInMyCart(int user_id) {
		try (Session session = sessionFactory.openSession()) {
			CriteriaBuilder criteriaBuilder = session.getCriteriaBuilder();
			CriteriaQuery<OrderDetail> criteriaQuery = criteriaBuilder.createQuery(OrderDetail.class);
			Root<OrderDetail> root = criteriaQuery.from(OrderDetail.class);
			criteriaQuery.select(root);

			Predicate p1 = criteriaBuilder.equal(root.get("user").get("id"), user_id);
			Predicate p2 = criteriaBuilder.isNull(root.get("order").get("id"));
			
			criteriaQuery.where(criteriaBuilder.and(p1, p2));

			Query<OrderDetail> query = session.createQuery(criteriaQuery);
			List<OrderDetail> result = query.getResultList();
			
			return result;
		}
	}
	
	public List<OrderDetail> productListInMyBill(int user_id, String order_detail_id_list) {
		String[] orderDetailIds = order_detail_id_list.split(",");
	    List<Integer> orderDetailIdList = Arrays.stream(orderDetailIds)
	                                            .map(Integer::parseInt)
	                                            .collect(Collectors.toList());

	    try (Session session = sessionFactory.openSession()) {
	        CriteriaBuilder criteriaBuilder = session.getCriteriaBuilder();
	        CriteriaQuery<OrderDetail> criteriaQuery = criteriaBuilder.createQuery(OrderDetail.class);
	        Root<OrderDetail> root = criteriaQuery.from(OrderDetail.class);
	        criteriaQuery.select(root);

	        Predicate p1 = criteriaBuilder.equal(root.get("user").get("id"), user_id);
	        Predicate p2 = root.get("id").in(orderDetailIdList);
	        
	        criteriaQuery.where(criteriaBuilder.and(p1, p2));

	        Query<OrderDetail> query = session.createQuery(criteriaQuery);
	        List<OrderDetail> result = query.getResultList();

	        return result;
	    }
	}
	
	public OrderDetail getInfoToPayment(int user_id, int product_id, int size_id, int quantity) {
		try (Session session = sessionFactory.openSession()) {
			Product product = productService.getInfoProductById(product_id);
			OrderDetail orderDetail = new OrderDetail();
			orderDetail.setId(0);
			orderDetail.setPrice(product.getPrice());
			orderDetail.setQuantity(quantity);
			orderDetail.setSize(session.get(Size.class, size_id));
			orderDetail.setUser(session.get(User.class, user_id));
			orderDetail.setProduct(session.get(Product.class, product_id));
	        return orderDetail;
	    }
	}
	
	public void updateOrderIdInOrderDetail(int id, int order_id) {
	    try (Session session = sessionFactory.openSession()) {
	        session.getTransaction().begin();

	        OrderDetail orderDetail = session.get(OrderDetail.class, id);

	        if (orderDetail != null) {
	            orderDetail.setOrder(session.get(Order.class, order_id));
	            session.update(orderDetail);
	        }

	        session.getTransaction().commit();
	    }
	}
	
	public List<OrderDetail> getInfoOrderHistoryDetailList(int order_id) {
		try (Session session = sessionFactory.openSession()) {
	        CriteriaBuilder criteriaBuilder = session.getCriteriaBuilder();
	        CriteriaQuery<OrderDetail> criteriaQuery = criteriaBuilder.createQuery(OrderDetail.class);
	        Root<OrderDetail> psRoot = criteriaQuery.from(OrderDetail.class);
	        criteriaQuery.select(psRoot);

	        criteriaQuery.where(criteriaBuilder.equal(psRoot.get("order"), order_id));

	        Query<OrderDetail> query = session.createQuery(criteriaQuery);
	        List<OrderDetail> resultList = query.getResultList();

	        return resultList;
	    }
	}
	
	public int addFastOrderDetail(int user_id, int product_id, int size_id, int quantity) {
		int orderDetailId = -1;
		try (Session session = sessionFactory.openSession()) {
			session.getTransaction().begin();

				Product product = getProduct(session, product_id);

				OrderDetail od = new OrderDetail();
				od.setPrice(product.getPrice());
				od.setQuantity(quantity);
				od.setUser(session.get(User.class, user_id));
				od.setProduct(session.get(Product.class, product_id));
				od.setSize(session.get(Size.class, size_id));
				od.setOrder(null);
				session.save(od);
				
				session.flush();
				
				orderDetailId = od.getId();
				
			session.getTransaction().commit();
			
		}
		return orderDetailId;
	}

	
}
