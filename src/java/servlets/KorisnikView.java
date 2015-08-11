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
public class KorisnikView extends HttpServlet {

  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException {
    response.setContentType("text/html;charset=UTF-8");

    HttpSession sesija = request.getSession();

    Connection con = null;
    Statement st = null;
    ResultSet rs = null;

    String adresa = "user.jsp";
    String poruka = "Korisnički mod";

    //uzima vrednosti iz pretrage samo ako nije prazno 
    String pretragaNazivK = request.getParameter("nazivk");
    if (pretragaNazivK == null) {
      pretragaNazivK = "";
    }

    String pretragaMestoK = request.getParameter("mestok");
    if (pretragaMestoK == null) {
      pretragaMestoK = "";
    }

    String datumOdK = request.getParameter("datumOdK");
    if (datumOdK == null) {
      datumOdK = "2000-01-01";
    }

    String datumDoK = request.getParameter("datumDoK");
    if (datumDoK == null) {
      datumDoK = "2020-01-01";
    }

    try {

      con = DB.getInstance().getConnection();
      st = con.createStatement();
      String upit = "select d.naziv_dogadjaja, d.vreme_dogadjaja, m.naziv_lokacije, id_dogadjaj "
              + "from dogadjaj as d, mesto as m "
              + "where d.id_lokacija=m.id_lokacija "
              + "and d.naziv_dogadjaja like '%" + pretragaNazivK + "%' "
              + "and m.naziv_lokacije like '%" + pretragaMestoK + "%' "
              + "and d.vreme_dogadjaja between '" + datumOdK + " 11:30:45' and '" + datumDoK + " 00:00:00' ";

      String rezultatK = "";
      java.util.Date trenutnoVreme = new java.util.Date();

      rezultatK = "<table class='tabela-view'><tr><th>Naziv dogadjaja</th><th>Datum i vreme</th><th>Lokacija</th><th>Vise detalja</th><th>Rezervacije</th>  </tr>";
      rs = st.executeQuery(upit);
      while (rs.next()) {
        String nazivdog = rs.getString(1);
        Timestamp datumvreme = rs.getTimestamp(2);
        String lokacija = rs.getString(3);
        int idDogadjaj = rs.getInt(4);

        if (trenutnoVreme.compareTo(datumvreme) < 0) {
          rezultatK += ("<tr><td>" + nazivdog + "</td><td>" + datumvreme + "</td><td>" + lokacija + "</td>"
                  + "<td><a href='dogadjajinfo.jsp?id_param=" + idDogadjaj + "'>Detaljnije</a></td>"
                  + "<td><a href='rezervacijakarata.jsp?id_param=" + idDogadjaj + "'>Rezervacije karata</a></td></tr>");
        } else{
          rezultatK += ("<tr><td>" + nazivdog + "</td><td>" + datumvreme + "</td><td>" + lokacija + "</td>"
                  + "<td><a href='dogadjajinfo.jsp?id_param=" + idDogadjaj + "'>Detaljnije</a></td>"
                  + "<td>Isteklo!</td></tr>");
        }
      }

      rezultatK += "</table>";

      st.close();

      request.setAttribute("poruka", poruka);
      request.setAttribute("rezultatK", rezultatK);
      request.setAttribute("pretragaMestoK", pretragaMestoK);
      request.setAttribute("pretragaNazivK", pretragaNazivK);
      request.setAttribute("datumOdK", datumOdK);
      request.setAttribute("datumDoK", datumDoK);

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
  
    @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException {
    doPost(request, response);
  }

}
