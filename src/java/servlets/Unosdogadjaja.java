package servlets;

import database.DB;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author mikla
 */
public class Unosdogadjaja extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        //pokupi podatke iz forme, unesi SQL u Dogadjaje, prosledi foreign key 
        //tabeli karte da bi povezao karte i dogadjaje
        HttpSession sesija = request.getSession();

        String nazivdog = request.getParameter("nazivdog");
        String datum = request.getParameter("datumdog");
        String vreme = request.getParameter("vremedog");
        String lokacija = request.getParameter("mestodog");
        int id_lokacija;

        String adresa = "blagajniknovidog.jsp";

        Connection con = null;
        Statement st = null;
        ResultSet rs = null;

        //Dohvati ID LOKACIJE
        try {
            con = DB.getInstance().getConnection();
            st = con.createStatement();
            String upit = "SELECT id_lokacija FROM mesto WHERE naziv_lokacije='" + lokacija + "';";

            rs = st.executeQuery(upit);
            if (rs.next()) {
                id_lokacija = rs.getInt(1);

                //Commit u bazu
                String upitUpdate = "INSERT INTO dogadjaj(naziv_dogadjaja, vreme_dogadjaja, id_lokacija) "
                        + "VALUES ('" + nazivdog + "', '" + datum + " " + vreme + "', " + id_lokacija + ")";
                st.executeUpdate(upitUpdate);
            }

        } catch (SQLException greska) {
            sesija.invalidate();
            request.setAttribute("porukaogresci", "Greska: " + greska);
            adresa = "greska.jsp";
        } finally {
            DB.getInstance().putConnection(con);
        }

        RequestDispatcher rd = request.getRequestDispatcher(adresa);
        rd.forward(request, response);

    }
}
