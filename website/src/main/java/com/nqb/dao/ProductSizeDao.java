package com.nqb.dao;

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

import com.nqb.model.Category;
import com.nqb.model.Product;
import com.nqb.model.ProductSize;
import com.nqb.model.Size;
@Component
public class ProductSizeDao {
	
	@Autowired
	SessionFactory sessionFactory;

	@Autowired
	HibernateTemplate hibernateTemplate;
	
	public List<ProductSize> getAllProductSize() {
		return hibernateTemplate.loadAll(ProductSize.class);
	}
	
	public void updateQuantityById(int quantity, int product_id, int size_id) {
		Session session = sessionFactory.openSession();
		session.getTransaction().begin();
		
		CriteriaBuilder criteriaBuilder = session.getCriteriaBuilder();
		CriteriaQuery<ProductSize> criteriaQuery = criteriaBuilder.createQuery(ProductSize.class);
		Root<ProductSize> root = criteriaQuery.from(ProductSize.class);
		criteriaQuery.select(root);
		
		Predicate p1 = criteriaBuilder.equal(root.get("size").get("id"), size_id);
		Predicate p2 = criteriaBuilder.equal(root.get("product").get("id"), product_id);
		
		criteriaQuery.where(criteriaBuilder.and(p1, p2));
		
		Query<ProductSize> query = session.createQuery(criteriaQuery);
		ProductSize productSize = query.getSingleResult();
		
		if (productSize != null) {
			productSize.setQuantity(productSize.getQuantity() - quantity);
			productSize.setQuantity_purchased(productSize.getQuantity_purchased() + quantity);
			session.getTransaction().commit();
		} else {
			session.getTransaction().rollback();
		}
	}
	
	public void insertRowsInProductSize(int product_id, int quantity) {
		try (Session session = sessionFactory.openSession()) {
	        session.getTransaction().begin();
	        Product p = session.get(Product.class, product_id);
	        for (int i = 1; i <= 7; i++) {
				ProductSize ps = new ProductSize();
				ps.setProduct(p);
				ps.setSize(session.get(Size.class, i));
				ps.setQuantity(quantity);
				ps.setQuantity_purchased(0);
				session.save(ps);
			}
	        session.getTransaction().commit();
	    }
	}
	
	
	

}
