
package com.user.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpSession;
import com.DAO.UserDAOImpl;
import com.DB.DBConnect;
import com.entity.User;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;

@WebServlet({ "/register" })
public class RegisterServlet extends HttpServlet
{
    protected void doPost(final HttpServletRequest req, final HttpServletResponse resp) throws ServletException, IOException {
        try {
            final String name = req.getParameter("name");
            final String email = req.getParameter("email");
            final String phone = req.getParameter("phone");
            final String password = req.getParameter("password");
            final String address = req.getParameter("address");
            final String city = req.getParameter("city");
            final String state = req.getParameter("state");
            final String pincode = req.getParameter("pincode");
            final String check = req.getParameter("check");
            final User us = new User();
            us.setName(name);
            us.setEmail(email);
            us.setPhone(phone);
            us.setPassword(password);
            us.setAddress(address);
            us.setCity(city);
            us.setState(state);
            us.setPincode(pincode);
            final HttpSession session = req.getSession();
            if (check != null) {
                final UserDAOImpl dao = new UserDAOImpl(DBConnect.getConn());
                final boolean f = dao.userRegister(us);
                if (f) {
                    session.setAttribute("succMSG", (Object)"User Register Successfully...");
                    resp.sendRedirect("register.jsp");
                }
                else {
                    session.setAttribute("failedMSG", (Object)"Something Wrong on Server...");
                    resp.sendRedirect("register.jsp");
                }
            }
            else {
                session.setAttribute("failedMSG", (Object)"Accept Term and Condition");
                resp.sendRedirect("register.jsp");
            }
        }
        catch (Exception e) {
            e.printStackTrace();
        }
    }
}