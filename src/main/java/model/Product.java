package model;

import java.util.Locale;

public class Product {
    private int id;
    private String name;
    private float price;
    private String image;
    private String des;
    private Category category; // cate_id

    public Product(int id, String name, float price, String image, String des, Category category) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.image = image;
        this.des = des;
        this.category = category;
    }

    public Product() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getDes() {
        return des;
    }

    public void setDes(String des) {
        this.des = des;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }
}
