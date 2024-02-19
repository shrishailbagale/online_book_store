
package com.user.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpSession;
import com.DAO.CartDAOImpl;
import com.DB.DBConnect;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;

@WebServlet({ "/remove_book" })
public class RemoveBookCart extends HttpServlet
{
    protected void doGet(final HttpServletRequest req, final HttpServletResponse resp) throws ServletException, IOException {
        try {
            final int bid = Integer.parseInt(req.getParameter("bid"));
            final int uid = Integer.parseInt(req.getParameter("uid"));
            final int cid = Integer.parseInt(req.getParameter("cid"));
            final CartDAOImpl dao = new CartDAOImpl(DBConnect.getConn());
            final boolean f = dao.deleteBook(bid, uid,cid);
            final HttpSession session = req.getSession();
            if (f) {
                session.setAttribute("failes", (Object)"Something Wrong.....");
                resp.sendRedirect("checkout.jsp");
            }
            else {
                session.setAttribute("succMSG", (Object)"Book Removed from Cart");
                resp.sendRedirect("checkout.jsp");
            }
        }
        catch (Exception e) {
            e.printStackTrace();
        }
    }
}