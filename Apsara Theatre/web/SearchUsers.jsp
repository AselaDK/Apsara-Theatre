<%-- 
    Document   : SearchUsers
    Created on : Aug 19, 2017, 7:06:47 AM
    Author     : Asela
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search Users</title>
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
        <%!String cfname,cid,py,vr; Connection cn ;Statement st; ResultSet rs;
 %>

   <center><div class="container">
   <h1>Search User</h1>
        <h3>Search by User name..</h3>
        <form action ="SearchUsers.jsp" method="get" >
           <input type="text" name="Name" required placeholder="Enter User Name Here"><br><br>
           <input type ="submit" name="susr" value="Search_User">
</form>
        
               <font color="white"> <table border = "2">
      <thead>
        <tr>
            <th>NIC</th>
            <th>First Name</th>
            <th>Last Name</th>
            <th>DOB</th>
            <th>Email</th>
            <th>Mobile</th>
            <th>Status</th>
        </tr>
    </thead>
 
   
        






        
        
        
        
        <% 
             cfname=request.getParameter("Name");
             vr=request.getParameter("sbmt");


             
try{              
             Class.forName("com.mysql.jdbc.Driver");
             String dbpath="jdbc:mysql://localhost/BookMe";
             cn=DriverManager.getConnection(dbpath,"root","");
             st=cn.createStatement();
 


{
                rs = st.executeQuery("SELECT * FROM client where cfname='"+cfname+"'");
String tblcid,tblcfname,tblclname,tblcdob,tblcemail,tblcmob,tblsts;
    
 while (rs.next()) {
                tblcid=rs.getString(1);
                 tblcfname=rs.getString(2);
                 tblclname=rs.getString(3);
                 tblcdob=rs.getString(4);
                 tblcemail=rs.getString(5);
                 tblcmob=rs.getString(6);
                 tblsts=rs.getString(8);


if(cfname.equals(tblcfname)){ %>
  <tr>
    <td><h4><%out.println(rs.getString("cid")); %></h4></td>
         <td><h4><%out.println(rs.getString("cfname")); %></h4></td>
         <td><h4><%out.println(rs.getString("csname")); %></h4></td>
         <td><h4><%out.println(rs.getString("cdob")); %></h4></td>
         <td><h4><%out.println(rs.getString("cemail")); %></h4></td>
         <td><h4><%out.println(rs.getString("cmob")); %></h4></td>
         <td><h4><%out.println(rs.getString("Status")); %></h4></td>
    </tr>
               </table>
 </font>
<%}
else{
                         %> <script>
                             window.alert("This data does not exist !");
                   </script>
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





rs.close();
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
