package kr.co.community.dao;

import java.util.List;

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
	
	public List<ProductBean> listProduct(int shop_idx)
	{
		return sqlSessionTemplate.selectList("shop.listProduct",shop_idx);
	}
	
}
