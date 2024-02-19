
package com.user.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpSession;
import com.entity.User;
import com.DAO.UserDAOImpl;
import com.DB.DBConnect;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;

@WebServlet({ "/login" })
public class LoginServlet extends HttpServlet
{
    protected void doPost(final HttpServletRequest req, final HttpServletResponse resp) throws ServletException, IOException {
        try {
            final UserDAOImpl dao = new UserDAOImpl(DBConnect.getConn());
            final HttpSession session = req.getSession();
            final String email = req.getParameter("email");
            final String password = req.getParameter("password");
            if ("admin@gmail.com".equals(email) && "admin".equals(password)) {
                final User us = new User();
                us.setName("Admin");
                session.setAttribute("userobj", (Object)us);
                resp.sendRedirect("admin/home.jsp");
            }
            else {
                final User us = dao.login(email, password);
                if (us != null) {
                    session.setAttribute("userobj", (Object)us);
                    resp.sendRedirect("index.jsp");
                }
                else {
                    session.setAttribute("failedMSG", (Object)"Email and Password Invalid");
                    resp.sendRedirect("login.jsp");
                }
            }
        }
        catch (Exception e) {
            e.printStackTrace();
        }
    }
}