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
          <div id="sekcije">
            <form action="KorisnikView" method="post" name="forma">
              <table class="tabela-pretraga">
                <tr>
                  <td>Naziv: </td>
                  <td><input type="text" name="nazivk" size="26" value="${pretragaNazivK}" /></td> 
                  <td>Mesto: </td>
                  <td>
                    <select name="mestok">
                      <option value="">Sve lokacije</option>
                      <%
                        Connection con = DB.getInstance().getConnection();
                        Statement stmt = con.createStatement();
                        ResultSet rs = stmt.executeQuery("select id_lokacija, naziv_lokacije from mesto");

                        while (rs.next()) {
                          out.println("<option value='" + rs.getString("naziv_lokacije") + "'>" + rs.getString("naziv_lokacije") + "</option>");
                          
                        }
                      %>
                    </select>
                  </td>


                </tr>
                <tr>
                  <td>Datum od: </td>
                  <td><input type="text" name="datumOdK" value="${datumOdK}" onchange="proveraDatumOd()"></td> 
                  <td>Datum do: </td>
                  <td><input type="text"  name="datumDoK" value="${datumDoK}" onchange="proveraDatumDo()"></td> 
                </tr>
                <tr>

                </tr>
                <tr>
                  <td colspan="4" style="text-align: right"><input type="submit" value="Pretraži"/></td>

                </tr>
              </table>
            </form>
          </div>
        </div>

        <div id="sekcije">
          ${rezultatK}
        </div>
      </div>

      <div id="futer">
        <p>PROJEKAT IZ INTERNET PROGRAMIRANJA<br />
          tema: Prodaja i rezervacija karata<br />
          Student: Mihail Miklasevskij NRTD 4/12<br />
      </div>

    </div>

        <script src="JS/provera.js"></script>
  </body>
</html>
