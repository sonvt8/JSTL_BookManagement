package com.tommy.servlets;

import com.tommy.dbmodels.DBManager;
import com.tommy.helpers.DBWorldQueries;
import com.tommy.models.WebUser;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.ResultSet;

@WebServlet(name = "LoginUser", value = "/loginUser.do")
public class LoginUser extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession s = request.getSession();
        WebUser wu = (WebUser) s.getAttribute("authorized_user");

        if (wu == null || wu.getUid().equals("") || wu.getUid() == null || wu.getAuthLevel() < 1) {
            String uid = "";
            String pwd = "";

            if (request.getParameter("uid") != null)
                uid = request.getParameter("uid");

            if (request.getParameter("pwd") != null)
                pwd = request.getParameter("pwd");

            if ((wu == null || wu.getUid().equals("")  || wu.getAuthLevel() < 1 || wu.getUid() == null)
                    && (uid != "" && pwd != "")) {
                if (getServletConfig().getServletContext().getAttribute("BookDBManager") != null)
                {
                    DBManager dbm = (DBManager)getServletConfig().getServletContext().getAttribute("BookDBManager");

                    try {
                        if (!dbm.isConnected())
                        {
                            if (!dbm.openConnection())
                                throw new IOException("Could not connect to database and open connection");
                        }
                        String query = DBWorldQueries.getWebUserByUsernameAndPassword(uid, pwd);
                        ResultSet rs = dbm.ExecuteResultSet(query);
                        while (rs.next())
                        {
                            wu = new WebUser();

                            wu.setUid(rs.getString("uid"));
                            wu.setPwd(rs.getString("password"));
                            wu.setAuthLevel(rs.getInt("authLevel"));

                            s.setAttribute("authorized_user", wu);

                            if (request.getParameter("rememberMe") != null)
                            {
                                String rememberMe =  request.getParameter("rememberMe");
                                if (rememberMe.equalsIgnoreCase("ON"))
                                {
                                    int CookieLife = 3600*24*7;

                                    Cookie uidCookie = new Cookie("credentials_uid", uid);
                                    Cookie pwdCookie = new Cookie("credentials_pwd", pwd);

                                    uidCookie.setMaxAge(CookieLife);
                                    pwdCookie.setMaxAge(CookieLife);

                                    response.addCookie(uidCookie);
                                    response.addCookie(pwdCookie);
                                }
                            }
                        }
                    }
                    catch (Exception ex)
                    {
                    	response.sendRedirect(getServletContext().getInitParameter("hostURL")
                                + getServletContext().getContextPath() + "/welcome.jsp");
                    	return;
                    }
                }
                else
                {
                    response.sendRedirect(getServletContext().getContextPath() + "/login.jsp");
                    return;
                }
            }

            if (wu == null || wu.getUid().equals("") || wu.getUid() == null || wu.getAuthLevel() < 1)
            {
            	s.setAttribute("errorMessage", "Incorrect username or password.");
            	response.sendRedirect(getServletContext().getInitParameter("hostURL")
                        + getServletContext().getContextPath() + "/index.jsp");
            	return;
            }

        }

        response.sendRedirect("index.jsp");
    }
}