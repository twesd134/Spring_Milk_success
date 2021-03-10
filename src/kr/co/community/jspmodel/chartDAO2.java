package kr.co.community.jspmodel;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import kr.co.community.beans.ChartBean;



public class chartDAO2 {
	
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	
	public void getCon() {
		
		try {
			Context initctx=new InitialContext();
			Context envctx=(Context) initctx.lookup("java:comp/env");
			DataSource ds=(DataSource)envctx.lookup("jdbc/pool");
		
			con=ds.getConnection();
		}catch(Exception e) {
				e.printStackTrace();
		}
	
	}
	
	public ArrayList<ChartBean> getchartdate(String chart_date){
		
		ArrayList<ChartBean> v = new ArrayList<>();
			
		ChartBean bean=null;
			getCon();
			
			
			try {
				
				String sql="select * from chart where chart_date Like '%'||?||'%' order by chart_date asc";
//				'%' || ? || '%'
				pstmt=con.prepareStatement(sql);
				
				pstmt.setString(1,chart_date);
				
				rs=pstmt.executeQuery();
				
				
				
			while(rs.next()) {
				 bean=new ChartBean();
				 //bean�� CarListBean���� ����
				 
					bean.setId(rs.getInt(1));
					bean.setKind(rs.getString(2));
					bean.setChart_date(rs.getString(3));
					bean.setTarget(rs.getInt(4));
					bean.setProduct(rs.getInt(5));
					
					v.add(bean);
				 
				 
			}
			con.close();
			}catch (Exception e) {
				e.printStackTrace();// TODO: handle exception
			}
			
			
			return v;
		}


}
