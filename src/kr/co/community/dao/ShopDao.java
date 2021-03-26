package kr.co.community.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.community.beans.ProductBean;

@Repository
public class ShopDao {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	
	public String getShopInfoname(int shop_idx)

	{
		return sqlSessionTemplate.selectOne("shop.shopInfoName",shop_idx);
	}
	
	public List<ProductBean> listProduct(int shop_idx,RowBounds rowBounds)
	{
		return sqlSessionTemplate.selectList("shop.listProduct",shop_idx,rowBounds);
	}
	
	public ProductBean getProduct(int p_id)
	{
		return sqlSessionTemplate.selectOne("shop.getProduct",p_id);
	}
	
	public List<ProductBean> Result()
	{
		return sqlSessionTemplate.selectList("shop.Result");
	}
	
	public int getContentCnt(int shop_idx) {
		return sqlSessionTemplate.selectOne("shop.getContentCnt", shop_idx);
	}
	
	  public void insertProduct(ProductBean writeBean) {
		sqlSessionTemplate.insert("shop.insertProduct", writeBean);
	    }
	  
	  public void updateProduct(ProductBean bean) {
		  sqlSessionTemplate.selectOne("shop.updateProduct", bean);
	    } 
	  public void deleteProduct(int p_id) {
		  sqlSessionTemplate.delete("shop.deleteProduct", p_id);
	    } 
	  public String fileInfo(int p_id) {
	        return sqlSessionTemplate.selectOne("shop.fileInfo",p_id);
	    }
	  
	  public List<ProductBean> detailProduct(int p_id) {
			return sqlSessionTemplate.selectList("shop.detailProduct", p_id);
		}
	
}