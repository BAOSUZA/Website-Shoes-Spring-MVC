package com.nqb.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.nqb.service.CategoryService;
import com.nqb.service.OrderService;
import com.nqb.service.ProductService;
import com.nqb.service.ProductSizeService;
import com.nqb.service.UserService;

@Controller
public class AdminController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private OrderService orderService;
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private ProductSizeService productSizeService;
	
	@Autowired
	private CategoryService categoryService;
	
	@RequestMapping(value = {"admin", "management/home"})
	public String viewHomeAdmin() {
		return "admin/index";
	}
	
	@RequestMapping(value = "/management/account")
	public String viewAccountManagement(Model model) {
		model.addAttribute("accList", userService.getAccountList());
		return "admin/account";
	}
	
	@RequestMapping(value = "/management/order")
	public String viewOrderManagement(Model model) {
		model.addAttribute("orderList", orderService.getOrderList());
		return "admin/order";
	}
	
	@RequestMapping(value = "/management/order/{choice}/{id}")
	public String viewUpdateOrderManagement2(Model model,@PathVariable String choice, @PathVariable int id) {
		orderService.updateStatusOrder(id, choice);
		model.addAttribute("orderList", orderService.getOrderList());
		return "admin/order";
	}
	
	@RequestMapping(value = "/management/product")
	public String viewProductManagement(Model model) {
		List<Object[]> object = productService.getInfoProductList();
		model.addAttribute("productList", object);
		return "admin/product";
	}
	
	@RequestMapping(value = "/management/view-add-product")
	public String viewAddProduct(Model model) {
		model.addAttribute("categoryList", categoryService.getCategoryList());
		return "admin/addproduct";
	}
	
	@RequestMapping(value = "/management/add-product", method = RequestMethod.POST)
	public String addProductHandle(
			Model model,
			@RequestParam("category_id") int category_id,
			@RequestParam("thumbnail") String thumbnail,
			@RequestParam("name") String name,
			@RequestParam("price") int price,
			@RequestParam("discount") int discount,
			@RequestParam("description") String description,
			@RequestParam("quantity") int quantity
			) {
		int product_id_new = productService.insertRowInProduct(category_id, thumbnail, name, price, discount, description);
		productSizeService.insertRowsInProductSize(product_id_new, quantity);
		List<Object[]> object = productService.getInfoProductList();
		model.addAttribute("productList", object);
		return "admin/product";
	}
	
	@RequestMapping(value = "/management/category")
	public String viewCategoryManagement(Model model) {
		List<Object[]> object = categoryService.getInfoCategoryList();
		model.addAttribute("categoryList", object);
		return "admin/category";
	}
	
	@RequestMapping(value = "/management/category/all-product/{category_id}")
	public String viewAllProductInCategoryManagement(Model model, @PathVariable int category_id) {
		List<Object[]> object = productService.getInfoProductByCategoryIdList(category_id);
		model.addAttribute("productList", object);
		return "admin/product";
	}

}
