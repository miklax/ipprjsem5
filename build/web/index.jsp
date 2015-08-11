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

        <title>Prodaja i rezarvacija karata</title>
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
                    <a href="#">Ulogujte se</a>
                </div>

            </div>

            <div id="meni">
                <a href="#">Pocetna strana</a>
            </div>

            <div id="sadrzaj">
                <div id="informacije">
                    ${(poruka!=null)?poruka:"Dobrodosli, ulogujte se ili kliknite na 'Pristupite kao Gost'"}
                </div>



                <div id="sekcije">
                    <form action="Login" method="post">
                        <table class="tabela-login">
                            <tr>
                                <td>Korisnicko ime: </td>
                                <td><input type="text" name="username" size="20" value="${korisnik.username}" /></td> 
                            </tr>
                            <tr>
                                <td>Lozinka</td>
                                <td><input type="password" name="password" size="20" /></td> 
                            </tr>
                            <tr>
                                <td colspan="2" style="text-align: right"><input type="submit" value="Uloguj se"/></td>
                            </tr>
                            <tr>
                                <td colspan="2" style="text-align: right"><a href="<%=request.getContextPath()%>/GostView">Pristupite kao GOST</a> | <a href="registracija.jsp">Registrujte se</a> </td>
                            </tr>
                        </table>
                    </form>
                            
                </div>
            </div>

            <div id="futer">
                <p>PROJEKAT IZ INTERNET PROGRAMIRANJA | tema: Prodaja i rezervacija karata | Student: Mihail Miklasevskij NRTD 4/12<br />
            </div>

        </div>
    </body>
</html>
