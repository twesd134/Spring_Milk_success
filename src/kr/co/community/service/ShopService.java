package kr.co.community.service;

import java.io.File;
import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.co.community.beans.PageBean;
import kr.co.community.beans.ProductBean;
import kr.co.community.beans.UserBean;
import kr.co.community.dao.ShopDao;

@Service
public class ShopService {
	@Autowired
	private ShopDao shopdao;
	

	@Value("${path.upload}")
	private String path_upload;
	

	@Value("${page.listcnt}")
	private int page_listcnt;
	
	@Value("${page.paginationcnt}")
	private int page_paginationcnt;
	
	
	@Resource(name = "loginUserBean")
	@Lazy
	private UserBean loginUserBean;
	
private String saveUploadFile(MultipartFile upload_file) {
		
		String file_name = upload_file.getOriginalFilename();
		
		try {
			upload_file.transferTo(new File(path_upload + "/" + file_name));
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return file_name;
	}
	
	
	
	 public String getShopInfoname(int shop_idx) 
	 { 
		 return shopdao.getShopInfoname(shop_idx);
	  
	  }
	 public void  insertProduct(ProductBean writeBean) {
		 
	
	       shopdao.insertProduct(writeBean);
	    }
	 
	 public List<ProductBean> listProduct(int shop_idx,int page)
	 {
		 int start=(page-1) * page_listcnt;
		RowBounds rowBounds = new RowBounds(start, page_listcnt);

		 return shopdao.listProduct(shop_idx,rowBounds);
	 }
	 
	 public ProductBean getProduct(int p_id){
		 
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
	 //상품 상세 
	public List<ProductBean> detailProduct(int p_id) {
		return shopdao.detailProduct(p_id);
	}
	//상품 수정
	public void updateProduct(ProductBean bean) {
		MultipartFile upload_file = bean.getProductPhoto();
		
		if(upload_file.getSize() > 0) {
			
			String file_name = saveUploadFile(upload_file);
		
			bean.setP_url(file_name);
		
		}
		
		shopdao.updateProduct(bean);
	}
	
    // 05. 상품삭제
    public void deleteProduct(int p_id) {
    	shopdao.deleteProduct(p_id);
    }
    // 06. 상품이미지 삭제를 위한 이미지파일 정보
    public String fileInfo(int p_id) {
        return shopdao.fileInfo(p_id);
    }

	 
}