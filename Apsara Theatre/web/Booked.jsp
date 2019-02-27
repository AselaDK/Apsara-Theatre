<%-- 
    Document   : Booked
    Created on : Aug 14, 2017, 4:05:29 PM
    Author     : Asela
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Booked</title>
 
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
                
        <%! String cid,name,mob; Connection cn ;Statement st;ResultSet rs;
        %>
        <%
             name=request.getParameter("name");
             cid=request.getParameter("txtcid");
             mob=request.getParameter("txtmob");
             
        try{     
             Class.forName("com.mysql.jdbc.Driver");
             String dbpath="jdbc:mysql://localhost/BookMe";
             cn=DriverManager.getConnection(dbpath,"root","");
             st=cn.createStatement();
           rs=st.executeQuery("select count(*) from Book where name='"+name+"' ");
                   
                 rs.last();
                 int count=rs.getRow();
                 rs.beforeFirst();
                       

             
            
            
             
          
               
                  
                 
       while(rs.next())         
       {   
          

                 if(count<1000)
              { st.executeUpdate ("insert into Book(name,cid,mob) values('"+name+"','"+cid+"','"+mob+"')");
               //out.println("Successfully Registered ! ");
               response.sendRedirect("Booked.html");
             
              }
             
            
               else
                 {  
                        %><script>
                             window.alert("Sorry! Tickets are out! ");
                   </script>         
                             
          <%}         
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
    </body>
</html>
