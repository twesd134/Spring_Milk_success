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

	    // 1. 장바구니 추가
	    public void insertCart(CartVO vo) {
	    	vo.setUser_idx(loginUserBean.getUser_idx());
	        cartDao.insertCart(vo);
	        
	    }
	    // 2. 장바구니 목록
	    public List<CartVO> listCart(String  user_id) {
	        return cartDao.listCart(user_id);
	    }
	    // 3. 장바구니 삭제
	    public void delete(int cart_id) {
	        cartDao.delete(cart_id);
	    }
	    // 4. 장바구니 수정
	    public void modifyCart(CartVO vo) {
	        cartDao.modifyCart(vo);
	    }
	    // 5. 장바구니 금액 합계
	    public int sumMoney() {
	        return cartDao.sumMoney();
	    }
	    // 6. 장바구니 상품 확인
	    public int countCart(int p_id) {
	        return cartDao.countCart(p_id);
	    }
	/*
	 * // 7. 장바구니 상품 수량 변경 public void updateCart(CartVO vo) {
	 * cartDao.updateCart(vo); }
	 */
}
