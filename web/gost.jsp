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

    <title>Gost mod</title>
  </head>
  <body>
    <div id="kontejner">

      <div id="baner">
        <div id="logo">
          IP Projekat - Prodaja i rezervacija karata
        </div>

        <div id="userid">
          Korisnik:
          ${(ulogovanikor!=null)?ulogovanikor:"Gost"}
          <br />
          <a href="index.jsp">Ulogujte se</a>
        </div>

      </div>

      <div id="meni">
        <a href="index.jsp">Početna strana</a>
      </div>

      <div id="sadrzaj">
        <div id="informacije">
          ${(poruka!=null)?poruka:"Gost mod"}
        </div>

        <div id="pretraga">
          <div id="sekcije">
            <form action="GostView" method="get">
              <table class="tabela-pretraga">
                <tr>
                  <td>Naziv: </td>
                  <td><input type="text" name="naziv" size="26" value="${pretragaNaziv}" /></td> 
                  <td>Mesto: </td>
                  <td>
                    <select name="mesto">
                      <option value="">Sve lokacije</option>
                      <%
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/nrtd412", "root", "");
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
                  <td><input type="text" name="datumod" value="${datumOd}"></td> 
                  <td>Datum do: </td>
                  <td><input type="text"  name="datumdo" value="${datumDo}"></td> 
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
          ${rezultat}
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
