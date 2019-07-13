<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@ page import="org.hibernate.*, org.hibernate. cfg.Configuration,  java.util.*,com.lti.hiber.User, org.hibernate.criterion.*,java.util.Iterator" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Restriction</title>
</head>
<body>
<%

Configuration cfg= new Configuration();
cfg.configure("hibernate.cfg.xml");
SessionFactory factory=cfg.buildSessionFactory();
Session sess=factory.openSession();

Criteria cr=sess.createCriteria(User.class);

cr.addOrder(Order.asc("name"));
cr.setMaxResults(5);
List<User> list= (List<User>)cr.list();
out.println("List of Employees"+"<br>");
out.println("<table border = '1'>");
out.println("<tr bgcolor='yelloe'>");
out.println("<th> User Id</th>");
out.println("<th> User Name</th>");
out.println("<th> Email</th>");
out.println("</tr>");
Iterator it=list.iterator();
while(it.hasNext()){
	User u =(User)it.next();
	out.println("<tr bgcolor='aqua'>");
	out.println("<td>"+u.getId()+"</td>");
	out.println("<td>"+u.getName()+"</td>");
	out.println("<td>"+u.getEmail()+"</td>");
	out.println("</tr>");
}
out.println("</table>");
sess.close();
factory.close();

	
	
	
	






%>
</body>
</html>