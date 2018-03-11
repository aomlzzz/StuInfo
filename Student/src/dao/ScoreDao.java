package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import vo.Score;

public class ScoreDao {
	//定义连接对象conn
			private Connection conn = null;
			private PreparedStatement ps=null;
			private ResultSet rs=null;
			//定义initConnection()方法获取数据库连接
			public void initConnection() throws Exception {
				Class.forName("com.mysql.jdbc.Driver");
				String url="jdbc:mysql://localhost:3306/school";
				conn = DriverManager.getConnection(url,"root","123456");
			}
			
			//关闭数据库连接closeConnection()方法
			public void closeConnection() throws Exception {
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
			       	if(conn!=null)conn.close();
			}
			//根据课程编号查询成绩
			public ArrayList getScoreByCourseno(String courseno) throws Exception{
				initConnection();
				
				ArrayList al=new ArrayList();
				String sql="select * from t_score as sc,t_student as st where sc.stuno=st.stuno and courseno=?";
				ps=conn.prepareStatement(sql);
				ps.setString(1, courseno);
				rs=ps.executeQuery();
				while(rs.next()){
					Score sco=new Score();
					sco.setStuno(rs.getString("sc.stuno"));
					sco.setStuname(rs.getString("st.stuname"));
					sco.setCourseno(rs.getString("sc.courseno"));
					sco.setScore(rs.getFloat("sc.score"));
					al.add(sco);
				}
				closeConnection();
				return al;
			}
			//批量录入成绩
			public int addScores(String courseno,String[] stuno,String[] score ) throws Exception{
				initConnection();
				String sql="update t_score set score=? where courseno=? and stuno=?";
				ps=conn.prepareStatement(sql);
				int num=0;
				for(int i=0;i<stuno.length;i++){
					Float sco=Float.parseFloat(score[i]);
					ps.setFloat(1,sco);	
					ps.setString(2, courseno);
					ps.setString(3,stuno[i]);
					num=ps.executeUpdate();
				}
				closeConnection();
				return num;
			}
}
