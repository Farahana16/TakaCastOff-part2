<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%
	String driver = "com.mysql.jdbc.Driver";
	String connectionUrl = "jdbc:postgresql://ec2-34-242-89-204.eu-west-1.compute.amazonaws.com:5432/";
	String database = "d3l5le2bv701er?sslmode=require";
	String userid = "rnqytvemmgbote";
	String password = "1314c362e861f0c8baa9a12de6f9385be4e0bd594f9a498eac797f306db8200e";
	String custID = request.getParameter("custID");
	String custPwd=request.getParameter("custPwd");
	String custPhoneNum=request.getParameter("custPhoneNum");
	String custEmail = request.getParameter("custEmail");
	String custUsername=request.getParameter("custUsername");
	if(custID != null){
		Connection con = null;
		PreparedStatement ps = null;
		int personID = Integer.parseInt(custID);
		try{
			Class.forName(driver);
			con = DriverManager.getConnection(connectionUrl+database,userid,password);
			String sql="Update customers set custID=?,custUsername=?,custPhoneNum=?,custPwd=?,custEmail=? where custID="+custID;
			ps = con.prepareStatement(sql);
			ps.setString(1, custID);
			ps.setString(2, custUsername);
			ps.setString(3, custPhoneNum);
			ps.setString(4, custPwd);
			ps.setString(5, custEmail);
			int i = ps.executeUpdate();
			if(i > 0){
		    response.sendRedirect("displayUpdate.jsp");
		    //out.print("Record Updated Successfully");
			}
			else{
				out.print("There is a problem in updating Record.");
			}
		}
		catch(SQLException sql){
			request.setAttribute("error", sql);
			out.println(sql);
		}
	}
%>