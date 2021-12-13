<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
	String driver = "com.mysql.jdbc.Driver";
	String connectionUrl = "jdbc:postgresql://ec2-34-242-89-204.eu-west-1.compute.amazonaws.com:5432/";
	String database = "d3l5le2bv701er?sslmode=require";
	String userid = "rnqytvemmgbote";
	String password = "1314c362e861f0c8baa9a12de6f9385be4e0bd594f9a498eac797f306db8200e";
	try {
		Class.forName(driver);
	} catch (ClassNotFoundException e) {
		e.printStackTrace();
	   }
		Connection connection = null;
		Statement statement = null;
		ResultSet resultSet = null;
%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="UTF-8">    
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
   /* Google Font Link */
   @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700&display=swap');
   *{
     margin: 0;
     padding: 0;
     box-sizing: border-box;
     font-family: "Poppins" , sans-serif;
   }
   body{
     
     display: flex;
     height: 100vh;
     align-items: center;
     justify-content: center;
     padding: 10px;
     background: linear-gradient(135deg, #71b7e6, #9b59b6);
     
   }
   .container{
     max-width: 100%;
     width: 100%;
     background: #fff;
     padding: 25px 30px;
     box-shadow: 0 5px 10px rgba(0,0,0,0.2);
     perspective: 2700px;
     border-radius: 5px;
  
   }
   .container .title{
       font-size: 25px;
       font-weight: 500;
       position: relative;
   }
   .container .title::before{
       content: '';
       position: absolute;
       left: 0;
       bottom: 0;
       height: 3px;
       width: 30px;
       background: linear-gradient(135deg, #71b7e6, #9b59b6);
   }
   .container form .user-details{
       display: flex;
       flex-wrap: wrap;  
       justify-content: space-between;
       margin: 20px 0 12px 0;
   }
   .container .row {
     display: flex;
   }
   
   container .column {
     flex: 33.33%;
     padding: 5px;
   }
   .user-profile .user-avatar img {
       width: 90px;
       height: 90px;
       -webkit-border-radius: 100px;
       -moz-border-radius: 100px;
       border-radius: 100px;
   }
   form .user-details .input-box{
       margin-bottom: 15px;
       width: calc(100% / 2 - 20px);
   }
   .user-details .input-box .details{
       display: block;
       font-weight: 500;
       margin-bottom: 5px;
   }
   .user-details .input-box input{
       height: 45px;
       width: 100%;
       outline: none;
       border-radius: 5px;
       border: 1px solid #ccc;
       padding-left: 15px;
       font-size: 16px;
       border-bottom-width: 2px;
       transition: all 0.3s ease;
   }
   .user-details .input-box input:focus,
   .user-details .input-box input:valid{
       
       border-color: #9b59b6
   }
   form .button input{
       height: 100%;
       width: 100%;
       outline: none;
       color: #fff;
       border: none;
       font-size: 18px;
       font-weight: 1px;
       border-radius: 5px;
       letter-spacing: 1px;
       background: rgb(19, 100, 192);
   }
    form .button input:hover{
       background: rgb(70, 161, 197);
    }
   @media (max-width: 584px){
       .container{
           max-width: 100px;	
       }
       form .user-details .input-box{
       margin-bottom: 20px;
       width: 100%;
       }
       .container form .user-details{
           max-height: 300px;
           overflow-y: scroll;
       }
       .user-details::-webkit-Scrollbar{
           width: 0;
       }
       
       column {
       width: 100%;
     }
  
}
   </style>
   </head>

<body>
        <div class="container">
          <div class="title">Update Profile</div>
		    <div class="row">
			 <div class="column"></div>
			    <div class="column">
			      <%
			      			//String ID = session.getAttribute("SES_ID");
							connection = DriverManager.getConnection(connectionUrl+database, userid, password);
							statement=connection.createStatement();
							String sql ="select * from customers where custID = '"+session.getAttribute("SES_ID")+ "'";
							resultSet = statement.executeQuery(sql);
						while(resultSet.next()){
					%>
                    <form action="updateProcess.jsp" method="post">  
		    		<div class="user-details">
                                
                     <input type="hidden" name="custID" value="<%=resultSet.getString("custID") %>">                      
                        
                    <div class="input-box">
                    <span class="details">Username</span>
                    <input type="text" value="<%=resultSet.getString("custUsername") %>"  name="custUsername" >
                    </div>
                                
                    <div class="input-box">
                    <span class="details">Phone Number</span>
                    <input type="text" value="<%=resultSet.getString("custPhoneNum") %>"  name="custPhoneNum" >
                    </div>
                                
                    <div class="input-box">
                    <span class="details">Password</span>
                    <input type="text" value="<%=resultSet.getString("custPwd") %>"  name="custPwd" >
                    </div>
                                
                    <div class="input-box">
                    <span class="details">Email</span>
                    <input type="text" value="<%=resultSet.getString("custEmail") %>"  name="custEmail" >
                    </div>
                    
                    </div>  

                    <div class="input-box button">
                        <input type="Submit" value="submit">
                    </div><br>
                     <div class="input-box button">
                        <a href="delete.jsp"><input type="Delete" value="delete"></a>
                    </div>
                            
                    </form>
                </div>    
            </div>
        </div>
        <%
		    }
		    
	    %>            
</body>
</html>