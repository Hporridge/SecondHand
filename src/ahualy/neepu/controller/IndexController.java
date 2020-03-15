package ahualy.neepu.controller;

import ahualy.neepu.bean.ShoppingClass;
import ahualy.neepu.bean.User;
import ahualy.neepu.config.Constants;
import ahualy.neepu.dao.UserDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
public class IndexController {
    /**
     *
     */
    @Autowired
    private UserDao userDao;


    @RequestMapping("/index")
            public String index(HttpServletRequest request,Model model){
                HttpSession session = request.getSession();
                User user;
                try {
            user = (User) session.getAttribute("user");
            model.addAttribute("list",user);
            System.out.println(user.toString());
        }catch (Exception e){
            user = null;
        }

        return "index";
    }

    @RequestMapping("/login")
    public String login(){
        return "login";
    }

    @RequestMapping("/register")
    public String register(){
        return "register";
    }

    @RequestMapping(value = "/register_validate",method = RequestMethod.POST)
    public String register2(@RequestParam(name = "name",
            required = false, defaultValue = "World") String name, Model model, String username, String email, String password){
        if (username.equals("") || email.equals("")||password.equals("")){
            model.addAttribute("es","请填写有效信息");
            return "register";
        }
        User userbean = new User();
        userbean.setUsername(username);
        userbean.setEmail(email);
        userbean.setPassword(password);
        userDao.addUser(userbean);
        model.addAttribute("name","success");
        return "login";
    }
    @RequestMapping(value = "/login_validate",method = RequestMethod.POST)
    public String login2(String password, String email, HttpServletRequest request,Model model){
        HttpSession session = request.getSession();
        User list ;
        try {
             list = userDao.queryUserBy(email);
        }catch (Exception e){
            list = null;
        }
        if (list!=null&&list.getPassword().equals(password)){

            System.out.println("success");
            session.setAttribute(Constants.USER_SESSION, list);
            session.setAttribute("user",list);
            model.addAttribute("list",list);

            // 增加管理员用户，当管理员登陆系统时，直接进入后台进行管理用户，对用户进行增删改查，还可以对商品进行管理
            if (list.getUsername().equals("admin")) {
                return "redirect:/indexBackstage";
            }
            return "index";
        }else{
            model.addAttribute("es","请正确填写邮箱和密码");
            return "login";
        }
    }
    //退出系统
    @RequestMapping(value="/exit")
    public ModelAndView Exit(ModelAndView mv, HttpSession session,String es,Model model) {
        if (es!=null){
            model.addAttribute("es",es);
        }
        mv.setViewName("forward:/login");
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
        System.out.println("退出系统时间："+df.format(new Date()));
        session.invalidate();
        return mv;
    }
}
