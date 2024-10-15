package com.nqb.dao;

import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.nqb.model.Category;
import com.nqb.model.Product;
import com.nqb.model.ProductSize;

@Component
public class ProductDao {

	@Autowired
	HibernateTemplate hibernateTemplate;
	
	@Autowired
    private SessionFactory sessionFactory;

//	DUYỆT TẤT CẢ SẢN PHẨM
	public List<Product> getAllProduct() {
		return hibernateTemplate.loadAll(Product.class);
	}
	
//	DUYỆT TẤT CẢ SẢN PHẨM CÓ CATEGORY_ID CHỈ ĐỊNH
	public List<Product> getProductByCategoryId(int category_id) {
		try (Session session = sessionFactory.openSession()) {
			CriteriaBuilder criteriaBuilder = session.getCriteriaBuilder();
		    
		    CriteriaQuery<Product> criteriaQuery = criteriaBuilder.createQuery(Product.class);
		    Root<Product> root = criteriaQuery.from(Product.class);

		    Predicate predicate = criteriaBuilder.equal(root.get("category").get("id"), category_id);
		    criteriaQuery.select(root).where(predicate);

		    Query<Product> query = session.createQuery(criteriaQuery);
		    List<Product> resultList = query.getResultList();
		    return resultList;
		}
	}
	
//	DUYỆT NHỮNG SẢN PHẨM ĐƯỢC MUA NHIỀU NHẤT
	public List<Object[]> getOutstandingProduct(int quantityRow) {
	    try (Session session = sessionFactory.openSession()) {
	        CriteriaBuilder criteriaBuilder = session.getCriteriaBuilder();
	        CriteriaQuery<Object[]> criteriaQuery = criteriaBuilder.createQuery(Object[].class);
	        Root<Product> pRoot = criteriaQuery.from(Product.class);
	        Root<ProductSize> psRoot = criteriaQuery.from(ProductSize.class);

	        criteriaQuery.multiselect(
	            pRoot,
	            criteriaBuilder.sum(psRoot.get("quantity_purchased"))
	        );

	        criteriaQuery.where(criteriaBuilder.equal(pRoot, psRoot.get("product")));
	        criteriaQuery.groupBy(pRoot);
	        criteriaQuery.orderBy(criteriaBuilder.desc(criteriaBuilder.sum(psRoot.get("quantity_purchased"))));

	        Query<Object[]> query = session.createQuery(criteriaQuery);
	        List<Object[]> resultList = query.setMaxResults(quantityRow).getResultList();

	        return resultList;
	    }
	}


//	DUYỆT TẤT CẢ SẢN PHẨM ĐƯỢC GIẢM GIÁ
	@Transactional
	public List<Product> getProductsByDiscountNotZero() {
	    Session session = sessionFactory.openSession();
	    CriteriaBuilder criteriaBuilder = session.getCriteriaBuilder();
	    
	    CriteriaQuery<Product> criteriaQuery = criteriaBuilder.createQuery(Product.class);
	    Root<Product> root = criteriaQuery.from(Product.class);

	    Predicate discountNotZeroPredicate = criteriaBuilder.notEqual(root.get("discount"), 0);
	    criteriaQuery.select(root).where(discountNotZeroPredicate);

	    Query<Product> query = session.createQuery(criteriaQuery);
	    List<Product> resultList = query.getResultList();
	    session.close();

	    return resultList;
	}
	
//	DUYỆT TẤT CẢ SẢN PHẨM ĐANG ĐƯỢC TÌM KIẾM
	@Transactional
	public List<Product> getProductBySearch(String content) {
		try (Session session = sessionFactory.openSession()) {
			CriteriaBuilder criteriaBuilder = session.getCriteriaBuilder();
			CriteriaQuery<Product> criteriaQuery = criteriaBuilder.createQuery(Product.class);
			Root<Product> root = criteriaQuery.from(Product.class);
			criteriaQuery.select(root);
			
			Predicate p1 = criteriaBuilder.like(root.get("name").as(String.class), "%"+content+"%");
			Predicate p2 = criteriaBuilder.like(root.get("description").as(String.class), "%"+content+"%");
			criteriaQuery.where(criteriaBuilder.or(p1, p2));
			
			Query<Product> query = session.createQuery(criteriaQuery);
		    List<Product> resultList = query.getResultList();
		    session.close();

		    return resultList;
		}
	}
	
//	DUYỆT THÔNG TIN CỦA PRODUCT VỚI ID CHỈ ĐỊNH
	public Product getInfoProductById(int id) {
		try(Session session = sessionFactory.openSession()) {
			CriteriaBuilder criteriaBuilder = session.getCriteriaBuilder();
			CriteriaQuery<Product> criteriaQuery = criteriaBuilder.createQuery(Product.class);
			Root<Product> root = criteriaQuery.from(Product.class);
			criteriaQuery.select(root);
			
			Predicate predicate = criteriaBuilder.equal(root.get("id").as(Product.class), id);
			criteriaQuery.where(predicate);
			
			Query<Product> query = session.createQuery(criteriaQuery);
			Product result = query.getSingleResult();
		    session.close();
			return result;
		}
	}
	
//	DUYỆT THÔNG TIN CỦA PRODUCT CHO ADMIN
	public List<Object[]> getInfoProductList() {
		try(Session session = sessionFactory.openSession()) {
			CriteriaBuilder criteriaBuilder = session.getCriteriaBuilder();
			CriteriaQuery<Object[]> criteriaQuery = criteriaBuilder.createQuery(Object[].class);
			Root<Product> pRoot = criteriaQuery.from(Product.class);
			Root<ProductSize> psRoot = criteriaQuery.from(ProductSize.class);
			criteriaQuery.multiselect(
					pRoot, 
					criteriaBuilder.sum(psRoot.get("quantity_purchased")),
					criteriaBuilder.sum(psRoot.get("quantity"))
					);
			
			criteriaQuery.where(criteriaBuilder.equal(pRoot, psRoot.get("product")));
			criteriaQuery.groupBy(pRoot);
			
			Query<Object[]> query = session.createQuery(criteriaQuery);
	        List<Object[]> resultList = query.getResultList();

	        return resultList;
		}
	}
	
//	DUYỆT THÔNG TIN CỦA PRODUCT THEO ID CATEGORY CHO ADMIN
	public List<Object[]> getInfoProductByCategoryIdList(int category_id) {
		try(Session session = sessionFactory.openSession()) {
			CriteriaBuilder criteriaBuilder = session.getCriteriaBuilder();
			CriteriaQuery<Object[]> criteriaQuery = criteriaBuilder.createQuery(Object[].class);
			Root<Product> pRoot = criteriaQuery.from(Product.class);
			Root<ProductSize> psRoot = criteriaQuery.from(ProductSize.class);
			criteriaQuery.multiselect(
					pRoot, 
					criteriaBuilder.sum(psRoot.get("quantity_purchased")),
					criteriaBuilder.sum(psRoot.get("quantity"))
					);
			
			Predicate p1 = criteriaBuilder.equal(pRoot, psRoot.get("product"));
			Predicate p2 = criteriaBuilder.equal(pRoot.get("category"), category_id);
			criteriaQuery.where(p1, p2);
			criteriaQuery.groupBy(pRoot);
			
			Query<Object[]> query = session.createQuery(criteriaQuery);
	        List<Object[]> resultList = query.getResultList();

	        return resultList;
		}
	}
	
//	THÊM SẢN PHẨM CHO BẢNG PRODUCT
	public int insertRowInProduct(int category_id, String thumbnail, String name, int price, int discount, String description) {
	    int productId = -1;

	    try (Session session = sessionFactory.openSession()) {
	        session.getTransaction().begin();
	        Category c = session.get(Category.class, category_id);

	        Product p = new Product();
	        p.setName(name);
	        p.setPrice(price);
	        p.setDiscount(discount);
	        p.setThumbnail(thumbnail);
	        p.setDescription(description);
	        p.setCategory(c);

	        session.save(p);
	        session.getTransaction().commit();

	        productId = p.getId();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return productId;
	}

	
}
