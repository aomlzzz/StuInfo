package vo;

public class Course {
	private String courseno;   //课程编号
	private String coursename;   //课程名称
	private Float credit;      //学分
	private String teano;      //教师编号

	public String getCourseno() {
		return courseno;
	}
	public void setCourseno(String courseno) {
		this.courseno = courseno;
	}
	public String getCoursename() {
		return coursename;
	}
	public void setCoursename(String coursename) {
		this.coursename = coursename;
	}
	public Float getCredit() {
		return credit;
	}
	public void setCredit(Float credit) {
		this.credit = credit;
	}
	public String getTeano() {
		return teano;
	}
	public void setTeano(String teano) {
		this.teano = teano;
	}

	
}
