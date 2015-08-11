package servlets;

import beans.Korisnik;
import database.DB;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.*;
import java.sql.*;

/**
 *
 * @author Mihail
 */
public class Login extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        Korisnik kor = new Korisnik();
        kor.setUsername(username);
        kor.setPassword(password);

        //Kreira novu sesiju za ceo app - ako nema kreira novu
        HttpSession sesija = request.getSession();
        sesija.setAttribute("korisnik", kor); //u sesiju kreiramo korisnik var

        String poruka = "";

        if (username.isEmpty() || password.isEmpty()) {
            poruka = "Niste popunili sva polja";
            request.setAttribute("poruka", poruka); //nova varijabla u sesiji poruka
            RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
            rd.forward(request, response);
        }

        Connection con = null;
        Statement st = null;
        ResultSet rs = null;
        String adresa = "index.jsp";
        
        try {

            con = DB.getInstance().getConnection();
            st = con.createStatement();
            String upit = "SELECT * FROM korisnik WHERE username='" + username + "' AND password='" + password + "'";

            
            rs = st.executeQuery(upit);
            if (rs.next()) {
                int levelacc = rs.getInt("levelacc");
                int odobren = rs.getInt("odobren");
                
                if(levelacc == 0){
                    adresa = "Admin";
                    poruka = "Administratorski mod";
                    
                } else if(levelacc == 2){
                    adresa = "KorisnikView";
                    poruka = "Korisnicki mod";
                } else if(levelacc == 1){
                    adresa = "Blagajnik";
                    poruka = "Blagajnik mod";
                } else {
                    adresa = "gost.jsp";
                    poruka = "Gost mod - dozvoljen samo pregled";
                }
                
                if(odobren == 0){
                  adresa = "index.jsp";
                  poruka = "Morate sacekati odobrenje od administratora";
                }
 
                st.close();

                request.setAttribute("poruka", poruka);
                request.setAttribute("ulogovanikor", username);
            } else {
                poruka = "Neispravno korisnicko ime ili lozinka";
                request.setAttribute("poruka", poruka);
                kor.setPassword("");
                adresa = "index.jsp";
                st.close();
            }

        } catch (SQLException greska) {
            sesija.invalidate();
            request.setAttribute("porukaogresci", "Greska: " + greska);
            adresa = "greska.jsp";
        } finally {
            DB.getInstance().putConnection(con);
        }
        
        sesija.setAttribute("usernames", username);
        RequestDispatcher rd = request.getRequestDispatcher(adresa);
        rd.forward(request, response);
    }

}
