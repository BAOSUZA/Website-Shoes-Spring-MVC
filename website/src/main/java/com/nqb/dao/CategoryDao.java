package com.nqb.dao;

import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.nqb.model.Category;
import com.nqb.model.Product;

@Component
public class CategoryDao {

	@Autowired
	private HibernateTemplate hibernateTemplate;
	
	@Autowired
	SessionFactory sessionFactory;
	
	public List<Category> getCategoryList() {
		return hibernateTemplate.loadAll(Category.class);
	}
	
	public List<Object[]> getInfoCategoryList() {
		try(Session session = sessionFactory.openSession()) {
			CriteriaBuilder criteriaBuilder = session.getCriteriaBuilder();
			CriteriaQuery<Object[]> criteriaQuery = criteriaBuilder.createQuery(Object[].class);
			Root<Category> cRoot = criteriaQuery.from(Category.class);
			Root<Product> pRoot = criteriaQuery.from(Product.class);
			criteriaQuery.multiselect(
					cRoot,
					criteriaBuilder.sum(pRoot.get("id"))
					);
			criteriaQuery.where(criteriaBuilder.equal(cRoot, pRoot.get("category")));
			criteriaQuery.groupBy(cRoot);
			
			Query<Object[]> query = session.createQuery(criteriaQuery);
	        List<Object[]> resultList = query.getResultList();
	        
			return resultList;
		}
	}
	
}
