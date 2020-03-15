package ahualy.neepu.dao;

import ahualy.neepu.bean.Shopping;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ShoppingDao {
    int addShopping(Shopping shopping);
    List<Shopping> queryShoppingList();
    List<Shopping> queryShoppingListById(int id);
    List<Shopping> queryShoppingByTypeId(int id);
    Shopping queryShoppingById(int id);
    int deleteShoppingById(int id);
    int updateShoppingById(Shopping shopping);
    List<Shopping> queryShoppingByContent(@Param("content")String content);
}
