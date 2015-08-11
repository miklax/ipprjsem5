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
          ${(poruka!=null)?poruka:"Kreiranje novog naloga"}  
        </div>

        <div id="pretraga">
          <form action="AdminAddUser" method="post">
            <table class="tabela-pretraga">
              <tr><td>Korisnicko ime:</td><td><input type="text" size="20" name="username" value="" /></td></tr>
              <tr><td>Lozinka:</td><td><input type="password" size="20" name="password" /></td></tr>
              <tr><td>Ime:</td><td><input type="text" size="20" name="ime" /></td></tr>
              <tr><td>Prezime</td><td><input type="text" size="20" name="prezime" /></td></tr>
              <tr><td>Email:</td><td><input type="text" size="20" name="email" /></td></tr>

              <tr><td>Lokacija</td><td>
                  <select name="lokacija">
                    <option value="">Sve lokacije</option>
                    <%
                      Connection con = DB.getInstance().getConnection();
                      Statement stmt = con.createStatement();
                      ResultSet rs = stmt.executeQuery("select id_lokacija, naziv_lokacije from mesto");

                      while (rs.next()) {
                        out.println("<option value='" + rs.getString("id_lokacija") + "'>" + rs.getString("naziv_lokacije") + "</option>");

                      }
                    %>
                  </select>
                </td></tr>

              <tr><td>Tip naloga:</td><td>
                  <select name="tipnaloga">
                    <option value="0">admin</option>
                    <option value="1">blagajnik</option>
                    <option value="2">korisnik</option>
                  </select>
                </td></tr>
              <tr><td>Odobren: </td><td>
                  <select name="odobren">
                    <option value="0">Nije odobren</option>
                    <option value="1">Odobren</option>
                  </select>
                </td></tr>
              <tr><td>Nivo ban-a: (0-3)</td><td><input type="text" size="20" name="nivobana" /></td></tr>
              <tr><td colspan="2"><input type="submit" value="Unesi korisnika" /></td></tr>
            </table>
          </form>
        </div>

        <div id="sekcije">
          *Ukoliko su ime i prezime prazni sistem ce izbaciti gresku
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
