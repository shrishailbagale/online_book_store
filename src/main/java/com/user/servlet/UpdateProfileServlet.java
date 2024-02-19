
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

@WebServlet({ "/update_profile" })
public class UpdateProfileServlet extends HttpServlet
{
    protected void doPost(final HttpServletRequest req, final HttpServletResponse resp) throws ServletException, IOException {
        try {
            int id = Integer.parseInt(req.getParameter("id"));
            String name = req.getParameter("name");
            String email = req.getParameter("email");
            String phone = req.getParameter("phone");
            String password = req.getParameter("password");
            String address = req.getParameter("address");
            String city = req.getParameter("city");
            String state = req.getParameter("state");
            String pincode = req.getParameter("pincode");
            
            
            User us = new User();
            us.setId(id);
            us.setName(name);
            us.setEmail(email);
            us.setPhone(phone);
//            us.setPassword(password);
            us.setAddress(address);
            us.setCity(city);
            us.setState(state);
            us.setPincode(pincode);
            final HttpSession session = req.getSession();
            final UserDAOImpl dao = new UserDAOImpl(DBConnect.getConn());
            
            final boolean f = dao.checkPassword(id, password);
            if (f) {
                final boolean f2 = dao.updateProfile(us);
                if (f2) {
                    session.setAttribute("succMSG", "Profile Update Successfully...");
                    resp.sendRedirect("edit_profile.jsp");
                }
                else {
                    session.setAttribute("failedMSG", "Something Wrong on Server...");
                    resp.sendRedirect("edit_profile.jsp");
                }
            }
            else {
                session.setAttribute("failedMSG", "Your Password is Incorrect");
                resp.sendRedirect("edit_profile.jsp");
            }
        }
        catch (Exception e) {
            e.printStackTrace();
        }
    }
}