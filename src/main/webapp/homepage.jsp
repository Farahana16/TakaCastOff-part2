<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.text.DecimalFormat" %>
<!DOCTYPE html>
<%
	String driver = "com.mysql.jdbc.Driver";
	String connectionUrl = "jdbc:postgresql://ec2-34-242-89-204.eu-west-1.compute.amazonaws.com:5432/";
	String database = "d3l5le2bv701er?sslmode=require";
	String userid = "rnqytvemmgbote";
	String password = "1314c362e861f0c8baa9a12de6f9385be4e0bd594f9a498eac797f306db8200e";
	
	try {
		Class.forName(driver);
	} 
	catch (ClassNotFoundException e) {
		e.printStackTrace();
	}
	Connection connection = null;
	Statement statement = null;
	ResultSet resultSet = null;
	String image = null;
	DecimalFormat format = new DecimalFormat("0.00");
%>
<html lang="en">
	<head>
		<title>Homepage</title>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
	<style>
		* {
		  box-sizing: border-box;
		}
		
		/* Style the body */
		body {
		  font-family: Arial, Helvetica, sans-serif;
		  margin: 0;
		}
		
		.header {
		  padding: 150px;
		  text-align: center;
		  background: url("bgover.jfif");
		  color: rgb(10, 10, 10);
		  background-position: center;
		  background-attachment: fixed;
		}
		
		/* Increase the font size of the heading */
		.header h1 {
		  font-size: 40px;
		}
		
		/* Sticky navbar - toggles between relative and fixed, depending on the scroll position. 
		It is positioned relative until a given offset position is met in the viewport - 
		then it "sticks" in place (like position:fixed). The sticky value is not supported in IE or 
		Edge 15 and earlier versions. However, for these versions the navbar will inherit default position */
		.navbar {
		  overflow: hidden;
		  background-color: rgb(51, 134, 212);
		  position: sticky;
		  position: -webkit-sticky;
		  top: 0;
		}
		
		/* Style the navigation bar links */
		.navbar a {
		  float: right;
		  display: block;
		  color: white;
		  text-align: center;
		  padding: 14px 20px;
		  text-decoration: none;
		}
		
		
		/* Right-aligned link */
		.navbar a.right {
		  float: left;
		}
		
		/* Change color on hover */
		.navbar a:hover {
		  background-color: #ddd;
		  color: black;
		}
		
		/* Active/current link */
		.navbar a.active {
		  background-color: rgb(48, 47, 47);
		  color: white;
		}
		
		/* Column container */
		.row {  
		  display: -ms-flexbox; /* IE10 */
		  display: flex;
		  -ms-flex-wrap: wrap; /* IE10 */
		  flex-wrap: wrap;
		}
		
		/* Create two unequal columns that sits next to each other */
		/* Sidebar/left column */
		.side {
		  -ms-flex: 30%; /* IE10 */
		  flex: 30%;
		  background-color: #f1f1f1;
		  padding: 20px;
		}
		
		.column {
		  float: left;
		  width: 20%;
		  padding: 20px;
		}
		
		/* Clearfix (clear floats) */
		.row::after {
		  content: "";
		  clear: both;
		  display: table;
		}
		
	</style>
	</head>
	<body>
		<div class="header">
		  <h1>Welcome To My Paradise</h1>
		  <p> Clothes heaven starts here</p>
		</div>
		
		<div class="navbar">
		  <a href="#">About Us</a>
		  <a href="#">Shop</a>
		  <a href="#" class="active">Home</a>
		  <a href="profileUpdate.jsp">Edit Profile</a>
		</div>
		<div class="row">
		<%
        try{
        	connection = DriverManager.getConnection(connectionUrl+database, userid, password);
       		statement=connection.createStatement();
        	String sql ="select * from product";
        	resultSet = statement.executeQuery(sql);
        while(resultSet.next()){
        	
        %>
		  <% image = resultSet.getString("productImages"); %>
		  <div class="column">
		    <img src="<%=image %>" alt="image" style="width:100%; height:70%">
		    
		    <h4><%=resultSet.getString("productName")%></h4>
		    <p>RM<%=format.format(resultSet.getDouble("productPrice"))%></p>
		  </div>
		  <%
	        }
	        connection.close();
	        } catch (Exception e) {
	        e.printStackTrace();
	        }
       	 %>
       	</div>
	</body>
</html>
