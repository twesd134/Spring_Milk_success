package kr.co.community.beans;

import java.sql.Date;
import org.springframework.web.multipart.MultipartFile;

public class CartVO {
		
	
		
	public Date getNowTime() {
		return nowTime;
	}
	public void setNowTime(Date nowTime) {
		this.nowTime = nowTime;
	}
	public Date getArriveTime() {
		return arriveTime;
	}
	public void setArriveTime(Date arriveTime) {
		this.arriveTime = arriveTime;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public int getUser_idx() {
		return user_idx;
	}
	public void setUser_idx(int user_idx) {
		this.user_idx = user_idx;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getP_url() {
		return p_url;
	}
	public void setP_url(String p_url) {
		this.p_url = p_url;
	}
	public int getCart_id() {
		return cart_id;
	}
	public void setCart_id(int cart_id) {
		this.cart_id = cart_id;
	}
	public MultipartFile getProductPhoto() {
		return productPhoto;
	}
	public void setProductPhoto(MultipartFile productPhoto) {
		this.productPhoto = productPhoto;
	}

	public int getP_id() {
		return p_id;
	}
	public void setP_id(int p_id) {
		this.p_id = p_id;
	}
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	public int getP_price() {
		return p_price;
	}
	public void setP_price(int p_price) {
		this.p_price = p_price;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public int getMoney() {
		return money;
	}
	public void setMoney(int money) {
		this.money = money;
	}
	
	
	private String user_id;
	private String user_name;
	private String address;
	private int cart_id; // 장바구니 번호
	private int p_id; // 상품 번호
	private String p_name; // 상품 이름
	private int p_price; // 상품 단가
	private String p_url;
	private int amount; // 구매 수량
	private int money; // 상품 가격
	private int user_idx;
	private Date nowTime;
	private Date arriveTime;
	private MultipartFile productPhoto;
	
}
