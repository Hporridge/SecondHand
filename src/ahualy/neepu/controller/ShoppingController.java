package ahualy.neepu.controller;

import ahualy.neepu.bean.Shopping;
import ahualy.neepu.bean.ShoppingClass;
import ahualy.neepu.bean.User;
import ahualy.neepu.config.MyFileUtil;
import ahualy.neepu.dao.BuyDao;
import ahualy.neepu.dao.ShoppingClassDao;
import ahualy.neepu.dao.ShoppingDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class ShoppingController {

    @Autowired
    ShoppingClassDao shoppingClassDao;
    @Autowired
    private ShoppingDao shoppingDao;

    @Autowired
    private BuyDao buyDao;

    // 我的发布
    @RequestMapping("/myshopping")
    public String myshopping(Model model,HttpServletRequest request){
        HttpSession session = request.getSession();
        User user_bean = (User) session.getAttribute("user");
        //根据用户的id查询发布的商品
        List<Shopping> list = shoppingDao.queryShoppingListById(user_bean.getId());
        model.addAttribute("list",list);
        return "myshopping";
    }


    // 跳转到商品分类页面，加载出所有商品分类
    @RequestMapping("addshoppingclass")
    public String addShoppingClass(Model model){
        List<ShoppingClass> shoppingclass = shoppingClassDao.queryShoppingClassList();
        model.addAttribute("shoppingclass",shoppingclass);
        return "shopping/addshoppingclass";
    }

    @RequestMapping(value = "shopping/edit",method = RequestMethod.GET)
    public String edit(Model model,Integer id){
        // 通过用户id去查询该用户的信息，添加到model中
        ShoppingClass shoppingClass = shoppingClassDao.queryShoppingClassById(id);
        model.addAttribute("list",shoppingClass);
        return "shopping/edit";
    }

    @RequestMapping(value = "shopping/edit",method = RequestMethod.POST)
    public String toedit(Model model,ShoppingClass shoppingClass){
        shoppingClassDao.updateShoppingClassById(shoppingClass);
        return "redirect:/addshoppingclass";
    }

    //增加商品分类
    @RequestMapping(value = "shopping/add")
    public String add(){
        return "shopping/add";
    }

    @RequestMapping(value = "shopping/add",method = RequestMethod.POST)
    public String toadd(Model model,ShoppingClass shoppingClass){
        shoppingClassDao.addShoppingClass(shoppingClass);
        return "redirect:/addshoppingclass";
    }

    // 删除商品分类
    @RequestMapping(value = "shopping/delete",method = RequestMethod.GET)
    public String delete(Model model,Integer id){
        shoppingClassDao.deleteShoppingClassById(id);
        return "/addshoppingclass";
    }

    // 添加商品(发布商品)
    @RequestMapping("/addshopping")
    public String addshopping(Model model){
        // 需要将查询出商品种类
        List<ShoppingClass> shopingclass_list = shoppingClassDao.queryShoppingClassList();
        model.addAttribute("shopingclass_list",shopingclass_list);
        return "addshopping";
    }



    /**
     *
     * @param file
     * @param request
     * @param content
     * @param title
     * @param money
     * @return
     */
    //处理文件上传
    @RequestMapping(value="/shoppinguploadimg", method = RequestMethod.POST)
    public String uploadImg(@RequestParam("file") MultipartFile file,
                            HttpServletRequest request, String content, String title, String money,Integer shopping_type,Model model) {
        if (content.equals("")||title.equals("")||model.equals("")||file==null){
            model.addAttribute("message","请正确填写，每一项都不能为空");
            return "addshopping";
        }
        String contentType = file.getContentType();
        String fileName = file.getOriginalFilename();
        String filePath = request.getSession().getServletContext().getRealPath("imgupload/");
        System.out.println(filePath+fileName);
        try {
            MyFileUtil.uploadFile(file.getBytes(), filePath, fileName);
        } catch (Exception e) {
            System.out.println("上传文件异常");
        }
        Shopping shopping_bean = new Shopping();
        shopping_bean.setContent(content);
        shopping_bean.setMoney(money);
        shopping_bean.setTitle(title);
        shopping_bean.setPhoto("http://localhost:8080/Second/imgupload/"+fileName);
        shopping_bean.setShopping_type(shopping_type);
        HttpSession session = request.getSession();
        User user_bean = (User) session.getAttribute("user");
        shopping_bean.setC_id(user_bean.getId());
        shoppingDao.addShopping(shopping_bean);
        model.addAttribute("message","你的"+fileName+"发布成功，请在我的发布里查看！");
        //返回json
        return "addshopping";
    }

    //删除我的商品
    @RequestMapping(value = "myshopping/delete",method = RequestMethod.GET)
    public String mydelete(Model model,Integer id){
        shoppingDao.deleteShoppingById(id);
        // 然后在购物车表里面删除所有用户的收藏的
        buyDao.deleteBuyBySId(id);
        return "/myshopping";
    }

    //编辑我的商品
    @RequestMapping(value = "myshopping/edit",method = RequestMethod.GET)
    public String myedit(Model model,Integer id){
        // 通过用户id去查询该用户的信息，添加到model中
        Shopping shopping = shoppingDao.queryShoppingById(id);
        // 需要将查询出商品种类
        List<ShoppingClass> shopingclass_list = shoppingClassDao.queryShoppingClassList();
        model.addAttribute("shopingclass_list",shopingclass_list);
        model.addAttribute("list",shopping);
        return "myshopping/edit";
    }

    //
    @RequestMapping(value = "myshopping/edit",method = RequestMethod.POST)
    public String tomyedit(Model model,Shopping shopping){
        shoppingDao.updateShoppingById(shopping);
        return "redirect:/addshopping";
    }

    //选择分类
    @RequestMapping(value = "ensure",method = RequestMethod.POST)
    public String ensure(Model model,Integer shopping_type){
        //根据类型id查询商品
        List<Shopping> shoppingList = shoppingDao.queryShoppingByTypeId(shopping_type);
        List<ShoppingClass> shopingclass_list = shoppingClassDao.queryShoppingClassList();
        model.addAttribute("shopingclass_list",shopingclass_list);
        // 需要将查询出商品种类
        model.addAttribute("list",shoppingList);
        return "shopping";
    }
    
    // 模糊查询商品
    @RequestMapping(value = "search_shopping",method = RequestMethod.GET)
    public String ensure(Model model,String content){
        
        //根据类型content查询商品
        List<Shopping> shoppingList = shoppingDao.queryShoppingByContent("%"+content+"%");
        
        List<ShoppingClass> shopingclass_list = shoppingClassDao.queryShoppingClassList();
        model.addAttribute("shopingclass_list",shopingclass_list);
        // 需要将查询出商品种类
        model.addAttribute("list",shoppingList);
        return "shopping";
    }

    

    // 模糊查询商品
    @RequestMapping(value = "search_shoppings",method = RequestMethod.GET)
    public String ensures(Model model,String content){
        //根据类型content查询商品
        List<Shopping> shoppingList = shoppingDao.queryShoppingByContent("%"+content+"%");

        List<ShoppingClass> shopingclass_list = shoppingClassDao.queryShoppingClassList();
        model.addAttribute("shopingclass_list",shopingclass_list);
        // 需要将查询出商品种类
        model.addAttribute("list",shoppingList);
        return "shoppings";
    }





    @RequestMapping("/shoppings")
    public String shopping(Model model){
        List<Shopping> list = shoppingDao.queryShoppingList();
        // 需要将查询出商品种类
        model.addAttribute("list",list);
        return "shoppings";
    }

    //管理员删除商品
    @RequestMapping(value = "shoppings/delete",method = RequestMethod.GET)
    public String shoppings(Model model,Integer id){
        
        // 首先在商品表里面删除该商品
        shoppingDao.deleteShoppingById(id);
        
        // 然后在购物车表里面删除所有用户的
        buyDao.deleteBuyBySId(id);
        return "/shoppings";
    }
}
