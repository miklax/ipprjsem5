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

        <title>Blagajnik mod</title>
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
                <a href="Blagajnik">Prodaja karata</a> | 
                <a href="blagajniknovidog.jsp">dodaj novi dogadjaj</a> |
                <a href="blagajnikkarte.jsp">Dodavanje karata za dogadjaje</a> | 
            </div>


            <div id="sadrzaj">
                <div id="informacije">
                  ${poruka}  - radna jedinica: <span style="font-weight: bold; color: maroon">${blagLokacija}</span>, ${mestoBlag} 
                </div>
                
                <div id="pretraga">
                    
                </div>
                
                <div id="sekcije">
                    ${tabela}
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
