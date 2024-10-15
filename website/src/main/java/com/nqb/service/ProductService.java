package com.nqb.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import com.nqb.dao.ProductDao;
import com.nqb.model.Product;

@Component
@Service
public class ProductService {

	@Autowired
	ProductDao productDao;

	public List<Product> getAllProduct() {
		return productDao.getAllProduct();
	}
	
	public List<Product> getProductsByDiscountNotZero() {
		return productDao.getProductsByDiscountNotZero();
	}

	public List<Product> getProductBySearch(String content) {
		return productDao.getProductBySearch(content);
	}
	
	public Product getInfoProductById(int id) {
		return productDao.getInfoProductById(id);
	}
	
	public List<Product> getProductByCategoryId(int category_id) {
		return productDao.getProductByCategoryId(category_id);
	}
	
	public List<Object[]> getOutstandingProduct(int quantityRow) {
		return productDao.getOutstandingProduct(quantityRow);
	}
	
	public List<Object[]> getInfoProductList() {
		return productDao.getInfoProductList();
	}
	
	public List<Object[]> getInfoProductByCategoryIdList(int category_id) {
		return productDao.getInfoProductByCategoryIdList(category_id);
	}
	
	public int insertRowInProduct(int category_id, String thumbnail, String name, int price, int discount, String description) {
		return productDao.insertRowInProduct(category_id, thumbnail, name, price, discount, description);
	}
}
