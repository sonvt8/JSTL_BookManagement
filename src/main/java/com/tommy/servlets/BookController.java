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
		System.out.println("List all Books");
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
