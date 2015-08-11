package servlets;

import database.DB;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.Date;
import javax.servlet.RequestDispatcher;

/**
 *
 * @author mikla
 */
public class RezervacijaSave extends HttpServlet {

  protected void doGet(HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException {
    response.setContentType("text/html;charset=UTF-8");

    String id_korisnika = request.getParameter("id_korisnika");
    int id_karte_dogadjaja = Integer.parseInt(request.getParameter("id_karte_dogadjaja"));
    int brojkarata = Integer.parseInt(request.getParameter("brojkarata"));
    int rezervacija = 0; //0-rezervacija 1-prodaja       
    Date trenutnovreme = new Date();
    SimpleDateFormat formatiranje = new SimpleDateFormat("yyyy-MM-dd");

    HttpSession sesija = request.getSession();

    Connection con = null;
    Statement st = null;
    ResultSet rs = null;

    String adresa = "KorisnikView";
    String poruka = "";

    try {

      con = DB.getInstance().getConnection();
      st = con.createStatement();
      String upit = "INSERT INTO `nrtd412`.`prodaja` (`id_prodaje`, `id_korisnika`, `datum_izdavanja`, `rezervacija_prodaja`, `id_karte_dogadjaja`, `brojkarata`) "
              + "VALUES (NULL, '3', '" + formatiranje.format(trenutnovreme) + "', '0', '" + id_karte_dogadjaja + "', '" + brojkarata + "');";

      st.executeUpdate(upit);
      poruka = "Uspesno rezervisane karte";
      st.close();

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
