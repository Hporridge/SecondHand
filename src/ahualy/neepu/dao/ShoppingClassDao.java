package ahualy.neepu.dao;

import ahualy.neepu.bean.Order;
import ahualy.neepu.bean.ShoppingClass;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ShoppingClassDao {

    int addShoppingClass(ShoppingClass shoppingClass);

    List<ShoppingClass> queryShoppingClassList();

    ShoppingClass queryShoppingClassById(int id);

    int deleteShoppingClassById(int id);

    int updateShoppingClassById(ShoppingClass shoppingClass);
}
