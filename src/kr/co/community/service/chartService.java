package kr.co.community.service;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.community.beans.ChartBean;
import kr.co.community.dao.ChartDao;

@Service
public class chartService {
	@Autowired
	private ChartDao chartdao;
	
	
 	public List<ChartBean> getchartlist(int chart_info_idx) { 
 		return chartdao.chartList(chart_info_idx); 
 		
 	}
 	
 	
 	
	 public String getchartInfoName(int chart_info_idx) 
	 { 
		 return chartdao.getchartInfoName(chart_info_idx);
	  
	  }
	 
	 public List<ChartBean> getonechart(String chart_date){
		 return chartdao.getonechart(chart_date);
	 }
	 
	 public void addchartInfo(ChartBean writechart)
	 {
		 chartdao.addchartInfo(writechart);
	 }



	public ChartBean getchartInfo(String chart_date) {
	
		return chartdao.getchartInfo(chart_date);
	
		}
	
	public void modifychartInfo(ChartBean modifychartbean)
	{
		chartdao.modifychartInfo(modifychartbean);
	
	}
	
	public void deletechartInfo(String chart_date) {
		chartdao.deletechartInfo(chart_date);
	}



}