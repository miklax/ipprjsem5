package servlets;

import beans.Korisnik;
import database.DB;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.*;
import java.sql.*;
import java.util.Date;

/**
 *
 * @author Mihail
 */
public class Blagajnik extends HttpServlet {

  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException {
    response.setContentType("text/html;charset=UTF-8");

    HttpSession sesija = request.getSession();

    Connection con = null;
    Statement st = null;
    ResultSet rs = null;

    String adresa = "blagajnik.jsp";
    String poruka = "Blagajnik mod";
    String nazivLokacije = "";
    String user = (String) sesija.getAttribute("usernames");

    //dohvati blagajnikovo radno mesto i lokaciju gde se nalazi
    try {
      con = DB.getInstance().getConnection();
      st = con.createStatement();
      //ovde imam gresku u sql. Pogledaj kako se zove parametar u seiji za korisnika i zameni sa 'blagajnik'
      String upit = "select naziv_lokacije, mesto from mesto where id_lokacija=(select id_lokacija from korisnik where username = '" + user + "');";

      rs = st.executeQuery(upit);
      if (rs.next()) {
        nazivLokacije = rs.getString(1);
        String mestoBlag = rs.getString(2);

        sesija.setAttribute("blagLokacija", nazivLokacije);
        sesija.setAttribute("mestoBlag", mestoBlag);
      }

      String upitTabela = "SELECT d.id_dogadjaj, d.naziv_dogadjaja, d.vreme_dogadjaja from dogadjaj as d\n"
              + "WHERE d.id_lokacija = (select  id_lokacija from mesto where naziv_lokacije = \"Spens\")";

      //trenutno vreme za poredjenje
      Date trenutnoVreme = new Date();

      String tabela = "<table class='tabela-view'><tr><th>ID</th><th>Naziv dogadjaja</th><th>Datum</th><th>Prodaja</th></tr>";
      //popunjavanje tabele
      rs = st.executeQuery(upitTabela);
      while (rs.next()) {
        int id_dogadjaj = rs.getInt(1);
        String naziv_dogadjaja = rs.getString(2);
        Date vreme_dogadjaja = rs.getDate(3);

        if (trenutnoVreme.compareTo(vreme_dogadjaja) < 0) {
          tabela += "<tr><td>" + id_dogadjaj + "</td><td>" + naziv_dogadjaja
                  + "</td><td>" + vreme_dogadjaja + "</td><td><a href='blagprodaja.jsp?id_param=" + id_dogadjaj + "'>Prodaja karata</a></tr>";
        } else {
          tabela += "<tr style='background-color: red'><td>" + id_dogadjaj + "</td><td>" + naziv_dogadjaja
                  + "</td><td>" + vreme_dogadjaja + "</td><td>Isteklo!</tr>";
        }

      }
      tabela += "</table>";
      request.setAttribute("tabela", tabela);

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

  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException {

    //KASNIJE KADA SE VRACAM NA INDEX POZIVAM GET PA MORAM DA NAPRAVIM REDIREKCIJU
    doPost(request, response);
  }

}
