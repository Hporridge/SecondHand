package ahualy.neepu.bean;

public class ShoppingClass {
    private int id;
    private String shoppingclass_name;
    private String shoppingclass_desc;


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getShoppingclass_name() {
        return shoppingclass_name;
    }

    public void setShoppingclass_name(String shoppingclass_name) {
        this.shoppingclass_name = shoppingclass_name;
    }

    public String getShoppingclass_desc() {
        return shoppingclass_desc;
    }

    public void setShoppingclass_desc(String shoppingclass_desc) {
        this.shoppingclass_desc = shoppingclass_desc;
    }

    @Override
    public String toString() {
        return "ShoppingClass{" +
                "id=" + id +
                ", shoppingclass_name='" + shoppingclass_name + '\'' +
                ", shoppingclass_desc='" + shoppingclass_desc + '\'' +
                '}';
    }
}
