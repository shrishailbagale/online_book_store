
package com.admin.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpSession;
import com.DAO.BookDAOImpl;
import com.DB.DBConnect;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;

@WebServlet({ "/delete" })
public class BookDeleteServlet extends HttpServlet
{
    protected void doGet(final HttpServletRequest req, final HttpServletResponse resp) throws ServletException, IOException {
        try {
            final int id = Integer.parseInt(req.getParameter("id"));
            final BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
            final boolean f = dao.deleteBook(id);
            final HttpSession session = req.getSession();
            if (f) {
                session.setAttribute("succMSG", (Object)"Book Delete Successfully!");
                resp.sendRedirect("admin/all_book.jsp");
            }
            else {
                session.setAttribute("failedMSG", (Object)"Somthing Wrong");
                resp.sendRedirect("admin/all_book.jsp");
            }
        }
        catch (Exception e) {
            e.printStackTrace();
        }
    }
}