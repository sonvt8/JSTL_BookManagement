package com.tommy.filters;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tommy.models.WebUser;

/**
 * Servlet Filter implementation class AuthorizationFilter
 */
@WebFilter("/Protected/*")
public class AuthorizationFilter implements Filter {

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {

        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;

        HttpSession s =  req.getSession();
        
        String dest = req.getServletContext().getContextPath() + "/index.jsp";

        if (s.getAttribute("authorized_user") == null) {
            res.sendRedirect(dest);
            return;
        } else {
            WebUser wu = (WebUser) s.getAttribute("authorized_user");
            if (wu.getUid()==null || wu.getUid().equals("") || wu.getPwd()== null || wu.getPwd().equals("")) {
                res.sendRedirect(dest);
                return;
            }
        }
		chain.doFilter(request, response);
	}
}
