package com.nqb.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class MyController {

	@Autowired
	private HandleController handleController;

	// TRẢ VỀ GIAO DIỆN TRANG CHỦ
	@RequestMapping(value = { "/", "/home" })
	public String viewHome(Model model) {
		handleController.dataHome(model);
		return "user/index";
	}

	// TRẢ VỀ GIAO DIỆN GIỚI THIỆU
	@RequestMapping("/introduce")
	public String viewIntroduce(Model model) {
		return "user/introduce";
	}

	// TRẢ VỀ GIAO DIỆN SẢN PHẨM CÁC LOẠI
	@RequestMapping("/product/{type}")
	public String viewProduct(Model model, @PathVariable String type) {
		handleController.pushDataToTypeProduct(model, type);
		return "user/product";
	}

	// TRẢ VỀ GIAO DIỆN LIÊN HỆ
	@RequestMapping("/contact")
	public String ViewContact(Model model) {
		return "user/contact";
	}

	// TRẢ VỀ GIAO DIỆN ĐĂNG NHẬP
	@RequestMapping("/login")
	public String formLogin(Model model) {
		return "user/login";
	}

	// TRẢ VỀ GIAO DIỆN ĐĂNG KÝ
	@RequestMapping("/register")
	public String formRegister(Model model) {
		return "user/register";
	}

	// TRẢ VỀ GIAO DIỆN ĐĂNG NHẬP KHI ĐĂNG XUẤT
	@RequestMapping("/logout")
	public String logout(Model model) {
		handleController.logoutHandling(model);
		return "user/login";
	}

	// TRẢ VỀ GIAO DIỆN TIỀM KIẾM SẢN PHẨM
	@RequestMapping(value = { "/search", "detail/search", "product/search", "addToCart/search",
			"loginAccount/search" }, method = RequestMethod.POST)
	public String search(@RequestParam("content") String content, Model model) {
		handleController.searchHandling(model, content);
		return "user/search";
	}

	// TRẢ VỀ GIAO DIỆN CHI TIẾT SẢN PHẨM
	@RequestMapping(value = "/detail/{productId}")
	public String showProductDetail(Model model, @PathVariable int productId) {
		handleController.goToDetailInterface(model, productId);
		return "user/detail";
	}

	// TRẢ VỀ GIAO DIỆN GIỎ HÀNG
	@RequestMapping(value = "/cart")
	public String viewCart(Model model) {
		handleController.dataMyCart();
		return "user/cart";
	}

	// GIAO DIỆN THANH TOÁN GIỎ HÀNG
	@RequestMapping(value = "/payment")
	public String viewPayment(Model model) {
		handleController.dataPayment(model);
		return "user/payment";
	}

	// GIAO DIỆN LỊCH SỬ ĐẶT HÀNG
	@RequestMapping(value = "/order-history")
	public String viewOrderHistory(Model model) {
		handleController.dataOrderHistory(model);
		return "user/history-order";
	}

}
