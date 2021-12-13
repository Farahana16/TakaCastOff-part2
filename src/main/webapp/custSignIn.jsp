<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
	<body>
		<%
			String username2 = request.getParameter("username");
			String password2 = request.getParameter("password");
			
			try{ 
				//load the driver class  
				Class.forName("com.mysql.jdbc.Driver"); 
				
				//create the connection object 
				Connection con=DriverManager.getConnection( "jdbc:postgresql://ec2-34-242-89-204.eu-west-1.compute.amazonaws.com:5432/d3l5le2bv701er?sslmode=require", "rnqytvemmgbote","1314c362e861f0c8baa9a12de6f9385be4e0bd594f9a498eac797f306db8200e"); 
				String username = request.getParameter("username");
				String pass = request.getParameter("pass");
		
				//create the statement object 
				Statement stmt=con.createStatement(); 
				String sql = "select * from customers where custUsername= '" + username + "' and custPwd= '" + pass + "'";
				
				//execute query 
				ResultSet rs=stmt.executeQuery(sql); 

				//processing resultset - iterate
				if(rs.next()){
					String custID = rs.getString("custID");
					session.setAttribute("SES_ID",custID);
					response.sendRedirect("homepage.jsp");
				}
				else {
					request.setAttribute("error", "Wrong username or password. Try Again");
					RequestDispatcher rd = request.getRequestDispatcher("index.jsp"); 
					rd.include(request, response);
				} 
				con.close(); 
			}
			catch(Exception e){ 
				System.out.println(e); 
			} 
		%>
	</body>
</html>
