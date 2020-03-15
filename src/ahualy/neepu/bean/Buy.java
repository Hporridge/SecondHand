package ahualy.neepu.bean;

public class Buy {
    private Integer id;
    private Integer c_id;
    private Integer s_id;
    private Integer state;
    

    @Override
    public String toString() {
        return "Buy{" +
                "id=" + id +
                ", c_id=" + c_id +
                ", s_id=" + s_id +
                ", state=" + state +
                '}';
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getC_id() {
        return c_id;
    }

    public void setC_id(Integer c_id) {
        this.c_id = c_id;
    }

    public Integer getS_id() {
        return s_id;
    }

    public void setS_id(Integer s_id) {
        this.s_id = s_id;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }
}
