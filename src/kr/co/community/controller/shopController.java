package kr.co.community.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.co.community.beans.CartVO;
import kr.co.community.beans.ProductBean;
import kr.co.community.beans.ResultBean;
import kr.co.community.service.ShopService;
import kr.co.community.service.cartService;


@Controller
@RequestMapping("/shop")
public class shopController {
	@Autowired
	private ShopService shopservice;
	
	
	@Autowired
	private cartService cartService;
	
	
	@GetMapping("/shop_main")
	public String shop_main(@RequestParam("shop_idx") int shop_idx,Model model)
	
	{
		model.addAttribute("shop_idx",shop_idx);
		List<ProductBean> listProduct= shopservice.listProduct(shop_idx);
		model.addAttribute("listProduct",listProduct);
		
		return "shop/shop_main";
		
	}
	
	@GetMapping("/shop_result")
	public String shop_result(HttpSession session, ModelAndView mav,Model model) 
	{
		  
	        List<CartVO> listCart = cartService.listCart(); // 장바구니 정보 
	        model.addAttribute("listCart",listCart);
	        return "shop/shop_result";
	}
	
	
	
	
	@GetMapping("/detail")
	public String detail(@RequestParam("shop_idx") int shop_idx,@RequestParam(value="p_id",required=false) String p_id,Model model) 
	{	
		
		model.addAttribute("shop_idx",shop_idx);
		List<ProductBean> getProduct=shopservice.getProduct(p_id);
		model.addAttribute("getProduct",getProduct);
		return "shop/detail";
	}
	
	
	// 1. 장바구니 추가
	@GetMapping("insert.do")
    public String insert(@ModelAttribute CartVO vo, HttpSession session,Model model){
        // 장바구니에 기존 상품이 있는지 검사
        int count = cartService.countCart(vo.getP_id());
        
        if(count == 0){
            // 없으면 insert
        	cartService.insert(vo);
        } else {
            // 있으면 update
            cartService.updateCart(vo);
        }
         List<CartVO> listCart = cartService.listCart(); // 장바구니 정보 
       
         model.addAttribute("listCart",listCart);
        return "shop/shop_result";
    }

    // 2. 장바구니 목록
	@GetMapping("list.do")
    public ModelAndView list(HttpSession session, ModelAndView mav){
        Map<String, Object> map = new HashMap<String, Object>();
        List<CartVO> list = cartService.listCart(); // 장바구니 정보 
        int sumMoney = cartService.sumMoney(); // 장바구니 전체 금액 호출
        // 장바구니 전체 긍액에 따라 배송비 구분
        // 배송료(10만원이상 => 무료, 미만 => 2500원)
        int fee = sumMoney >= 100000 ? 0 : 2500;
        map.put("list", list);                // 장바구니 정보를 map에 저장
        map.put("count", list.size());        // 장바구니 상품의 유무
        map.put("sumMoney", sumMoney);        // 장바구니 전체 금액
        map.put("fee", fee);                 // 배송금액
        map.put("allSum", sumMoney+fee);    // 주문 상품 전체 금액
        mav.setViewName("shop/cartList");    // view(jsp)의 이름 저장
        mav.addObject("map", map);            // map 변수 저장
        return mav;
    }

    // 3. 장바구니 삭제
	@GetMapping("delete.do")
    public String delete(@RequestParam int cart_id){
        cartService.delete(cart_id);
        return "redirect:/shop/cart/list.do";
    }

    // 4. 장바구니 수정
	@GetMapping("update.do")
    public String update(@RequestParam int[] amount, @RequestParam int[] p_id, HttpSession session) {
       
        // 레코드의 갯수 만큼 반복문 실행
        for(int i=0; i<p_id.length; i++){
            CartVO vo = new CartVO();
            vo.setAmount(amount[i]);
            vo.setP_id(p_id[i]);
            cartService.modifyCart(vo);
        }

        return "redirect:/shop/cart/list.do";
    }

}
