package com.nqb.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import com.nqb.dao.CategoryDao;
import com.nqb.model.Category;

@Component
@Service
public class CategoryService {
	
	@Autowired
	private CategoryDao categoryDao;
	
	public List<Category> getCategoryList() {
		return categoryDao.getCategoryList();
	}
	
	public List<Object[]> getInfoCategoryList() {
		return categoryDao.getInfoCategoryList();
	}

}
