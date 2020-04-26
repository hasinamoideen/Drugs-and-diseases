<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>login validation</title>
    </head>
    <body>
        <%@page import="java.sql.*"%>
        <%
          try
          {
              Class.forName("com.mysql.jdbc.Driver");
              Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/drugs_and_diseases","root","");
              
              PreparedStatement ps = con.prepareStatement("select * from users");
              
              ResultSet rs = ps.executeQuery();
              String username = request.getParameter("username");
              String password = request.getParameter("password");
              
              if(username.equals("hasinamoideen@gmail.com") && password.equals("hasi29yuvi"))
                   response.sendRedirect("add.jsp");
              while(rs.next())
              {
                  
                  if(rs.getString(1).equals(username) && rs.getString(2).equals(password))
                  {
                      session.setAttribute("username",username);
                      session.setAttribute("password",password);
                      response.sendRedirect("search.jsp");
                  }
              }
              response.sendRedirect("index.jsp");
          }
          catch(Exception e)
          {
              
          }
            
        %>
    </body>
</html>
