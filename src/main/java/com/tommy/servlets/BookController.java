package com.tommy.servlets;

import java.io.IOException;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

import com.tommy.dbmodels.DBManager;
import com.tommy.helpers.DBBookQueries;
import com.tommy.models.Book;

@WebServlet(name = "BookController", value = "/bookcontroller.do")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 1, // 1MB
		maxFileSize = 1024 * 1024 * 10, // 10MB
		maxRequestSize = 1024 * 1024 * 100 // 100MB
)
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

		if (getServletConfig().getServletContext().getAttribute("BookDBManager") != null) {
			DBManager dbm = (DBManager) getServletConfig().getServletContext().getAttribute("BookDBManager");

			try {
				if (!dbm.isConnected()) {
					if (!dbm.openConnection())
						throw new IOException("Could not connect to database and open connection");
				}

				String query = DBBookQueries.getBooks();

				ArrayList<Book> listBooks = new ArrayList<Book>();

				ResultSet rs = dbm.ExecuteResultSet(query);

				while (rs.next()) {
					Book b = new Book();

					b.setId(rs.getInt("Id"));
					b.setTitle(rs.getString("Title"));
					b.setAuthor(rs.getString("Author"));
					b.setPrice(rs.getString("Price"));
					b.setQuantity(rs.getInt("Quantity"));
					b.setReleased(rs.getString("Released"));
					b.setCateId(rs.getInt("CategoryId"));
					b.setImageUrl(rs.getString("ImageUrl"));
					b.setDescription(rs.getString("Description"));
					listBooks.add(b);
				}
				s.setAttribute("listBooks", listBooks);
			} catch (Exception ex) {
				throw new IOException("Query could not be executed to get all books");
			}
			response.sendRedirect(getServletContext().getInitParameter("hostURL") + getServletContext().getContextPath()
					+ "/index.jsp");
		} else {
			response.sendRedirect(getServletContext().getInitParameter("hostURL") + getServletContext().getContextPath()
					+ "/login.jsp");
		}
	}

	private void addBook(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		HttpSession s = request.getSession();
		Part filePart = request.getPart("photo");

		String title = request.getParameter("title");
		String author = request.getParameter("author");
		String released = request.getParameter("date_iso");
		String quantity = request.getParameter("digits");
		String category = request.getParameter("cateName");
		String price = request.getParameter("numbers");
		String fileName = filePart.getSubmittedFileName();
		String description = request.getParameter("description");

		try {
			Book b = new Book();
			b.setTitle(title);
			b.setAuthor(author);
			b.setPrice(price);
			b.setQuantity(Integer.parseInt(quantity));
			b.setDescription(description);
			b.setReleased(released);
			b.setCateId(getCategoryId(category));
			b.setImageUrl(fileName);

			if (getServletConfig().getServletContext().getAttribute("BookDBManager") != null) {
				DBManager dbm = (DBManager) getServletConfig().getServletContext().getAttribute("BookDBManager");

				try {
					if (!dbm.isConnected()) {
						if (!dbm.openConnection())
							throw new IOException("Could not connect to database and open connection");
					}

					String query = DBBookQueries.insertData(b);

					dbm.ExecuteNonQuery(query);

					// Upload Image
					for (Part part : request.getParts()) {
						part.write(getServletContext().getInitParameter("uploadPath") + fileName);
					}
					
					s.setAttribute("deleteOk", "Book has been remvoved successfully!");
				} catch (Exception ex) {
					throw new IOException("Query could not be executed to insert a new book");
				}
				
				s.setAttribute("listBooks", null);
				response.sendRedirect(getServletContext().getInitParameter("hostURL")
						+ getServletContext().getContextPath() + "/index.jsp");
			} else {
				response.sendRedirect(getServletContext().getInitParameter("hostURL")
						+ getServletContext().getContextPath() + "/login.jsp");
			}
		} catch (Exception ex) {
			response.sendRedirect(getServletContext().getInitParameter("hostURL") + getServletContext().getContextPath()
					+ "/errorHandler.jsp");
		}
	}

	private void loadBook(HttpServletRequest request, HttpServletResponse response) throws IOException {
		System.out.println("LOAD BOOK");
	}

	private void updateBook(HttpServletRequest request, HttpServletResponse response) throws IOException {
		System.out.println("UPDATE BOOK");
	}

	private void deleteBook(HttpServletRequest request, HttpServletResponse response) throws IOException {
		try {
			String bookId = request.getParameter("bookId");

			if (getServletConfig().getServletContext().getAttribute("BookDBManager") != null) {
				DBManager dbm = (DBManager) getServletConfig().getServletContext().getAttribute("BookDBManager");

				try {
					if (!dbm.isConnected()) {
						if (!dbm.openConnection())
							throw new IOException("Could not connect to database and open connection");
					}

					String query = DBBookQueries.deleteBook(bookId);

					dbm.ExecuteNonQuery(query);
				} catch (Exception ex) {
					throw new IOException("Query could not be executed to insert a new city");
				}

				HttpSession s = request.getSession();
				s.setAttribute("listBooks", null);

				response.sendRedirect(getServletContext().getInitParameter("hostURL")
						+ getServletContext().getContextPath() + "/index.jsp");
			} else {
				response.sendRedirect(getServletContext().getInitParameter("hostURL")
						+ getServletContext().getContextPath() + "/login.jsp");
			}
		} catch (Exception ex) {
			response.sendRedirect(getServletContext().getInitParameter("hostURL") + getServletContext().getContextPath()
					+ "/errorHandler.jsp");
		}
	}

	private int getCategoryId(String cateName) {
		if (cateName.equalsIgnoreCase("Action and Adventure")) {
			return 1;
		}
		if (cateName.equalsIgnoreCase("Classics")) {
			return 2;
		}
		if (cateName.equalsIgnoreCase("Comic Book or Graphic Novel")) {
			return 3;
		}
		return 4;
	}

//	private Date convertStrToDate(String d) throws ParseException {
//		Date date = (Date) new SimpleDateFormat("yyyy/MM/dd").parse(d);
//		return date;
//	}
}
