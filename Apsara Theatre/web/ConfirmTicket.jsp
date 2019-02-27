<%-- 
    Document   : ConfirmTicket
    Created on : Aug 18, 2017, 11:00:10 PM
    Author     : Asela
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Confirm ID</title>
         <style>
                body
{
    background-image:url(bgimage.jpg);
 
 }
 header {background: black;color:#ffcc66;}
  div.container {
     
    width: 50%;
    background-color: #cc0000
}

footer {background: #aaa;color:white;}

</style>
    </head>
        <body>
                    <header><center><font  size="500"><b>Apsara Theatre</b></font>
                          <h5 align="center">Lotus Rd,Colombo 7.</h5>
                          
        </header>
            
            <h4>
<%@page import="java.sql.*"%>
        <%!String cid,p; Connection cn ;Statement st; ResultSet rs;
 %>

   <center><div class="container">
   <h1>Search User</h1>
        <h3>Search by User name..</h3>
        <form action ="ConfirmTicket.jsp" method="get" >
           <input type="text" name="cid" required placeholder="Enter User ID Here"><br><br>
           <input type ="submit" name="susr" value="Search_User">
</form>
        
               <font color="white"> <table border = "2">
      <thead>
        <tr>
            <th>Event</th>
            <th>NIC</th>
             <th>Mobile</th>
            <th>Payment</th>
        </tr>
    </thead>
 
   <script>function sorry()
                {
                    window.alert("Sorry ! Tickets are out..")
                }
            </script>
        






        
        
        
        
        <% 
             cid=request.getParameter("cid");
              
try{              
             Class.forName("com.mysql.jdbc.Driver");
             String dbpath="jdbc:mysql://localhost/BookMe";
             cn=DriverManager.getConnection(dbpath,"root","");
             st=cn.createStatement();
                rs = st.executeQuery("SELECT * FROM Book where cid='"+cid+"'");
String tblcid,tblevent,tblmob,tblpay;
    


{
 
 while (rs.next()) {
                tblevent=rs.getString(1);
               tblcid=rs.getString(2); 
                 tblmob=rs.getString(3);
                 tblpay=rs.getString(4);

                 

if(cid.equals(tblcid)){ %>
  <tr>
    <td><h4><%out.println(rs.getString(1)); %></h4></td>
         <td><h4><%out.println(rs.getString(2)); %></h4></td>
         <td><h4><%out.println(rs.getString(3)); %></h4></td>
         <td><h4><%out.println(rs.getString(4)); %></h4></td>
 
    </tr>
               </table>
 </font>
 
 
 
 
<%  }
else{
                         %> 
<%}
       


}
}
           
            
 
}
        catch(ClassNotFoundException e)
        {
            out.println(e.getMessage());
        }
        catch(SQLException e)
        {
            out.println(e.getMessage());
        }
        catch(NullPointerException e)
        {
            out.println(e.getMessage());
        }




%>



<br>


 </div>  </center>  

             
             
               
  
            
 

</h4>
         <br><br><br><br><br><br><br><br><br><br><br><br>
   <bottom><footer><center>  <a href="AboutUs.html" >About Us</a>
       <a href="ContactUs.html" >Contact Us</a></center>   
        </footer></bottom>
    </body>
</html>
