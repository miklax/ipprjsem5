package servlets;

import beans.Korisnik;
import database.DB;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
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
public class AdminEditUser extends HttpServlet {

  protected void doPost(HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException {
    response.setContentType("text/html;charset=UTF-8");

    int id = Integer.parseInt(request.getParameter("id"));
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    String ime = request.getParameter("first_name");
    String prezime = request.getParameter("last_name");
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
      RequestDispatcher rd = request.getRequestDispatcher("adminedituser.jsp");
      rd.forward(request, response);
    }

    Connection con = null;
    Statement st = null;
    ResultSet rs = null;
    String adresa = "Admin";

    try {

      con = DB.getInstance().getConnection();
      st = con.createStatement();
      String upit = "UPDATE korisnik"
              + "SET username='" + username + "', password='" + password + "',"
              + "first_name='" + ime + "', last_name='" + prezime + "', email='" + email + "',"
              + " id_lokacija='" + lokacija + "', levelacc='" + tipnaloga + "', odobren = '"+odobren+"', banlevel = '"+banlevel+"'"
              + "WHERE id_korisnika='"+id+"'";
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
