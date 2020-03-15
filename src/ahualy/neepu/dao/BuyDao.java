package ahualy.neepu.dao;


import ahualy.neepu.bean.Buy;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface BuyDao {
    int addBuy(Buy shopping);
    List<Buy> queryBuyList(int c_id);
    void updateBuyById(Buy buy);
    Buy queryBuyBySIdAndCId(int c_id,int s_id);
    void deleteBuyBySIdAndCId(int c_id,int s_id);
    void deleteBuyBySId(int s_id);
    
}
