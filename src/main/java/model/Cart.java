package model;


import java.util.*;

public class Cart {
    private String id;
    private User user;
    private Date buyDate;

    public Cart() {
    }

    public Cart(String id, User user, Date buyDate) {
        this.id = id;
        this.user = user;
        this.buyDate = buyDate;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Date getBuyDate() {
        return buyDate;
    }

    public void setBuyDate(Date buyDate) {
        this.buyDate = buyDate;
    }
}
