package com.user.servlet;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.DAO.BookDAOImpl;
import com.DB.DBConnect;
import com.entity.BookDtls;

@WebServlet("/add_old_book")
@MultipartConfig
public class AddOldBook extends HttpServlet {
	
	 protected void doPost(final HttpServletRequest req, final HttpServletResponse resp) throws ServletException, IOException {
	        try {
	            final String name = req.getParameter("bname");
	            final String author = req.getParameter("bauthor");
	            final String price = req.getParameter("bprice");
	            final String category ="Old Book";
	            final String status = "Active";
	            final Part part = req.getPart("bphoto");
	            final String fileName = part.getSubmittedFileName();
	            
	            final String usermail = req.getParameter("user");
	            
	            final BookDtls b = new BookDtls(name, author, price, category, status, fileName, usermail);
	            final BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
	            final boolean f = dao.addBook(b);
	            final HttpSession session = req.getSession();
	            if (f) {
	                final String path = String.valueOf(this.getServletContext().getRealPath("")) + "book";
	                final File file = new File(path);
	                part.write(String.valueOf(path) + File.separator + fileName);
	                session.setAttribute("success", (Object)"Book Add Successfully!");
	                resp.sendRedirect("sell_book.jsp");
	            }
	            else {
	                session.setAttribute("failed", (Object)"Something wrong on Server");
	                resp.sendRedirect("sell_book.jsp");
	            }
	        }
	        catch (Exception e) {
	            e.printStackTrace();
	        }
	    }

}
