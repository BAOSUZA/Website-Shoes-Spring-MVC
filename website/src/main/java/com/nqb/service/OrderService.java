package com.nqb.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import com.nqb.dao.OrderDao;
import com.nqb.model.Order;

@Component
@Service
public class OrderService {
	
	@Autowired
	private OrderDao orderDao;
	
	public int insertRowInOrder(String reciever, String address, String phone, String email, int total_money, int user_id) {
		return orderDao.insertRowInOrder(reciever, address, phone, email, total_money, user_id);
	}
	
	public List<Order> getOrderList() {
		return orderDao.getOrderList();
	}
	
	public List<Order> getOrderListByUserId(int user_id) {
		return orderDao.getOrderListByUserId(user_id);
	}

	public void updateStatusOrder(int id, String choice) {
		orderDao.updateStatusOrder(id, choice);
	}
}
