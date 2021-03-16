package kr.co.community.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.community.service.ShopService;


@Controller
@RequestMapping("/shop")
public class shopController {
	@Autowired
	private ShopService shopservice;
	
	@GetMapping("shop_main")
	public String shop_main()
	
	{
		
		return "shop/shop_main";
		
	}
	
	@GetMapping("shop_result")
	public String shop_result() 
	{
		
		
		return "shop/shop_result";
	}
	



}
