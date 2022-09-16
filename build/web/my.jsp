<%-- 
    Document   : my
    Created on : Sep 3, 2022, 3:38:09 PM
    Author     : LENOVO
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.util.logging.Logger"%>
<%@page import="java.util.logging.Level"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.io.PrintWriter"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <style>
        
        #back{
            width:80px;
            height:40px;
            background-color: blue;
            border: 2px solid black;
            border-radius: 3px;
            padding: 2px;
            color: white;
            
            
        }
    </style>
    <body>
        <h1>Your data is :-</h1>
        <% 
            String name=request.getParameter("name");
            String mobile=request.getParameter("mobile");
            String email=request.getParameter("email");
            String massage=request.getParameter("massage");
             //PrintWriter out = response.getWriter(); 
            /* TODO output your page here. You may use following sample code. */
            out.print(name+"  "+mobile+"  "+email+"  "+massage);    
        
        Connection con=null;
        try{
       // Class.forName("com.mysql.jdbc.Driver");
       Class.forName("com.mysql.cj.jdbc.Driver");
        con =DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb","root","1234");
       System.out.println(con);
       System.out.println("Database connection Success ");
        }catch(ClassNotFoundException | SQLException ex){
           // Logger.getLogger(databases.class.getName()).log(Level.SEVERE,null,ex);
        }
        
        
        try (PreparedStatement stmt = con.prepareStatement("INSERT INTO MYDB.cv VALUES(?,?,?,?)")) {
               boolean t=false;
                for(int j=0;j<10;j++){
                    String s=mobile.substring(j,j+1);
                    
                    if( mobile.length()==10 && ("0".equals(s)||"1".equals(s) || "2".equals(s)|| "3".equals(s) || "4".equals(s) || "5".equals(s) || "6".equals(s) ||"7".equals(s)|| "8".equals(s) || "9".equals(s))){
                    t=true;
                    }
                    else{
                    t=false;
                    break;
                    }
                }
               if(t){ stmt.setString(1,name);
                stmt.setString(2,mobile);
                stmt.setString(3,email);
                stmt.setString(4,massage);
            
                
               boolean execute = stmt.execute();
                System.out.println("Insertion completed");
                out.print("<h2>Successfully added..</h2>");
            }
            else{
            out.print("<h2> Not Successfully added..</h2>");
            }
                stmt.close();
                 
            }
            catch (SQLException ex) {
           
       }
       
     
        %>
        <a href="index.html" id="back" >Back</a>
    </body>
</html>
