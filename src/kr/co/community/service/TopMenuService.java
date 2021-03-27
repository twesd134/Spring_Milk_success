package kr.co.community.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.community.beans.BoardInfoBean;
import kr.co.community.beans.CartVO;
import kr.co.community.beans.ChartInfoBean;
import kr.co.community.beans.ShopInfoBean;
import kr.co.community.beans.UserBean;
import kr.co.community.beans.cartInfoBean;
import kr.co.community.dao.CartDAO;
import kr.co.community.dao.TopMenuDao;
import kr.co.community.dao.UserDao;

@Service
public class TopMenuService {
	@Autowired
    CartDAO cartDao;
	
	@Autowired
	private TopMenuDao topMenuDao;
	
	@Autowired
    UserDao userDao;
	
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
	
	public List<cartInfoBean> getcartMenu(){
		List<cartInfoBean> getcartMenu=topMenuDao.getcartMenu();
		return getcartMenu;
	}
	
}
