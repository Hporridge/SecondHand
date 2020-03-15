package ahualy.neepu.bean;

public class Shopping {
    private int id;
    private int c_id;
    private String title;
    private String content;
    private String photo;
    private String money;
    private int shopping_type;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getC_id() {
        return c_id;
    }

    public void setC_id(int c_id) {
        this.c_id = c_id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    public String getMoney() {
        return money;
    }

    public void setMoney(String money) {
        this.money = money;
    }

    public int getShopping_type() {
        return shopping_type;
    }

    public void setShopping_type(int shopping_type) {
        this.shopping_type = shopping_type;
    }

    @Override
    public String toString() {
        return "Shopping{" +
                "id=" + id +
                ", c_id=" + c_id +
                ", title='" + title + '\'' +
                ", content='" + content + '\'' +
                ", photo='" + photo + '\'' +
                ", money='" + money + '\'' +
                ", shopping_type=" + shopping_type +
                '}';
    }
}
