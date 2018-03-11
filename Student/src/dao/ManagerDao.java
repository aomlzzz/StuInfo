package dao;
import java.sql.*;
import vo.Manager;
public class ManagerDao {
	private Connection conn;	
	//获取数据库连接方法initConnetion()
	public void initConnection() throws Exception{
		Class.forName("com.mysql.jdbc.Driver");
		String url="jdbc:mysql://localhost:3306/school";
		conn=DriverManager.getConnection(url,"root","123456");	
	}
	//getManagerByManname方法根据管理员名查询数据表，返回man对象
	public Manager getManagerByManname(String manname) throws Exception{
		initConnection();
		String sql="select * from t_manager where manname=?";
		PreparedStatement ps=conn.prepareStatement(sql);
		ps.setString(1, manname);
		ResultSet rs=ps.executeQuery();
		Manager man=null;
		if(rs.next()){
			man=new Manager();
			man.setManno(rs.getString("manno"));
			man.setManname(rs.getString("manname"));
			man.setManpwd(rs.getString("manpwd"));
		}
		return man;			
	}
}
