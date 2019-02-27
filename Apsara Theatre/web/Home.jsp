<%-- 
    Document   : Events
    Created on : Aug 11, 2017, 5:34:13 PM
    Author     : Asela
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User</title>
                <style type="text/css">
body
{
    background-image:url(bgimage.jpg),url(index.jpg);
    height: 5px;
    background-position: top,inherit;
    background-repeat: no-repeat,repeat;
size: landscape;

 }
 header {background: black;color:#ffcc66;}
 div.container {
     align-content: space-around;
     height: auto;
    width: 70%;
    background-color: #cc0000;
}
footer {background: #aaa;color:white; text-align: center; height:50px;}

</style>
    </head>
        <body>
                    
        <header><center><font  size="500"><b>Apsara Theatre</b></font>
                          <h5 align="center">Lotus Rd,Colombo 7.</h5>
                          <h4 align="right" ><a href="Home.jsp" style="color:#ffff99">Home  |</a>
                                                            <a href="Log-in.html" style="color:#ffff99">Log-in  |</a>
                                                            <a href="Register.html" style="color:#ffff99">Register </a>                          
                          </h4>
        </header>
            
                    
        <h1><font color="yellow">Wellcome to Apsara Theatre !</font></h1>
            <h2><font color="white" align="left">
        The Apsara Theatre is a fully equipped sate of the art performance centre, 
        meant for large scale theatrical productions. The theatre consists of two venues for performances,
        which includes the main auditorium and an Open Air Amphitheater.<br>

        Situated in the heart of Colombo city, this modern architectural masterpiece
        facilitates easy access for both local and foreign producers. The Theatre is also 
        surrounded by several five Star Hotels and other commercial establishments.
        </font></h2>
                           
        <h1><font color="orange">
            <ul>
                <li></li>1000 Seats..
                <li></li>Lobby..
                <li></li>Garden..
                <li></li>Studio..
                <li></li>Best Facilities and Latest Technology..            
            </ul></font></h1>     
       
         <!--      
        <center> <a  href="Log-in.html" ><img   src="login.jpg" width="200" height="70"/><br><br><br><br><br>
         <a href="Register.html"><img  src="reg.jpg" width="200" height="70"/></a></center>
        -->
 
  <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
  <center> <div class="container">   


            
            <h4>
                <%@page import="java.util.Date"%>
                <%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.*"%>
        <%! Connection cn ;Statement st; ResultSet rs; %>
 
        <h1 align="center"><mark><b>...Upcoming Events...</mark></b></h1>
        
        <% 
         
   
try{              
             Class.forName("com.mysql.jdbc.Driver");
             String dbpath="jdbc:mysql://localhost/BookMe";
             cn=DriverManager.getConnection(dbpath,"root","");
             st=cn.createStatement();
             rs = st.executeQuery("SELECT * FROM event ");
String tblname,tbldate,tblsttime,tblid ;

 while (rs.next()) 
 {  
                 tblname=rs.getString(2);
                 tbldate=rs.getString(3);
                 tblsttime=rs.getString(5);
                  
                 
                
                 SimpleDateFormat df=new SimpleDateFormat("yyyy-MM-dd");
                  Date now=new Date();
                // String date=String.valueOf(df.format(now));
               
                
                 Date edate=df.parse(tbldate);
                 
                 
            // out.println(tbldate);
               // out.println(date);
                 
if(edate.after(now))
{         
    %> 
 
    <form action =" Log-in.html" method="get" style="border-style:solid" style="border-color: blue" >
    
   
 
        <h1 align="center"><font color="yellow"><%out.println(rs.getString(2)); %></font></h1>
         <h4 align="center"> on  <%out.println(rs.getString(3)); %> </h4>
           <h4 align="center"> @   <%out.println( rs.getString(5)); %> onwards</h4>
                     <%//session.setAttribute("id", tblid); %>
     
           
<h4 align="center"> <input type ="submit" value="BookMe"></h4>
     </form><br><br>
     <br>

     
     
 
     
         
     <% 
  
 
         
         
         
             } 
 
             }}
       catch(ClassNotFoundException e)
        {
            out.println(e.getMessage());
        }
        catch(SQLException e)
        {
            out.println(e.getMessage());
        }
cn.close();
%>
<br>


 </div>
</center>
             
             
               
  
            
 

</h4>
    <bottom><footer><a href="AboutUs.html" >About Us</a>
    <center>     <a href="ContactUs.html" >Contact Us</a></center>   
        </footer></bottom>
    </body>
</html>
