
package com.admin.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpSession;
import com.DAO.BookDAOImpl;
import com.DB.DBConnect;
import com.entity.BookDtls;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;

@WebServlet({ "/editbooks" })
public class EditBookServlet extends HttpServlet
{
    protected void doPost(final HttpServletRequest req, final HttpServletResponse resp) throws ServletException, IOException {
        try {
            final int id = Integer.parseInt(req.getParameter("id"));
            final String name = req.getParameter("bname");
            final String author = req.getParameter("bauthor");
            final String price = req.getParameter("bprice");
            final String status = req.getParameter("bstatus");
            final BookDtls b = new BookDtls();
            b.setbId(id);
            b.setBname(name);
            b.setBauthor(author);
            b.setBprice(price);
            b.setBstatus(status);
            final BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
            final boolean f = dao.updateEditBooks(b);
            final HttpSession session = req.getSession();
            if (f) {
                session.setAttribute("succ", (Object)"Book Update Successfully!");
                resp.sendRedirect("admin/all_book.jsp");
            }
            else {
                session.setAttribute("failed", (Object)"Somthing Wrong");
                resp.sendRedirect("admin/all_book.jsp");
            }
        }
        catch (Exception e) {
            e.printStackTrace();
        }
    }
}