<%-- 

    Author     : Mihail
--%>

<%@page import="java.sql.*"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="CSS/glavnistilovi.css" rel="stylesheet" type="text/css" />
    <link href='http://fonts.googleapis.com/css?family=Roboto' rel='stylesheet' type='text/css'>

    <title>Blagajnik mod - dodavanje karata</title>
  </head>
  <body>
    <%!
      Date trenutnoVreme = new Date();
    %>


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
        <a href="Blagajnik">Prodaja karata</a> | 
        <a href="blagajniknovidog.jsp">dodaj novi dogadjaj</a> |
        <a href="blagajnikkarte.jsp">Dodavanje karata za dogadjaje</a> | 
      </div>

      <div id="sadrzaj">
        <div id="informacije">
          ${poruka} - radna jedinica: <span style="font-weight: bold; color: maroon">${blagLokacija}</span>, ${mestoBlag} 
        </div>

        <div id="pretraga">
          <form action="UnosKarata" method="get">
            <table class="tabela-pretraga">
              <tr>
                <td>Izaberite dogadjaj*:</td> 
                <td><select name="mestok">
                    <option value="${tempNazDog}">${tempNazDog}</option>
                    <%
                      Class.forName("com.mysql.jdbc.Driver");
                      Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/nrtd412", "root", "");
                      Statement stmt = con.createStatement();
                      ResultSet rs = stmt.executeQuery("select naziv_dogadjaja, vreme_dogadjaja from dogadjaj");

                      while (rs.next()) {
                        Date vreme = rs.getDate("vreme_dogadjaja");
                        if (trenutnoVreme.compareTo(vreme) < 0) {
                          out.println("<option value='" + rs.getString("naziv_dogadjaja") + "'>" + rs.getString("naziv_dogadjaja") + "</option>");
                        }

                      }
                    %>
                  </select> </td></tr>
              <tr><td>Tip karata: </td>
                <td><input type="text" size="20" name="tipkarata"/></td></tr>
              <tr><td>
                  Raspolozivo karata: </td>
                <td><input type="text" size="20" name="raspolozivok" /></td></tr>
              <tr><td>Ukupno karata:</td>
                <td><input type="text" size="20" name="ukupnok" /> </td></tr>
              <tr><td colspan="2">
                  <input type="submit" value="Upisite karte"/></td></tr>

            </table>
          </form>
        </div>

        <div id="sekcije">
          ${tabelakarte}
          <hr>
          *prikazuje samo dogadjaje koji predhode u padajucoj listi <br/>
          **nakon unosa karte u donjem delu pojavice se tabela sa tipovima karata i brojem karata
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
