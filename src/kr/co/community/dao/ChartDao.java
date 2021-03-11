package kr.co.community.dao;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.community.beans.ChartBean;
import kr.co.community.beans.ContentBean;

@Repository
public class ChartDao {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	public List<ChartBean> chartList(int chart_info_idx){
		return sqlSessionTemplate.selectList("chart.getChartList",chart_info_idx);
	}
	
	public String getchartInfoName(int chart_info_idx)
	
	{
		return sqlSessionTemplate.selectOne("chart.getchartInfoName",chart_info_idx);
	}
	
	public List<ChartBean> getonechart(String chart_date) 
	{
		
		return sqlSessionTemplate.selectList("chart.getonechart",chart_date);
	
	}

	public void addchartInfo(ChartBean writechart) {
		// TODO Auto-generated method stub
		sqlSessionTemplate.insert("chart.addchartInfo", writechart);
	}
	
	public ChartBean getchartInfo(String chart_date) {
		return sqlSessionTemplate.selectOne("chart.getchartInfo", chart_date);
	}
	
	public void modifychartInfo(ChartBean modifychartbean) {
		sqlSessionTemplate.selectOne("chart.modifychartInfo", modifychartbean);
	}
	
	public void deletechartInfo(String chart_date) {
		sqlSessionTemplate.delete("chart.deletechartInfo", chart_date);
	}
	
}
