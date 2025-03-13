/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.StartupDAO;
import dao.UserDAO;
import dto.StartupDTO;
import dto.UserDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * 
 */
@WebServlet(name = "MainController", urlPatterns = {"/MainController"})
public class MainController extends HttpServlet {

    private StartupDAO startupdao = new StartupDAO();

    private static final String LOGIN_PAGE = "login.jsp";

    public UserDTO getUser(String txtUser) {
        UserDAO udao = new UserDAO();
        UserDTO user = udao.readbyID(txtUser);
        return user;
    }

    public boolean isValidLogin(String txtUser, String txtPassword) {
        UserDTO user = getUser(txtUser);

        if (user != null && user.getPassword().equals(txtPassword)) {
            return true;
        } else {
            return false;
        }
    }

    private void search(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String searchTerm = request.getParameter("searchTerm");
        if (searchTerm == null) {
            searchTerm = "";
        }
        List<StartupDTO> startup = startupdao.searchbyTitle2(searchTerm);
        request.setAttribute("startups", startup);
        request.setAttribute("searchTerm", searchTerm);
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = LOGIN_PAGE;
        try {
            String action = request.getParameter("action");
            System.out.println(action);
            if (action == null) {
                url = LOGIN_PAGE;
            }
            // Your code here
            if (action != null && action.equals("login")) {
                // Login action
                String strUserID = request.getParameter("txtUser");
                String strPassword = request.getParameter("txtPassword");
                if (isValidLogin(strUserID, strPassword)) {
                    url = "search.jsp";
                    UserDTO user = getUser(strUserID);
                    request.getSession().setAttribute("user", user);

                    // search
                    search(request, response);
                } else {
                    request.setAttribute("message", "Incorrect UserID or Password");
                    url = "login.jsp";
                }
            } else if (action != null && action.equals("logout")) {
                url = "login.jsp";
                request.getSession().invalidate(); // Hủy phiên làm việc
            } else if (action != null && action.equals("search")) {
                url = "search.jsp";
                search(request, response);
            } else if (action != null && action.equals("add")) {
                if (request.getSession().getAttribute("user") != null) {
                    UserDTO user = (UserDTO) request.getSession().getAttribute("user");
                    if (user.getRole().equals("AD")) {
                        try {
                            String bookID = request.getParameter("txtBookID");
                            String title = request.getParameter("txtTitle");
                            String author = request.getParameter("txtAuthor");
                            int publishYear = Integer.parseInt(request.getParameter("txtPublishYear"));
                            double price = Double.parseDouble(request.getParameter("txtPrice"));
                            int quantity = Integer.parseInt(request.getParameter("txtQuantity"));
                            System.out.println(bookID);
                            boolean checkError = false;
                            if (bookID == null || bookID.trim().isEmpty()) {
                                request.setAttribute("txtBookID_error", "Book ID cannot be empty.");
                                bookID = "";
                                checkError = true;
                            }
                            if (title == null || title.trim().isEmpty()) {
                                request.setAttribute("txtTitle_error", "Title cannot be empty.");
                                title = "";
                                checkError = true;
                            }
                            if (quantity <= 0) {
                                request.setAttribute("txtQuantity_error", "Quantity > 0.");
                                checkError = true;
                            }
                            StartupDTO book = new StartupDTO (bookID, title, author, publishYear, price, quantity);

                            if (!checkError) {
                                startupdao.create(book);
                                url = "search.jsp";
                                search(request, response);
                            } else {
                                request.setAttribute("book", book);
                                url = "bookForm.jsp";
                            }
                        } catch (Exception e) {
                            System.out.println(e.toString());
                        }
                    } else {
                        response.getWriter().print("<h1>303 Error, ... </h1>");
                    }
                }
            }
        } catch (Exception e) {
            log("Error at MainController: " + e.toString());
        } finally {
            RequestDispatcher rd = request.getRequestDispatcher(url);
            if (!url.equals("MainController")) {
                rd.forward(request, response);
            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
