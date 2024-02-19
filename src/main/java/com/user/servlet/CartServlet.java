
package com.user.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpSession;
import com.entity.BookDtls;
import com.DAO.CartDAOImpl;
import com.entity.Cart;
import com.DAO.BookDAOImpl;
import com.DB.DBConnect;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;

@WebServlet({ "/cart" })
public class CartServlet extends HttpServlet
{
    protected void doGet(final HttpServletRequest req, final HttpServletResponse resp) throws ServletException, IOException {
        try {
            final int bid = Integer.parseInt(req.getParameter("bid"));
            final int uid = Integer.parseInt(req.getParameter("uid"));
            final BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
            final BookDtls b = dao.getBookById(bid);
            final Cart c = new Cart();
            c.setBid(bid);
            c.setUid(uid);
            c.setBname(b.getBname());
            c.setBauthor(b.getBauthor());
            c.setBprice(Double.parseDouble(b.getBprice()));
            c.setTotalprice(Double.parseDouble(b.getBprice()));
            final CartDAOImpl dao2 = new CartDAOImpl(DBConnect.getConn());
            final boolean f = dao2.addCart(c);
            final HttpSession session = req.getSession();
            if (f) {
                session.setAttribute("addCart", (Object)"Added to Cart");
                resp.sendRedirect("all_new_book.jsp");
            }
            else {
                session.setAttribute("failed", (Object)"Something wrong on server");
                resp.sendRedirect("all_new_book.jsp");
            }
        }
        catch (Exception e) {
            e.printStackTrace();
        }
    }
}