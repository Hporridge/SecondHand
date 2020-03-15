package ahualy.neepu.controller;

import ahualy.neepu.bean.Order;
import ahualy.neepu.dao.OrderDao;
import org.aspectj.weaver.ast.Or;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

@Controller
public class OrderController {

    @Autowired
    private OrderDao orderDao;

    @RequestMapping("/shoppingorder")
    public String allOrder(Model model){
        List<Order> orders = orderDao.queryOrderList();
        model.addAttribute("orders",orders);
        return "order/shoppingorder";
    }

    @RequestMapping(value = "order/delete",method = RequestMethod.GET)
    public String delete(Model model,Integer id){
        orderDao.deleteOrderById(id);
        return "/shoppingorder";
    }

    @RequestMapping(value = "order/edit",method = RequestMethod.GET)
    public String edit(Model model,Integer order_id){
        // 通过用户id去查询该用户的信息，添加到model中
        Order order = orderDao.queryOrderById(order_id);
        model.addAttribute("list",order);
        return "order/edit";
    }

    @RequestMapping(value = "order/edit",method = RequestMethod.POST)
    public String toedit(Model model,Order order){
        orderDao.updateOrderById(order);
        return "redirect:/shoppingorder";
    }
}
