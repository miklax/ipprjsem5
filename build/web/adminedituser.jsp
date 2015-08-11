<%-- 

    Author     : Mihail
--%>
<%@page import="java.sql.*"%>
<%@page import="database.DB"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="CSS/glavnistilovi.css" rel="stylesheet" type="text/css" />
    <link href='http://fonts.googleapis.com/css?family=Roboto' rel='stylesheet' type='text/css'>

    <title>Admin mod</title>


    <%!
      int id;
      String username = "";
      String password = "";
      String first_name = "";
      String last_name = "";
      String email = "";
      int id_lokacija;
      int levelacc;
      int odobren;
      int banlevel;
    %>

  </head>
  <body>

    <div id="kontejner">

      <div id="baner">
        <div id="logo">
          IP Projekat - Prodaja i rezervacija karata
        </div>

        <div id="userid">
          Korisnik:
          ${korisnik.username}
          <br />
          <a href="promenalozinke.jsp">Promenite sifru</a> | <a href="Logout">Izlogujte se</a>
        </div>

      </div>

      <div id="meni">
        <a href="Admin">azuriranje korisnika</a> | 
        <a href="adminadduser.jsp">dodaj korisnika</a>
      </div>

      <div id="sadrzaj">
        <div id="informacije">
          ${(poruka!=null)?poruka:"Azuriranje korisnika"}  
        </div>


        <%
          Connection con = DB.getInstance().getConnection();
          Statement stmt = con.createStatement();
          ResultSet rs = stmt.executeQuery("select * from korisnik where id_korisnika = "+request.getParameter("id_param")+"");

          if (rs.next()) {
            id = rs.getInt("id_korisnika");
            username = rs.getString("username");
            password = rs.getString("password");
            first_name = rs.getString("first_name");
            last_name = rs.getString("last_name");
            email = rs.getString("email");
            id_lokacija = rs.getInt("id_lokacija");
            levelacc = rs.getInt("levelacc");
            odobren = rs.getInt("odobren");
            banlevel = rs.getInt("banlevel");

          }
          stmt.close();
        %>




        <div id="pretraga">
          <form action="AdminEditUser" method="post">
            <table class="tabela-pretraga">
              <tr><td>Korisnicko ime:</td><td><input type="text" name="id_korisnika" value="<% out.print(id);  %>" disabled /></td></tr>
              <tr><td>Korisnicko ime:</td><td><input type="text" name="username" value="<% out.print(username); %>" /></td></tr>
              <tr><td>Lozinka:</td><td><input type="text" name="password" value="<% out.print(password); %>" /></td></tr>
              <tr><td>Ime:</td><td><input type="text" name="first_name" value="<% out.print(first_name); %>" /></td></tr>
              <tr><td>Prezime</td><td><input type="text" name="last_name" value="<% out.print(last_name); %>" /></td></tr>
              <tr><td>Email:</td><td><input type="text" name="email" value="<% out.print(email); %>" /></td></tr>
              <tr><td>Lokacija</td><td><input type="text" name="id_lokacija" value="<% out.print(id_lokacija); %>" /></td></tr>
              <tr><td>Tip naloga:</td><td><input type="text" name="levelacc" value="<% out.print(levelacc); %>" /></td></tr>
              <tr><td>Odobren: </td><td><input type="text" name="odobren" value="<% out.print(odobren); %>" /></td></tr>
              <tr><td>Nivo ban-a: (0-3)</td><td><input type="text" name="banlevel" value="<% out.print(banlevel); %>" /></td></tr>
              <tr><td colspan="2"><input type="submit" value="Izmeni korisnika" /></td></tr>
            </table>
          </form>
        </div>

        <div id="sekcije">
          *
        </div>
      </div>

      <div id="futer">
        <p>PROJEKAT IZ INTERNET PROGRAMIRANJA<br />
          tema: Prodaja i rezervacija karata<br />
          Student: Mihail Miklasevskij NRTD 4/12<br />
      </div>

    </div>
  </body>
</html>
