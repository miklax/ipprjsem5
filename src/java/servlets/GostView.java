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
public class GostView extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        HttpSession sesija = request.getSession();

        Connection con = null;
        Statement st = null;
        ResultSet rs = null;

        String adresa = "gost.jsp";
        String poruka = "Gost mod";

        //uzima vrednosti iz pretrage samo ako nije prazno 
        String pretragaNaziv = request.getParameter("naziv");
        if (pretragaNaziv == null) {
            pretragaNaziv = "";
        }

        String pretragaMesto = request.getParameter("mesto");
        if (pretragaMesto == null) {
            pretragaMesto = "";
        }

        String datumOd = request.getParameter("datumod");
        if (datumOd == null) {
            datumOd = "2000-01-01";
        }

        String datumDo = request.getParameter("datumDo");
        if (datumDo == null) {
            datumDo = "2100-01-01";
        }

        try {

            con = DB.getInstance().getConnection();
            st = con.createStatement();
            String upit = "select d.naziv_dogadjaja, d.vreme_dogadjaja, m.naziv_lokacije "
                    + "from dogadjaj as d, mesto as m "
                    + "where d.id_lokacija=m.id_lokacija "
                    + "and d.naziv_dogadjaja like '%" + pretragaNaziv + "%' "
                    + "and m.naziv_lokacije like '%" + pretragaMesto + "%' "
                    + "and d.vreme_dogadjaja between '" + datumOd + " 11:30:45' and '" + datumDo + " 00:00:00' ";

            String rezultat = "";

            rezultat = "<table class='tabela-view'><tr><th>Naziv dogadjaja</th><th>Datum i vreme</th><th>Lokacija</th></tr>";
            rs = st.executeQuery(upit);
            while (rs.next()) {
                String nazivdog = rs.getString(1);
                Timestamp datumvreme = rs.getTimestamp(2);
                String lokacija = rs.getString(3);

                rezultat += ("<tr><td>" + nazivdog + "</td><td>" + datumvreme + "</td><td>" + lokacija + "</td></tr>");
            }

            rezultat += "</table>";

            st.close();

            request.setAttribute("poruka", poruka);
            request.setAttribute("rezultat", rezultat);
            request.setAttribute("pretragaMesto", pretragaMesto);
            request.setAttribute("pretragaNaziv", pretragaNaziv);
            request.setAttribute("datumOd", datumOd);
            request.setAttribute("datumDo", datumDo);

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
