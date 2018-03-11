package dao;
import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import common.Page;


import vo.Manager;
import vo.Teacher;
public class TeacherDao {
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
	
	//查询所有教师方法getAllTeachers()
	public ArrayList getAllTeachers() throws Exception {
		ArrayList al = new ArrayList();     //定义集合对象al
		initConnection();
		String sql="select * from t_Teacher";
		ps=conn.prepareStatement(sql);
		rs=ps.executeQuery();
		while(rs.next()){
			Teacher tea = new Teacher();   //创建教师对象tea
			tea.setTeano(rs.getString("TEANO"));
			tea.setTeaname(rs.getString("TEANAME"));
			tea.setTeasex(rs.getString("TEASEX"));
			tea.setTitle(rs.getString("TITLE"));
			al.add(tea);             //将查到的教师对象放入集合al 
            
		}
		closeConnection();
		return al; //返回教师集合al 
	}
	
		//根据编号查询教师方法getTeacherByTeano()
		public Teacher getTeacherByTeano(String  teano) throws Exception {
			initConnection();
			Teacher tea = null;
			String sql="select * from t_teacher where teano=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1,teano);
			rs=ps.executeQuery();
			
			if(rs.next()){
				   //创建教师对象tea
				tea=new Teacher();
				tea.setTeano(rs.getString("TEANO"));
				tea.setTeaname(rs.getString("TEANAME"));
				tea.setTeapwd(rs.getString("TEAPWD"));
				tea.setTeasex(rs.getString("TEASEX"));
				tea.setTitle(rs.getString("TITLE"));
				}
			closeConnection();
			return tea;            //返回教师
			}
		
		//根据姓名查询教师方法getTeacherByTeaname()
				public Teacher getTeacherByTname(String  tname) throws Exception {
					initConnection();
					Teacher tea = null;
					String sql="select * from t_teacher where teaname=?";
					ps=conn.prepareStatement(sql);
					ps.setString(1,tname);
					rs=ps.executeQuery();
					
					if(rs.next()){
						   //创建教师对象tea
						tea=new Teacher();
						tea.setTeano(rs.getString("TEANO"));
						tea.setTeaname(rs.getString("TEANAME"));
						tea.setTeapwd(rs.getString("TEAPWD"));
						tea.setTeasex(rs.getString("TEASEX"));
						tea.setTitle(rs.getString("TITLE"));
						}
					closeConnection();
					return tea;            //返回教师
					}
		
		
		//添加某个教师方法insertOneTeacher()
		public int insertOneTeacher(Teacher  tea) throws Exception {
			initConnection();
			String sql="insert into t_teacher (teano,teaname,teasex,teapwd,title) values(?,?,?,?,?)";
			ps=conn.prepareStatement(sql);
			ps.setString(1,tea.getTeano());
			 ps.setString(2,tea. getTeaname());
			 ps.setString(3,tea. getTeasex());
			 ps.setString(4,tea. getTeapwd());
			 ps.setString(5,tea. getTitle());
			int i=ps.executeUpdate();
			closeConnection();
			return i;     //返回i 
			}

		
		//根据学号删除某个教师方法deleteTeacherByTeano()
		public int deleteTeacherByTeano(String  teano) throws Exception {
			initConnection();
			String sql="delete from t_teacher where teano=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1,teano);
			int i=ps.executeUpdate();
			closeConnection();
			return i;            //返回i 
			}
			
		//更新某个教师方法updateOneTeacher()
		public int updateOneTeacher(Teacher  tea) throws Exception {
			initConnection();
			String sql="UPDATE T_TEACHER SET TEANAME=? ,TEASEX=?,TITLE=? WHERE TEANO=?";
			ps=conn.prepareStatement(sql);
			 ps.setString(1,tea.getTeaname());
			 ps.setString(2,tea.getTeasex());
			 ps.setString(3,tea.getTitle());
			 ps.setString(4, tea.getTeano());
			int i=ps.executeUpdate();
			closeConnection();
			return i;      //返回i 
			}
		
		//多条件查询教师
		public ArrayList getAllTeacherByMostCon(String teano,String teaname) throws Exception{
			Teacher teacher=null;
			ArrayList list=new ArrayList();
			
			//构造多条件查询的SQL语句（实现单一条件或者多个条件的灵活查询）
			String sql="select * from t_teacher where 1=1 ";
			//精确查询
			/*
			if(stuno!=null&&!stuno.equals("")){
				sql+=" and stuno='"+stuno+"'";
			}
			if(stuname!=null&&!stuname.equals("")){
				sql+=" and stuname='"+stuname+"'";
			}
			
			sql+=" order by stuno";
			*/
			//模糊查询
			if(teano!=null&&!teano.equals("")){
				sql+=" and stuno like '%"+teano+"%'";
			}
			if(teaname!=null&&!teaname.equals("")){
				sql+=" and stuname like '%"+teaname+"%'";
			}
			
			sql+=" order by teano";
			try{
				initConnection();
				ps=conn.prepareStatement(sql);
				rs=ps.executeQuery();
				while(rs.next()){
					//将教师记录转化为教师对象
					teacher=new Teacher();
					teacher.setTeano(rs.getString("TEANO"));
					teacher.setTeaname(rs.getString("TEANAME"));
					teacher.setTeapwd(rs.getString("TEAPWD"));
					teacher.setTeasex(rs.getString("TEASEX"));
					teacher.setTitle(rs.getString("TITLE"));
					list.add(teacher);
				}
			}catch (Exception e) {
				e.printStackTrace();
			}finally{
					closeConnection();
				
			}
			return list;
		}
		
		//分页查询教师记录
		public Map findAllTeacher(int curPage) throws Exception{
			Teacher teacher=null;
			ArrayList list=new ArrayList();//声明一个List对象，用于存放所要显示教师对象
			ResultSet r=null;
			Map map=null;
			Page pa=null;		
				initConnection();
				String sql="select * from t_teacher order by teano"; 
				ps=conn.prepareStatement(sql);
				rs=ps.executeQuery();
				pa=new Page();//声明分页类对象
				pa.setPageSize(3);//设置每页所要显示记录个数
				pa.setPageCount(rs);//根据结果集设置所有要显示的总页数
				pa.setCurPage(curPage);//设置所要显示页，即当前页
				r=pa.setRs(rs);//设置本页要显示的结果集，此时记录指针处于第一条记录上
				r.previous();//记录指针前移，使之处于第一条记录之前的位置
				//利用循环操作将查询到的结果集放入List对象中
				for(int i=0;i<pa.getPageSize();i++){
					if(r.next()){
						//将教师记录转化为教师对象
						teacher=new Teacher();
						teacher.setTeano(r.getString(1));
						teacher.setTeaname(r.getString(3));
						teacher.setTeapwd(r.getString(2));
						teacher.setTeasex(r.getString(4));
						teacher.setTitle(r.getString(5));
						list.add(teacher);
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


