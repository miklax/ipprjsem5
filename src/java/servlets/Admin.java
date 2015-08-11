package servlets;

import database.DB;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.Date;
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
public class Admin extends HttpServlet {

  protected void doPost(HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException {

    HttpSession sesija = request.getSession();

    Connection con = null;
    Statement st = null;
    ResultSet rs = null;

    String adresa = "admin.jsp";
    String poruka = "Administratorski mod";
    String nazivLokacije = "";
    String user = (String) sesija.getAttribute("usernames");
    String tabela = "";

    try {
      con = DB.getInstance().getConnection();
      st = con.createStatement();

      String upitTabela = "select id_korisnika, username, password, first_name, last_name, email, odobren, banlevel from korisnik;";
      rs = st.executeQuery(upitTabela);

      tabela = "<table class='tabela-view'><tr><th>ID</th><th>username</th><th>password</th><th>Ime</th>"
              + "<td>prezime</td><td>email</td></tr>";
      //popunjavanje tabele
      while (rs.next()) {
        int id_korisnika = rs.getInt(1);
        String username = rs.getString(2);
        String password = rs.getString(3);
        String ime = rs.getString(4);
        String prezime = rs.getString(5);
        String email = rs.getString(6);
        int odobren = rs.getInt("odobren");
        int banlevel = rs.getInt("banlevel");


        if (odobren == 0 && banlevel < 3) {
          tabela += "<tr style='background-color: yellow'><td>" + id_korisnika + "</td><td>" + username + "</td><td>" + password
                  + "</td><td>" + ime + "</td><td>" + prezime + "</td><td>" + email + "</td>"
                  + "<td><a href='adminedituser.jsp?id_param=" + id_korisnika + "'>Azuriranje</a></tr>";
        }
        if (banlevel == 3) {
          tabela += "<tr style='background-color: red'><td>" + id_korisnika + "</td><td>" + username + "</td><td>" + password
                  + "</td><td>" + ime + "</td><td>" + prezime + "</td><td>" + email + "</td>"
                  + "<td><a href='adminedituser.jsp?id_param=" + id_korisnika + "'>Azuriranje</a></tr>";
        } 
        if (odobren == 1 && banlevel < 3) {
          tabela += "<tr><td>" + id_korisnika + "</td><td>" + username + "</td><td>" + password
                  + "</td><td>" + ime + "</td><td>" + prezime + "</td><td>" + email + "</td>"
                  + "<td><a href='adminedituser.jsp?id_param=" + id_korisnika + "'>Azuriranje</a></tr>";
        }        
        
        
      }
      tabela += "</table>";
      request.setAttribute("tabelausers", tabela);

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
