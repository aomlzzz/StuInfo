package dao;
import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import common.Page;


import vo.Student;
public class StudentDao {
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
	
	//查询所有学生方法getAllStudents()
	public ArrayList getAllStudents() throws Exception {
		ArrayList al = new ArrayList();     //定义集合对象al
		initConnection();
		String sql="select * from t_student";
		ps=conn.prepareStatement(sql);
		rs=ps.executeQuery();
		while(rs.next()){
			Student stu = new Student();   //创建学生对象stu
			stu.setStuno(rs.getString("STUNO"));
			stu.setStuname(rs.getString("STUNAME"));
			stu.setStusex(rs.getString("STUSEX"));
			al.add(stu);             //将查到的学生对象放入集合al 
            
		}
		closeConnection();
		return al; //返回学生集合al 
	}
	
		//根据学号查询某个学生方法getStudentByStuno()
		public Student getStudentByStuno(String  stuno) throws Exception {
			initConnection();
			Student stu = null;
			String sql="select * from t_student where stuno=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1,stuno);
			rs=ps.executeQuery();
			
			if(rs.next()){
				   //创建学生对象stu
				stu=new Student();
				stu.setStuno(rs.getString("STUNO"));
				stu.setStuname(rs.getString("STUNAME"));
				stu.setStusex(rs.getString("STUSEX"));
				}
			closeConnection();
			return stu;            //返回学生  
			}
		
		
		//添加某个学生方法insertOneStudent()
		public int insertOneStudent(Student  stu) throws Exception {
			initConnection();
			String sql="insert into t_student (stuno,stuname,stusex,stupwd) values(?,?,?,?)";
			ps=conn.prepareStatement(sql);
			ps.setString(1,stu.getStuno());
			 ps.setString(2,stu. getStuname());
			 ps.setString(3,stu. getStusex());
			 ps.setString(4,stu. getStupwd());
			int i=ps.executeUpdate();
			closeConnection();
			return i;     //返回i 
			}

		
		//根据学号删除某个学生方法deleteStudentByStuno()
		public int deleteStudentByStuno(String  stuno) throws Exception {
			initConnection();
			String sql="delete from t_student where stuno=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1,stuno);
			int i=ps.executeUpdate();
			closeConnection();
			return i;            //返回i 
			}
			
		//更新某个学生方法updateOneStudent()
		public int updateOneStudent(Student  stu) throws Exception {
			initConnection();
			String sql="UPDATE T_STUDENT SET STUNAME=? ,STUSEX=? WHERE STUNO=?";
			ps=conn.prepareStatement(sql);
			 ps.setString(1,stu. getStuname());
			 ps.setString(2,stu. getStusex());
			 ps.setString(3,stu.getStuno());
			int i=ps.executeUpdate();
			closeConnection();
			return i;      //返回i 
			}
		
		//多条件查询学生
		public ArrayList getAllStudentByMostCon(String stuno,String stuname) throws Exception{
			Student student=null;
			ArrayList list=new ArrayList();
			
			//构造多条件查询的SQL语句（实现单一条件或者多个条件的灵活查询）
			String sql="select * from t_student where 1=1 ";
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
			if(stuno!=null&&!stuno.equals("")){
				sql+=" and stuno like '%"+stuno+"%'";
			}
			if(stuname!=null&&!stuname.equals("")){
				sql+=" and stuname like '%"+stuname+"%'";
			}
			
			sql+=" order by stuno";
			try{
				initConnection();
				ps=conn.prepareStatement(sql);
				rs=ps.executeQuery();
				while(rs.next()){
					//将学生记录转化为学生对象
					student=new Student();
					student.setStuno(rs.getString("STUNO"));
					student.setStuname(rs.getString("STUNAME"));
					student.setStupwd(rs.getString("STUPWD"));
					student.setStusex(rs.getString("STUSEX"));
					list.add(student);
				}
			}catch (Exception e) {
				e.printStackTrace();
			}finally{
					closeConnection();
				
			}
			return list;
		}
		
		//分页查询学生记录
		public Map findAllStudent(int curPage) throws Exception{
			Student student=null;
			ArrayList list=new ArrayList();//声明一个List对象，用于存放所要显示学生对象
			ResultSet r=null;
			Map map=null;
			Page pa=null;		
				initConnection();
				String sql="select * from t_student order by stuno"; 
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
						//将学生记录转化为学生对象
						student=new Student();
						student.setStuno(r.getString(1));
						student.setStuname(r.getString(3));
						student.setStupwd(r.getString(2));
						student.setStusex(r.getString(4));
						list.add(student);
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


