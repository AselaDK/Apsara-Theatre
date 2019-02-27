<%-- 
    Document   : BookMe
    Created on : Aug 13, 2017, 9:28:39 PM
    Author     : Asela
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>BookMe!</title>
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
        
        <%@page import="java.sql.*"%>
                
        <%! String cid,name,mob; Connection cn ;Statement st;ResultSet rs1;
        %>
        <%  name=request.getParameter("name");
               cid=request.getParameter("cid");
               mob=request.getParameter("txtmob");
                  
             
             
        try{     
             Class.forName("com.mysql.jdbc.Driver");
             String dbpath="jdbc:mysql://localhost/BookMe";
             cn=DriverManager.getConnection(dbpath,"root","");
             st=cn.createStatement();
  
        %>
        <h1><b><font style="color:yellow"><center>
                Hi__<%=session.getAttribute("myname")%>__!
                </center></font></b></h1>       
        
        
        <%
                    
                     %><h1><b><font style="color:yellow"><center>
                Your events<br><%=session.getAttribute("myevents")%>
                </center></font></b></h1><%
             
                {    
                    rs1=st.executeQuery("select * from event");

             %>
    <center><div class="container">
             <h1 align='center'>Book your event here...</h1>
             
        <form  action="Booked.jsp" method="post">
            <h3 align="center"> <!--Event <br><input type="text" name="txtname" required placeholder="Select Your Event"><br><br-->
                <select name="name">
                    <% 
                    while(rs1.next()){ 
                    
                    %><option><%=rs1.getString(2)%>
                    </option>
                   <% }%>
                </select> <br><br>
                
            NIC:<br><%=session.getAttribute("cid")%> <br><br>
            Mobile:<br><input type="text" name="txtmob" required placeholder="Enter your mobile number"><br><br>
            <input type="submit" name="btnSbmt" value="BookMe!">
            </h3>
        </form>
            <mark><a href="DeleteBook.jsp" >Delete</a>Your Book Here..</mark>
        </div></center>
             <% 
                         
          {
               
                  
                  
      while(rs1.next())          {   
           rs1=st.executeQuery("select count(*) from Book where name='"+name+"' ");
              //String tblsts;
                 rs1.last();
                 int count=rs1.getRow();
                 rs1.beforeFirst();
           
                 if(count<1000)
              { 
                  st.executeUpdate ("insert into Book(name,cid,mob) values('"+name+"','"+cid+"','"+mob+"')");
               //out.println("Successfully Registered ! ");
               response.sendRedirect("Booked.html");
             
              }
             
            
               else
                 {  
                        %> <script>
                             window.alert("Sorry!   We are full...");
                   </script>         
                             
          <%  }         
}   
            
                
             
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
        
             

       %>
           <bottom><footer><a href="AboutUs.html" >About Us</a>
    <left>     <a href="ContactUs.html" >Contact Us</a></left>   
        </footer></bottom>
    
    </body>
</html>
