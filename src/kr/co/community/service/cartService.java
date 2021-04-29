package kr.co.community.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Service;

import kr.co.community.beans.CartVO;
import kr.co.community.beans.ProductBean;
import kr.co.community.beans.UserBean;
import kr.co.community.dao.CartDAO;

@Service
public class cartService {
		
	@Resource(name = "loginUserBean")
	@Lazy
	private UserBean loginUserBean;
	
		@Autowired
	    CartDAO cartDao;


	    public void insertCart(CartVO vo) {
	    	vo.setUser_idx(loginUserBean.getUser_idx());
	        cartDao.insertCart(vo);
	        
	    }
	   
	    public List<CartVO> listCart(String  user_id) {
	        return cartDao.listCart(user_id);
	    }
	    
	    public void delete(int cart_id) {
	        cartDao.delete(cart_id);
	    }
	  
	    public void modifyCart(CartVO vo) {
	        cartDao.modifyCart(vo);
	    }
	
	    public int sumMoney() {
	        return cartDao.sumMoney();
	    }
	
	    public int countCart(int p_id) {
	        return cartDao.countCart(p_id);
	    }
	
}
