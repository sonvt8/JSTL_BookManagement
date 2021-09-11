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
import com.tommy.models.Book;

@WebServlet(name = "BookController", value = "/bookcontroller.do")
public class BookController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String theCommand = request.getParameter("command");

		if (theCommand == null) {
			theCommand = "LIST";
		}

		switch (theCommand) {
		case "DELETE":
			deleteBook(request, response);
			break;
		case "LIST":
			listBooks(request, response);
			break;
		case "LOAD":
			loadBook(request, response);
			break;
		default:
			listBooks(request, response);
			break;
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String theCommand = request.getParameter("command");

		if (theCommand == null) {
			theCommand = "LIST";
		}

		switch (theCommand) {
		case "ADD":
			addBook(request, response);
			break;
		case "UPDATE":
			updateBook(request, response);
			break;
		}
	}

	private void listBooks(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession s = request.getSession();

        if (getServletConfig().getServletContext().getAttribute("BookDBManager") != null)
        {
            DBManager dbm = (DBManager)getServletConfig().getServletContext().getAttribute("BookDBManager");

            try {
                if (!dbm.isConnected())
                {
                    if (!dbm.openConnection())
                        throw new IOException("Could not connect to database and open connection");
                }

                String query = DBWorldQueries.getBooks();

                ArrayList<Book> listBooks = new ArrayList<Book>();

                ResultSet rs = dbm.ExecuteResultSet(query);

                while (rs.next())
                {
                	Book b = new Book();
                    
                    b.setId(rs.getInt("Id"));
                    b.setTitle(rs.getString("Title"));
                    b.setAuthor(rs.getString("Author"));
                    b.setPrice(rs.getString("Price"));
                    b.setQuantity(rs.getInt("Quantity"));
                    b.setReleased(rs.getDate("Released"));
                    b.setCateId(rs.getInt("CategoryId"));
                    b.setImageUrl(rs.getString("ImageUrl"));
                    b.setDescription(rs.getString("Description"));
                    listBooks.add(b);
                }
                s.setAttribute("listBooks", listBooks);
            }
            catch (Exception ex)
            {
                throw new IOException("Query could not be executed to get all books");
            }
            response.sendRedirect(getServletContext().getInitParameter("hostURL")
                    + getServletContext().getContextPath() +"/index.jsp");
        }
        else
        {
            response.sendRedirect(getServletContext().getInitParameter("hostURL")
                    + getServletContext().getContextPath() + "/login.jsp");
        }
	}

	private void addBook(HttpServletRequest request, HttpServletResponse response) throws IOException {
	}

	private void loadBook(HttpServletRequest request, HttpServletResponse response) throws IOException {
	}

	private void updateBook(HttpServletRequest request, HttpServletResponse response) throws IOException {
	}

	private void deleteBook(HttpServletRequest request, HttpServletResponse response) throws IOException {
	}
}
