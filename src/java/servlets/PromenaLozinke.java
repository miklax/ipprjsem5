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
public class PromenaLozinke extends HttpServlet {

  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException {

    HttpSession sesija = request.getSession();

    Connection con = null;
    Statement st = null;

    String adresa = "Login";
    String user = (String) sesija.getAttribute("usernames");
    String poruka = "Promena lozinke za korisnika: " + user;

    String lozinka = "";

    if (request.getParameter("lozinka1").equals(request.getParameter("lozinka2"))) {
      lozinka = request.getParameter("lozinka1");

      try {
        con = DB.getInstance().getConnection();
        st = con.createStatement();
        String upit = "UPDATE korisnik SET password='" + lozinka + "' WHERE username='" + user + "';";

        st.executeUpdate(upit);
        st.close();
      } catch (SQLException greska) {
        sesija.invalidate();
        request.setAttribute("porukaogresci", "Greska: " + greska);
        adresa = "greska.jsp";
      } finally {
        DB.getInstance().putConnection(con);
      }
      
      adresa = "index.jsp";
      poruka = "Lozinka uspesno promenjena";

    } else {
      poruka = "Lozinke se ne podudaraju";
      adresa = "promenalozinke.jsp";
    }

    sesija.setAttribute("poruka", poruka);
    request.getRequestDispatcher(adresa).forward(request, response);
  }

}
