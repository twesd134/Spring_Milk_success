package kr.co.community.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.community.beans.CartVO;
import kr.co.community.beans.ProductBean;
import kr.co.community.beans.UserBean;

@Repository
public class CartDAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

    // 1. 장바구니 추가
   
	public void insertCart(CartVO vo) {
    
    	sqlSessionTemplate.insert("cart.insertCart", vo);
    
    }
    
    // 2. 장바구니 목록
    
    public List<CartVO> listCart(String user_id) {
    	return sqlSessionTemplate.selectList("cart.listCart",user_id);
    }
    
    // 3. 장바구니 삭제
    
    public void delete(int cart_id) {
        sqlSessionTemplate.delete("cart.deleteCart", cart_id);
    }
    
    // 4. 장바구니 수정
    
    public void modifyCart(CartVO vo) {
        sqlSessionTemplate.update("cart.modifyCart", vo);
    }
    
    // 5. 장바구니 금액 합계
    public int sumMoney() {
        sqlSessionTemplate.selectOne("cart.sumMoney");
        return sqlSessionTemplate.selectOne("cart.sumMoney");
    }
    
    // 6. 장바구니 동일한 상품 레코드 확인
    public int countCart(int p_id) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("p_id", p_id);
        return sqlSessionTemplate.selectOne("cart.countCart", map);
    }
	/*
	 * // 7. 장바구니 상품수량 변경 public void updateCart(CartVO vo) {
	 * sqlSessionTemplate.update("cart.sumCart", vo); }
	 */
}
