<%-- 

    Author     : Mihail
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="CSS/glavnistilovi.css" rel="stylesheet" type="text/css" />
    <link href='http://fonts.googleapis.com/css?family=Roboto' rel='stylesheet' type='text/css'>

    <title>Dogadjaj info</title>
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

          <!-- TODO nemoj da zaboravis linkove -->
          <a href="promenalozinke.jsp">Promenite sifru</a> | <a href="Logout">Izlogujte se</a>
        </div>

      </div>

      <div id="meni">
        <a href="index.jsp">Početna strana</a> | <a href="#">Pregled rezervisanih karti</a> 
      </div>

      <div id="sadrzaj">
        <div id="informacije">
          ${(poruka!=null)?poruka:"Korisnički mod"} - Detaljan pregled dogadjaja
        </div>

        <div id="pretraga">
          <div id="sekcije">

            <%
              Class.forName("com.mysql.jdbc.Driver");
              Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/nrtd412", "root", "");
              Statement stmt = con.createStatement();
              ResultSet rs = null;
              String upit;

              int id_dog = Integer.parseInt(request.getParameter("id_param"));
              upit = "SELECT d.id_dogadjaj, d.naziv_dogadjaja, d.vreme_dogadjaja, m.naziv_lokacije, m.adresa, m.mesto "
                      + "FROM dogadjaj as d, mesto as m "
                      + "where d.id_lokacija=m.id_lokacija AND d.id_dogadjaj=" + id_dog;

              rs = stmt.executeQuery(upit);

              if (rs.next()) {
                String naziv_dog = rs.getString(2);
                Timestamp vreme_dog = rs.getTimestamp(3);
                String lokacija = rs.getString(4);
                String adresa = rs.getString(5);
                String mesto = rs.getString(6);

                out.println("<table>"
                        + "<tr><td>Redni broj dogadjaja: </td><td>" + id_dog + "</td></tr>"
                        + "<tr><td>Naziv dogadjaja: </td><td>" + naziv_dog + "</td></tr>"
                        + "<tr><td>Datum i vreme: </td><td>" + vreme_dog + "</td></tr>"
                        + "<tr><td>Lokacija: </td><td>" + lokacija + "</td></tr>"
                        + "<tr><td>Adresa: </td><td>" + adresa + "</td></tr>"
                        + "<tr><td>Mesto: </td><td>" + mesto + "</td></tr>"
                        + "</table>");
              }
            %>


          </div>
        </div>

        <div id="sekcije">

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
