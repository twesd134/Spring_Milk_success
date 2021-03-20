package kr.co.community.service;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import kr.co.community.beans.PageBean;
import kr.co.community.beans.ProductBean;
import kr.co.community.dao.ShopDao;

@Service
public class ShopService {
	@Autowired
	private ShopDao shopdao;

	@Value("${page.listcnt}")
	private int page_listcnt;
	
	@Value("${page.paginationcnt}")
	private int page_paginationcnt;
	
	
	 public String getShopInfoname(int shop_idx) 
	 { 
		 return shopdao.getShopInfoname(shop_idx);
	  
	  }
	 
	 public List<ProductBean> listProduct(int shop_idx,int page)
	 {
		 int start=(page-1) * page_listcnt;
		RowBounds rowBounds = new RowBounds(start, page_listcnt);

		 return shopdao.listProduct(shop_idx,rowBounds);
	 }
	 
	 public List<ProductBean> getProduct(String p_id){
		 
		 return shopdao.getProduct(p_id);
		 
	 }
	 
	 public List<ProductBean> Result(){
		 return shopdao.Result();
	 }
	 
	 
	public PageBean getContentCnt(int shop_idx, int currentPage) {
			
	int content_cnt = shopdao.getContentCnt(shop_idx);
			
	PageBean pageBean = new PageBean(content_cnt, currentPage, page_listcnt, page_paginationcnt);
			
	return pageBean;
	
	}
	 
	 
}
