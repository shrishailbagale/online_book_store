
package com.user.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpSession;
import com.DAO.FeedbackDAO;
import com.DB.DBConnect;
import com.entity.Feedback;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;

@WebServlet({ "/addfeedback" })
public class AddFeedback extends HttpServlet
{
    protected void doPost(final HttpServletRequest req, final HttpServletResponse resp) throws ServletException, IOException {
        try {
            final String name = req.getParameter("name");
            final String email = req.getParameter("email");
            final String phone = req.getParameter("phone");
            final String message = req.getParameter("message");
            final int userId = Integer.parseInt(req.getParameter("userid"));
            final Feedback f = new Feedback(name, email, phone, message, userId);
            final FeedbackDAO dao = new FeedbackDAO(DBConnect.getConn());
            final HttpSession session = req.getSession();
            if (dao.addFeedback(f)) {
                session.setAttribute("SuccMsg", (Object)"Feedback Register succesfully");
                resp.sendRedirect("feedback.jsp");
            }
            else {
                session.setAttribute("failedMsg", (Object)"Something wrong on server!");
                resp.sendRedirect("feedback.jsp");
            }
        }
        catch (Exception e) {
            e.printStackTrace();
        }
    }
}