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
                    ${poruka}
                </div>
                
                <div id="pretraga">
                    ${tabelausers}
                </div>
                
                <div id="sekcije">
                    *Banovani korisnici su crvenom,a neodobreni zutom bojom oznaceni
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
