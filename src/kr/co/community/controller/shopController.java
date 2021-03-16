package kr.co.community.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.co.community.beans.ProductBean;
import kr.co.community.service.ShopService;


@Controller
@RequestMapping("/shop")
public class shopController {
	@Autowired
	private ShopService shopservice;
	
	
	
	@GetMapping("/shop_main")
	public String shop_main(@RequestParam("shop_idx") int shop_idx,Model model)
	
	{
		model.addAttribute("shop_idx",shop_idx);
		List<ProductBean> listProduct= shopservice.listProduct(shop_idx);
		model.addAttribute("listProduct",listProduct);
		
		return "shop/shop_main";
		
	}
	
	@GetMapping("/shop_result")
	public String shop_result() 
	{
		
		return "shop/shop_result";
	}
	



}
