package com.nqb.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import com.nqb.dao.OrderDetailDao;
import com.nqb.model.OrderDetail;

@Component
@Service
public class OrderDetailService {

	@Autowired
	private OrderDetailDao orderDetailDao;
	
	public boolean addToCart(int user_id, int product_id, int size_id, int amount_product) {
		return orderDetailDao.addToCart(user_id, product_id, size_id, amount_product);
	}
	
	public List<OrderDetail> productListInMyCart(int user_id) {
		return orderDetailDao.productListInMyCart(user_id);
	}
	
	public List<OrderDetail> productListInMyBill(int user_id, String order_detail_id_list) {
		return orderDetailDao.productListInMyBill(user_id, order_detail_id_list);
	}
	
	public OrderDetail getInfoToPayment(int user_id, int product_id, int size_id, int quantity) {
		return orderDetailDao.getInfoToPayment(user_id, product_id, size_id, quantity);
	}
	
	public void updateOrderIdInOrderDetail(int id, int order_id) {
		orderDetailDao.updateOrderIdInOrderDetail(id, order_id);
	}
	
	public List<OrderDetail> getInfoOrderHistoryDetailList(int order_id) {
		return orderDetailDao.getInfoOrderHistoryDetailList(order_id);
	}
	
	public int addFastOrderDetail(int user_id, int product_id, int size_id, int quantity) {
		return orderDetailDao.addFastOrderDetail(user_id, product_id, size_id, quantity);
	}
}
