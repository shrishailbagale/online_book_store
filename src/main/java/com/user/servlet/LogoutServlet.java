
package com.user.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;

@WebServlet({ "/logout" })
public class LogoutServlet extends HttpServlet
{
    protected void doGet(final HttpServletRequest req, final HttpServletResponse resp) throws ServletException, IOException {
        try {
            final HttpSession session = req.getSession();
            session.removeAttribute("userobj");
            final HttpSession session2 = req.getSession();
            session.setAttribute("succMSG", (Object)"Logout Successfully!");
            resp.sendRedirect("login.jsp");
        }
        catch (Exception e) {
            e.printStackTrace();
        }
    }
}