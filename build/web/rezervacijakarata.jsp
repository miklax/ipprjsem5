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

    <title>Korisnicki mod</title>
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
        <a href="index.jsp">Početna strana</a> | <a href="#">Pregled rezervisanih karti</a> 
      </div>

      <div id="sadrzaj">
        <div id="informacije">
          ${(poruka!=null)?poruka:"Korisnički mod"}
        </div>

        <div id="pretraga">
          <form action="RezervacijaSave" method="get">
            <table class="tabela-pretraga">
              <tr><td>Korisnik:</td><td><input type="text" size="20" name="id_korisnika" value="${korisnik.username}"/></td></tr>
              <tr><td>Tip karata:</td><td>
                  <select name="id_karte_dogadjaja">
                    
                    <%
                      Connection con = DB.getInstance().getConnection();
                      Statement stmt = con.createStatement();
                      int id_param = Integer.parseInt(request.getParameter("id_param"));
                      ResultSet rs = stmt.executeQuery("select id_karte_dogadjaja, tip_karata from tip_karte_dogadjaja where id_dogadjaja="+id_param+";");
                      while (rs.next()) {
                        out.println("<option value='" + rs.getInt("id_karte_dogadjaja") + "'>" + rs.getString("tip_karata") + "</option>");

                      }
                    %>
                  </select>
                </td></tr>
              <tr><td>Kolicina karata:</td><td><input type="text" size="20" name="brojkarata" /></td></tr>
              <tr><td colspan="2"><input type="submit" value="Upisi rezervaciju" /></td></tr>

            </table>
          </form>
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
