/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import database.DB;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.sql.*;
import javax.servlet.RequestDispatcher;

/**
 *
 * @author mikla
 */
public class UnosKarata extends HttpServlet {

  protected void doGet(HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException {
    response.setContentType("text/html;charset=UTF-8");

    HttpSession sesija = request.getSession();

    String naziv_dogadjaja = request.getParameter("mestok");
    String tip_karata = request.getParameter("tipkarata");
    int raspolozivo_karata = Integer.parseInt(request.getParameter("raspolozivok"));
    int ukupno_karata = Integer.parseInt(request.getParameter("ukupnok"));

    String tabela = "";
    String adresa = "blagajnikkarte.jsp";

    Connection con = null;
    Statement st = null;
    ResultSet rs = null;

    try {
      con = DB.getInstance().getConnection();
      st = con.createStatement();

      String upitUpdate = "insert into tip_karte_dogadjaja (id_dogadjaja, tip_karata, raspolozivo_karata, ukupno_karata) "
              + "values ((select id_dogadjaj from dogadjaj where naziv_dogadjaja='" + naziv_dogadjaja + "'), '" + tip_karata + "', " + raspolozivo_karata + ", " + ukupno_karata + ")";
      st.executeUpdate(upitUpdate);

      String upit = "select tip_karata, raspolozivo_karata, ukupno_karata from tip_karte_dogadjaja"
              + " where id_dogadjaja=(select id_dogadjaj from dogadjaj where naziv_dogadjaja='" + naziv_dogadjaja + "')";

      rs = st.executeQuery(upit);

      String tipKarata;
      int raspolozivo, ukupno;

      tabela += "<table class='tabela-view'><tr><th>Tip karata</th><th>Raspolozivo</th><th>Ukuno</th></tr>";

      while (rs.next()) {
        tipKarata = rs.getString(1);
        raspolozivo = rs.getInt(2);
        ukupno = rs.getInt(3);

        tabela += "<tr><td>" + tipKarata + "</td><td>" + raspolozivo
                + "</td><td>" + ukupno + "</td></tr>";
      }
      
      tabela += "</table>";

    } catch (SQLException greska) {
      sesija.invalidate();
      request.setAttribute("porukaogresci", "Greska: " + greska);
      adresa = "greska.jsp";
    } finally {
      DB.getInstance().putConnection(con);
    }

    sesija.setAttribute("tabelakarte", tabela);
    request.setAttribute("tempNazDog", naziv_dogadjaja);
    request.getRequestDispatcher(adresa).forward(request, response);

  }

}
