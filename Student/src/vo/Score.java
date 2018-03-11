package vo;

public class Score {
	private String stuno;   //学号
	private String stuname;  //姓名
	private String courseno;  // 课程编号
	private String coursename;  //课程名称
	private Float score;         //分数
	private String type;         //类型
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getStuno() {
		return stuno;
	}
	public void setStuno(String stuno) {
		this.stuno = stuno;
	}
	public String getStuname() {
		return stuname;
	}
	public void setStuname(String stuname) {
		this.stuname = stuname;
	}
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
	public Float getScore() {
		return score;
	}
	public void setScore(Float score) {
		this.score = score;
	}
	
}
