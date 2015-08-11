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

        <title>Registracija korisnika</title>
    </head>
    <body>
        <div id="kontejner">

            <div id="baner">
                <div id="logo">
                    IP Projekat - Prodaja i rezervacija karata
                </div>

                <div id="userid">
                    Korisnik:
                    Novi korisnik
                    <br />
                    <a href="index.jsp">Ulogujte se</a>
                </div>

            </div>

            <div id="meni">
                
            </div>

            <div id="sadrzaj">
                <div id="informacije">
                    Registracija novog korisnika
                </div>
                
                <div id="pretraga">
                  <form action="Registracija" method="post">
                    <table class="tabela-pretraga">
                      <tr><td>Korisnicko ime: </td><td><input type="text" size="20" name="username" /></td></tr>
                      <tr><td>Lozinka: </td><td><input type="password" size="20" name="password" /></td></tr>
                      <tr><td>Ime: </td><td><input type="text" size="20" name="ime" /></td></tr>
                      <tr><td>Prezime: </td><td><input type="text" size="20" name="prezime" /></td></tr>
                      <tr><td>email: </td><td><input type="text" size="20" name="email" /></td></tr>
                      <tr><td colspan="2"><input type="submit" value="Registruj se"</td></tr>
                    </table>
                  </form>
                </div>
                
                <div id="sekcije">
                    *administrator mora da odobri registraciju
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
