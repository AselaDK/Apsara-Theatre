<%-- 
    Document   : Log-in
    Created on : Aug 10, 2017, 3:03:03 PM
    Author     : Asela
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Log-in</title>
    </head>
    <body>
        <h1>
            <%@page import="java.sql.*"%>
        <%!String cid,cpw,nm; Connection cn ;Statement st; ResultSet rs;
        %>
        <% 
             cid=request.getParameter("txtcid");
             cpw=request.getParameter("txtcpw");
             
             try{     
             Class.forName("com.mysql.jdbc.Driver");
             String dbpath="jdbc:mysql://localhost/BookMe";
             cn=DriverManager.getConnection(dbpath,"root","");
             st=cn.createStatement();
             
             rs=st.executeQuery("select * from Client");
             String tblcpw,tblsts,tblcname,tblevnt,tblcid;
             while(rs.next())
             {
                 
                 tblcname=rs.getString("cfname");
                 tblcid=rs.getString(1);
                 tblcpw=rs.getString(7);
                 tblsts=rs.getString(8);
                 
                              
                 
                 if(cid.equals(tblcid) )
                 {
                      if(cpw.equals(tblcpw))
                     {
                         if(tblsts.equals("admin"))
                         {
                             response.sendRedirect("Admin.html");
                            
                         }
                         else
                         { 
                         response.sendRedirect("BookMe.jsp");
                         session.setAttribute("cid", cid);
                         while(rs.next())
                         {
                         rs=st.executeQuery("select cfname from Client where cid='"+cid+"'");
                          session.setAttribute("myname", tblcname);
                          
                         rs=st.executeQuery("select * from Book where cid='"+cid+"'");
                         tblevnt=rs.getString(1);
                         session.setAttribute("myevents", tblevnt);  
                         }

                           //st.executeQuery("select cid from Client where cemail='"+cemail+"'");
                           //tblcid=rs.getString(1);
                           
                   //        while(rs.next())
                  //         {
                   //        rs=st.executeQuery("select name from Book where cid='"+tblcid+"'");
               //                             tblevnt=rs.getString("name");
                 //         session.setAttribute("myevents", tblevnt);  
                 //          }
                         }
                     }
                     
                 }
               else
                 {
                          %> <script>
                             window.alert("Wrong email or password !");
                   </script>        
                             
          <%//response.sendRedirect("Log-in.html");
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
        </h1>
    </body>
</html>
