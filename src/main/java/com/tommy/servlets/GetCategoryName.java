package com.tommy.servlets;

import java.io.IOException;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tommy.dbmodels.DBManager;
import com.tommy.helpers.DBWorldQueries;
import com.tommy.models.WebUser;

@WebServlet(name = "GetCategoryName", value = "/getcategoryname.do")
public class GetCategoryName extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession s = request.getSession();
        
        if (s.getAttribute("authorized_user") == null) {
            response.sendRedirect(getServletContext().getInitParameter("hostURL")
                    + getServletContext().getContextPath() + "/login.jsp");
            return;
        } else {
            WebUser wu = (WebUser) s.getAttribute("authorized_user");
            if (wu.getAuthLevel() < 2) {
                response.sendRedirect(getServletContext().getInitParameter("hostURL")
                        + getServletContext().getContextPath() + "/login.jsp");
                return;
            }
        }

        if (getServletConfig().getServletContext().getAttribute("BookDBManager") != null)
        {
            DBManager dbm = (DBManager)getServletConfig().getServletContext().getAttribute("BookDBManager");

            try {
                if (!dbm.isConnected())
                {
                    if (!dbm.openConnection())
                        throw new IOException("Could not connect to database and open connection");
                }

                String query = DBWorldQueries.getCategoryName();

                ArrayList<String> cateName = new ArrayList<String>();

                ResultSet rs = dbm.ExecuteResultSet(query);

                while (rs.next())
                {
                    String c = rs.getString("Name");
                    cateName.add(c);
                }

                s.setAttribute("cateData", cateName);

            }
            catch (Exception ex)
            {
                throw new IOException("Query could not be executed to get category name");
            }
            response.sendRedirect(getServletContext().getInitParameter("hostURL")
                    + getServletContext().getContextPath() + "/add_book.jsp");
        }
        else
        {
            response.sendRedirect("login.jsp");
        }
	}

}
