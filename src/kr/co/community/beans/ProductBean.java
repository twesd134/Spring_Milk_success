package kr.co.community.beans;

import org.springframework.web.multipart.MultipartFile;

public class ProductBean {
	
	
	
	
	
	
	
	public int getP_content_idx() {
		return p_content_idx;
	}
	public void setP_content_idx(int p_content_idx) {
		this.p_content_idx = p_content_idx;
	}
	public MultipartFile getProductPhoto() {
		return productPhoto;
	}
	public void setProductPhoto(MultipartFile productPhoto) {
		this.productPhoto = productPhoto;
	}
	public String getP_url() {
		return p_url;
	}
	public void setP_url(String p_url) {
		this.p_url = p_url;
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
	public String getP_desc() {
		return p_desc;
	}
	public void setP_desc(String p_desc) {
		this.p_desc = p_desc;
	}


	private int p_id;
	private String p_name;
	private int p_price;
	private String p_desc;
	private String p_url;
	private MultipartFile productPhoto;
	private int p_content_idx;
	
}
