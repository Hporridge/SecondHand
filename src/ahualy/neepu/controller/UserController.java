package ahualy.neepu.controller;

import ahualy.neepu.bean.User;
import ahualy.neepu.dao.UserDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

/**
 * 用户管理类，也是后台控制器,管理员的权限管理
 */
@Controller
public class UserController {

    @Autowired
    private UserDao userDao;

    @RequestMapping(value = "/indexBackstage",method= RequestMethod.GET)
    public String indexBackstage(Model model){
        // 需要查询出id>1的用户，展示在前端页面
        List<User> users = userDao.queryUserList();
        model.addAttribute("user_list",users);
        return "/indexBackstage";
    }

    @RequestMapping(value = "user/edit",method = RequestMethod.GET)
    public String edit(Model model,Integer id){
        // 通过用户id去查询该用户的信息，添加到model中
        User user = userDao.queryUserById(id);
        model.addAttribute("list",user);
        return "user/edit";
    }

    @RequestMapping(value = "user/delete",method = RequestMethod.GET)
    public String delete(Model model,Integer id){
        userDao.deleteUserById(id);
        return "/indexBackstage";
    }

    @RequestMapping(value = "user/edit",method = RequestMethod.POST)
    public String toedit(Model model,User user){
        // 通过用户id去查询该用户的信息，添加到model中
        userDao.updateUserById(user);
        return "redirect:/indexBackstage";
    }

    @RequestMapping(value = "mymessage/edit",method = RequestMethod.POST)
    public String toeditMymessage(Model model,User user){
        // 通过用户id去查询该用户的信息，添加到model中
        userDao.updateUserById(user);
        model.addAttribute("es","你的个人信息已成功修改，你需要重新登陆系统");
        return "redirect:/exit";
    }
}
