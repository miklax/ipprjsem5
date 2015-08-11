<%-- 

    Author     : Mihail
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="CSS/glavnistilovi.css" rel="stylesheet" type="text/css" />
    <link href='http://fonts.googleapis.com/css?family=Roboto' rel='stylesheet' type='text/css'>

    <title>Promena lozinke</title>
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
          <a href="Logout">Izlogujte se</a>
        </div>

      </div>

      <div id="meni">
        
      </div>

      <div id="sadrzaj">
        <div id="informacije">
          ${(poruka!=null)?poruka:"Promena lozinke:"}
        </div>

        <div id="pretraga">
          <form action="PromenaLozinke" method="post">
            <table class="tabela-pretraga">
              <tr><td>Nova lozinka</td><td><input type="password" size="20" name="lozinka1"/></td></tr>
              <tr><td>Ponovite lozinku</td><td><input type="password" size="20" name="lozinka2"/></td></tr>
              <tr><td colspan="2"><input type="submit" value="Promenite lozinku" /> </td></tr>
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
