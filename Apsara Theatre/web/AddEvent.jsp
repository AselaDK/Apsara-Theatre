<%-- 
    Document   : GetEvent
    Created on : Aug 11, 2017, 11:41:08 AM
    Author     : Asela
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Event</title>
                <style>
                body
{
    background-image:url(bgimage.jpg);
 
 }
 header {background: black;color:#ffcc66;}
  div.container {
     
    width: auto;
    background-color: #cc0000
}

footer {background: #aaa;color:white;}

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
        
        <div class="container">
            
            <script>function success()
                {
                    window.alert("Successfully Submitted !")
                }
            </script>
            
            <font style="color:white"><h1 align="center"><b><u>Add Events Here..</u></b></h1><br></font>
    <form   action="AddEvent.jsp" method="post"  >
        <mark><h3 align="center">
             Name<br><input type="text" name="txtname" required ><br>
             Date<br><input type="text" name="date" required placeholder="yyyy-MM-dd"><br>
             Venue<br><input type="text" name="vnu" required ><br>
             Start Time<br><input type="text" name="sttime" required placeholder="hh.mm"><br>
             End Time<br><input type="text" name="endtime" required placeholder="hh.mm" ><br>
             Genre <br>
                <select name="genre">
                 <option value="Musical Show(Indoor)">Musical Show(Indoor)</option>
                 <option value="Musical Show(Outdoor)">Musical Show(Outdoor)</option>
                 <option value="Stage Drame">Stage Drama</option>
                 <option value="Fashion Show">Fashion Show</option>
                 <option value="Beauty Pagent">Beauty Pageant</option>
                 <option value="Ceremony">Ceremony</option>
                 <option value="Carnival">Carnival</option>
                 <option value="Other">Other</option>
                 </select>
             <br>
             
             Description<br><input type="text" name="txtdesc" required ><br><br>
             
             <input type="radio" name="payment" value="p">Paid
             <input type="radio" name="payment" value="np">Not Paid<br><br>
            
             Paid Amount<br>Rs.<input type="text" name="pamount" required ><br><br>
            
           <!--    <input type="file" name="file" size="100" /><br><br><br>-->
             
           <input type="submit" name="btnSbmt" value="Add Event" onclick="success()"><br> 
            
            </h3></mark>           </form></div>

         <br><br><br><br><br><br><br><br><br><br><br><br>
<bottom><footer style="height: 50px"><a href="AboutUs.html" >About Us</a>
    <left>     <a href="ContactUs.html" >Contact Us</a></left>   
    </footer></bottom>      
        
        
        
        
        
        
        
        
        
        <h1>
        <%@page import="java.sql.*"%>
        <%! String name,date,sttime,edtime,gnr,dse,venue,prc,ts,py,pa; Connection cn ;Statement st;
        %>
        <%              
             name=request.getParameter("txtname");
             date=request.getParameter("date");
             venue=request.getParameter("vnu");
             sttime=request.getParameter("sttime");
             edtime=request.getParameter("endtime");
             gnr=request.getParameter("genre");
             dse=request.getParameter("txtdesc");
             py=request.getParameter("payment");
             pa=request.getParameter("pamount");
 
        try{     
             Class.forName("com.mysql.jdbc.Driver");
             String dbpath="jdbc:mysql://localhost/BookMe";
             cn=DriverManager.getConnection(dbpath,"root","");
             st=cn.createStatement();
            // String sqlQuery = "INSERT INTO event('id', 'name', 'date', 'venue', 'sttime', 'endtime', 'genre', 'price', 'desc', 'seats') VALUES (NULL, 'Saga', '2017-08-16', 'Colombo', '12', '23', 'Other', '1000', 'Live in concert', '500');";
           // st.executeUpdate(sqlQuery);
          st.executeUpdate("insert into event(name,date,venue,sttime,endtime,genre,dse,seats,payment,amount) values('"+name+"','"+date+"','"+venue+"','"+sttime+"'+'.00','"+edtime+"'+'.00','"+gnr+"','"+dse+"','1000','"+py+"','"+pa+"')");

               //out.println("Successfully Added Event ! ");
              // response.sendRedirect("Home.jsp");
            
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
        <!--<h2 align="center"> <a href="Home.html" ><h3>Home</h3></a></h2>-->
        </h1>
    </body>
</html>
