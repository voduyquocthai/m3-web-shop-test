package model;

public class CartItem {

    private String id;
    private int quantity;
    private float unitPrice;
    private Product product;
    private Cart cart;

    public CartItem() {
    }

    public CartItem(String id, int quantity, float unitPrice, Product product, Cart cart) {
        this.id = id;
        this.quantity = quantity;
        this.unitPrice = unitPrice;
        this.product = product;
        this.cart = cart;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public float getUnitPrice() {
        return unitPrice;
    }

    public void setUnitPrice(float unitPrice) {
        this.unitPrice = unitPrice;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public Cart getCart() {
        return cart;
    }

    public void setCart(Cart cart) {
        this.cart = cart;
    }
}
