package com.nqb.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import com.nqb.dao.ProductSizeDao;
import com.nqb.model.ProductSize;

@Component
@Service
public class ProductSizeService {
	
	@Autowired
	ProductSizeDao productSizeDao;
	
	public List<ProductSize> getAllProductSize() {
		return productSizeDao.getAllProductSize();
	}
	
	public void updateQuantityById(int quantity, int product_id, int size_id) {
		productSizeDao.updateQuantityById(quantity, product_id, size_id);
	}
	
	public void insertRowsInProductSize(int product_id, int quantity) {
		productSizeDao.insertRowsInProductSize(product_id, quantity);
	}
}
