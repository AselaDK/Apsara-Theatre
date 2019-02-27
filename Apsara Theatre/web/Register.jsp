<%-- 
    Document   : Register
    Created on : Aug 10, 2017, 11:50:26 AM
    Author     : Asela
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register</title>
    </head>
    <body>
        <h1><%@page import="java.sql.*"%>
        <%!int cnic,cmob; String cfn,cln,cemail,cdob,cpw,ccpw; Connection cn ;Statement st;ResultSet rs;
        %>
        <%
             
            cnic=Integer.parseInt(request.getParameter("txtcnic"));
             cfn=request.getParameter("txtcfn");
             cln=request.getParameter("txtcln");
             cdob=request.getParameter("txtcdob");
             cemail=request.getParameter("txtcemail");
             cpw=request.getParameter("txtcpw");
             ccpw=request.getParameter("txtccpw");
             cmob=Integer.parseInt(request.getParameter("txtcmob"));
             

             
        try{     
             Class.forName("com.mysql.jdbc.Driver");
             String dbpath="jdbc:mysql://localhost/BookMe";
             cn=DriverManager.getConnection(dbpath,"root","");
             st=cn.createStatement();
            
        } 
        catch(ClassNotFoundException e)
        {
            out.println(e.getMessage());
        }
        catch(SQLException e)
        {
            out.println(e.getMessage());
        }
        
             if(cpw.equals(ccpw))
             {
               st.executeUpdate 
        ("insert into Client(cid,cfname,csname,cdob,cemail,cmob,cpw,status) "
                + "values('"+cnic+"','"+cfn+"','"+cln+"','"+cdob+"','"+cemail+"','"+cmob+"','"+cpw+"','user')");
               //out.println("Successfully Registered ! ");
               response.sendRedirect("BookMe.jsp");
  
                          session.setAttribute("myname",cfn);
                          session.setAttribute("cid",cnic);
                          
             }
             else
             {
             o<%-- 
    Document   : Register
    Created on : Aug 10, 2017, 11:50:26 AM
    Author     : Asela
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register</title>
    </head>
    <body>
        <h1><%@page import="java.sql.*"%>
        <%!int cnic,cmob; String cfn,cln,city; Connection cn ;Statement st;
        %>
        <%            
            
             cfn=request.getParameter("fname");
             cln=request.getParameter("lname");
             city=request.getParameter("city");
                          
        try{     
             Class.forName("com.mysql.jdbc.Driver");
             String dbpath="jdbc:mysql://localhost/BookMe";
             cn=DriverManager.getConnection(dbpath,"root","");
             st=cn.createStatement();
            
        } 
        catch(ClassNotFoundException e)
        {
            out.println(e.getMessage());
        }
        catch(SQLException e)
        {
            out.println(e.getMessage());
        }
        
             
             
               st.executeUpdate 
        ("insert into member(cfname,clname,city) "
                + "values('"+cfn+"','"+cln+"','"+city+"')");
               //out.println("Successfully Registered ! ");
               response.sendRedirect("BookMe.jsp");
  
                     
                          
  
             
        %>
        <h2 align="center"> <a href="Home.html" ><h3>Home</h3></a></h2>
        </h1>
                 
    </body>
</html>
out.println("<h2 align=center>Password Mismatched!</h2>");
             }
             
        %>
        <h2 align="center"> <a href="Home.html" ><h3>Home</h3></a></h2>
        </h1>
                 
    </body>
</html>
