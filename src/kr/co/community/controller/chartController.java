package kr.co.community.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.validation.Valid;

import org.apache.ibatis.annotations.Select;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.community.beans.ChartBean;
import kr.co.community.beans.ContentBean;
import kr.co.community.beans.UserBean;
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
		
		@Resource(name = "loginUserBean")
		@Lazy
		private UserBean loginUserBean;
		
		@GetMapping("/chart_main")
		public String chart_main(@RequestParam(value="chart_info_idx",required=false)int chart_info_idx,
				@RequestParam(value="chart_date",required=false)String chart_date,Model model)
		{	
			model.addAttribute("chart_info_idx",chart_info_idx);
			String chartInfoName=chartservice.getchartInfoName(chart_info_idx);
			model.addAttribute("chartInfoName",chartInfoName);
			
			List<ChartBean> getonechart =chartservice.getonechart(chart_date);
			model.addAttribute("getonechart",getonechart);
			model.addAttribute("loginUserBean", loginUserBean);

			
			return "chart/chart_main";
		}
	
	
		@GetMapping("/chart_main_pro") 
		public String chart_main_pro( @RequestParam("chart_date")String chart_date, Model model) {
	  
		model.addAttribute("chart_date",chart_date);
		List<ChartBean> getonechart=chartservice.getonechart(chart_date);
		model.addAttribute("getonechart",getonechart);
		
	  
	  
	  return "chart/chart_main";
	  
	  }
	
	  @GetMapping("/write") 
	  public String write_chart()
	  {
		 
		
		  
		  return "chart/write";
	  }
	  
	  @PostMapping("/write_pro")
	  public String write_pro(@Valid @ModelAttribute("writechart") ChartBean writechart, BindingResult result)
	  {
		 
			if(result.hasErrors()) {
				return "chart/write";
			}
		  
		chartservice.addchartInfo(writechart);
		
		return "chart/chart_wrie_success";
			
	  }
	  
	 
	  @GetMapping("/modify") 
	  public String modify()
	  
	  {
		  return "chart/modify";
	  }
	  
	  @PostMapping("/modify_pro")
	  public String modify_pro(@Valid @ModelAttribute("modifychartBean") ChartBean modifychartBean, BindingResult result)
	  {
		 
			if(result.hasErrors()) {
				return "chart/chart_main";
			}
		  
		chartservice.modifychartInfo(modifychartBean);
		
		return "chart/modify_success";
			
	  }
	  
	  @GetMapping("/delete")
	  public String delete()
	  
	  {
		  

		
	  return "chart/delete";
	  }
	  
	  @PostMapping("/delete_pro")
	  public String delete_pro(@RequestParam(value="chart_date",required=false)String chart_date)
	  
	  {
		  
		 chartservice.deletechartInfo(chart_date);
	  return "chart/delete_success";
	  }
	  
	  
}
