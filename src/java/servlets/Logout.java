
package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Mihail
 */
public class Logout extends HttpServlet {

 
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        
        //ovo mi je nelogicno da se ubacuje atribut nakon ubijanja sesije
        request.getSession().invalidate();
        request.setAttribute("poruka", "Dovidjenja, Hvala sto ste koristili sistem");
        request.getRequestDispatcher("index.jsp").forward(request, response);
        
    }

}