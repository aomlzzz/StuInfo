# StuInfo
## Student information management system <br/>
## 这是一个基于jsp的学生管理系统
本人初学者水平，写的一般，有很多代码冗余，也没有按照mvc模式来，放上来让大家参考参考
<hr/>
登陆分三个角色：<br/>
<ul>
<li>管理员</li>
<li>教师</li>
<li>学生</li>
</ul>
每个角色的能执行的操作不同，管理员可以对学生/老师/课程信息进行CRUD,教师可以修改成绩、录入成绩、修改个人信息,学生可以选课、查看和修改个人信息<br/>

## 项目部署<br/>
<hr/>
数据库文件为school.sql, 直接导入即可
我在项目中用的是mariadb,如果你用的是mysql或者别的数据库，需要把DAO文件中的url全部修改
管理员账户：admin 密码：123456
