package kr.co.community.controller;

import java.util.List;

import javax.validation.Valid;

import org.apache.ibatis.annotations.Select;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.community.beans.ChartBean;
import kr.co.community.service.BoardService;
import kr.co.community.service.chartService;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;


@Controller
@RequestMapping("/chart")
public class chartController {
		@Autowired
		private chartService chartservice;
		
		
		@GetMapping("/chart_main")
		public String chart_main(@RequestParam(value="chart_info_idx",required=false)int chart_info_idx,
				@RequestParam(value="chart_date",required=false)String chart_date,Model model)
		{	
			model.addAttribute("chart_info_idx",chart_info_idx);
			String chartInfoName=chartservice.getchartInfoName(chart_info_idx);
			model.addAttribute("chartInfoName",chartInfoName);
			
			List<ChartBean> getonechart =chartservice.getonechart(chart_date);
			model.addAttribute("getonechart",getonechart);
		
			
			return "chart/chart_main";
		}
	
		
	
		@GetMapping("/chart_main_pro") public String chart_main_pro(
	  
	  @RequestParam("chart_date")String chart_date, Model model) {
	  
		model.addAttribute("chart_date",chart_date);
		List<ChartBean> getonechart=chartservice.getonechart(chart_date);
		model.addAttribute("getonechart",getonechart);
		
	  
	  
	  return "chart/chart_main";
	  
	  }
	 
}		
		
		

		
		
		
		
		
		
		
