package kr.co.community.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.community.beans.ProductBean;
import kr.co.community.dao.ShopDao;

@Service
public class ShopService {
	@Autowired
	private ShopDao shopdao;
	
	
	 public String getShopInfoname(int shop_idx) 
	 { 
		 return shopdao.getShopInfoname(shop_idx);
	  
	  }
	 
	 public List<ProductBean> listProduct(int shop_idx)
	 {
		 return shopdao.listProduct(shop_idx);
	 }
	 
	
}
