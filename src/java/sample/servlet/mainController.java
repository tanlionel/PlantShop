/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package sample.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author NGUYEN TAN
 */
public class mainController extends HttpServlet {

    private String url = "errorpage.jsp";

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            String action = request.getParameter("action");
            switch (action) {
                case "login":
                    url = "loginServlet";
                    break;
                case "register":
                    url = "registerServlet";
                    break;
                case "orderagain":
                    url="orderagainServlet";
                    break;
                case "changeProfile":
                    url="changeProfileServlet";
                    break;
                case "logout":
                    url = "logoutServlet";
                    break;
                case "addtocart":
                    url = "addToCartServlet";
                    break;
                case "viewcart":
                    url = "viewCart.jsp";
                    break;
                case "update":
                    url = "updateCartServlet";
                    break;
                case "delete":
                    url = "deleteCartServlet";
                    break;
                case "saveOrder":
                    url = "saveShoppingCartServlet";
                    break;
                case "manageAccounts":
                    url = "manageAccountsServlet";
                    break;
                case "updateStatusAccount":
                    url = "updateStatusAccountServlet";
                    break;
                case "searchAccount":
                    url="searchAccountServlet";
                    break;
                case "manageOrders":
                    url="manageOrdersServlet";
                    break;
                case "deleteOrder":
                    url="deleteOrderServlet";
                    break;
                case "managePlants":
                    url="managePlantsServlet";
                    break;
                case "updatePlant":
                    url="updatePlantServlet";
                    break;
                case "manageCategories":
                    url="manageCategoriesServlet";
                    break;
                default:
                    url = "index.jsp";
            }
            RequestDispatcher dispatcher = request.getRequestDispatcher(url);
            dispatcher.forward(request, response);
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
