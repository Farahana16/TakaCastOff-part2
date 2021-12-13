<%-- 
    Document   : delete
    Created on : Dec 11, 2021, 11:10:17 AM
    Author     : User
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
 <!DOCTYPE html>
 <html>
     <body>
   
<%
       
            Connection con;
            /*PreparedStatement pst;*/
            ResultSet rs;
            
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            con = DriverManager.getConnection("jdbc:postgresql://ec2-34-242-89-204.eu-west-1.compute.amazonaws.com:5432/d3l5le2bv701er?sslmode=require", "rnqytvemmgbote","1314c362e861f0c8baa9a12de6f9385be4e0bd594f9a498eac797f306db8200e");
            Statement pst = con.createStatement();
            pst.executeUpdate("delete from customers where custID = '"+session.getAttribute("SES_ID")+"'");
            response.sendRedirect("index.jsp"); 
        
        %>
        
        <script>
            
            alert("Succesful Deleted!");
            window.location.href="index.jsp";
            
       </script>
     </body>
 </html>