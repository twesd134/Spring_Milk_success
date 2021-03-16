package kr.co.community.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ShopDao {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	
	public String getShopInfoname(int shop_idx)

	{
		return sqlSessionTemplate.selectOne("shop.shopInfoName",shop_idx);
	}
}
