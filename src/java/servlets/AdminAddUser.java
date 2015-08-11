package servlets;

import beans.Korisnik;
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
public class AdminAddUser extends HttpServlet {

  protected void doPost(HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException {
    response.setContentType("text/html;charset=UTF-8");

    String username = request.getParameter("username");
    String password = request.getParameter("password");
    String ime = request.getParameter("ime");
    String prezime = request.getParameter("prezime");
    String email = request.getParameter("email");
    int lokacija = Integer.parseInt(request.getParameter("lokacija"));
    int tipnaloga = Integer.parseInt(request.getParameter("tipnaloga"));
    int odobren = Integer.parseInt(request.getParameter("odobren"));
    int banlevel = Integer.parseInt(request.getParameter("nivobana"));

    Korisnik kor = new Korisnik();
    kor.setUsername(username);
    kor.setPassword(password);
    kor.setFirst_name(ime);
    kor.setLast_name(prezime);
    kor.setEmail(email);
    kor.setLokacija(lokacija);
    kor.setLevelacc(tipnaloga);
    kor.setOdobren(odobren);
    kor.setBanlevel(banlevel);

    HttpSession sesija = request.getSession();
    sesija.setAttribute("korisnikset", kor);
    
    
    String poruka = "";

    if (username.isEmpty() || password.isEmpty()) {
      poruka = "Niste popunili korisnicko ime ili lozinku";
      request.setAttribute("poruka", poruka); //nova varijabla u sesiji poruka
      RequestDispatcher rd = request.getRequestDispatcher("adminadduser.jsp");
      rd.forward(request, response);
    }

    Connection con = null;
    Statement st = null;
    ResultSet rs = null;
    String adresa = "Admin";

    try {

      con = DB.getInstance().getConnection();
      st = con.createStatement();
      String upit = "INSERT INTO korisnik "
              + "(username, password, first_name, last_name, email, id_lokacija, levelacc, odobren, banlevel) "
              + "VALUES ('" + username + "', '" + password + "', '" + ime + "', '" + prezime + "', '" + email + "', '" + lokacija + "', '" + tipnaloga + "', '" + odobren + "', '" + banlevel + "');";

      st.executeUpdate(upit);
      st.close();

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
