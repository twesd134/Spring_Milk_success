package kr.co.community.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.community.beans.BoardInfoBean;
import kr.co.community.beans.ChartBean;
import kr.co.community.beans.ChartInfoBean;
import kr.co.community.beans.ShopInfoBean;
import kr.co.community.dao.TopMenuDao;

@Service
public class TopMenuService {
	
	@Autowired
	private TopMenuDao topMenuDao;
	
	public List<BoardInfoBean> getTopMenuList(){
		List<BoardInfoBean> topMenuList = topMenuDao.getTopMenuList();
		return topMenuList;
	}
	
	
	public List<ChartInfoBean> getchartMenu(){
		List<ChartInfoBean> chartMenu=topMenuDao.getchartMenu();
		return chartMenu;
	}
	
	public List<ShopInfoBean> getShopMenu(){
		List<ShopInfoBean> ShopMenu=topMenuDao.getShopMenu();
		return ShopMenu;
	}
	
	
}
