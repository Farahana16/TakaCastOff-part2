<%-- 
    Document   : connect
    Created on : Dec 11, 2021, 7:31:06 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
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
     
     min-height: 100vh;
     display: flex;
     align-items: center;
     justify-content: center;
     padding: 10px;
     background: linear-gradient(135deg, #71b7e6, #9b59b6);
     
   }
   .container{
     max-width: 80%;
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
   }
   .container .user-details{
       display: flex;
       flex-wrap: wrap;  
       justify-content: space-between;
       margin: 20px 0 12px 0;
   }
   
   .user-details .input-box{
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
      /* width: 100%; */
       outline: none;
       border-radius: 5px;
       border: 1px solid #ccc;
     /*  padding-left: 15px;*/
       font-size: 16px;
       border-bottom-width: 2px;
       transition: all 0.3s ease;
   }
    .input-box input:focus,
    .input-box input:valid{
       
       border-color: #9b59b6
   }
   .button input{
       height: 10%;
       width: 20%;
       outline: none;
       color: #71b7e6;
       border: none;
       font-size: 18px;
       font-weight: 1px;
       border-radius: 5px;
       letter-spacing: 1px;
       background: rgb(19, 100, 192);
   }

   @media (max-width: 584px){
       .container{
           max-width: 100px;	
       }
       .container .user-details{
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
<%
		String custPwd = request.getParameter("custPwd");
		String custPhoneNum = request.getParameter("custPhoneNum");
        String custEmail = request.getParameter("custEmail");
		String custUsername = request.getParameter("custUsername");

		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:postgresql://ec2-34-242-89-204.eu-west-1.compute.amazonaws.com:5432/d3l5le2bv701er?sslmode=require", "rnqytvemmgbote","1314c362e861f0c8baa9a12de6f9385be4e0bd594f9a498eac797f306db8200e");
			Statement stmt=con.createStatement(); 
			String sql = "insert into customers(custPwd, custPhoneNum, custEmail, custUsername) values('"+custPwd+"','"+custPhoneNum+"','"+custEmail+"','"+custUsername+"')";
		
			int x = stmt.executeUpdate(sql);
			
			if(x>0){%>
				<script>alert("Successfully Updated");</script>
			<%}else{%>
				<script>alert("Failed");</script>
			<%}
			con.close();
                        
		}catch(Exception e){
			out.println(e);
		}
        %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    	<title>Profile Edited</title>
         <link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
           <div class="container">
               <%  
                                Connection con;
                                PreparedStatement pst;
                                ResultSet rs;
        
                                Class.forName("com.mysql.jdbc.Driver");
                                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/tiedye","root","");
                                
                                  String query = "select * from customers";
                                  Statement st = con.createStatement();
                                  
                                    rs =  st.executeQuery(query);
                                    
                                        if(rs.next())
                                        {
                                            String id = rs.getString("custID");
                                   %>
                                   <div class="title" style="text-align: center;">Updated Profile
                                           </div><br><br>
                                          <div class="input-box" style="text-align: center;">
                                               <br><br><span>Password</span>
                                               <br><%=rs.getString("custPwd") %>
                                               <br><br><span>Phone Number</span>
                                               <br><%=rs.getString("custPhoneNum") %>
                                               <br><br><span>Email</span>
                                               <br><%=rs.getString("custEmail") %>
                                               <br><br><span>Username</span>
                                               <br><%=rs.getString("custUsername") %>
                                         </div>
                                      <div class="input-box button" align="center">
                                        <a  href="homepage.jsp">
                                            <br><br><input type="button" value="Homepage" style=color:white>
                                        </a>
                                        </div>  
             </div>                             
                              <% 
                                 }
                               %> 
        </div>

      </body>
</html>