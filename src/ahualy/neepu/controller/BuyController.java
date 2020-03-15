package ahualy.neepu.controller;

import ahualy.neepu.bean.*;
import ahualy.neepu.config.AlipayConfig;
import ahualy.neepu.dao.*;
import ahualy.neepu.util.OrderCodeFactory;
import com.alipay.api.AlipayApiException;
import com.alipay.api.AlipayClient;
import com.alipay.api.DefaultAlipayClient;
import com.alipay.api.request.AlipayTradePagePayRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.List;

@Controller
public class BuyController {
    @Autowired
    private ShoppingDao shoppingDao;
    @Autowired
    private BuyDao buyDao;
    @Autowired
    private UserDao userDao;
    @Autowired
    private OrderDao orderDao;
    @Autowired
    private ShoppingClassDao shoppingClassDao;


    @RequestMapping("/shopping")
    public String shopping(Model model,String addMessage){
        List<Shopping> list = shoppingDao.queryShoppingList();
        // 需要将查询出商品种类
        List<ShoppingClass> shopingclass_list = shoppingClassDao.queryShoppingClassList();
        model.addAttribute("shopingclass_list",shopingclass_list);
        model.addAttribute("list",list);
        model.addAttribute("addMessage",addMessage);
        return "shopping";
    }

    // 添加到购物车
    @RequestMapping(value = "/addcart",method = RequestMethod.GET)
    public String addcart(HttpServletRequest request, Integer id,Model model){

        HttpSession session = request.getSession();
        User userbean = (User) session.getAttribute("user");
        int c_id  = userbean.getId();
        
        // 根据c_id和s_id去查询该用户添加的商品，如果在该用户下面已经添加了这个商品，就不再进行添加
      
        if(buyDao.queryBuyBySIdAndCId(c_id,id)!=null){
            model.addAttribute("addMessage","该商品已经在购物车了");
            return "redirect:/shopping";
        }else{
            Buy buybean = new Buy();
            buybean.setState(0);
            buybean.setC_id(c_id);
            buybean.setS_id(id);
            buyDao.addBuy(buybean);
            model.addAttribute("addMessage","添加成功");
            return "redirect:/shopping";
        }
    }

    /**
     *  创建订单
     * @param sumPrice 需要付款的总金额
     * @param ids  付款商品的id
     * @return
     */
    
    @RequestMapping(value ="/buyshopping",method = RequestMethod.GET)
    public void  buyshopping(@RequestParam  String sumPrice, @RequestParam int[] ids,@RequestParam Integer client,HttpServletResponse response) throws IOException {
        //生成订单 数量默认1 遍历商品id，通过商品id获取到商品信息，获取交易双方的用户信息
        //跳转到支付宝付款页面

        AlipayClient alipayClient = new DefaultAlipayClient(AlipayConfig.gatewayUrl, AlipayConfig.app_id,
                AlipayConfig.merchant_private_key, "json", AlipayConfig.charset, AlipayConfig.alipay_public_key, AlipayConfig.sign_type);

//      订单号
        String out_trade_no = OrderCodeFactory.getOrderIdByUUID();
        out_trade_no  = URLDecoder.decode(out_trade_no,"UTF-8");
//      总金额
        String total_amount = sumPrice;
        total_amount = URLDecoder.decode(total_amount,"UTF-8");
//      商品名称
        Shopping shoppings = shoppingDao.queryShoppingById(ids[0]);
        String subject = shoppings.getTitle();
        subject = URLDecoder.decode(subject,"UTF-8");
//      商品描述
        String body = subject;
        body = URLDecoder.decode(body,"UTF-8");

        AlipayTradePagePayRequest alipayRequest = new AlipayTradePagePayRequest(); ///创建API对应的request
        alipayRequest.setReturnUrl("success");
        alipayRequest.setBizContent("{" +
                "    \"out_trade_no\":\""+ out_trade_no +"\"," +
                "    \"product_code\":\"FAST_INSTANT_TRADE_PAY\"," +
                "    \"total_amount\":"+ total_amount +"," +
                "    \"subject\":\""+ subject +"\"," +
                "    \"body\":\""+ body +"\"" +
                "    }"+
                "  }");

        String form="";

        try {
            form = alipayClient.pageExecute(alipayRequest).getBody(); //调用SDK生成表单
        } catch (AlipayApiException e) {
            e.printStackTrace();
        }
        response.setContentType("text/html;charset=utf-8");
        response.getWriter().println(form);//直接将完整的表单html输出到页面
        response.getWriter().close();


    }

    // 个人订单,通过session中获取用户id
    @RequestMapping(value = "/myorder",method = RequestMethod.GET)
    public String myorder(Model model,@RequestParam Integer client){
        //通过电话号码获取到该用户所有的订单
        User user = userDao.queryUserById(client);
        List<Order> list = orderDao.queryOrderListByPhone(user.getPhone());
        model.addAttribute("list",list);
        return "myorder";
    }
    
    @RequestMapping(value = "/mycart",method = RequestMethod.GET)
    public String mycart(Model model,HttpSession session){
        User userbean = (User) session.getAttribute("user");
        List<Buy> list = buyDao.queryBuyList(userbean.getId());
        List<Shopping> list2 = new ArrayList<Shopping>();
        for (Buy bean: list) {
            Shopping shoppingbean = shoppingDao.queryShoppingById(bean.getS_id());
            list2.add(shoppingbean);
        }
        model.addAttribute("list", list2);
        return "mycart";
    }

    
    @RequestMapping(value = "mycart/delete",method = RequestMethod.GET)
    public String delete(HttpServletRequest request, Integer id){
        // 传过来的是商品id s_id,还需要获取用户id
        HttpSession session = request.getSession();
        User userbean = (User) session.getAttribute("user");
        int c_id  = userbean.getId();
        
        buyDao.deleteBuyBySIdAndCId(c_id,id);
        return "redirect:/shopping";
    }

    @RequestMapping("/success")
    public String success(String out_trade_no,Double total_amount,Integer client,int[] ids){
        // 购买者
        User user = userDao.queryUserById(client);
        //每一个商品是一个订单
        for (int id : ids) {
            Shopping shopping = shoppingDao.queryShoppingById(id);
            Order order = new Order();
            order.setOrderId(out_trade_no);
            order.setShopping_name(shopping.getTitle());
            order.setNum("1");
            order.setMoney(shopping.getMoney());
            order.setRevceiving_address(user.getAddress());
            order.setRevceiving_name(user.getUsername());
            order.setRevceiving_phone(user.getPhone());
            order.setSend_phone(userDao.queryUserById(shopping.getC_id()).getPhone());
            order.setPhoto(shopping.getPhoto());
            orderDao.addOrder(order);
            // 订单创建好了之后，购物车中相应的物品应该被清空，也就是执行一个删除操作
            buyDao.deleteBuyBySIdAndCId(user.getId(),id);
        }
        List<Buy> list = buyDao.queryBuyList(user.getId());
        for (Buy bean: list) {
            bean.setState(1);
            buyDao.updateBuyById(bean);
        }

//        ModelAndView modelAndView = new ModelAndView();
//        modelAndView.setViewName("success");
//        modelAndView.addObject("money",total_amount);
//        modelAndView.addObject("no",out_trade_no);
//        return modelAndView;
        return "redirect:/mycart";
    }
}
