
package com.user.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import java.util.Iterator;
import javax.servlet.http.HttpSession;
import java.util.List;
import com.entity.Cart;
import java.util.Random;
import com.entity.Book_Order;
import java.util.ArrayList;
import com.DAO.BookOrderImpl;
import com.DAO.CartDAOImpl;
import com.DB.DBConnect;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;

@WebServlet({ "/order" })
public class OrderServlet extends HttpServlet
{
    protected void doPost(final HttpServletRequest req, final HttpServletResponse resp) throws ServletException, IOException {
        try {
            final HttpSession session = req.getSession();
            final int id = Integer.parseInt(req.getParameter("id"));
            final String order_date = req.getParameter("order_date");
            final String name = req.getParameter("username");
            final String email = req.getParameter("email");
            final String phone = req.getParameter("phone");
            final String address = req.getParameter("address");
            final String city = req.getParameter("city");
            final String state = req.getParameter("state");
            final String pincode = req.getParameter("pincode");
            final String paymentType = req.getParameter("paymentType");
            final String fullAdd = String.valueOf(address) + ", " + city + ", " + state + ", " + pincode;
            final CartDAOImpl dao = new CartDAOImpl(DBConnect.getConn());
            final List<Cart> blist = dao.getBookByUser(id);
            if (blist.isEmpty()) {
                session.setAttribute("failed", (Object)"Please Add item your cart");
                resp.sendRedirect("checkout.jsp");
            }
            else {
                final BookOrderImpl dao2 = new BookOrderImpl(DBConnect.getConn());
                Book_Order o = null;
                final ArrayList<Book_Order> orderlist = new ArrayList<Book_Order>();
                final Random r = new Random();
                for (final Cart c : blist) {
                    o = new Book_Order();
                    c.getBauthor();
                    o.setOrderid("BOOK-ORD-00" + r.nextInt(1000));
                    o.setOrder_date(order_date);
                    o.setUsername(name);
                    o.setEmail(email);
                    o.setPhone(phone);
                    o.setFullAdd(fullAdd);
                    o.setBname(c.getBname());
                    o.setBauthor(c.getBauthor());
                    o.setBprice(new StringBuilder().append(c.getBprice()).toString());
                    o.setPaymentType(paymentType);
                    orderlist.add(o);
                }
                if ("noselect".equals(paymentType)) {
                    session.setAttribute("failedmsg", (Object)"Please select Payment mode");
                    resp.sendRedirect("checkout.jsp");
                }
                else {
                    final boolean f = dao2.saveOrder(orderlist);
                    if (f) {
                        session.setAttribute("succmsg", (Object)"Order Successfully Done.");
                        resp.sendRedirect("order_success.jsp");
                    }
                    else {
                        session.setAttribute("failedmsg", (Object)"Something on Wrong... ");
                        resp.sendRedirect("checkout.jsp");
                    }
                }
            }
        }
        catch (Exception e) {
            e.printStackTrace();
        }
    }
}