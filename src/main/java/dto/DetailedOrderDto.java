package dto;

public class DetailedOrderDto {
	    private String orderIdx;
	    private String orderDate;
	    private String customer;
	    private int totalPrice;
	    private String orderStatus;
	    private String product;
	    private String option1;
	    private String option2;
	    private String option3;
	    private String photo;
	    private int quantity;
	    private String address;
	    private String email;
	    private int totalOrdersByCustomer;

	    public DetailedOrderDto(String orderIdx, String orderDate, String customer, int totalPrice, String orderStatus,
	                            String product, String option1, String option2, String option3, String photo,
	                            int quantity, String address, String email, int totalOrdersByCustomer) {
	        this.orderIdx = orderIdx;
	        this.orderDate = orderDate;
	        this.customer = customer;
	        this.totalPrice = totalPrice;
	        this.orderStatus = orderStatus;
	        this.product = product;
	        this.option1 = option1;
	        this.option2 = option2;
	        this.option3 = option3;
	        this.photo = photo;
	        this.quantity = quantity;
	        this.address = address;
	        this.email = email;
	        this.totalOrdersByCustomer = totalOrdersByCustomer;
	    }

	    public String getOrderIdx() {
	        return orderIdx;
	    }

	    public void setOrderIdx(String orderIdx) {
	        this.orderIdx = orderIdx;
	    }

	    public String getOrderDate() {
	        return orderDate;
	    }

	    public void setOrderDate(String orderDate) {
	        this.orderDate = orderDate;
	    }

	    public String getCustomer() {
	        return customer;
	    }

	    public void setCustomer(String customer) {
	        this.customer = customer;
	    }

	    public int getTotalPrice() {
	        return totalPrice;
	    }

	    public void setTotalPrice(int totalPrice) {
	        this.totalPrice = totalPrice;
	    }

	    public String getOrderStatus() {
	        return orderStatus;
	    }

	    public void setOrderStatus(String orderStatus) {
	        this.orderStatus = orderStatus;
	    }

	    public String getProduct() {
	        return product;
	    }

	    public void setProduct(String product) {
	        this.product = product;
	    }

	    public String getOption1() {
	        return option1;
	    }

	    public void setOption1(String option1) {
	        this.option1 = option1;
	    }

	    public String getOption2() {
	        return option2;
	    }

	    public void setOption2(String option2) {
	        this.option2 = option2;
	    }

	    public String getOption3() {
	        return option3;
	    }

	    public void setOption3(String option3) {
	        this.option3 = option3;
	    }

	    public String getPhoto() {
	        return photo;
	    }

	    public void setPhoto(String photo) {
	        this.photo = photo;
	    }

	    public int getQuantity() {
	        return quantity;
	    }

	    public void setQuantity(int quantity) {
	        this.quantity = quantity;
	    }

	    public String getAddress() {
	        return address;
	    }

	    public void setAddress(String address) {
	        this.address = address;
	    }

	    public String getEmail() {
	        return email;
	    }

	    public void setEmail(String email) {
	        this.email = email;
	    }

	    public int getTotalOrdersByCustomer() {
	        return totalOrdersByCustomer;
	    }

	    public void setTotalOrdersByCustomer(int totalOrdersByCustomer) {
	        this.totalOrdersByCustomer = totalOrdersByCustomer;
	    }
	}
