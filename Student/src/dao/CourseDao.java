package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import common.Page;

import vo.Course;
import vo.Teacher;

public class CourseDao {
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
		
		//根据教师编号查询任课课程
		public ArrayList getCourseByTeano(String teano) throws Exception{
			initConnection();
			Course cou=null;
			ArrayList al=new ArrayList();
			String sql="select * from t_course where teano=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, teano);
			rs=ps.executeQuery();
			while(rs.next()){
				cou=new Course();
				cou.setCourseno(rs.getString("COURSENO"));
				cou.setCoursename(rs.getString("COURSENAME"));
				cou.setCredit(rs.getFloat("CREDIT"));
				cou.setTeano(rs.getString("TEANO"));
				al.add(cou);
			}
			closeConnection();
			return al;
		}
		
		
		//根据课程号查询课程
		public Course getCourseByCouno(String couno) throws Exception{
			initConnection();
			Course cou = null;
			String sql="select * from t_course where courseno=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1,couno);
			rs=ps.executeQuery();
			
			if(rs.next()){
				   //创建教师对象tea
				cou=new Course();
				cou.setCourseno(rs.getString("courseno"));
				cou.setCoursename(rs.getString("coursename"));
				cou.setCredit(rs.getFloat("credit"));
				cou.setTeano(rs.getString("teano"));
				}
			closeConnection();
			return cou;		
		}
		
		//添加某个课程的方法
		public int insertOneCourse(Course  cou) throws Exception {
			initConnection();
			String sql="insert into t_course (courseno,coursename,credit,teano) values(?,?,?,?)";
			ps=conn.prepareStatement(sql);
			ps.setString(1,cou.getCourseno());
			 ps.setString(2,cou.getCoursename());
			 ps.setFloat(3,cou.getCredit());
			 ps.setString(4,cou.getTeano());
			int i=ps.executeUpdate();
			closeConnection();
			return i;     //返回i 
			}
		
		//根据课程号删除某个课程的方法
		public int deleteCourseByCouno(String  couno) throws Exception {
			initConnection();
			String sql="delete from t_course where courseno=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1,couno);
			int i=ps.executeUpdate();
			closeConnection();
			return i;            //返回i 
			}
		
		//更新某个课程的方法
		public int updateOneCourse(Course  cou) throws Exception {
			initConnection();
			String sql="update t_course set coursename=?, credit=?, teano=? where courseno=?";
			ps=conn.prepareStatement(sql);
			 ps.setString(1,cou.getCoursename());
			 ps.setFloat(2,cou.getCredit());
			 ps.setString(3,cou.getTeano());
			 ps.setString(4, cou.getCourseno());
			int i=ps.executeUpdate();
			closeConnection();
			return i;      //返回i 
			}
		
		//分页查询课程信息
		public Map findAllCourse(int curPage) throws Exception{
			Course course=null;
			ArrayList list=new ArrayList();//声明一个List对象，用于存放所要显示课程对象
			ResultSet r=null;
			Map map=null;
			Page pa=null;		
				initConnection();
				String sql="select * from t_course order by courseno"; 
				ps=conn.prepareStatement(sql);
				rs=ps.executeQuery();
				pa=new Page();//声明分页类对象
				pa.setPageSize(5);//设置每页所要显示记录个数
				pa.setPageCount(rs);//根据结果集设置所有要显示的总页数
				pa.setCurPage(curPage);//设置所要显示页，即当前页
				r=pa.setRs(rs);//设置本页要显示的结果集，此时记录指针处于第一条记录上
				r.previous();//记录指针前移，使之处于第一条记录之前的位置
				//利用循环操作将查询到的结果集放入List对象中
				for(int i=0;i<pa.getPageSize();i++){
					if(r.next()){
						//将教师记录转化为教师对象
						course=new Course();
						course.setCourseno(r.getString(1));
						course.setCoursename(r.getString(2));
						course.setCredit(r.getFloat(3));
						course.setTeano(r.getString(4));
						list.add(course);
					}else{
						break;
					}
				}
				map=new HashMap();//声明一个Map对象
				map.put("list",list);//将list对象放入Map对象
				map.put("pa",pa);//将Page对象放入Map对象
				closeConnection();
				return map;
		}
		
	
}
