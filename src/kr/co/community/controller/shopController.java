package kr.co.community.controller;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.co.community.beans.CartVO;
import kr.co.community.beans.ContentBean;
import kr.co.community.beans.PageBean;
import kr.co.community.beans.ProductBean;
import kr.co.community.beans.UserBean;
import kr.co.community.service.ShopService;
import kr.co.community.service.cartService;


@Controller
@RequestMapping("/shop")
public class shopController {
	@Autowired
	private ShopService shopservice;
	
	
	@Resource(name = "loginUserBean")
	@Lazy
	private UserBean loginUserBean;
	
	@Autowired
	private cartService cartService;
	
	@GetMapping("/shop_main")
	public String shop_main(@RequestParam("shop_idx") int shop_idx,
			   @RequestParam(value = "page", defaultValue = "1") int page,
			   Model model)
	
	{
		model.addAttribute("shop_idx",shop_idx);
		List<ProductBean> listProduct= shopservice.listProduct(shop_idx,page);
		model.addAttribute("listProduct",listProduct);
		
		PageBean pageBean = shopservice.getContentCnt(shop_idx, page);
		model.addAttribute("pageBean", pageBean);
		
		model.addAttribute("page", page);
		
		model.addAttribute("loginUserBean", loginUserBean);
		
		
		return "shop/shop_main";
		
	}
	
	
	 // 3. 상품등록 페이지 매핑
    @RequestMapping("/write")
    public String write(@ModelAttribute("writeBean") ProductBean writeBean,
    		@RequestParam("shop_idx") int shop_idx){
    		
    	writeBean.setP_content_idx(shop_idx);
        return "shop/write";
    }
    // 4. 상품등록 처리 매핑
    @RequestMapping("/insert.do")
    public String insert(@Valid @ModelAttribute("writeBean") ProductBean writeBean){
        String filename = "";
        // 첨부파일(상품사진)이 있으면
        if(!writeBean.getProductPhoto().isEmpty()){
            filename = writeBean.getProductPhoto().getOriginalFilename();
            // 개발디렉토리 - 파일 업로드 경로
            //String path = "C:\\Users\\doubles\\Desktop\\workspace\\gitSpring\\"
            //                + "spring02\\src\\main\\webapp\\WEB-INF\\views\\images";
            // 배포디렉토리 - 파일 업로드 경로
            String path = "C:\\Users\\Administrator\\git2\\Community\\WebContent\\resources\\image";
            try {
                new File(path).mkdirs(); // 디렉토리 생성
                // 임시디렉토리(서버)에 저장된 파일을 지정된 디렉토리로 전송
                writeBean.getProductPhoto().transferTo(new File(path+filename));
            } catch (Exception e) {
                e.printStackTrace();
            }
            writeBean.setP_url(filename);
            shopservice.insertProduct(writeBean);
        }
        return "shop/insert_success";
    }
    
    // 5. 상품 수정(편집) 페이지 매핑
    @GetMapping("/edit")
    public String edit(ProductBean modifybean,
    		@RequestParam(value="p_id",required=false) int p_id,Model model,
    		@RequestParam(value="shop_idx",required=false) int shop_idx
    		
    		)
   
    {
    	
        model.addAttribute("shop_idx",shop_idx);
        model.addAttribute("p_id",p_id);
        
        ProductBean tempBean=shopservice.getProduct(p_id);
        modifybean.setP_name(tempBean.getP_name());
        modifybean.setP_price(tempBean.getP_price());
        modifybean.setP_desc(tempBean.getP_desc());
        modifybean.setP_url(tempBean.getP_url());
        modifybean.setP_id(p_id);
        
        model.addAttribute("tempBean",tempBean);
        /*
        private int p_id;
    	private String p_name;
    	private int p_price;
    	private String p_desc;
    	private String p_url;
    	private MultipartFile productPhoto; */
        return "shop/edit";
    }
    
    // 6. 상품 수정(편집) 처리 매핑
    @PostMapping("/update.do")
    public String update(@Valid @ModelAttribute("modifyContentBean") ProductBean modifyContentBean,
    		BindingResult result,Model model
    		
    		){

		
		if(result.hasErrors()) {
			return "shop/edit";
		}
    	shopservice.updateProduct(modifyContentBean);
        
        return "shop/insert_success";
    }
    
	
	
	@GetMapping("/shop_result")
	public String shop_result(@RequestParam(value="user_id",required=false) String user_id,HttpSession session, ModelAndView mav,Model model) 
	{
		  	
	        List<CartVO> listCart = cartService.listCart(user_id); // 장바구니 정보 
	        model.addAttribute("listCart",listCart);
	        return "shop/shop_result";
	}
	
	
	
	
	@GetMapping("/detail")
	public String detail(@RequestParam("shop_idx") int shop_idx,@RequestParam(value="p_id",required=false) int  p_id,Model model) 
	{	
		
		model.addAttribute("shop_idx",shop_idx);
		ProductBean getProduct=shopservice.getProduct(p_id);
		model.addAttribute("getProduct",getProduct);
		model.addAttribute("loginUserBean", loginUserBean);
		return "shop/detail";
	}
	
	
	// 1. 장바구니 추가
	@PostMapping("/insert.shop")
    public String insert(@RequestParam(value="user_id",required=false) String  user_id,
    		@ModelAttribute CartVO vo, HttpSession session,Model model,@RequestParam(value="p_id",required=false) String p_id){
        // 장바구니에 기존 상품이 있는지 검사
      
          cartService.insertCart(vo);
      
         List<CartVO> listCart = cartService.listCart(user_id); // 장바구니 정보 
       
         model.addAttribute("listCart",listCart);
        

 		return "shop/insert_shop_success";
    }

	
    
	 @RequestMapping("/delete.do")
	    public String delete(@RequestParam(value="p_id",required=false) int  p_id){
	      
	        shopservice.deleteProduct(p_id);
	        return "shop/insert_success";
	    }
	 
	 // 3. 장바구니 삭제
		@GetMapping("/delete")
	    public String delete(@RequestParam(value="user_id",required=false) String  user_id,
	    		@RequestParam(value="cart_id",required=false) int  cart_id,Model model){
			
			cartService.delete(cart_id);
	        
	        List<CartVO> listCart = cartService.listCart(user_id); // 장바구니 정보 

	        model.addAttribute("listCart",listCart);
	        
	        return "shop/shop_result";
	    }
	 
	 
	
}