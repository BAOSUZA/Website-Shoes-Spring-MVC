package com.nqb.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.nqb.model.OrderDetail;
import com.nqb.model.Product;
import com.nqb.model.ProductSize;
import com.nqb.model.User;
import com.nqb.service.OrderDetailService;
import com.nqb.service.OrderService;
import com.nqb.service.ProductService;
import com.nqb.service.ProductSizeService;
import com.nqb.service.UserService;

@Controller
public class HandleController {

	@Autowired
	ProductService productService;

	@Autowired
	UserService userService;

	@Autowired
	ProductSizeService productSizeService;

	@Autowired
	OrderDetailService orderDetailService;

	@Autowired
	OrderService orderService;

	@Autowired
	private HttpSession session;

//	XỬ LÝ ĐĂNG NHẬP
	@RequestMapping("/loginAccount")
	public String loginHandling(@RequestParam("email") String email, @RequestParam("password") String password,
			Model model) {

		if (userService.isValid(email, password)) {
			User user = userService.getUserByEmailAndPassword(email, password);
			session.setAttribute("user_id", user.getId());
			session.setAttribute("role_id", user.getRole().getId());
			session.setAttribute("fullname", user.getFullname());
			dataMyCart();
		} else {
			model.addAttribute("email", email);
			model.addAttribute("error_password", "*Mật khẩu chưa chính xác, vui lòng nhập lại!");
			return "user/login";
		}
		dataHome(model);
		return "user/index";
	}

//	XỬ LÝ TẠO TÀI KHOẢN
	@RequestMapping(value = "/insertAccount", method = RequestMethod.POST)
	public String registerHandling(@RequestParam("fullname") String fullname, @RequestParam("email") String email,
			@RequestParam("phonenumber") String phone_number, @RequestParam("address") String address,
			@RequestParam("password") String password, @RequestParam("repassword") String repassword, Model model) {
		if (password.equals(repassword)) {
			userService.addUser(fullname, email, address, phone_number, password);
		} else {
			model.addAttribute("fullname", fullname);
			model.addAttribute("email", email);
			model.addAttribute("phone_number", phone_number);
			model.addAttribute("address", address);
			model.addAttribute("password", password);
			model.addAttribute("error_repassword", "*Nhập sai mật khẩu, vui lòng nhập lại!");
		}
		dataHome(model);
		return "user/register";
	}

//	XỬ LÝ ĐĂNG XUẤT
	public void logoutHandling(Model model) {
		session.removeAttribute("user_id");
		session.removeAttribute("role_id");
		session.removeAttribute("fullname");
		session.removeAttribute("myCartList");
	}

//	XỬ LÝ GỬI DỮ LIỆU BAN ĐẦU CHO TRANG CHỦ
	public void dataHome(Model model) {
		int totalPageAllProducts = (int) Math.ceil(productService.getAllProduct().size() / 10);
		int totalPageDiscountProducts = (int) Math.ceil(productService.getProductsByDiscountNotZero().size() / 5);

		List<Product> listFeatured = new ArrayList<>();
		for (Object[] objects : productService.getOutstandingProduct(7)) {
		    Product product = (Product) objects[0];
		    listFeatured.add(product);
		}
		
		model.addAttribute("listFeatured", listFeatured);
		model.addAttribute("allProducts", productService.getAllProduct());
		model.addAttribute("discountProducts", productService.getProductsByDiscountNotZero());
		model.addAttribute("totalPageAllProducts", totalPageAllProducts);
		model.addAttribute("totalPageDiscountProducts", totalPageDiscountProducts);
	}

//	XỬ LÝ TÌM KIẾM
	public void searchHandling(Model model, String content) {
		int totalPageProducts = (int) Math.ceil(productService.getProductBySearch(content).size() / 10);
		model.addAttribute("allProducts", productService.getProductBySearch(content));
		model.addAttribute("totalPageProducts", totalPageProducts);
	}
	
//	XỬ LÝ TRUYỀN DỮ LIỆU VỀ GIAO DIỆN TỪNG LOẠI SẢN PHẨM
	public void pushDataToTypeProduct(Model model , String type) {
		int categoryId;
		if (type.equals("nam")) {
			categoryId = 1;
		}else if(type.equals("nu")) {
			categoryId = 2;
		}else if (type.equals("tre-em")) {
			categoryId = 3;
		}else {
			categoryId = 4;
		}
		int totalPageProducts = (int) Math.ceil(productService.getProductByCategoryId(categoryId).size() / 10);
		model.addAttribute("listProducts", productService.getProductByCategoryId(categoryId));
		model.addAttribute("totalTypeProductPages", totalPageProducts);
	}

//	XỬ LÝ ĐI ĐẾN GIAO DIỆN CHI TIẾT 1 SẢN PHẨM
	public void goToDetailInterface(Model model, int productId) {
		Product productInfo = productService.getInfoProductById(productId);
		List<ProductSize> product_sizeList = productSizeService.getAllProductSize();
		String listSizeStr = "";
		for (ProductSize item : product_sizeList) {
			if (item.getProduct().getId() == productId) {
				listSizeStr += "ID=" + item.getSize().getId() + ",Size=" + item.getSize().getType() + ",Quantity="
						+ item.getQuantity() + ",Quantity Purchased=" + item.getQuantity_purchased() + ",Product ID="
						+ item.getProduct().getId() + ";";
			}
		}
		model.addAttribute("listSizeStr", listSizeStr);
		model.addAttribute("productInfo", productInfo);
	}

//	 XỬ LÝ THÊM VÀO GIỎ HÀNG
	@RequestMapping(value = "/detail/addToCart", method = RequestMethod.POST)
	public String addToCart(@RequestParam("product_id") int product_id, @RequestParam("size_id") int size_id,
			@RequestParam(value = "amount-product") int amount_product, Model model) {
		int user_id = (int) session.getAttribute("user_id");
		if (orderDetailService.addToCart(user_id, product_id, size_id, amount_product)) {
			productSizeService.updateQuantityById(amount_product, product_id, size_id);
		}
		Product productInfo = productService.getInfoProductById(product_id);
		List<ProductSize> product_sizeList = productSizeService.getAllProductSize();
		String listSizeStr = "";
		for (ProductSize item : product_sizeList) {
			if (item.getProduct().getId() == product_id) {
				listSizeStr += "ID=" + item.getSize().getId() + ",Size=" + item.getSize().getType() + ",Quantity="
						+ item.getQuantity() + ",Quantity Purchased=" + item.getQuantity_purchased() + ",Product ID="
						+ item.getProduct().getId() + ";";
			}
		}
		model.addAttribute("listSizeStr", listSizeStr);
		model.addAttribute("productInfo", productInfo);
		dataMyCart();
		return "user/detail";
	}

//	XỬ LÝ GỌI DỮ LIỆU CỦA GIỎ HÀNG
	public void dataMyCart() {
		Object userIdAttribute = session.getAttribute("user_id");
		if (userIdAttribute != null && userIdAttribute instanceof Integer) {
			int user_id = (int) userIdAttribute;
			List<OrderDetail> list = orderDetailService.productListInMyCart(user_id);
			session.setAttribute("myCartList", list);
		}
	}

//	XỬ LÝ GỌI DỮ LIỆU ĐẾN GIỎ HÀNG
	public void dataPayment(Model model) {
		int user_id = (int) session.getAttribute("user_id");
		List<OrderDetail> list = orderDetailService.productListInMyCart(user_id);
		model.addAttribute("allDataCart", list);
	}

//	XỬ LÝ TẠO HÓA ĐƠN VÀ CHUYỂN ĐẾN GIAO DIỆN THANH TOÁN
	@RequestMapping(value = "/createBill", method = RequestMethod.POST)
	public String createBill(Model model, @RequestParam("idList") String order_detail_id_list) {
		Object userIdAttribute = session.getAttribute("user_id");
		if (userIdAttribute != null && userIdAttribute instanceof Integer) {
			int user_id = (int) userIdAttribute;
			model.addAttribute("myBill", orderDetailService.productListInMyBill(user_id, order_detail_id_list));
		}
		return "user/payment";
	}

//	XỬ LÝ CHUYỂN ĐẾN GIAO DIỆN THANH TOÁN KHI MUA 1 SẢN PHẨM Ở DETAIL PRODUCT
	@RequestMapping(value = "/payone/{productId}/{sizeId}/{quantity}")
	public String detailToPayment(Model model, @PathVariable int productId, @PathVariable int sizeId,
			@PathVariable int quantity) {
		int user_id = (int) session.getAttribute("user_id");
		model.addAttribute("infoDetailToPay",
				orderDetailService.getInfoToPayment(user_id, productId, sizeId, quantity));
		return "user/payment";
	}

//	 XỬ LÝ THANH TOÁN
	@RequestMapping(value = "/paymentbill", method = RequestMethod.POST)
	public String paymentBill(Model model, @RequestParam("orderdetail_id") String orderdetail_id,
			@RequestParam("name") String name, @RequestParam("address") String address,
			@RequestParam("phone") String phone, @RequestParam("email") String email,
			@RequestParam("total") int total_money) {
		int user_id = (int) session.getAttribute("user_id");
		orderdetail_id = orderdetail_id.trim();
		String[] orderdetail_id_arr = orderdetail_id.split(" ");
		System.out.println(orderdetail_id);
		int new_order_id = orderService.insertRowInOrder(name, address, phone, email, total_money, user_id);
		for (int i = 0; i < orderdetail_id_arr.length; i++) {
			orderDetailService.updateOrderIdInOrderDetail(Integer.parseInt(orderdetail_id_arr[i]), new_order_id);
		}
		dataMyCart();
		dataHome(model);
		return "user/index";
	}
	
//	XỬ LÝ THANH TOÁN KHI MUA NGAY
	@RequestMapping(value = "/payone/{productId}/{sizeId}/paymentbill")
	public String fastPaymentProduct(Model model,
			@PathVariable int productId, 
			@PathVariable int sizeId,
			@RequestParam("orderdetail_id") int orderdetail_id,
			@RequestParam("name") String name, @RequestParam("address") String address,
			@RequestParam("phone") String phone, @RequestParam("email") String email,
			@RequestParam("total") int total_money) {
		int user_id = (int) session.getAttribute("user_id");
		orderdetail_id = orderDetailService.addFastOrderDetail(user_id, productId, sizeId, 1);
		productSizeService.updateQuantityById(1, productId, sizeId);
		int new_order_id = orderService.insertRowInOrder(name, address, phone, email, total_money, user_id);
		orderDetailService.updateOrderIdInOrderDetail(orderdetail_id, new_order_id);
		dataMyCart();
		dataHome(model);
		return "user/index";
	}
	
//	XỬ LÝ DUYỆT ĐƠN HÀNG ĐÃ ĐẶT
	public void dataOrderHistory(Model model) {
		int user_id = (int) session.getAttribute("user_id");
		List<OrderDetail> list = orderDetailService.productListInMyCart(user_id);
		model.addAttribute("orderHistoryList", orderService.getOrderListByUserId(user_id));
	}
	
//	HIỂN THỊ CHI TIẾT LỊCH SỬ ĐƠN HÀNG ĐÃ ĐẶT
	@RequestMapping(value = "order-history/{order_id}", method = RequestMethod.GET)
	public String viewOrderHistoryDetail(Model model, @PathVariable int order_id) {
		List<OrderDetail> detailList = orderDetailService.getInfoOrderHistoryDetailList(order_id);
		dataOrderHistory(model);
		model.addAttribute("detailList", detailList);
		return "user/history-order";
	}
	
}
