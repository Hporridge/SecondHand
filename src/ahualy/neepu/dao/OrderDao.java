package ahualy.neepu.dao;

import ahualy.neepu.bean.Order;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface OrderDao {

    int addOrder(Order order);

    List<Order> queryOrderList();

    List<Order> queryOrderListByPhone(String phone);

    Order queryOrderById(int id);

    int deleteOrderById(int id);

    int updateOrderById(Order order);
}
