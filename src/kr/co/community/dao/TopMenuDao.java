package kr.co.community.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.community.beans.BoardInfoBean;
import kr.co.community.beans.ChartInfoBean;
import kr.co.community.beans.ShopInfoBean;

@Repository
public class TopMenuDao {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public List<BoardInfoBean> getTopMenuList(){
		List<BoardInfoBean> topMenuList = sqlSessionTemplate.selectList("topmenu.get_topmenu_list");
		return topMenuList;
	}


	public List<ChartInfoBean> getchartMenu(){
		List<ChartInfoBean> chartMenu = sqlSessionTemplate.selectList("topmenu.get_chart_list");
		return chartMenu;
		
	}
	
	public List<ShopInfoBean> getShopMenu(){
		List<ShopInfoBean> ShopMenu = sqlSessionTemplate.selectList("topmenu.get_shop_list");
		return ShopMenu;
		
	}
	
	
}
