package kr.co.community.interceptor;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import kr.co.community.beans.BoardInfoBean;
import kr.co.community.beans.CartVO;
import kr.co.community.beans.ChartInfoBean;
import kr.co.community.beans.ShopInfoBean;
import kr.co.community.beans.UserBean;
import kr.co.community.beans.cartInfoBean;
import kr.co.community.service.TopMenuService;

public class TopMenuInterceptor implements HandlerInterceptor{

	@Autowired
	private TopMenuService topMenuService;
	
	@Resource(name = "loginUserBean")
	@Lazy
	private UserBean loginUserBean;
	
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// TODO Auto-generated method stub
		List<BoardInfoBean> topMenuList = topMenuService.getTopMenuList();
		List<ChartInfoBean> chartMenu=topMenuService.getchartMenu();
		List<ShopInfoBean> ShopMenu=topMenuService.getShopMenu();
		List<cartInfoBean> cartMenu=topMenuService.getcartMenu();
	
		
		request.setAttribute("cartMenu",cartMenu );
		request.setAttribute("topMenuList", topMenuList);
		request.setAttribute("chartMenu",chartMenu);
		request.setAttribute("ShopMenu",ShopMenu);
		request.setAttribute("loginUserBean", loginUserBean);
		
		return true;
	}


	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		
	}


	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub
		
	}
}