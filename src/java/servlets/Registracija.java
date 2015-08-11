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
public class Registracija extends HttpServlet {

  /**
   *
   */
  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException {

    HttpSession sesija = request.getSession();

    String user = request.getParameter("username");
    String pass = request.getParameter("password");
    String ime = request.getParameter("ime");
    String prezime = request.getParameter("prezime");
    String email = request.getParameter("email");

    String adresa = "index.jsp";
    String poruka = "";
    
    Connection con = null;
    Statement st = null;
    ResultSet rs = null;

    try {
      con = DB.getInstance().getConnection();
      st = con.createStatement();
      String upit = "insert into korisnik (username, password, first_name, last_name, email, levelacc, odobren, banlevel) "
              + "values ('" + user + "', '"+pass+"', '"+ime+"', '"+prezime+"', '"+email+"', 2, 0, 0)";

      st.executeUpdate(upit);
      st.close();
      
      poruka = "registracija uspesno obavljenam, sacekajte odobrenje";
      
    } catch (SQLException greska) {
      sesija.invalidate();
      request.setAttribute("porukaogresci", "Greska: " + greska);
      adresa = "greska.jsp";
    } finally {
      DB.getInstance().putConnection(con);
    }
    
    sesija.setAttribute("poruka", poruka);
    request.getRequestDispatcher(adresa).forward(request, response);
  }

}
